return {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
	lazy = true,
  event = { "VeryLazy" },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  }
