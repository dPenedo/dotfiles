return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "debugloop/telescope-undo.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },

    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          -- theme = "ivy",
          mappings = {
            i = {
              ["<C-s>"] = "select_horizontal",
              ["<C-h>"] = "which_key",
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
            n = {
              ["<C-s>"] = "select_horizontal",
            },
          },
          extensions = {
            fzf = {
              fuzzy = true,                   -- false will only do exact matching
              override_generic_sorter = true, -- override the generic sorter
              override_file_sorter = true,    -- override the file sorter
              case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            },
          },
        },
      })
      telescope.load_extension("fzf")
      telescope.load_extension("undo")
      telescope.load_extension("file_browser")

      -- telescope.load_extension("scope")
    end,
  },
}
