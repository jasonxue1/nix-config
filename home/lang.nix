{pkgs, ...}: {
  home.packages = with pkgs; [
    # lua
    lua-language-server
    stylua
    selene
    lua51Packages.luarocks
    lua5_1
    # nix
    nixd
    deadnix
    statix
    alejandra
  ];
}
