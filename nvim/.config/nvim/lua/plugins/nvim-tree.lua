return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    modified = {
      enable = true,
    },

    view = {
      centralize_selection = true,
      cursorline = true,
      debounce_delay = 15,
      preserve_window_proportions = false,
      number = false,
      relativenumber = false,
      signcolumn = "yes",
      width = 40,
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
      icons = {
        glyphs = {

          modified = "󰈸",
        },
      },
    },
    actions = {

      open_file = {
        window_picker = {
          chars = "jklhABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        },
      },
    },
  },
  keys = {
    {
      "<leader>e",
      "<CMD>NvimTreeFindFile<CR>",
      desc = "Explorer Nvimtree (Root Dir)",
    },
  },
}
