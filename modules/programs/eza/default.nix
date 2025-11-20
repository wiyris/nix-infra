{
  lib,
  config,
  ...
}: let
  cfg = config.programs'.eza;
in {
  options.programs'.eza.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm' = {
      programs.eza = {
        enable = true;
        enableFishIntegration = true;
        enableNushellIntegration = false;
        git = true;
        icons = "auto";
        colors = "always";
        extraOptions = [
          "--icons"
        ];
      };
      home.shellAliases = {
        tree = "eza --all --long --tree";
      };
    };
  };
}
