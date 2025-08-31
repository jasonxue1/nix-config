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
    ./dbus.nix
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./just.nix
    ./man.nix
    ./ripgrep.nix
    ./skim.nix
    ./treefmt.nix
    ./yazi.nix
    ./zathura.nix
    ./zoxide.nix
  ];
}
