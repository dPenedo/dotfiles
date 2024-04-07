return {
  {
    'willothy/flatten.nvim',
    -- config = true,
    -- or pass configuration with
    opts = {
      window = {
        open = 'alternate',
      },
    },
    -- Ensure that it runs first to minimize delay when opening file from terminal
    priority = 1001,
  },
  {
 "folke/zen-mode.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
},
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    }
  },
  -- { "xiyaowong/transparent.nvim",
  -- },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    'chentoast/marks.nvim',
    config = function()
      require("marks").setup()
    end,
  },

  {
    "kylechui/nvim-surround",
    lazy=true,
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  -- {
  -- "SR-MyStar/yazi.nvim",
  --     lazy = true,
  -- cmd = "Yazi",
  -- opts = {
  --   -- ...
  -- },
  -- },
  -- {
  --   'lmburns/lf.nvim',
  --   dependencies = {
  --     'akinsho/toggleterm.nvim',
  --   },
  --   opts = {
  --     default_actions = {
  --       -- default action keybindings
  --       ['<C-t>'] = 'tabedit',
  --       ['<C-s>'] = 'split',
  --       ['<C-v>'] = 'vsplit',
  --       ['<C-o>'] = 'tab drop',
  --     },
  --   },
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
    }
  },
  -- {
  --   'lukas-reineke/headlines.nvim',
  --   lazy = true,
  --   opts = function()
  --     local opts = {}
  --     for _, ft in ipairs { 'markdown', 'norg', 'rmd', 'org' } do
  --       opts[ft] = {
  --         headline_highlights = {},
  --       }
  --       for i = 1, 6 do
  --         local hl = 'Headline' .. i
  --         vim.api.nvim_set_hl(0, hl, { link = 'Headline', default = true })
  --         table.insert(opts[ft].headline_highlights, hl)
  --       end
  --     end
  --     return opts
  --   end,
  --   ft = { 'markdown', 'norg', 'rmd', 'org' },
  --   config = function(_, opts)
  --     -- PERF: schedule to prevent headlines slowing down opening a file
  --     vim.schedule(function()
  --       require('headlines').setup(opts)
  --       require('headlines').refresh()
  --     end)
  --   end,
  -- },
	{
		'brenoprata10/nvim-highlight-colors',
		lazy = true
	},
	{
		"shellRaining/hlchunk.nvim",
		event = { "UIEnter" },
		opts = {
			chunk = {
				-- details about support_filetypes and exclude_filetypes in https://github.com/shellRaining/hlchunk.nvim/blob/main/lua/hlchunk/utils/filetype.lua
				style = {
					{ fg = "#54546D" },
					{ fg = "#c21f30" }, -- this fg is used to highlight wrong chunk
				},
				textobject = "",
				max_file_size = 1024 * 1024,
				error_sign = true,
			},
			line_num = {
				enable = false,
			},

			blank = {
				enable = false,}
		}
	},
	{
  'stevearc/dressing.nvim',
  opts = {},
},


  -- {
  --   "jackMort/ChatGPT.nvim",
  --   config = function()
  --     require("chatgpt").setup()
  --     local home = vim.fn.expand("$HOME")
  --     api_key_cmd = "gpg --decrypt " .. home .. "/cc.txt.gpg"
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   }
  -- },
  -- { import = 'plugins.plugins.toggleterm' },
}
