---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      inlay_hints = true, -- enable/disable inlay hints on start
    },
    -- customize lsp formatting options
  },
}
