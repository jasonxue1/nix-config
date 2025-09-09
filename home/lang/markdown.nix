{pkgs, ...}: {
  home.packages = with pkgs; [
    mermaid-cli
    marksman
    mado
    pkgs.master.mdsf
  ];
}
