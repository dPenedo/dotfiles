return {
	'miikanissi/modus-themes.nvim',
	priority = 1000,
	opts = {
		variant = 'tinted',
		transparent = true, -- Transparent background (as supported by the terminal)

		on_colors = function(colors)
			colors.magenta_intense = '#73B5A4'
		end,
	},
}
