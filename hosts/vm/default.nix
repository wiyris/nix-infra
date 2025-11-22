{
  imports = [
    ./disko.nix
    ./hardware.nix
  ];

  programs' = {
    bat.enable = true;
    btop.enable = true;
    eza.enable = true;
    fish.enable = true;
    fzf.enable = true;
    git.enable = true;
    ripgrep.enable = true;
    starship.enable = true;
    tmux.enable = true;
    yazi.enable = true;
    zoxide.enable = true;
  };

  boot.loader.grub.enable = true;
}
