{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services'.rtorrent;
  webuiPort = 8112;
in
{
  options.services'.rtorrent.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    services.rtorrent = {
      enable = true;
      openFirewall = true;
      group = "media";
      dataPermissions = "0755";
      downloadDir = "/data/media/downloads";
    };
    services.flood = {
      enable = true;
      port = webuiPort;
      openFirewall = true;
      extraArgs = [ "--rtsocket=${config.services.rtorrent.rpcSocket}" ];
    };
    # allow access to the socket by putting it in the same group as rtorrent service
    # the socket will have g+w permissions
    systemd.services.flood.serviceConfig.SupplementaryGroups = [ config.services.rtorrent.group ];
  };
}
