{
  description = "infra";

  outputs =
    inputs:
    let
      lib = import ./lib inputs;
    in
    {
      nixosConfigurations = {
        hiki = lib.mkNixosSystem inputs.nixpkgs "x86_64-linux" "hiki";
        vm = lib.mkNixosSystem inputs.nixpkgs "x86_64-linux" "vm";
      };
    };
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
