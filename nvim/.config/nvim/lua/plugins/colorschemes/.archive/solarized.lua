return {
	'maxmx03/solarized.nvim',
	lazy = false,
	priority = 1000,
	---@type solarized.config
	opts = {
		transparent = {
			enabled = true,
		},
	},
	config = function(_, opts)
		vim.o.termguicolors = true
		vim.o.background = 'light'
		require('lua.plugins.colorschemes.Resp.solarized').setup(opts)
		vim.cmd.colorscheme 'solarized'
	end,
}
