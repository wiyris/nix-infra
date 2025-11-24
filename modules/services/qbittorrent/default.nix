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
      group = "media";
      inherit webuiPort;
      serverConfig = {
        LegalNotice.Accepted = true;
        BitTorrent = {
          MergeTrackersEnabled = true;
          Session = {
            AddTorrentStopped = false;
            DefaultSavePath = "/data/Downloads";
            MaxActiveTorrents = -1;
            MaxActiveUploads = -1;
            MaxConnections = -1;
            MaxConnectionsPerTorrent = -1;
            MaxUploads = -1;
            MaxUploadsPerTorrent = -1;
            ProxyPeerConnections = false;
            QueueingSystemEnabled = true;
          };
        };
        Preferences = {
          WebUI = {
            AuthSubnetWhitelist = "0.0.0.0/0";
            AuthSubnetWhitelistEnabled = true;
            AlternativeUIEnabled = true;
          };
        };
      };
    };
    systemd.services.qbittorrent = {
      wantedBy = [];
      serviceConfig.UMask = "0002";
    };
  };
}
