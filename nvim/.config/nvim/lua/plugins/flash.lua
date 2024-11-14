return {
  "folke/flash.nvim",
  opts = {
    labels = "jklqsfghwertyuiopzcvbnm",
    search = {
      -- search/jump in all windows
      multi_window = false,
    },
    multi_line = false,
    modes = {
      search = { enabled = false },
      char = {
        jump_labels = true,
        highlight = {
          backdrop = false, -- Desactiva el fondo en el modo char
        },
      },
    },
    highlight = {
      backdrop = false, -- Desactiva el fondo globalmente
    },
  },
  keys = {
    { "S", mode = { "n", "o", "x" }, false },
    {
      "<a-s>",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
  },
}
