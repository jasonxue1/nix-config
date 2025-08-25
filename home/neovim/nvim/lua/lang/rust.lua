---@type LazySpec
return {
  "mrcjkb/rustaceanvim",
  optional = true,
  opts = {
    dap = {
      adapter = {
        type = "executable",
        command = "lldb-dap",
        name = "lldb",
      },
    },
  },
}
