 return {
     -- WARN: no funciona
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
    },
}
