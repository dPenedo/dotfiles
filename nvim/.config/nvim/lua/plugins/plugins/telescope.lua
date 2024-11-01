return {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'debugloop/telescope-undo.nvim',

    -- "lexay/telescope-zoxide.nvim",
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  keys = {
    { '<C-p>', '<CMD>Telescope find_files <CR>', { desc = 'Telescope files' } },
    { '<leader>ff', '<CMD>Telescope find_files <CR>', { desc = 'Telescope files' } },
    { '<leader>/', '<CMD>Telescope current_buffer_fuzzy_find<CR>', { desc = 'Telescope para en el buffer actual' } },
    { '<leader>b', '<CMD>Telescope buffers<CR>', { desc = 'Telescope buffers' } },
    { '<leader><space>', '<CMD>Telescope buffers<CR>', { desc = 'Telescope buffers' } },
    { '<leader>gg', '<CMD>Telescope live_grep<CR>', { desc = 'Telescope grep' } },
    { '<leader>fn', '<CMD>NotasBuscar<CR>', { desc = '[N]otas [F]ind' } },
    { '<leader>u', '<CMD>Telescope undo<CR>', { desc = 'Telescope para en el historial de deshacer' } },
    { '<leader>fd', '<CMD>Telescope diagnostics<CR>', { desc = 'Telescope para en el historial de deshacer' } },
    { '<leader>ft', '<CMD>TodoTelescope<CR>', { desc = 'Telescope para TODOs' } },
    { '<leader>fh', '<CMD>Telescope help_tags<CR>', { desc = 'Telescope para etiquetas de ayuda' } },
    { '<leader>fr', '<CMD>Telescope registers<CR>', { desc = 'Telescope para registers' } },
    { '<leader>fc', '<CMD>Telescope commands<CR>', { desc = 'Telescope para commands' } },
    { '<leader>fk', '<CMD>Telescope keymaps<CR>', { desc = 'keymaps' } },
    { '<leader>fo', '<CMD>Telescope oldfiles<CR>', { desc = 'Telescope oldfiles' } },
    { '<leader>fj', '<CMD>Telescope jumplist<CR>', { desc = 'Telescope oldfiles' } },
    { '<leader>ca', '<CMD>lua vim.lsp.buf.code_action()<cr>', { desc = 'Code actions' } },
    { 'gr', '<CMD>Telescope lsp_references<CR>', { desc = 'Telescope lsp references' } },
    -- { '<leader>aa', '<CMD>Telescope commands<CR>', { desc = 'Telescope commands' } },
  },
}
