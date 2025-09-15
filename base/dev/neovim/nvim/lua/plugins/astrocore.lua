---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      diagnostics = { virtual_text = true, virtual_lines = true }, -- diagnostic settings on startup
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    options = {
      opt = {
        scrolloff = 5,
        sidescrolloff = 5,
      },
    },
    mappings = {
      n = {
        U = {
          "<cmd>redo<CR>",
          desc = "Redo",
        },
      },
    },
  },
}
