return {
	'folke/todo-comments.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {

		highlight = {
			comments_only = false,
		},
		keywords = {
			NOTE = { icon = ' ', color = 'info' },
		},
	},
}
