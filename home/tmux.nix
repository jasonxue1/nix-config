{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      yank
      cpu
      prefix-highlight
    ];

    prefix = "C-a";
    keyMode = "vi";
    mouse = true;
    historyLimit = 100000;
    baseIndex = 1;
    escapeTime = 1;
    terminal = "xterm-256color";

    extraConfig = ''
      set -g allow-passthrough on
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM

      set -g default-terminal "xterm-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"
      set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
      set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0

      set-option -g status-position top

      # action key
      unbind C-b

      # default shell
      set -g default-shell "$SHELL"
      set -s extended-keys always
      set -g xterm-keys on
      set -sg repeat-time 300
      set -s focus-events on
      set -sg exit-empty on

      # display
      setw -g pane-base-index 1
      setw -g automatic-rename on
      set -g renumber-windows on

      # allow the title bar to adapt to whatever host you connect to
      set -g set-titles on
      set -g set-titles-string "#T"

      set -g display-panes-time 2000
      set -g display-time 2000
      set -g status-interval 1

      # window management
      bind -n M-w new-window -c "#{pane_current_path}"
      # break pane to window
      bind -n M-b break-pane
      # close self pane
      bind -n M-c kill-pane
      # close other pane
      bind -n M-o kill-pane -a
      # close window
      bind -n M-q kill-window
      # close other window
      bind -n M-e kill-window -a
      # switch to other window
      bind -n M-h previous-window
      bind -n M-l next-window

      bind -n M-Right resize-pane -R
      bind -n M-Left resize-pane -L
      bind -n M-Up resize-pane -U
      bind -n M-Down resize-pane -D

      # rebind split window
      unbind %
      bind | split-window -h -c "#{pane_current_path}"
      unbind '"'
      bind - split-window -v -c "#{pane_current_path}"

      # S 切换 session, N 新建 session
      bind S command-prompt -p "Switch to session:" "switch-client -t '%%'"
      bind N command-prompt -p "New session name:" "new-session -s'%%'"

      bind W choose-tree -Z

      bind H choose-tree 'move-pane -v -s "%%"'

      bind V choose-tree 'move-pane -h -s "%%"'

      # set -g status-keys emacs
      set -g mode-keys vi

      bind -n M-v copy-mode

      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind -T copy-mode-vi h send-keys -X cursor-left
      bind -T copy-mode-vi l send-keys -X cursor-right
      bind -T copy-mode-vi k send-keys -X cursor-up
      bind -T copy-mode-vi j send-keys -X cursor-down
      bind -T copy-mode-vi e send-keys -X next-word-end
      bind -T copy-mode-vi K send-keys -N 5 -X cursor-up
      bind -T copy-mode-vi J send-keys -N 5 -X cursor-down
      bind -T copy-mode-vi H send-keys -X start-of-line
      bind -T copy-mode-vi L send-keys -X end-of-line
      bind -T copy-mode-vi Y send-keys -X copy-end-of-line
      bind -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind -T copy-mode-vi = send-keys -X search-again
      bind -T copy-mode-vi = send-keys -X search-reverse

      set -g set-clipboard on

      # Moving window
      bind-key \{ swap-window -t -1 \; previous-window
      bind-key \} swap-window -t +1 \; next-window


      set -g status-right '#{cpu_bg_color} CPU: #{cpu_icon} #{cpu_percentage} | %a %h-%d %H:%M '

      is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?(g?\.?(view|n?vim?x?)(-wrapped)?(diff)?|fzf)'"

      bind-key -T copy-mode-vi 'C-h' if -F '#{pane_at_left}' ''' 'select-pane -L'
      bind-key -T copy-mode-vi 'C-j' if -F '#{pane_at_bottom}' ''' 'select-pane -D'
      bind-key -T copy-mode-vi 'C-k' if -F '#{pane_at_top}' ''' 'select-pane -U'
      bind-key -T copy-mode-vi 'C-l' if -F '#{pane_at_right}' ''' 'select-pane -R'

      bind-key -T copy-mode-vi C-Left resize-pane -L 1
      bind-key -T copy-mode-vi C-Down resize-pane -D 1
      bind-key -T copy-mode-vi C-Up resize-pane -U 1
      bind-key -T copy-mode-vi C-Right resize-pane -R 1
    '';
  };
}
