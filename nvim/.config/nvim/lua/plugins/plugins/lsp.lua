return {
	-- LSP Configuration & Plugins
	'neovim/nvim-lspconfig',
	event = 'VeryLazy',

	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		{ 'williamboman/mason.nvim', config = true },
		'williamboman/mason-lspconfig.nvim',

		-- Useful status updates for LSP
		-- { 'rcarriga/nvim-notify',    opts = {} },
		-- Additional lua configuration, makes nvim stuff amazing!
	},
}
