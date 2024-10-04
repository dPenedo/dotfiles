return {
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
						-- bg_gutter = 'none',
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
				-- sumiInk0 = '#121212',
				-- sumiInk1 = '#181818',
				-- sumiInk2 = '#1a1a1a',
				-- sumiInk3 = '#121212',
				-- sumiInk4 = '#2A2A2A',
				-- sumiInk5 = '#363636',
				-- sumiInk6 = '#545454',

				-- -- Popup and Floats
				-- waveBlue1 = "#223249",
				-- waveBlue2 = "#2D4F67",
				-- waveBlue1 = '#2A2A36',
				-- waveBlue2 = '#3A334c',
				--lotusInk1

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
}
