{pkgs, ...}: {
  # Lua language tools and toolchain
  home.packages = with pkgs; [
    lua-language-server
    stylua
    selene
    lua51Packages.luarocks
    lua5_1
  ];
}

