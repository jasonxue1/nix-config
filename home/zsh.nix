{...}: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      v = "nvim";
      lg = "lazygit";
      nixfmt = "nix fmt --no-write-lock-file .";
    };
  };
}
