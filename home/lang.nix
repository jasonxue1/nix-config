{pkgs, ...}: {
  home.packages = with pkgs; [
    # lua
    lua-language-server
    stylua
    selene
    # nix
    nixd
    deadnix
    statix
    alejandra
  ];
}
