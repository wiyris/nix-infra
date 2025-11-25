{
  config,
  lib,
  ...
}:
let
  cfg = config.programs'.fzf;
in
{
  options.programs'.fzf.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm'.programs.fzf = {
      enable = true;
      enableFishIntegration = true;
      colors = lib.mkForce { };
      defaultOptions = [
        "--height 40%"
        "--reverse"
        "--border"
        "--color=16"
      ];
      defaultCommand = "rg --files --hidden --glob=!.git/";
    };
  };
}
