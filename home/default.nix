{pkgs, ...}: {
  # Home Manager entrypoint: packages, session vars, and module imports.
  home.stateVersion = "25.05";
  home.sessionVariables = {
    https_proxy = "http://127.0.0.1:7897";
    http_proxy = "http://127.0.0.1:7897";
    all_proxy = "socks5h://127.0.0.1:7897";

    EDITOR = "nvim";
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

  imports = [
    ./neovim
    ./kitty.nix
    ./shell
    ./catppuccin.nix
    ./lang
    ./git.nix
    ./tools
    ./secrets
    ./tmux
    ./firefox.nix
    ./fonts.nix
    ./key_mappings
    ./social.nix
  ];
}
