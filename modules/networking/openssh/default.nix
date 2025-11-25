{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    sshfs
    # sshs
  ];
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };
}
