return {
  "saghen/blink.cmp",
  dependencies = {
    {
      "Kaiser-Yang/blink-cmp-dictionary",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  opts = {
    completion = {
      ghost_text = {
        enabled = false,
      },
      list = { selection = { preselect = false } },
      --
    },
  },
}
