return {
	'stevearc/oil.nvim',
	opts = {
		skip_confirm_for_simple_edits = true,
		keymaps = {
			['<C-h>'] = false,
			['<C-l>'] = false,
			['<leader>r'] = 'actions.refresh',
			['<leader>h'] = 'actions.parent',
			['<leader>l'] = 'actions.select',
			['<leader>.'] = 'actions.toggle_hidden',
			['<leader>q'] = 'actions.close',
		},
	},
	-- optional dependencies
	dependencies = { 'nvim-tree/nvim-web-devicons' },
}
