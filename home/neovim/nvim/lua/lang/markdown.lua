---@type LazySpec
return {
  {
    "Astronvim/astrolsp",
    opts = function(_, opts)
      opts.servers =
        require("astrocore").list_insert_unique(opts.servers, { "marksman" })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.sources = require("astrocore").list_insert_unique(opts.sources, {
        require "none-ls.diagnostics.mado",
      })
    end,
  },
}
