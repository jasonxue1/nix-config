{pkgs, ...}: let
  taplo-zsh-completion = pkgs.runCommand "taplo-zsh-completion" {buildInputs = [pkgs.taplo];} ''
    mkdir -p $out/share/zsh/site-functions
    ${pkgs.taplo}/bin/taplo completions zsh > $out/share/zsh/site-functions/_taplo
  '';
in {
  home.packages = [
    pkgs.carapace-bridge
    taplo-zsh-completion
  ];
  programs.carapace = {
    enable = true;
  };
  home.sessionVariables = {
    CARAPACE_BRIDGES = "bash,fish,inshellisense,zsh";
  };
  programs.zsh = {
    enableCompletion = true;
    completionInit = ''
      fpath=("${taplo-zsh-completion}/share/zsh/site-functions" $fpath)
      autoload -Uz compinit
      compinit
    '';
  };
}
