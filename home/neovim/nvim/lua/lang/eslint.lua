return {
  "Astronvim/astrolsp",
  opts = function(_, opts)
    opts.servers =
      require("astrocore").list_insert_unique(opts.servers, { "eslint" })
  end,
}
