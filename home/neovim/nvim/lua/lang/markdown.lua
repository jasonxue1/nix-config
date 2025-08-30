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
      local h = require "null-ls.helpers"
      local methods = require "null-ls.methods"
      local DIAGNOSTICS = methods.internal.DIAGNOSTICS
      local mado = h.make_builtin {
        name = "mado",
        meta = {
          description = "A fast Markdown linter written in Rust.",
          url = "https://github.com/akiomik/mado",
        },
        method = DIAGNOSTICS,
        filetypes = { "markdown" },
        factory = h.generator_factory,
        generator_opts = {
          command = "mado",
          args = {
            "check",
          },
          to_stdin = true,
          from_stderr = false,
          format = "line",
          check_exit_code = function(code) return code <= 1 end,
          on_output = h.diagnostics.from_patterns {
            {
              pattern = [[^([^:]+):(%d+):(%d+):%s+(MD%d+)%s+(.+)$]],
              groups = { "filename", "row", "col", "code", "message" },
              overrides = { diagnostics = { severity = 2, source = "mado" } },
            },
            {
              pattern = [[^([^:]+):(%d+):%s+(MD%d+)%s+(.+)$]],
              groups = { "filename", "row", "col", "code", "message" },
              overrides = { diagnostics = { severity = 2, source = "mado" } },
            },
          },
        },
      }
      opts.sources = require("astrocore").list_insert_unique(opts.sources, {
        require "none-ls.formatting.mdsf",
        mado,
      })
    end,
  },
}
