{pkgs, ...}: {
  home.packages = with pkgs; [
    codex
    curl
    wget
    coreutils
    ripgrep
    bottom
    gdu
    fzf
    age
    sops
    tree-sitter
    eza
    yazi
    zoxide
    skim
    bat
  ];
}
