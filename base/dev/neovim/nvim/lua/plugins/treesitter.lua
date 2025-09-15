---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  optional = true,
  opts = {
    ensure_installed = "all",
    ignore_install = {
      "ipkg",
    },
  },
}
