return {
  "romgrk/barbar.nvim",
  lazy = false,
  opts = {
    icons = {
      buffer_index = true,
      modified = { button = " " },
      button = false,
      separator = { left = "▎", right = "⎹" },
    },
  },

  keys = {
    -- Move to previous/next
    { "<A-,>", "<Cmd>BufferMovePrevious<CR>", { desc = "Barbar" } },
    { "<A-.>", "<Cmd>BufferMoveNext<CR>", { desc = "Barbar" } },

    -- Goto buffer in position...
    { "<leader>1", "<Cmd>BufferGoto 1<CR>", { desc = "Barbar" } },
    { "<leader>2", "<Cmd>BufferGoto 2<CR>", { desc = "Barbar" } },
    { "<leader>3", "<Cmd>BufferGoto 3<CR>", { desc = "Barbar" } },
    { "<leader>4", "<Cmd>BufferGoto 4<CR>", { desc = "Barbar" } },
    { "<leader>5", "<Cmd>BufferGoto 5<CR>", { desc = "Barbar" } },
    { "<leader>6", "<Cmd>BufferGoto 6<CR>", { desc = "Barbar" } },
    { "<leader>7", "<Cmd>BufferGoto 7<CR>", { desc = "Barbar" } },
    { "<leader>8", "<Cmd>BufferGoto 8<CR>", { desc = "Barbar" } },
    { "<leader>9", "<Cmd>BufferGoto 9<CR>", { desc = "Barbar" } },
    { "<leader>0", "<Cmd>BufferLast<CR>", { desc = "Barbar" } },

    -- Close buffer
    { "<leader>bq", "<Cmd>BufferClose<CR>", { desc = "Barbar" } },
    -- Magic buffer-picking mode
    { "<C-p>", "<Cmd>BufferPick<CR>", { desc = "Barbar" } },
    { "<leader>bx", "<Cmd>BufferPickDelete<CR>", { desc = "Barbar" } },
    { "<leader>ut", "<Cmd>BarbarDisable<CR>", { desc = "Barbar" } },
    { "<leader>uT", "<Cmd>BarbarEnable<CR>", { desc = "Barbar" } },
  },
}
