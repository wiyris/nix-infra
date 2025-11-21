{
  imports = [
    ./disko.nix
    ./hardware-configuration.nix
    ./hardware.nix
    ./initrd.nix
    ./networking.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };

    # kernelPackages = pkgs.linuxPackages_hardened;
    # kernelParams = [];
  };
}
