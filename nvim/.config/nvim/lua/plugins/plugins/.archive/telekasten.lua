-- No funciona
return {
  'renerocksai/telekasten.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    require('telekasten').setup {
      home = vim.fn.expand '/home/daniel/Documentos/Dropbox/Notas/', -- Especifica la ruta de tu directorio de notas
    }
  end,
  keys = {
    { '<leader>nt', '<cmd>Telekasten panel<CR>', desc = 'Open Telekasten panel' },
    { '<leader>nf', '<cmd>Telekasten find_notes<CR>', desc = 'Find notes' },
    { '<leader>ng', '<cmd>Telekasten search_notes<CR>', desc = 'Search notes' },
    { 'gf', '<cmd>Telekasten follow_link<CR>', desc = 'Follow link' },
    { '<leader>nn', '<cmd>Telekasten new_note<CR>', desc = 'Create new note' },
    { '<leader>nb', '<cmd>Telekasten show_backlinks<CR>', desc = 'Show backlinks' },
    { '<BS>', '<cmd>Telekasten toggle_todo<CR>', desc = 'Toggle todo' },
    { '<leader>nr', '<cmd>Telekasten rename_note<CR>', desc = 'Rename note' },
    { '[[', '<cmd>Telekasten insert_link<CR>', mode = 'i', desc = 'Insert link' },
  },
}
