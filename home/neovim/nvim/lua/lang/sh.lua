---@type LazySpec
return {
  {
    "Astronvim/astrolsp",
    opts = function(_, opts)
      opts.servers =
        require("astrocore").list_insert_unique(opts.servers, { "bashls" })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require "null-ls"

      opts.sources = require("astrocore").list_insert_unique(opts.sources, {
        null_ls.builtins.formatting.shfmt,
      })
    end,
  },
}
