{
  networking = {
    dhcpcd.wait = "background";
    enableIPv6 = false;
    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPortRanges = [
      ];
    };
  };
}
