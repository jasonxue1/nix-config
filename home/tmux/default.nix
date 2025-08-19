{pkgs, ...}: let
  cpuinfo = pkgs.writeShellScriptBin "cpuinfo" (builtins.readFile ./cpuinfo.sh);
in {
  # Tmux defaults and keybindings tuned for vi workflow.
  home.packages = [
    cpuinfo
    pkgs.osx-cpu-temp
  ];
  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      yank
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
      set -g default-terminal "screen-256color"
      set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'
      set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'

      set-option -g status-position top
      unbind C-b
      set -g default-shell "$SHELL"
      set -s extended-keys always
      set -g xterm-keys on
      set -sg repeat-time 300
      set -s focus-events on
      set -sg exit-empty on

      setw -g pane-base-index 1
      setw -g automatic-rename on
      set -g renumber-windows on
      set -g set-titles on
      set -g set-titles-string "#T"
      set -g display-panes-time 2000
      set -g display-time 2000
      set -g status-interval 1

      bind -n M-w new-window -c "#{pane_current_path}"
      bind -n M-b break-pane
      bind -n M-c kill-pane
      bind -n M-o kill-pane -a
      bind -n M-q kill-window
      bind -n M-e kill-window -a
      bind -n M-h previous-window
      bind -n M-l next-window
      bind -n M-Right resize-pane -R
      bind -n M-Left resize-pane -L
      bind -n M-Up resize-pane -U
      bind -n M-Down resize-pane -D
      unbind %
      bind | split-window -h -c "#{pane_current_path}"
      unbind '"'
      bind - split-window -v -c "#{pane_current_path}"
      bind S command-prompt -p "Switch to session:" "switch-client -t '%%'"
      bind N command-prompt -p "New session name:" "new-session -s'%%'"
      bind W choose-tree -Z
      bind H choose-tree 'move-pane -v -s "%%"'
      bind V choose-tree 'move-pane -h -s "%%"'

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
      bind-key \{ swap-window -t -1 \; previous-window
      bind-key \} swap-window -t +1 \; next-window

      set -g status-right '#(${cpuinfo}/bin/cpuinfo) '
    '';
  };
}
