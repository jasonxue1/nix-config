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
    ./tmux
    ./firefox.nix
    ./fonts.nix
    ./key_mappings
    ./social.nix
    ./scripts
  ];
}
