{pkgs, ...}: let
  secrets = import (builtins.path {
    path = ./secrets.nix;
    name = "secrets";
  }) {};
in {
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    curl
    coreutils
    maple-mono."NF-CN"
    ripgrep
    lazygit
    bottom
    nodejs
    gdu
  ];
  home.sessionVariables = {
    https_proxy = "http://127.0.0.1:7897";
    http_proxy = "http://127.0.0.1:7897";
    all_proxy = "socks5://127.0.0.1:7897";

    EDITOR = "nvim";

    GITHUB_TOKEN = secrets.github-token;
  };

  imports = [
    ./neovim.nix
    ./kitty.nix
    ./zsh.nix
    ./catppuccin.nix
    ./lang.nix
    ./git.nix
  ];
}
