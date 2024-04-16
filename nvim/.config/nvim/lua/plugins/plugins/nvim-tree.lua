return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    view = {
      side = 'right',
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
    },
    actions = {
      open_file = {
        quit_on_open = true,
        window_picker = {
          chars = 'jkl;ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
        },
      },
    },
  },
}
