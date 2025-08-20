---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.eslint" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.indent.snacks-indent-hlchunk" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.lsp.actions-preview-nvim" },
}
