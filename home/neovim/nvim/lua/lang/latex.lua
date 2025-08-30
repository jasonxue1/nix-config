---@type LazySpec
return {
  {
    "Astronvim/astrolsp",
    opts = function(_, opts)
      opts.servers = require("astrocore").list_insert_unique(
        opts.servers,
        { "texlab", "ltex_plus" }
      )
      opts.config = {
        texlab = {
          settings = {
            texlab = {
              auxDirectory = "build",
              build = {
                executable = "latexmk",
                args = {
                  "-xelatex",
                  "-interaction=nonstopmode",
                  "-file-line-error",
                  "-outdir=build",
                  "%f",
                },
                forwardSearchAfter = false,
                onSave = true,
              },
              forwardSearch = {
                executable = "zathura",
                args = {
                  "%p",
                },
              },
              chktex = {
                onOpenAndSave = true,
                onEdit = true,
              },
            },
          },
        },
      }
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.sources = require("astrocore").list_insert_unique(opts.sources, {
        require "none-ls.formatting.tex_fmt",
      })
    end,
  },
}
