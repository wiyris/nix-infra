{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services'.lms;
in {
  options.services'.lms.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [pkgs.lms];
    users = {
      groups.lms = {};
      users = {
        lms.isSystemUser = true;
        lms.group = "lms";
      };
    };
    systemd.services.lms = {
      description = "Lightweight Music Server";
      wants = ["network-online.target"];
      after = ["network-online.target"];
      wantedBy = ["multi-user.target"];
      serviceConfig = {
        Type = "simple";
        Restart = "on-failure";
        RestartSec = 1;
        Environment = "OMP_THREAD_LIMIT=1";
        User = "lms";
        Group = "lms";
        ExecStart = "${pkgs.lms}/bin/lms";
      };
    };
    networking.firewall.allowedTCPPorts = [5082];
  };
}
