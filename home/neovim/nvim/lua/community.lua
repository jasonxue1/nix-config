---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.eslint" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.startup.alpha-nvim" },
  { import = "astrocommunity.fuzzy-finder.fzf-lua" },
}
