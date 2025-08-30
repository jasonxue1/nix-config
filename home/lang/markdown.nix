{pkgs, ...}: {
  home.packages = with pkgs; [
    mermaid-cli
    marksman
    jasonPkgs.mado
    (mdsf.overrideAttrs (_: {
      doCheck = false;
    }))
  ];
}
