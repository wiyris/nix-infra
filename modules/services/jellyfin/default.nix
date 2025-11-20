{
  config,
  lib,
  ...
}: let
  cfg = config.services'.jellyfin;
in {
  options.services'.jellyfin.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
    };
  };
}
