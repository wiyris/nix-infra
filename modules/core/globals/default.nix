{ lib, ... }:
{
  options.globals = {
    userName = lib.mkOption {
      type = lib.types.str;
      default = "tsubaki";
      example = "tsubaki";
      description = "Default user name";
    };
    homeDirectory = lib.mkOption {
      type = lib.types.str;
      default = "/home/tsubaki";
      example = "/home/tsubaki";
      description = "Path of user home directory";
    };
    configDirectory = lib.mkOption {
      type = lib.types.str;
      default = "/home/tsubaki/dots";
      example = "/home/tsubaki/dots";
      description = "Path of config directory";
    };
    defaultShell = lib.mkOption {
      type = lib.types.str;
      default = "fish";
      example = "bash";
      description = "Default Command-line shell";
    };
  };
}
