---@type LazySpec
return {
  {
    "Astronvim/astrolsp",
    opts = function(_, opts)
      opts.formatting = {
        disabled = require("astrocore").list_insert_unique(
          opts.formatting.disabled,
          { "nixd" }
        ),
      }
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local null_ls = require "null-ls"
      opts.sources = require("astrocore").list_insert_unique(opts.sources, {
        null_ls.builtins.formatting.alejandra,
        null_ls.builtins.diagnostics.statix,
      })
    end,
  },
}
