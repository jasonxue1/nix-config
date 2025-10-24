---@module "snacks"
---@type LazySpec
return {
  "folke/snacks.nvim",
  optional = true,
  opts = function(_, opts)
    ---@type snacks.config
    opts = {
      image = {
        doc = { enabled = true },
      },
      dashboard = {
        preset = {
          keys = require("astrocore").list_insert_unique(
            opts.dashboard.preset.keys,
            { { icon = " ", key = "q", desc = "Quit", action = ":qa" } }
          ),
        },
      },
    }
  end,
}
