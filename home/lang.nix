{pkgs, ...}: {
  home.packages = with pkgs; [
    # lua
    lua-language-server
    stylua
    selene
    luarocks
    # nix
    nixd
    deadnix
    statix
    alejandra
  ];
}
