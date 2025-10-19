---@type LazySpec
return {
  {
    "Astronvim/astrolsp",
    opts = function(_, opts)
      opts.servers =
        require("astrocore").list_insert_unique(opts.servers, { "tinymist" })
      opts.config = {
        tinymist = {
          settings = {
            formatterMode = "typstyle",
            exportPdf = "onType",
            formatterProseWrap = true,
            lint = {
              enable = true,
              when = "onType",
            },
          },
        },
      }
    end,
  },
  {
    "kaarmu/typst.vim",
    enabled = false,
    optional = true,
  },
  {
    "jasonxue1/blank",
    cmd = "OpenPdf",
    config = function()
      vim.api.nvim_create_user_command("OpenPdf", function()
        local filepath = vim.api.nvim_buf_get_name(0)
        if filepath:match "%.typ$" then
          local pdf_path = filepath:gsub("%.typ$", ".pdf")
          vim.system { "zathura", pdf_path }
        end
      end, {})
    end,
  },
}
