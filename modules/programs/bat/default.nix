{
  config,
  lib,
  ...
}: let
  cfg = config.programs'.bat;
in {
  options.programs'.bat.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    programs.bat = {
      enable = true;
      config = {
        theme = lib.mkForce "base16";
      };
    };

    environment.shellAliases = {
      cat = "bat --plain";
    };
  };
}
