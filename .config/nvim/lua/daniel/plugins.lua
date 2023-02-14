-------------------------------------------------
-- DT'S NEOVIM CONFIGURATION
-- Neovim website: https://neovim.io/
-- DT's dotfiles: https://gitlab.com/dwt1/dotfiles
-------------------------------------------------

local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end




-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
    augroup packer_user_config
      autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])
packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

    --  Coc
    -- use {'neoclide/coc.nvim', branch = 'release'}

    -- Kitty
	use("knubie/vim-kitty-navigator")
    -- Emmet
	use("mattn/emmet-vim")

    -- Lines
	use("crispgm/nvim-tabline")
	use("akinsho/bufferline.nvim")
	use("nvim-lualine/lualine.nvim")

    -- Transparent
	use("xiyaowong/nvim-transparent")

    -- Treesitter
	-- use("nvim-treesitter/nvim-treesitter") --  Treesitter Syntax Highlighting
    -- use {
    --     'nvim-treesitter/nvim-treesitter',
    --     run = ':TSUpdate'
    -- }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

	-- Tim Pope Plugins --
    --
--	use("tpope/vim-surround")

	-- Syntax Highlighting and Colors --
	use("PotatoesMaster/i3-vim-syntax")
	use("kovetskiy/sxhkd-vim")
	-- use("vim-python/python-syntax")
	-- use("ap/vim-css-color")
    use("norcalli/nvim-colorizer.lua")

-- Snippets
    use ("L3MON4D3/LuaSnip") --snippet engine
    use ("rafamadriz/friendly-snippets") -- a bunch of snippets to use



    
-- Whichkey
--    use("folke/which-key.nvim")

    -- Ranger
	use("kevinhwang91/rnvimr")
    -- nvimtree
    use("kyazdani42/nvim-tree.lua")
    use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
    -- Comments
    use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

-- Format
    use("sbdchd/neoformat")


-- Notes
    use("renerocksai/telekasten.nvim")
    use("renerocksai/calendar-vim")
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    
    use {"ellisonleao/glow.nvim"}


-- Org
use {'nvim-orgmode/orgmode', config = function()
  require('orgmode').setup{}
end
}
use {'akinsho/org-bullets.nvim', config = function()
  require('org-bullets').setup()
end}
    
    -- Iconos
	use("kyazdani42/nvim-web-devicons")
	use("ryanoasis/vim-devicons")
    -- Dependencias
	use("nvim-lua/plenary.nvim")
    -- indent
	use("lukas-reineke/indent-blankline.nvim")



	-- Colorschemes --
	-- use("RRethy/nvim-base16")
	-- use("kyazdani42/nvim-palenight.lua")
	use("nanotech/jellybeans.vim")
	use("rebelot/kanagawa.nvim")
	use("jacoborus/tender.vim")
	use("bluz71/vim-moonfly-colors")
	-- use("mhartington/oceanic-next")
    use ('Yazeed1s/oh-lucy.nvim')
    use ('sainnhe/sonokai')
    -- use ({ 'projekt0n/github-nvim-theme' })

    use ('navarasu/onedark.nvim')
	-- use("srcery-colors/srcery-vim")
	-- use("sam4llis/nvim-tundra")
	use("sainnhe/everforest")
    use ("EdenEast/nightfox.nvim")
    use ("ajmwagar/vim-deus")
    use { "ellisonleao/gruvbox.nvim" }
    use ('tiagovla/tokyodark.nvim')
    use ('folke/tokyonight.nvim')
    use ("savq/melange")



    use { 'kaiuri/nvim-juliana' }
    -- use ('dracula/vim')
    use {"Mofiqul/dracula.nvim"}



    use ("wuelnerdotexe/vim-enfocado")
    use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
        require("catppuccin").setup {
            flavour = "mocha" -- mocha, macchiato, frappe, latte
        }
        -- vim.api.nvim_command "colorscheme catppuccin"
    end
    }
    
   
  
-- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }


        --Autopair
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }


	-- Other stuff --
    --  
	use("frazrepo/vim-rainbow")
    use("nvim-lua/popup.nvim")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-telescope/telescope-file-browser.nvim")
	use("junegunn/fzf.vim")
	use("junegunn/fzf")
	use("nvim-telescope/telescope-media-files.nvim")



	if packer_bootstrap then
		packer.sync()
	end
end)


    --Telescope

require('telescope').setup()
require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

require("telescope").load_extension "file_browser"
require('telescope').load_extension('media_files')

--Indentation
require("indent_blankline").setup {
    char = "",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
  show_trailing_blankline_indent = false,
}
require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})


    -- Treesitter
--
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = { 'org' },
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}



-- Org 
require('cmp').setup({
 sources = {
  { name = 'orgmode' }
  }
})
-- Load custom treesitter grammar for org filetype
 require('orgmode').setup_ts_grammar()

 require('orgmode').setup({
  org_agenda_files = {'~/Dropbox/sync/*'},
  org_default_notes_file = '~/Dropbox/sync/Eginbeharrak.org',
})
-- --
--










-- Color nvim
require("colorizer").setup()


-- Bufferline
vim.opt.termguicolors = true
require("bufferline").setup{}

-- Lualine
require('lualine').setup()

require('packer').use { 'mhartington/formatter.nvim' }

require('formatter').setup({
  logging = false,
  filetype = {
    javascript, css, html = {
        -- prettierd
       function()
          return {
            exe = "prettierd",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
    },

    -- other formatters ...
  }
})



-- lspzero
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()






--
local dracula = require("dracula")
dracula.setup({
  -- customize dracula color palette
  colors = {
    bg = "#282A36",
    fg = "#F8F8F2",
    selection = "#44475A",
    comment = "#727169",
    red = "#FF5555",
    orange = "#FFB86C",
    yellow = "#F1FA8C",
    green = "#50fa7b",
    purple = "#BD93F9",
    cyan = "#8BE9FD",
    pink = "#FF79C6",
    bright_red = "#FF6E6E",
    bright_green = "#69FF94",
    bright_yellow = "#FFFFA5",
    bright_blue = "#D6ACFF",
    bright_magenta = "#FF92DF",
    bright_cyan = "#A4FFFF",
    bright_white = "#FFFFFF",
    menu = "#21222C",
    visual = "#3E4452",
    gutter_fg = "#4B5263",
    nontext = "#3B4048",
  },
  -- show the '~' characters after the end of buffers
  show_end_of_buffer = true, -- default false
  -- use transparent background
  transparent_bg = false, -- default false
  -- set custom lualine background color
  lualine_bg_color = "#44475a", -- default nil
  -- set italic comment
  italic_comment = true, -- default false
  -- overrides the default highlights see `:h synIDattr`
  overrides = {
    -- Examples
    -- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
    -- NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
    -- Nothing = {} -- clear highlight of Nothing
  },
})
-- Default options
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    module_default = true,  -- Default enable value for modules
    styles = {              -- Style to be applied to different syntax groups
      comments = "italic",    -- Value is any valid attr-list value `:help attr-list`
      conditionals = "bold",
      constants = "bold",
      functions = "bold",
      keywords = "italic",
      numbers = "NONE",
      operators = "bold",
      strings = "NONE",
      types = "italic",
      variables = "bold",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})


-- -- Lsp config
-- require("lspconfig").pylsp.setup{}

