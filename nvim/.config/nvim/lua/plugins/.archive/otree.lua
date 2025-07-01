return {
  "Eutrius/Otree.nvim",
  lazy = false,
  dependencies = {
    "stevearc/oil.nvim",
    -- { "echasnovski/mini.icons", opts = {} },
    -- "nvim-tree/nvim-web-devicons",
  },
  opts = {
    win_size = 40,
  },
  keys = {
    { "<leader>e", "<CMD>Otree<CR>", desc = "Explorer" },
  },
}
