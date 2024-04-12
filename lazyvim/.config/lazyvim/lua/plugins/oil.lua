return {
  'stevearc/oil.nvim',
  opts = {
      skip_confirm_for_simple_edits = true,
    keymaps = {
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-s>"] = "actions.select_split",
      ["<C-h>"] = false,
      ["<C-r>"] = "actions.refresh",

      ["."] = "actions.toggle_hidden",
    },
  },
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
