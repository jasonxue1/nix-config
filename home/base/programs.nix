{...}: {
  programs = {
    bat.enable = true;
    eza.enable = true;
    fd.enable = true;
    ripgrep = {
      enable = true;
      arguments = ["-i"];
    };
    yazi.enable = true;
    bottom.enable = true;
    fzf.enable = true;
    direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };
    codex.enable = true;
    zathura = {
      enable = true;
    };
    man.enable = true;
    zoxide.enable = true;
  };
  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-P -c";
  };
}
