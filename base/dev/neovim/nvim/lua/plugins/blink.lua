---@type LazySpec
return {
  "Saghen/blink.cmp",
  optional = true,
  opts = {
    completion = {
      ghost_text = {
        enabled = true,
        show_with_menu = true,
        show_without_selection = true,
      },
      menu = {
        auto_show = true,
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
    },
  },
}
