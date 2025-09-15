{pkgs, ...}: {
  home.packages = with pkgs; [
    curl
    wget
    coreutils
    gdu
    age
    sops
    tree-sitter
    dbus
    imagemagick
    treefmt
    jason.clash-verge-rev
  ];
}
