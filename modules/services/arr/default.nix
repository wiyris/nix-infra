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
    environment.extraInit = "umask 0000";
    services.transmission.settings.umask = "0000";
    services = {
      # lidarr = {
      #   enable = true;
      #   openFirewall = true;
      #   group = "arr";
      # };
      radarr = {
        enable = true;
        openFirewall = true;
        group = "arr";
      };
      readarr = {
        enable = true;
        openFirewall = true;
        group = "arr";
      };
      sonarr = {
        enable = true;
        openFirewall = true;
        group = "arr";
      };
      prowlarr = {
        enable = true;
        openFirewall = true;
      };
      # flaresolverr = {
      #   enable = true;
      #   openFirewall = true;
      # };
      bazarr = {
        enable = true;
        openFirewall = true;
        group = "arr";
      };
      jellyseerr = {
        enable = true;
        openFirewall = true;
      };
    };
  };
}
