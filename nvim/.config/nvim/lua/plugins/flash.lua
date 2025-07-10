return {
  "folke/flash.nvim",
  opts = {
    -- labels = "jklqsfghwertyuiopzcvbnm",
    labels = "jklwdsasdfjklqwertyuiopzxcvbnm",

    search = {
      -- search/jump in all windows
      multi_window = true,
      mode = "search",
    },
    multi_line = false,
    modes = {
      search = { enabled = false },
      char = {
        enabled = false,
        jump_labels = false,
        multi_line = false,
        highlight = {
          backdrop = true, -- Desactiva el fondo en el modo char
        },
      },
    },
    highlight = {
      backdrop = true, -- Desactiva el fondo globalmente
    },
  },
  keys = {
    { "s", mode = { "n", "o", "x" }, false },
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "<A-s>",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
  },
}
