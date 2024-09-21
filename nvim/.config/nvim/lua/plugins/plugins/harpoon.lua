return {
	'theprimeagen/harpoon',
	branch = 'harpoon2',
	lazy = true,
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('harpoon').setup()
	end,
	keys = {
		{
			'<leader>ja',
			function()
				require('harpoon'):list():add()
			end,
			desc = 'harpoon file',
		},
		{
			'<leader>js',
			function()
				local harpoon = require 'harpoon'
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = 'harpoon quick menu',
		},
		{
			'<leader>jj',
			function()
				require('harpoon'):list():select(1)
			end,
			desc = 'harpoon to file 1',
		},
		{
			'<leader>jk',
			function()
				require('harpoon'):list():select(2)
			end,
			desc = 'harpoon to file 2',
		},
		{
			'<leader>jl',
			function()
				require('harpoon'):list():select(3)
			end,
			desc = 'harpoon to file 3',
		},
		{
			'<leader>j;',
			function()
				require('harpoon'):list():select(4)
			end,
			desc = 'harpoon to file 4',
		},
		{
			"<leader>j'",
			function()
				require('harpoon'):list():select(5)
			end,
			desc = 'harpoon to file 5',
		},
	},
}
