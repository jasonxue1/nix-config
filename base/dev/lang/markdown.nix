{pkgs, ...}: {
  home.packages = with pkgs; [
    mermaid-cli
    marksman
    mado
    mdx-language-server
    mdsf
  ];
}

