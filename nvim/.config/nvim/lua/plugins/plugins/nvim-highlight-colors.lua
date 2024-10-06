return {
	'brenoprata10/nvim-highlight-colors',
	lazy = true,
	keys = {
		{
			'<leader>cc',
			'<CMD>lua require("nvim-highlight-colors").toggle()<CR>',
			desc = 'Resaltar colores',
		},
	},
}
