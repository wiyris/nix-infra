{
  config,
  lib,
  ...
}: let
  cfg = config.programs'.starship;
in {
  options.programs'.starship.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    programs.starship = {
      enable = true;
      # enableBashIntegration = false;
      # enableFishIntegration = true;
    };
  };
}
