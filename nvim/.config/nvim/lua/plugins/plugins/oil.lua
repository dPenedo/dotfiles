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
			['<C-h>'] = 'actions.parent',
			['<C-l>'] = 'actions.select',
			['<leader>.'] = 'actions.toggle_hidden',
			['<leader>q'] = 'actions.close',
		},
		view_options = {
			-- Show files and directories that start with "."
			show_hidden = true,
		},
	},
	-- optional dependencies
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = {
		{ '<leader>h', '<CMD>Oil <CR>',  { desc = 'Abrir Oil' } },
		{ '<C-h>',     '<CMD>Oil <CR>',  { desc = 'Abrir Oil' } },
		{ '<leader>-', '<CMD>Oil .<CR>', { desc = 'Abrir Oil en root' } },
	},
}
