return {
  "Eutrius/Otree.nvim",
  lazy = false,
  dependencies = {
    "stevearc/oil.nvim",
  },
  opts = {
    win_size = 40,
    open_on_left = true,

    show_hidden = true,
    show_ignore = true,
    git_signs = true,
    lsp_signs = true,
    oil = "",
  },
  keys = {
    { "<leader>e", "<CMD>Otree<CR>", desc = "Explorer" },
  },
}
