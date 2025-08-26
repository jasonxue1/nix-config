{...}: {
  home.stateVersion = "25.05";
  imports = [
    ./neovim
    ./kitty.nix
    ./shell
    ./catppuccin.nix
    ./lang
    ./git.nix
    ./tools
    ./secrets
    # ./tmux
    ./browser
    ./fonts.nix
    ./key_mappings
    ./social.nix
    ./scripts
  ];
}
