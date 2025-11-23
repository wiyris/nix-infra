{
  boot.kernelParams = ["ip=192.168.0.142::192.168.0.1:255.255.255.0:myhost::none"];
  boot.initrd = {
    availableKernelModules = ["r8169"];
    network = {
      enable = true;
      udhcpc.enable = true;
      flushBeforeStage2 = true;
      ssh = {
        enable = true;
        port = 22;
        authorizedKeys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINodUsq9pH/nA+bjgpjW5Q83V6ncbNI4p6n6HaHxu+Pd tsubaki@shiki"
        ];
        hostKeys = ["/etc/secrets/initrd/ssh_host_ed25519_key"];
      };
      postCommands = ''
        # Automatically ask for the password on SSH login
        echo 'cryptsetup-askpass || echo "Unlock was successful; exiting SSH session" && exit 1' >> /root/.profile
      '';
    };
  };
}
