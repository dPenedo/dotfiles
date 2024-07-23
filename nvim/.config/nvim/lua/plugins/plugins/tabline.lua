return {
	'crispgm/nvim-tabline',

	dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional
	opts         = {

		show_icon = true, -- show file extension icon
		modify_indicator = '󰈸',

		brackets = { ' ', ' ' }, -- file name brackets surrounding
	}
}
