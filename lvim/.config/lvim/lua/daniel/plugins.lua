lvim.plugins = {
	{
		"lmburns/lf.nvim",
		dependencies = {
			"akinsho/toggleterm.nvim",
		},
		opts = {
			default_actions = { -- default action keybindings
				["<C-t>"] = "tabedit",
				["<C-s>"] = "split",
				["<C-v>"] = "vsplit",
				["<C-o>"] = "tab drop",
			},
			escape_quit = true,
			border = "curved",
			layout_mapping = "<M-f>", -- resize window with this key
			views = { -- window dimensions to rotate through
				{ width = 0.990, height = 0.990 },
				{ width = 0.750, height = 0.750 },
			},
			winblend = 6,
			highlights = { -- highlights passed to toggleterm
				Normal = { guibg = "#181820", guifg = "#f00" },
			},
		},
	},
	{
		"crispgm/nvim-tabline",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional
		config = function()
			require("tabline").setup({
				show_icon = true, -- show file extension icon
				brackets = { " ", " " }, -- file name brackets surrounding
			})
		end,
	},

	-- Probando a comentar
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				tailwind = true,
			},
		},
	},
	{
		"folke/zen-mode.nvim",
		opts = {
			window = { height = 0.9 },
		},
	},
	-- {
	-- 	"xiyaowong/transparent.nvim",
	-- },
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		config = function()
			require("oil").setup({
				delete_to_trash = true,
				skip_confirm_for_simple_edits = true,
				keymaps = {
					["<C-v>"] = "actions.select_vsplit",
					["<C-s>"] = "actions.select_split",
					["<C-t>"] = "actions.select_tab",
				},
			})
		end,
	},
	{ "debugloop/telescope-undo.nvim" },
	-- {
	--   "Pocco81/auto-save.nvim",
	--   config = function()
	--     require("auto-save").setup()
	--   end,
	-- },
	-- JAVA
	{ "mfussenegger/nvim-jdtls", ft = { "java" } },

	-- colorschemes
	{
		"deparr/tairiki.nvim",
		lazy = false,
	},
	{ "tobi-wan-kenobi/zengarden" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"rebelot/kanagawa.nvim",
		opts = {
			transparent = false,
			functionStyle = { bold = true },
			dimInactive = true,
			typeStyle = { bold = true },
			keywordStyle = { bold = true },
			colors = {
				palette = {
					-- fujiWhite = "#DCD7Bb",
					-- oldWhite = "#C8C093",
					-- fujiWhite = "#F1eed7",
					-- oldWhite = "#F1eed7",
					-- sumiInk3 = "#120309",
					-- autumnGreen = "#037971",
					-- springGreen = "#9EBC9F",
				},
			},
		},
	},

	{
		"sainnhe/gruvbox-material",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_enable_bold = 1
			vim.g.gruvbox_material_visual = "red background"
			vim.g.gruvbox_material_ui_contrast = "hight"
			-- vim.g.gruvbox_material_transparent_background = 1
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_show_eob = 0
			vim.g.gruvbox_material_statusline_style = "default"
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup({
				style = "vulgaris", -- Choose between 'vulgaris' (regular) and 'multiplex' (greener)
				code_style = {
					keywords = "bold",
					functions = "bold",
					strings = "italic",
					variables = "none",
				},
			})
		end,
	},
}
