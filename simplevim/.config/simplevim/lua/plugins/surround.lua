return {
  "kylechui/nvim-surround",
  lazy = false,
  config = function()
    require("nvim-surround").setup({
      aliases = {
        ["n"] = "**",
        ["i"] = "*",
        ["s"] = "```",
      },
    })
  end,
}
