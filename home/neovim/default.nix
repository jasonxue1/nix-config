{config, ...}: let
  # Keep Neovim config in-repo and symlink it.
  configPath = "/etc/nix-darwin/home/neovim/nvim";
in {
  programs.neovim.enable = true;
  catppuccin.nvim.enable = false;
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink configPath;
}
