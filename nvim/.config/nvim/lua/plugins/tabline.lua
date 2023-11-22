return {
  {
    "crispgm/nvim-tabline",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional
    config = function()
      require("tabline").setup({
        show_icon = true, -- show file extension icon
        brackets = { " ", " " }, -- file name brackets surrounding
      })
    end,
  },
}
