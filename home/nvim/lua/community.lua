---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.startup.alpha-nvim" },
  { import = "astrocommunity.fuzzy-finder.fzf-lua" },
  -- { import = "astrocommunity.media.image-nvim" },
}
