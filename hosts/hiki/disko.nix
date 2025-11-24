{inputs, ...}: {
  imports = [inputs.disko.nixosModules.disko];
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "ata-CT500MX500SSD1_1850E1DC9DA9";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                settings = {
                  allowDiscards = true;
                };
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/";
                };
              };
            };
          };
        };
      };
      data = {
        type = "disk";
        device = "ata-ST8000DM004-2CX188_ZR12QR8X";
        content = {
          type = "gpt";
          partitions = {
            root = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted-data";
                settings = {
                  allowDiscards = true;
                };
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/data";
                  mountOptions = ["umask=0002"];
                };
              };
            };
          };
        };
      };
    };
  };
}
