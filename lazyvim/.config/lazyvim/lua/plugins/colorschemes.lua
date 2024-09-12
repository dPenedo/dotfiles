return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		opts = {
			-- transparent = true, -- do not set background color
			compile = true,
			transparent = true,
			functionStyle = { bold = false },
			dimInactive = false,
			typeStyle = { bold = false },
			keywordStyle = { bold = true },
			colors = {
				theme = {
					wave = {
						ui = {
							-- bg_gutter = '#161617',
							bg_gutter = "none",
							nontext = "#5E6982",
						},
					},
				},
				palette = {
					-- fujiWhite = "#DCD7Bb
					-- sumiInk1 = "#161617",
					-- sumiInk1 = "#1f1f28",
					sumiInk3 = "#161617",
					-- sumiInk6 = "#47475C",
					sumiInk6 = "#3A3A4B",
					oldWhite = "#DCD7Bb",
					-- fujiWhite = '#F6F1d3',
					fujiWhite = "#eee0bf",
					-- oldWhite = "#F1eed7",
					-- sumiInk3 = "#120309",
					-- autumnGreen = "#037971",
					-- springGreen = "#9EBC9F",
				},
			},
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			overrides = function(colors)
				local theme = colors.theme
				return {
					NvimTreeIndentMarker = { fg = theme.syn.comment },
				}
			end,
		},
	},
	{
		"EdenEast/nightfox.nvim",
		opts = {
			options = {
				styles = {   -- Style to be applied to different syntax groups
					comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
					conditionals = "bold",
					constants = "bold",
					functions = "bold",
					keywords = "NONE",
					numbers = "NONE",
					operators = "NONE",
					strings = "NONE",
					types = "italic",
					variables = "NONE",
				},
			},
			palettes = {
				dayfox = {
					-- Defining multiple shades is done by passing a table
					blue = { base = "#464C8B", bright = "#7e94ed", dim = "#595C78" },
				},
			},
		},
	}, -- lazy
}
