{
  config,
  lib,
  ...
}: let
  cfg = config.programs'.nh;
  inherit (config.globals) configDirectory;
in {
  options.programs'.nh.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.programs.nh = {
      enable = true;
      flake = "${configDirectory}";
      clean = {
        enable = true;
        extraArgs = "--keep 10";
      };
    };
  };
}
