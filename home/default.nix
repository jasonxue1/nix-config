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
    ./browser
    ./fonts.nix
    ./key_mappings
    ./social.nix
    ./scripts
    ./auto_launch.nix

    # ./tmux
  ];
}
