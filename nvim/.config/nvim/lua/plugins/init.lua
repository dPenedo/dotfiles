require('lazy').setup({
  performance = {
    cache = {
      enabled = true
    },
    rtp = {
      disabled_plugins = {
  "2html_plugin",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "matchit",
        "matchparen",
        "netrw",
        "netrwFileHandlers",
        "netrwPlugin",
        "netrwSettings",
        "rrhelper",
        "spec",
        "spellfile_plugin",
        "tar",
        "tarPlugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",

      }

    }
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',  opts = {} },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',
  event = "VeryLazy",
    opts = {} },

  {
  'stevearc/conform.nvim',
  opts = {},
},

  {
    'willothy/flatten.nvim',
    opts = {},
  },
  {
 "folke/zen-mode.nvim",
    event = "BufReadPre",
  opts = {}},
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {}
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    'chentoast/marks.nvim',
    event = "BufReadPre",
		opts ={}
  },

  {
    "kylechui/nvim-surround",
    lazy=true,
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
		opts ={}
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { }
  },
	{
		'brenoprata10/nvim-highlight-colors',
		lazy = true
	},
	{
  'stevearc/dressing.nvim',
  event = "VeryLazy",
  opts = {},
},
  { import = 'plugins.plugins' },
  { import = 'plugins.colorschemes' },
}, {})

-- vim: ts=2 sts=2 sw=2 et
