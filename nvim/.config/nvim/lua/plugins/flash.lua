return {
  "folke/flash.nvim",
  opts = {
    labels = "sfghjklqwertyuiopzcvbnm",
    modes = {
      char = {
        jump_labels = false,
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
