-- Funciona vien, pero no lo estoy usando

return {
  'j-morano/buffer_manager.nvim',
  lazy = true,
  opts = { line_keys = '1234567890' },
  keys = {
    { '<leader>m', '<CMD>lua require("buffer_manager.ui").toggle_quick_menu()<CR>', desc = 'Buffer Manager' },
  },
}
