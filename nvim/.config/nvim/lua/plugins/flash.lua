return {
  "folke/flash.nvim",
  opts = {
    modes = {
      char = {
        jump_labels = true,
      },
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
