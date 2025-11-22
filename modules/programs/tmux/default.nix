{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.programs'.tmux;
  inherit (config.globals) defaultShell;
  shell = "${pkgs.${defaultShell}}/bin/${defaultShell}";
in {
  options.programs'.tmux.enable = lib.mkEnableOption {};
  config = lib.mkIf cfg.enable {
    imports = [
      ./dots/binds.nix
      ./plugins/catppuccin.nix
    ];
    programs.tmux = {
      enable = true;
      inherit shell;
      mouse = true;
      escapeTime = 0;
      extraConfig = ''
        set -g status-position top
        # Start windows and panes at 1, not 0
        set -g base-index 1
        setw -g pane-base-index 1
      '';
      plugins = with pkgs.tmuxPlugins; [
        # tmux-fzf
        sensible
      ];
    };

    environment.shellAliases = {
      t = "tmux new-session";
      ta = "tmux attach";
      tl = "tmux list-sessions";
      tk = "tmux kill-session -t";
      tks = "tmux kill-server";
    };
  };
}
