---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  optional = true,
  opts = function(_, opts)
    -- local null_ls = require "null-ls"
    local h = require "null-ls.helpers"
    local methods = require "null-ls.methods"
    local FORMATTING = methods.internal.FORMATTING
    local topiary_nushell = h.make_builtin {
      name = "topiary_nushell",
      meta = {
        description = "A uniform formatter for simple languages",
        url = "https://github.com/blindFS/topiary-nushell",
      },
      method = FORMATTING,
      filetypes = { "nu" },
      factory = h.formatter_factory,
      generator_opts = {
        command = "topiary",
        args = {
          "format",
          "$FILENAME",
        },
        to_temp_file = true,
      },
    }

    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      topiary_nushell,
    })
  end,
}
