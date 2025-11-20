{
  config,
  lib,
  ...
}: let
  servicePort = 5005;
  cfg = config.services'.kavita;
in {
  options.services'.kavita.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = [servicePort];
    services.kavita = {
      enable = true;
      tokenKeyFile = config.sops.secrets.kavita-token.path;
      settings = {
        Port = servicePort;
      };
    };

    sops.secrets.kavita-token = {
      owner = "kavita";
      group = "kavita";
      sopsFile = ../../../secrets/secrets.yaml;
    };
  };
}
