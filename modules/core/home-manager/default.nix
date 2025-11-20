{
  inputs,
  lib,
  system,
  config,
  options,
  ...
}: let
  inherit (config.globals) userName homeDirectory;
in {
  imports = [inputs.home-manager.nixosModules.home-manager];

  options = {
    hm' = lib.mkOption {
      type = lib.types.attrs;
      default = {};
      description = "Options to pass directly to home-manager primary user.";
    };
    user' = lib.mkOption {
      type = lib.types.attrs;
      default = {};
      description = "Options to pass directly to users.extraUsers primary user.";
    };
  };
  config = {
    user'.home = homeDirectory;
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = false;
      backupFileExtension = "hm-bak";
    };

    hm' = {
      programs.home-manager.enable = true;
      home.username = userName;
      home.homeDirectory = homeDirectory;
      home.packages = [inputs.home-manager.packages.${system}.default];
    };

    home-manager.users.${userName} = lib.mkAliasDefinitions options.hm';
    users.extraUsers.${userName} = lib.mkAliasDefinitions options.user';
  };
}
