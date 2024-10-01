require('lazy').setup({

  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        '2html_plugin',
        'getscript',
        'getscriptPlugin',
        'gzip',
        'logipat',
        'matchit',
        'matchparen',
        'netrw',
        'netrwFileHandlers',
        'netrwPlugin',
        'netrwSettings',
        'rrhelper',
        'spec',
        'spellfile_plugin',
        'tar',
        'tarPlugin',
        'vimball',
        'vimballPlugin',
        'zip',
        'zipPlugin',
      },
    },
  },

  -- Useful plugin to show you pending keybinds.
  -- { 'folke/which-key.nvim',     opts = {} },
  -- "gc" to comment visual regions/lines
  -- { 'numToStr/Comment.nvim',        event = 'VeryLazy', opts = {} },

  -- { 'echasnovski/mini.starter', version = '*', opts = {} },
  {
    'stevearc/conform.nvim',
    event = 'InsertEnter',
    opts = {},
  },

  {
    'willothy/flatten.nvim',
    -- event = 'VeryLazy',
    opts = {},
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {}, -- this is equalent to setup({}) function
  },
  {
    'chentoast/marks.nvim',
    event = 'BufReadPre',
    opts = {},
  },

  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {

      highlight = {
        comments_only = false,
      },
      keywords = {
        NOTE = { icon = ' ', color = 'info' },
      },
    },
  },
  {
    'brenoprata10/nvim-highlight-colors',
    lazy = true,
  },
  -- {
  --   'stevearc/dressing.nvim',
  --   event = 'VeryLazy',
  --   opts = {},
  -- },
  { import = 'plugins.plugins' },
  { import = 'plugins.colorschemes' },
}, {})

-- vim: ts=2 sts=2 sw=2 et
