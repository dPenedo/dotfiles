return {
  'stevearc/oil.nvim',
  opts = {
    keymaps = {
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-s>"] = "actions.select_split",
      ["<C-r>"] = "actions.refresh",
      ["<C-h>"] = "actions.toggle_hidden",
    },
  },
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
