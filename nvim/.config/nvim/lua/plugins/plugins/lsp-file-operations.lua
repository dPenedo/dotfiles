return {
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-tree.lua',
      'echasnovski/mini.files',
    },
    config = function()
      require('lsp-file-operations').setup()
    end,
  },
}