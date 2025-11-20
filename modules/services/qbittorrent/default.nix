{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services'.qbittorrent;
  webuiPort = 8080;
in {
  options.services'.qbittorrent.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    services.qbittorrent = {
      enable = true;
      openFirewall = true;
      package = pkgs.qbittorrent-nox;
      group = "arr";
      inherit webuiPort;
    };
    systemd.services.qbittorrent.wantedBy = [];
  };
}
