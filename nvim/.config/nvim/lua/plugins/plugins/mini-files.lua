return {
	'echasnovski/mini.files',
	version = '*',
	opts = {
		mappings = {
			synchronize = '<leader>w',
			go_in = 'l',
			go_in_plus = '<cr>',
			go_out = 'H',
			go_out_plus = 'h',
		},
		windows = {
			preview = true,
			width_preview = 50,
		},
	},
	keys = {
		{
			'<leader>-',
			function()
				require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
			end,
			desc = 'Open mini.files (Directory of Current File)',
		},
		{
			'<leader>_',
			function()
				require('mini.files').open(vim.uv.cwd(), true)
			end,
			desc = 'Open mini.files (cwd)',
		},
	},
}
