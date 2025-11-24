{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services'.arr;
in {
  options.services'.arr.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    users.groups.arr = {};
    services = {
      # radarr = {
      #   enable = true;
      #   openFirewall = true;
      # };
      sonarr = {
        enable = true;
        openFirewall = true;
        group = "media";
      };
      prowlarr = {
        enable = true;
        openFirewall = true;
      };
      # jellyseerr = {
      #   enable = true;
      #   openFirewall = true;
      # };
    };
  };
}
