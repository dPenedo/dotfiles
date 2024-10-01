return {
	'folke/persistence.nvim',
	event = 'BufReadPre',
	opts = {},
	keys = {

		-- load the session for the current directory
		{
			'<leader>S',
			function()
				require('persistence').load()
			end,
		},
		-- select a session to load
		{
			'<leader>se',
			function()
				require('persistence').select()
			end,
		},
		-- load the last session
		{
			'<leader>sL',
			function()
				require('persistence').load { last = true }
			end,
		},
		-- stop Persistence => session won't be saved on exit
		{
			'<leader>sq',
			function()
				require('persistence').stop()
			end,
		},
	},
}
