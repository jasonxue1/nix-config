{config, ...}: let
  configPath = "${config.home.homeDirectory}/nix-config/base/dev/neovim/nvim";
in {
  programs.vim = {
    enable = true;
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
  };
  catppuccin.nvim.enable = false;
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink configPath;
}
