{
  programs.tmux = {
    keyMode = "vi";
    prefix = "M-Space";
    extraConfig = ''
      # bind 'v' copy-mode
      bind -n M-v copy-mode
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy"
      bind -T copy-mode-vi Escape send-keys -X copy-pipe-and-cancel "wl-copy"
      bind p paste-buffer
      bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "wl-copy"

      # Config reload
      bind -n M-r source-file ~/.config/tmux/tmux.conf \; display-message "tmux.conf reloaded"

      # General configs
      # bind -n M-C-q detach
      bind -n M-q kill-pane
      bind -n M-Q kill-window

      # Split windows
      # bind -n M-Space split-window -h
      # bind -n M-Enter split-window -h -p 35
      # bind -n M-C-Enter split-window -v
      bind | split-window -hc "#{pane_current_path}"
      bind-key "\\" split-window -fh -c "#{pane_current_path}"
      bind - split-window -vc "#{pane_current_path}"

      bind-key Z select-pane -l \; resize-pane -Z

      bind -n M-n if-shell 'tmux list-windows | grep -q "^1:"' 'select-window -t 1' 'new-window -t 1'
      bind -n M-t if-shell 'tmux list-windows | grep -q "^2:"' 'select-window -t 2' 'new-window -t 2'
      bind -n M-h if-shell 'tmux list-windows | grep -q "^3:"' 'select-window -t 3' 'new-window -t 3'
      bind -n M-p if-shell 'tmux list-windows | grep -q "^4:"' 'select-window -t 4' 'new-window -t 4'
      bind -n M-d if-shell 'tmux list-windows | grep -q "^5:"' 'select-window -t 5' 'new-window -t 5'

      # Move to each pane
      bind -n M-i select-pane -R
      bind -n M-, select-pane -L
      bind -n M-e select-pane -U
      bind -n M-a select-pane -D
      # bind -n M-l select-pane -R
      # bind -n M-h select-pane -L
      # bind -n M-k select-pane -U
      # bind -n M-j select-pane -D

      # Resize each pane
      bind -n M-"-" resize-pane -L 5
      bind -n M-"=" resize-pane -R 5
      bind -n M-"'" resize-pane -U 2
      bind -n M-"." resize-pane -D 2

      # Swap windows
      bind -n M-"<" swap-window -d -t -1
      bind -n M-I swap-window -d -t +1

      # Toggle Bar
      # bind-key t set -g status
      bind-key -n M-b set -g status
    '';
  };
}
