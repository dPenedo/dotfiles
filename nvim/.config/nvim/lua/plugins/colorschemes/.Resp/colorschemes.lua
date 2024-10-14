return {
	--
	-- {
	-- 	'sainnhe/everforest',
	-- 	lazy = false,
	-- 	config = function()
	-- 		vim.cmd [[
	--         " https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt
	--         " Important!!
	--         " For dark version.
	--         " set background=dark
	--         " Set contrast.
	--         " This configuration option should be placed before `colorscheme gruvbox-material`.
	--         " Available values: 'hard', 'medium'(default), 'soft'
	--         let g:everforest_background = 'hard'
	--         let g:everforest_transparent_background = 2
	--         " For better performance
	--         let g:everforest_better_performance = 1
	--         let g:everforest_enable_italic = 1
	--         let  g:everforest_enable_bold = 1
	--         let g:everforest_diagnostic_text_highlight = 1
	--         " let g:everforest_diagnostic_line_highlight = 1
	--         let g:everforest_diagnostic_virtual_text = "colored"
	--         let g:everforest_sign_column_background = 'none'
	--
	--         colorscheme gruvbox-material
	--         ]]
	-- 	end,
	-- },

	-- {
	-- 	'ramojus/mellifluous.nvim',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		color_set = 'mellifluous',
	-- 		-- color_set = 'mellifluous',
	-- 		-- dim_inactive = true,
	-- 		transparent_background = {
	-- 			enabled = true,
	-- 			floating_windows = true,
	-- 			telescope = true,
	-- 			file_tree = true,
	-- 			cursor_line = false,
	-- 			status_line = false,
	-- 		},
	-- 		-- kanagawa_dragon = {
	-- 		-- 	color_overrides = {
	-- 		-- 		dark = {
	-- 		-- 			bg = '#31353f',
	-- 		-- 		},
	-- 		-- 	},
	-- 		-- },
	-- 		-- mellifluous = {
	-- 		-- 	color_overrides = {
	-- 		-- 		dark = {
	-- 		-- 			-- bg = '#31353f',
	-- 		-- 			-- bg = '#232834',
	-- 		-- 			-- bg = '#1f2637',
	-- 		-- 			-- bg = '#232834',
	-- 		-- 			-- bg = '#1b1e28', -- Se ve genial pero no el visual
	-- 		-- 			--
	-- 		-- 			-- bg = '#141c2e',
	-- 		-- 			bg = '#111827',
	-- 		-- 			-- bg = '#31353f',
	-- 		-- 			-- bg = '#60687b',
	-- 		-- 			-- shades_fg = '#31353f',
	-- 		-- 		},
	-- 		-- 		light = {
	-- 		-- 			-- bg = '#31353f',
	-- 		-- 			-- bg = '#232834',
	-- 		-- 			-- bg = '#1f2637',
	-- 		-- 			-- bg = '#232834',
	-- 		-- 			-- bg = '#1b1e28', -- Se ve genial pero no el visual
	-- 		-- 			--
	-- 		-- 			-- bg = '#141c2e',
	-- 		-- 			bg = '#DEDACF',
	-- 		-- 			-- bg = '#31353f',
	-- 		-- 			-- bg = '#60687b',
	-- 		-- 			-- shades_fg = '#31353f',
	-- 		-- 		},
	-- 		-- 	},
	-- 		-- },
	-- 	},
	-- 	-- config = function()
	-- 	--   vim.cmd.colorscheme 'melange'
	-- 	--   -- vim.cmd.Mellifluous 'mountain'
	-- 	-- end,
	-- },
	-- { 'savq/melange-nvim' },
	-- {
	-- 	'ribru17/bamboo.nvim',
	-- 	lazy = false,
	-- 	config = function()
	-- 		require('bamboo').setup {
	-- 			-- optional configuration here
	-- 			style = 'vulgaris',
	-- 			transparent = true, -- Show/hide background
	-- 		}
	-- 		require('bamboo').load()
	-- 	end,
	-- },
	-- { 'kvrohit/rasmus.nvim' },
	-- {
	-- 	'https://github.com/sainnhe/sonokai',
	-- 	opts = {
	--
	-- 		config = function()
	-- 			vim.cmd [[
	--            let g:sonokai_style= "shusia"
	-- 	]]
	-- 		end,
	-- 	},
	-- },
	--
	-- {
	--   "loctvl842/monokai-pro.nvim",
	--   lazy = false,
	--   priority = 1000,
	--   opts = {},
	--
	--
	-- {
	-- 	'fynnfluegge/monet.nvim',
	-- 	name = 'monet',
	-- 	opts = {
	-- 		transparent_background = true,
	-- 		dark_mode = true,
	--
	-- 		color_overrides = {
	-- 			dark0 = '#161617',
	-- 		},
	-- 	},
	-- },
	-- {
	-- 	'rose-pine/neovim',
	-- 	name = 'rose-pine',
	-- 	opts = {
	-- 		styles = {
	-- 			bold = true,
	-- 			italic = true,
	-- 			transparency = false,
	-- 		},
	-- 	},
	-- },

	-- {
	-- 	'catppuccin/nvim',
	-- 	name = 'catppuccin',
	-- 	opts = {
	-- 		transparent_background = true, -- disables setting the background color.
	-- 		color_overrides = {
	-- 			mocha = {
	-- 				pink = '#F5C5C2',
	-- 				base = '#161722',
	-- 				mauve = '#A8A6F7',
	-- 				text = '#dee4f8',
	-- 				-- lavender = '#CBD1FB',
	-- 			},
	-- 			latte = {
	-- 				mantle = '#c9cddf',
	-- 			},
	-- 		},
	-- 		highlight_overrides = {
	-- 			mocha = function(colors)
	-- 				return {
	-- 					LineNr = { fg = colors.overlay2 },
	-- 					CursorLineNr = { fg = colors.yellow },
	-- 					NvimTreeOpenedFolderName = { fg = colors.lavender },
	-- 					NvimTreeEmptyFolderName = { fg = colors.teal },
	-- 				}
	-- 			end,
	-- 		},
	-- 	},
	-- 	priority = 1000,
	-- },
	-- {
	-- 	'vague2k/vague.nvim',
	-- 	config = function()
	-- 		require('vague').setup {
	-- 			-- optional configuration here
	-- 			transparent = true, -- don't set background
	-- 		}
	-- 	end,
	-- },
	-- {
	-- 	'mellow-theme/mellow.nvim',
	-- },
	-- {
	-- 	'sho-87/kanagawa-paper.nvim',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		transparent = true,
	-- 	},
	-- },
	-- {
	-- 	'AlexvZyl/nordic.nvim',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	-- opts = {
	-- 	-- 	transparent_bg = true,
	-- 	-- },
	-- },
	--
	-- {
	-- 	'dgox16/oldworld.nvim',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		highlight_overrides = {
	-- 			Normal = { bg = 'NONE' },
	-- 			NormalNC = { bg = 'NONE' },
	-- 			NormalFloat = { bg = 'NONE' },
	-- 			FloatBorder = { bg = 'NONE' },
	-- 			CursorLine = { bg = '#222128' },
	-- 		},
	-- 	},
	-- },
	-- Lazy
	-- {
	-- 	'polirritmico/monokai-nightasty.nvim',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		dark_style_background = 'transparent', -- default, dark, transparent, #color
	-- 		color_headers = true,            -- Enable header colors for each header level (h1, h2, etc.)
	-- 	},
	-- },
	-- {
	-- 	'2giosangmitom/nightfall.nvim',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		transparent = true,
	-- 		color_overrides = {
	-- 			maron = { background = '#000100' },
	-- 		},
	-- 		integrations = {
	-- 			headlines = { enabled = true },
	-- 		},
	-- 	},
	-- },
	-- Using lazy.nvim
}