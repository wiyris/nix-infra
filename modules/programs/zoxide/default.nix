{
  config,
  lib,
  ...
}:
let
  cfg = config.programs'.zoxide;
in
{
  options.programs'.zoxide.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
      flags = [ "--cmd z" ];
    };
  };
}
