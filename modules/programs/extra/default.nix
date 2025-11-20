{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.programs'.extra;
in {
  options.programs'.extra.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    hm'.home.packages = with pkgs; [
      git
      neovim
    ];
  };
}
