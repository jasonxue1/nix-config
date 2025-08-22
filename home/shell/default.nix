{pkgs, ...}: {
  imports = [
    ./zsh
    ./nushell
  ];
  home.sessionVariables = {
    SHELL = "${pkgs.nushell}/bin/nu";
  };
}
