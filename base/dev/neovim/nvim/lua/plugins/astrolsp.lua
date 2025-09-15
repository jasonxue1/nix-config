---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      inlay_hints = true, -- enable/disable inlay hints on start
    },
    formatting = {
      timeout_ms = 5000,
    },
  },
}
