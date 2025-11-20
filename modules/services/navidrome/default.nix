{
  config,
  lib,
  ...
}: let
  cfg = config.services'.navidrome;
in {
  options.services'.navidrome.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    services.navidrome = {
      enable = true;
      openFirewall = true;
      settings = {
        Address = "0.0.0.0";
        Port = 4533;
        MusicFolder = "/mnt/music/Bandcamp";
        EnableInsightsCollector = false;
      };
    };
  };
}
