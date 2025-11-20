{pkgs, ...}: {
  programs.tmux = {
    plugins = with pkgs.tmuxPlugins; [catppuccin];
    extraConfig = ''
      # https://github.com/catppuccin/tmux/discussions/317#discussioncomment-11064512

      set -g @catppuccin_flavor 'mocha'
      set -g @catppuccin_status_background 'none'
      set -g @catppuccin_window_status_style 'none'
      set -g @catppuccin_pane_status_enabled "off"
      set -g @catppuccin_pane_border_status "off"

      set -g window-status-separator ""
      set -g status-left-length 0
      # set -g status-left "#[fg=#{@thm_fg} bold]#H (#S) "
      set -g status-left "#[fg=#{@thm_fg} bold](#S) "
      set -ga status-left "#{?client_prefix,#[fg=#{@thm_red} bold]PREFIX ,#{?#{==:#{pane_mode},copy-mode},#[fg=#{@thm_yellow} bold]COPY ,#[fg=#{@thm_green} bold]NORMAL }}"

      ### Right Status
      set -g status-right-length 100
      set -g status-right ""
      # set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_overlay_0}, none]│"
      # set -ga status-right "#[bg=default,fg=#{@thm_lavender}] 󰭦 %Y-%m-%d 󰅐 %H:%M "

      # Run plugin
      run-shell ${pkgs.tmuxPlugins.catppuccin}/share/tmux-plugins/catppuccin/catppuccin.tmux

      # Configure Tmux
      set -g status-position top
      # set -g status-style "bg=#{@thm_bg}"
      set -g status-style "bg=default"
      set -g status-justify "absolute-centre"

      # pane border look and feel
      # setw -g pane-border-status top
      # setw -g pane-border-format ""
      # setw -g pane-active-border-style "bg=default,fg=#{@thm_overlay_0}"
      # setw -g pane-border-style "bg=default,fg=#{@thm_surface_0}"
      # setw -g pane-border-lines single

      # window look and feel
      set -wg automatic-rename on
      set -g automatic-rename-format "Window"

      set -g window-status-format " #I#{?#{!=:#{window_name},Window},: #W,} "
      # set -g window-status-style "bg=#{@thm_bg},fg=#{@thm_fg}"
      set -g window-status-style "bg=default,fg=#{@thm_surface_0}"
      # set -g window-status-last-style "bg=#{@thm_bg},fg=#{@thm_peach}"
      set -g window-status-activity-style "bg=#{@thm_red},fg=#{@thm_bg}"
      set -g window-status-bell-style "bg=#{@thm_red},fg=#{@thm_bg},bold"
      set -gF window-status-separator "#[bg=default,fg=#{@thm_overlay_0}]│"

      set -g window-status-current-format " #I#{?#{!=:#{window_name},Window},: #W,} "
      set -g window-status-current-style "bg=default,fg=#{@thm_lavender},bold"
      # set -g window-status-current-style "bg=#{@thm_lavender},fg=#{@thm_bg},bold"

      # https://github.com/catppuccin/tmux/issues/192#issuecomment-2255515681
      # set -g status 2
      # set -g status-format[1] ""

      set -g status-bg default
      set -g status-style bg=default
    '';
  };
}
