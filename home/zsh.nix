{...}: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      v = "nvim";
      lg = "lazygit";
      nixfmt = "nix fmt --no-write-lock-file .";
    };
    initContent = ''
      if [ -f $HOME/.env ]; then
        set -a
        source $HOME/.env
        set +a
      fi
    '';
  };
}
