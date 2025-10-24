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
    ruffle
    jason.nix-olde
    cachix
  ];
}
