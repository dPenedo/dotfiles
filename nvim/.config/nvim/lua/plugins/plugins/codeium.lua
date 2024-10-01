return {
	'Exafunction/codeium.vim',
	event = 'BufEnter',
	config = function()
		vim.keymap.set('i', '<C-a>', function()
			return vim.fn['codeium#Accept']()
		end, { expr = true, silent = true, desc = 'Codeium Accept' })
		vim.keymap.set('i', '<C-x>', function()
			return vim.fn['codeium#Clear']()
		end, { expr = true, silent = true, desc = 'Codeium Clear' })
		vim.keymap.set('i', '<C-s>', function()
			return vim.fn['codeium#CycleCompletions'](1)
		end, { expr = true, silent = true, desc = 'Codeium Cycle Completions Next' })
		vim.keymap.set('i', '<C-w>', function()
			return vim.fn['codeium#CycleCompletions'](-1)
		end, { expr = true, silent = true, desc = 'Codeium Cycle Completions Prev' })
		-- vim.g.codeium_filetypes = {
		-- 	markdown = false,
		-- }
	end,
	opts = {
		enable_chat = true,
	},
	keys = {
		{ '<leader>co', '<cmd>CodeiumToggle<cr>', desc = 'Codeium Toggle' },
	},
}
