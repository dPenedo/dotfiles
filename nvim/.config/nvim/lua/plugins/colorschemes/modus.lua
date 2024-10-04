return {
	'miikanissi/modus-themes.nvim',
	priority = 1000,
	opts = {
		variant = 'tinted',
		on_colors = function(colors)
			colors.magenta_intense = '#73B5A4'
		end,
	},
}
