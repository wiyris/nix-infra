{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (config.globals) userName;
in {
  environment.systemPackages = with pkgs; [
    curl
    file # print filetype
    killall
    neovim
    p7zip
    wget # download http/ftp
  ];

  user' = {
    # hashedPasswordFile = "config.sops.secrets.pass-test.path;";
    initialHashedPassword = "$y$j9T$FyXRRqLttcdVGvfopLg0g/$9gILD5hPZLqkwYi1nW9CFWp/VimrcZmssgtYv9qvVt1";
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  # networking.domain = "";
  zramSwap.enable = true;

  time.timeZone = lib.mkDefault "Asia/Tokyo";
  system.stateVersion = lib.mkDefault "25.05";
  home-manager.users.${userName}.home.stateVersion = lib.mkDefault "25.05";
}
