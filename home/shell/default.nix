{pkgs, ...}: {
  imports = [
    ./zsh
    ./nushell
    ./carapace.nix
  ];
  home.sessionVariables = {
    SHELL = "${pkgs.nushell}/bin/nu";
  };
}
