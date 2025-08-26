{pkgs, ...}: {
  home.packages = with pkgs; [
    curl
    wget
    coreutils
    gdu
    age
    sops
    tree-sitter
  ];
  imports = [
    ./bat.nix
    ./bottom.nix
    ./codex.nix
    ./eza.nix
    ./fzf.nix
    ./ripgrep.nix
    ./skim.nix
    ./yazi.nix
    ./zoxide.nix
  ];
}
