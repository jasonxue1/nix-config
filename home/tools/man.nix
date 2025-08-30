{...}: {
  programs.man = {
    enable = true;
  };
  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-P -c";
  };
}
