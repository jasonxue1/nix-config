---@type LazySpec
return {
  {
    "Astronvim/astrolsp",
    opts = function(_, opts)
      opts.servers =
        require("astrocore").list_insert_unique(opts.servers, { "lua_ls" })
      opts.formatting = {
        disabled = require("astrocore").list_insert_unique(
          opts.formatting.disabled,
          { "lua_ls" }
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
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.selene,
      })
    end,
  },
}
