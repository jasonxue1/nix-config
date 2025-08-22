{pkgs, ...}: {
  imports = [
    ./zsh
    ./nushell
    ./carapace.nix
    ./starship.nix
  ];
  home.sessionVariables = {
    SHELL = "${pkgs.nushell}/bin/nu";
  };
  home.shell = {
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };
}
