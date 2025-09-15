{pkgs, ...}: {
  home.packages = [
    pkgs.tex-fmt
    pkgs.texlab
    (pkgs.texlive.withPackages (ps:
      with ps; [
        xetex
        latexmk
        biber
        scheme-small
        collection-langchinese
      ]))
  ];
}

