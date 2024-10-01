return {
	'folke/zen-mode.nvim',
	event = 'BufReadPre',
	opts = {
		window = {
			width = 100,
		},
		plugins = {

			options = {
				laststatus = 3, -- turn off the statusline in zen mode
			},
		},
	},
	keys = {

		{ '<leader>z', ':ZenMode<CR>', { desc = 'Entra o sale  en Zen mode' } },
	},
}
