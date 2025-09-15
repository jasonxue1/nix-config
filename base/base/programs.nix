{...}: {
  programs.bat.enable = true;
  programs.eza.enable = true;
  programs.fd.enable = true;
  programs.ripgrep = {
    enable = true;
    arguments = ["-i"];
  };
  programs.yazi.enable = true;
  programs.bottom.enable = true;
  programs.fzf.enable = true;
  programs.direnv = {
    enable = true;
    silent = true;
    nix-direnv.enable = true;
  };
  programs.codex.enable = true;
  programs.zathura = {
    enable = true;
  };
  programs.man.enable = true;
  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-P -c";
  };
}

