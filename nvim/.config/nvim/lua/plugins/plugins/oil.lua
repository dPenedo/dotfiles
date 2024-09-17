return {
	'stevearc/oil.nvim',
	opts = {
		skip_confirm_for_simple_edits = true,
		keymaps = {
			['<C-h>'] = false,
			['<C-l>'] = false,
			['<C-r>'] = 'actions.refresh',

			['<leader>h'] = 'actions.toggle_hidden',
		},
	},
	-- Optional dependencies
	dependencies = { 'nvim-tree/nvim-web-devicons' },
}
