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
      centralize_selection = true,
      cursorline = true,
      debounce_delay = 15,
      preserve_window_proportions = false,
      number = false,
      relativenumber = false,
      signcolumn = "yes",
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
    modified = {
      enable = true,
    },
    diagnostics = {
      enable = true,
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
