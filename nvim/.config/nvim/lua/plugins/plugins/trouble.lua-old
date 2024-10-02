return {
	'folke/trouble.nvim',
	event = 'VeryLazy',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		position = 'bottom', -- position of the list can be: bottom, top, left, right
		-- your configuration comes here
		--or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		{ '<leader>xx', '<CMD>Trouble diagnostics toggle<cr>', desc = 'Trouble diagnostics' },
		{
			'<leader>xw',
			function()
				require('trouble').toggle 'workspace_diagnostics'
			end,
		},
		{
			'<leader>xd',
			function()
				require('trouble').toggle 'document_diagnostics'
			end,
		},
		{
			'<leader>xq',
			function()
				require('trouble').toggle 'quickfix'
			end,
		},
		{
			'<leader>xl',
			function()
				require('trouble').toggle 'loclist'
			end,
		},
		{
			'gR',
			function()
				require('trouble').toggle 'lsp_references'
			end,
		},
	},
}
