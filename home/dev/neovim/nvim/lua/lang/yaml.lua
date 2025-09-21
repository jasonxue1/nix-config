---@type LazySpec
return {
  {
    "Astronvim/astrolsp",
    opts = function(_, opts)
      opts.servers =
        require("astrocore").list_insert_unique(opts.servers, { "yamlls" })
      opts.formatting = {
        disabled = require("astrocore").list_insert_unique(
          opts.formatting.disabled,
          { "yamlls" }
        ),
      }
    end,
  },
}
