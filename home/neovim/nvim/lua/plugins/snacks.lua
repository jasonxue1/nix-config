---@module "snacks"
---@type LazySpec
return {
  "folke/snacks.nvim",
  optional = true,
  ---@type snacks.Config
  opts = {
    image = {
      doc = { enabled = true },
    },
  },
}
