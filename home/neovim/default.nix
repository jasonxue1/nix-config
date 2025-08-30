{
  pkgs,
  config,
  ...
}: let
  # Keep Neovim config in-repo and symlink it.
  configPath = "/etc/nix-darwin/home/neovim/nvim";
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  catppuccin.nvim.enable = false;
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink configPath;
  home = {
    packages = with pkgs; [
      neovim-remote
    ];
    sessionVariables = {
      # NVIM_LISTEN_ADDRESS = "/tmp/nvimsocket";
    };
  };
}
