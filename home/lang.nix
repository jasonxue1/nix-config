{pkgs, ...}: {
  # Language toolchain packages for Lua and Nix.
  home.packages = with pkgs; [
    lua-language-server
    stylua
    selene
    lua51Packages.luarocks
    lua5_1
    nixd
    deadnix
    statix
    alejandra
  ];
}
