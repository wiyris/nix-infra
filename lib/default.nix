inputs: let
  lib = inputs.nixpkgs.lib;
in
  lib
  // rec {
    # Returns all files in a directory matching a suffix
    filesInDirectoryWithSuffix = directory: suffix:
      lib.pipe (lib.filesystem.listFilesRecursive directory) [
        # Get only files ending in .nix
        (builtins.filter (name: lib.hasSuffix suffix name))
      ];

    # Returns all files ending in .nix for a directory
    nixFiles = directory: filesInDirectoryWithSuffix directory ".nix";

    # Returns all files ending in default.nix for a directory
    defaultFiles = directory: filesInDirectoryWithSuffix directory "default.nix";

    # Imports all files in a directory and passes inputs
    importOverlays = directory:
      lib.pipe (nixFiles directory) [
        # Import each overlay file
        (map (file: (import file) inputs))
      ];

    # Import default files as attrset with keys provided by parent directory
    defaultFilesToAttrset = directory:
      lib.pipe (defaultFiles directory) [
        # Import each file
        (map (file: {
          name = builtins.baseNameOf (builtins.dirOf file);
          value = import file;
        }))
        # Convert to an attrset of parent dir name -> file
        (builtins.listToAttrs)
      ];

    mkNixosSystem = pkgs: system: hostName:
      pkgs.lib.nixosSystem {
        inherit system;
        modules = [
          (../. + "/hosts/${hostName}")
          {
            imports = builtins.attrValues (defaultFilesToAttrset ../modules);
            nixpkgs.config.allowUnfree = true;
            networking.hostName = hostName;
          }
        ];
        specialArgs = {
          inherit inputs system lib;
          nixpkgs = pkgs;
        };
      };
  }
