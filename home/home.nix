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

    age
    sops
  ];
  home.sessionVariables = {
    https_proxy = "http://127.0.0.1:7897";
    http_proxy = "http://127.0.0.1:7897";
    all_proxy = "socks5://127.0.0.1:7897";

    EDITOR = "nvim";
  };

  imports = [
    ./neovim.nix
    ./kitty.nix
    ./zsh.nix
    ./catppuccin.nix
    ./lang.nix
    ./git.nix
    ./secrets.nix
  ];
}
