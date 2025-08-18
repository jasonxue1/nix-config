{pkgs, ...}: {
  # Zsh shell configuration, aliases, and plugins.
  programs.zsh = {
    enable = true;
    shellAliases = {
      v = "nvim";
      lg = "lazygit";
      nixfmt = "nix fmt --no-write-lock-file";
      ls = "eza --icons=auto";
      ll = "eza -lg --icons=auto";
      tn = "tmux new -s";
      ta = "tmux a -t";
      y = "yazi";
      cd = "z";
      sk = "fzf";
    };
    initContent = ''
      if [ -f $HOME/.env ]; then
        set -a
        source $HOME/.env
        set +a
      fi

      eval "$(zoxide init zsh)"

      if [ -f $HOME/.p10k.zsh ]; then
      	source $HOME/.p10k.zsh
      fi
    '';
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
      {
        name = "autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
      {
        name = "fzf-history-search";
        src = pkgs.zsh-fzf-history-search;
        file = "share/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh";
      }
      {
        name = "fast-syntax-highlighting";
        src = pkgs.zsh-fast-syntax-highlighting;
        file = "share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh";
      }
    ];
  };
  home.file.".p10k.zsh".source = ./.p10k.zsh;
}
