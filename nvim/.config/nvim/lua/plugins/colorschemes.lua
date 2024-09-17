return {
	{
		'rebelot/kanagawa.nvim',
		lazy = false,
		opts = {
			-- transparent = true, -- do not set background color
			compile = true,
			transparent = true,
			functionStyle = { bold = true },
			dimInactive = false,
			typeStyle = { bold = false },
			keywordStyle = { bold = false },
			colors = {
				theme = {
					wave = {
						ui = {
							-- bg_gutter = '#161617',
							bg_gutter = 'none',
							nontext = '#B1A9A0',
						},
					},
					lotus = {
						ui = {
							bg_gutter = 'none',
							-- bg_gutter = '#161617',
							-- bg = '#f6f9e1',
						},
					},
				},
				palette = {
					-- Wave
					fujiWhite = '#E8DBCF',
					-- oldWhite = '#CDD6F4',
					oldWhite = '#c9cbd1',

					-- Brown:
					-- sumiInk0 = '#191715',
					-- sumiInk1 = '#1B1917',
					-- sumiInk2 = '#1D1B19',
					-- sumiInk3 = '#221F1C',
					-- sumiInk4 = '#2A2622',
					-- sumiInk5 = '#36322C',
					-- sumiInk6 = '#4A433D',

					--Neutral:
					sumiInk0 = '#161616',
					sumiInk1 = '#181818',
					sumiInk2 = '#1a1a1a',
					sumiInk3 = '#1F1F1F',
					sumiInk4 = '#2A2A2A',
					sumiInk5 = '#363636',
					sumiInk6 = '#545454',

					-- -- Popup and Floats
					-- waveBlue1 = "#223249",
					-- waveBlue2 = "#2D4F67",
					waveBlue1 = '#4A433D',
					waveBlue2 = '#3A334c',
					--

					-- sumiInk6 = '#3A3A4B',
					-- Lotus
					lotusInk1 = '#161617',
					lotusWhite0 = '#B3BDFD',
					lotusWhite1 = '#dcd5ac',
					lotusWhite2 = '#e5ddb0',
					lotusWhite3 = '#F8F3F0',
					lotusWhite4 = '#DEE4F8',
					lotusWhite5 = '#CDD6F4',
				},
			},
			styles = {
				sidebars = 'transparent',
				floats = 'transparent',
			},
			overrides = function(colors)
				local theme = colors.theme
				return {
					NvimTreeIndentMarker = { fg = theme.syn.comment },
				}
			end,
		},
	},
	--
	--   {'sainnhe/everforest',
	-- lazy = false,
	--   config = function()
	--         vim.cmd([[
	--         " https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt
	--         " Important!!
	--         " For dark version.
	--         " set background=dark
	--         " Set contrast.
	--         " This configuration option should be placed before `colorscheme gruvbox-material`.
	--         " Available values: 'hard', 'medium'(default), 'soft'
	--         let g:everforest_background = 'hard'
	--         let g:everforest_transparent_background = 1
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
	--         ]])
	--     end,
	--   },

	-- {
	-- 	'sainnhe/gruvbox-material',
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
	--         let g:gruvbox_material_background = 'hard'
	--         let g:gruvbox_material_transparent_background = 1
	--         " For better performance
	--         let g:gruvbox_material_ui_contrast = 'high'
	--         let g:gruvbox_material_better_performance = 1
	--         let g:gruvbox_material_enable_italic = 1
	--         let  g:gruvbox_material_enable_bold = 1
	--         let g:gruvbox_material_diagnostic_text_highlight = 1
	--         " let g:gruvbox_material_diagnostic_line_highlight = 1
	--         let g:gruvbox_material_diagnostic_virtual_text = "colored"
	--         let g:gruvbox_material_sign_column_background = 'none'
	--
	--         colorscheme gruvbox-material
	--         ]]
	-- 	end,
	-- },
	-- {
	-- 	'folke/tokyonight.nvim',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		transparent = true, -- Enable this to disable setting the background color
	-- 		day_brightness = 0.1, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	-- 	},
	-- },
	{
		'ramojus/mellifluous.nvim',
		lazy = false,
		priority = 1000,
		opts = {
			color_set = 'mellifluous',
			-- color_set = 'mellifluous',
			-- dim_inactive = true,
			transparent_background = {
				enabled = true,
				floating_windows = true,
				telescope = true,
				file_tree = true,
				cursor_line = false,
				status_line = false,
			},
			kanagawa_dragon = {
				color_overrides = {
					dark = {
						bg = '#31353f',
					},
				},
			},
			mellifluous = {
				color_overrides = {
					dark = {
						-- bg = '#31353f',
						-- bg = '#232834',
						-- bg = '#1f2637',
						-- bg = '#232834',
						-- bg = '#1b1e28', -- Se ve genial pero no el visual
						--
						-- bg = '#141c2e',
						bg = '#111827',
						-- bg = '#31353f',
						-- bg = '#60687b',
						-- shades_fg = '#31353f',
					},
					light = {
						-- bg = '#31353f',
						-- bg = '#232834',
						-- bg = '#1f2637',
						-- bg = '#232834',
						-- bg = '#1b1e28', -- Se ve genial pero no el visual
						--
						-- bg = '#141c2e',
						bg = '#DEDACF',
						-- bg = '#31353f',
						-- bg = '#60687b',
						-- shades_fg = '#31353f',
					},
				},
			},
		},
		-- config = function()
		--   vim.cmd.colorscheme 'melange'
		--   -- vim.cmd.Mellifluous 'mountain'
		-- end,
	},
	{ 'dpenedo/melange-nvim' },
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
	{ 'kvrohit/rasmus.nvim' },
	{
		'https://github.com/sainnhe/sonokai',
		opts = {

			config = function()
				vim.cmd [[
            let g:sonokai_style= "shusia"
		]]
			end,
		},
	},
	--
	-- {
	--   "loctvl842/monokai-pro.nvim",
	--   lazy = false,
	--   priority = 1000,
	--   opts = {},
	--
	--
	{
		'EdenEast/nightfox.nvim',
		opts = {
			options = {
				styles = {     -- Style to be applied to different syntax groups
					comments = 'italic', -- Value is any valid attr-list value `:help attr-list`
					conditionals = 'bold',
					constants = 'bold',
					functions = 'bold',
					keywords = 'NONE',
					numbers = 'NONE',
					operators = 'NONE',
					strings = 'NONE',
					types = 'italic',
					variables = 'NONE',
				},
			},
			palettes = {
				dayfox = {
					-- Defining multiple shades is done by passing a table
					bg3 = '#e4dcd4',
					sel0 = '#CDD6F4',
					-- sel1 = "#7e94ed",
					blue = { base = '#464C8B', bright = '#7e94ed', dim = '#595C78' },
				},
			},
		},
	},
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
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	opts = {
	-- 		styles = {
	-- 			bold = true,
	-- 			italic = true,
	-- 			transparency = false,
	-- 		},
	-- 	}
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
	{
		'vague2k/vague.nvim',
		config = function()
			require('vague').setup {
				-- optional configuration here
				transparent = true, -- don't set background
			}
		end,
	},
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
	{
		'polirritmico/monokai-nightasty.nvim',
		lazy = false,
		priority = 1000,
		opts = {
			dark_style_background = 'transparent', -- default, dark, transparent, #color
			color_headers = true,            -- Enable header colors for each header level (h1, h2, etc.)
		},
	},
	{
		'2giosangmitom/nightfall.nvim',
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
		},
	},
}
