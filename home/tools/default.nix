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
    ./direnv.nix
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./man.nix
    ./ripgrep.nix
    ./skim.nix
    ./treefmt.nix
    ./yazi.nix
    ./zathura.nix
    ./zoxide.nix
  ];
}
