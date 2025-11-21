{
  config,
  lib,
  ...
}: {
  networking = {
    enableIPv6 = false;
    interfaces.enp2s0.ipv4.addresses = [
      {
        address = "192.168.0.42";
        prefixLength = 24;
      }
    ];
    defaultGateway = "192.168.0.1";
    nameservers = [
      # "192.168.0.1"
      "194.242.2.2"
      "1.1.1.1"
      "1.0.0.1"
    ];
  };
  services.openssh = {
    enable = true;
    # ports = [];
    settings = {
      PermitRootLogin = lib.mkForce "yes";
      # AllowUsers = [];
    };
  };
}
