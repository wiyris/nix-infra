{
  lib,
  config,
  ...
}:
let
  cfg = config.programs'.btop;
in
{
  options.programs'.btop.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm'.programs.btop = {
      enable = true;
      settings = {
        theme_background = false;
        truecolor = true;
        force_tty = false;
        vim_keys = true;
        rounded_corners = true;
        graph_symbol = "braille";
        update_ms = 200;
        proc_sorting = "cpu direct";
      };
    };
  };
}
