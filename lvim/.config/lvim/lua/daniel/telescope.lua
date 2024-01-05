lvim.builtin.telescope.defaults = {
  prompt_prefix = "   ",
  selection_caret = "  ",
  entry_prefix = "  ",
  initial_mode = "insert",
  selection_strategy = "reset",
  sorting_strategy = "ascending",
  layout_strategy = "horizontal",
  layout_config = {
    horizontal = {
      prompt_position = "top",
      preview_width = 0.55,
      results_width = 0.8,
    },
    vertical = {
      mirror = false,
    },
    width = 0.87,
    height = 0.80,
    preview_cutoff = 120,
  },

  mappings = {
    i = {
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
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
    }
  }
}
