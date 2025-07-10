return {
  "dpenedo/Otree.nvim",
  branch = "feat/add-right-side-option",
  lazy = false,
  dependencies = {
    "stevearc/oil.nvim",
  },
  opts = {
    win_size = 40,
    open_on_left = false,
  },
  keys = {
    { "<leader>e", "<CMD>Otree<CR>", desc = "Explorer" },
  },
}
