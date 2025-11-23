{
  config,
  lib,
  ...
}: let
  cfg = config.programs'.bat;
in {
  options.programs'.bat.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm' = {
      programs.bat = {
        enable = true;
        settings = {
          theme = lib.mkForce "base16";
        };
      };

      home.shellAliases = {
        cat = "bat --plain";
      };
    };
  };
}
