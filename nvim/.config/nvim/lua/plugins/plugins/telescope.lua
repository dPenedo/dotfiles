return {
	'nvim-telescope/telescope.nvim',
	event = 'VeryLazy',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'debugloop/telescope-undo.nvim',
		-- "lexay/telescope-zoxide.nvim",
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
	},
}
