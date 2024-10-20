return {
	'cbochs/grapple.nvim',
	opts = {
		scope = 'git', -- also try out "git_branch"
		icons = false, -- setting to "true" requires "nvim-web-devicons"
		status = false,
	},
	keys = {
		{ '<leader>sa', '<cmd>Grapple toggle<cr>',         desc = 'Tag a file' },
		{ '<leader>ss', '<cmd>Grapple toggle_tags<cr>',    desc = 'Toggle tags menu' },

		{ '<leader>sj', '<cmd>Grapple select index=1<cr>', desc = 'Select first tag' },
		{ '<leader>sk', '<cmd>Grapple select index=2<cr>', desc = 'Select second tag' },
		{ '<leader>sl', '<cmd>Grapple select index=3<cr>', desc = 'Select third tag' },
		{ '<leader>s;', '<cmd>Grapple select index=4<cr>', desc = 'Select fourth tag' },
	},
}
