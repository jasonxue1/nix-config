---@type LazySpec
return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    optional = true,
    priority = 1000,
    opts = {
      flavour = "mocha",
      background = { dark = "mocha" },
    },
  },
}
