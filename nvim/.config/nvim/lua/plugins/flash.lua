return {
  "folke/flash.nvim",
  vscode = false,
  opts = {
    modes = {
      search = {
        -- when `true`, flash will be activated during regular search by default.
        -- You can always toggle when searching with `require("flash").toggle()`
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
}
