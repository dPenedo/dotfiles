return {
  "folke/flash.nvim",
  vscode = false,
  opts = {
    modes = {
      search = {
        enabled = true,
      },
      char = {
        enabled = true,
        highlight = { backdrop = false },
        jump_labels = true,
        multi_line = false,
      },
    },
  },
  keys = {
    { "s", mode = { "n", "x", "o" }, false },
  },
}
