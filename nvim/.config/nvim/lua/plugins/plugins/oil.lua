return {
	'stevearc/oil.nvim',
	opts = {
		skip_confirm_for_simple_edits = true,
		keymaps = {
			['<C-h>'] = false,
			['<C-l>'] = false,
			['<leader>r'] = 'actions.refresh',
			['<C-h>'] = 'actions.parent',
			['<C-l>'] = 'actions.select',
			['<leader>h'] = 'actions.toggle_hidden',
		},
	},
	-- optional dependencies
	dependencies = { 'nvim-tree/nvim-web-devicons' },
}
