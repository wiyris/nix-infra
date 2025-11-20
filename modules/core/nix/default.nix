{
  imports = [
    ./substituters.nix
  ];
  nixpkgs.config = {
    allowBroken = false;
    allowUnfree = true;
  };

  nix = {
    # nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      trusted-users = [
        "@wheel"
      ];
    };
  };
}
