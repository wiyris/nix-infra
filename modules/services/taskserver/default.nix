{
  config,
  lib,
  ...
}: let
  cfg = config.services'.taskserver;
in {
  options.services'.taskserver.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    services.taskserver = {
      enable = true;
      openFirewall = true;
    };
  };
}
