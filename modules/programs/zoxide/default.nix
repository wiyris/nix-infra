{
  config,
  lib,
  ...
}: let
  cfg = config.programs'.zoxide;
in {
  options.programs'.zoxide.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
      options = ["--cmd z"];
    };
  };
}
