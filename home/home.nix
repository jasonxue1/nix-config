{pkgs, ...}: {
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    git
    curl
    coreutils
    maple-mono."NF-CN"
    ripgrep
    lazygit
    bottom
    nodejs
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
  home.sessionVariables = {
    https_proxy = "http://127.0.0.1:7897";
    http_proxy = "http://127.0.0.1:7897";
    all_proxy = "socks5://127.0.0.1:7897";

    EDITOR = "nvim";
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

  imports = [
    ./neovim.nix
    ./kitty.nix
    ./zsh.nix
    ./catppuccin.nix
    ./lang.nix
    ./git.nix
    ./secrets.nix
    ./tmux.nix
    ./firefox.nix
  ];
}
