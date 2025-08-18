{pkgs, ...}: {
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
    ];
  };
  home.file.".p10k.zsh".source = ./.p10k.zsh;
}
