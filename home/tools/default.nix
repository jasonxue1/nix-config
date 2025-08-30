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
    ./fd.nix
    ./fzf.nix
    ./man.nix
    ./ripgrep.nix
    ./skim.nix
    ./treefmt.nix
    ./yazi.nix
    ./zoxide.nix
  ];
}
