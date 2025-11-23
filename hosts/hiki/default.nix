{pkgs, ...}: {
  imports = [
    ./disko.nix
    ./hardware-configuration.nix
    ./initrd.nix
  ];

  networking'.mullvad.enable = true;

  programs' = {
    bat.enable = true;
    btop.enable = true;
    eza.enable = true;
    fish.enable = true;
    fish.isDefault = true;
    fzf.enable = true;
    git.enable = true;
    ripgrep.enable = true;
    starship.enable = true;
    tmux.enable = true;
    yazi.enable = true;
    zoxide.enable = true;
  };

  environment.systemPackages = with pkgs; [
    intel-gpu-tools
    libva-utils
  ];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      vpl-gpu-rt
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [intel-vaapi-driver];
  };

  networking = {
    interfaces.enp2s0.ipv4.addresses = [
      {
        address = "192.168.0.42";
        prefixLength = 24;
      }
    ];
    defaultGateway = "192.168.0.1";
    nameservers = [
      # "192.168.0.1"
      "194.242.2.2"
      "1.1.1.1"
      "1.0.0.1"
    ];
  };

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
