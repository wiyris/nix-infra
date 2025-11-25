{
  config,
  lib,
  ...
}:
let
  cfg = config.services'.navidrome;
  Port = 4533;
  MusicFolder = "/data/Music/albums";
in
{
  options.services'.navidrome.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    services.navidrome = {
      enable = true;
      openFirewall = true;
      settings = {
        Address = "0.0.0.0";
        EnableInsightsCollector = false;
        inherit Port MusicFolder;
      };
    };
  };
}
