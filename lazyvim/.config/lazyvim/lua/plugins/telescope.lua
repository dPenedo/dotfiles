return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "debugloop/telescope-undo.nvim",
  },

  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
    },
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
        ["<Tab>"] = false,
        ["<Tab>"] = "select_default",
        ["<C-s>"] = "select_horizontal",
        ["<C-v>"] = "select_vertical",
        ["<C-h>"] = "which_key",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
      n = {
        ["<C-s>"] = "select_horizontal",
        ["<C-v>"] = "select_vertical",
      },
    },
  },
}
