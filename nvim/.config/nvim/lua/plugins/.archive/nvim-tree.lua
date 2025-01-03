return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    hijack_cursor = true,
    view = {
      side = "left",
    },

    renderer = {
      indent_markers = {
        enable = true,
      },
    },
    modified = {
      enable = true,
    },
    diagnostics = {
      enable = true,
    },
    actions = {
      open_file = {
        -- quit_on_open = true,
        window_picker = {
          chars = "jkl;uiop",
        },
      },
    },
  },
  keys = {
    { "<leader>e", "<CMD>NvimTreeFindFileToggle<CR>", { desc = "NvimTree" } },
  },
}
