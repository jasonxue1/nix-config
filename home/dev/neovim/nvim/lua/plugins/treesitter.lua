---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  optional = true,
  opts = {
    ensure_installed = "all",
    ignore_install = { "ipkg" },
  },
  config = function(_, opts)
    require("nvim-treesitter.install").prefer_git = true
    require("nvim-treesitter.configs").setup(opts)
  end,
}
