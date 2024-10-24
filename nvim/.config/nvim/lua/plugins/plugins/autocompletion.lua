return {
	-- Autocompletion
	-- event = "VeryLazy",
	-- event = "InsertEnter",
	lazy = true,

	'hrsh7th/nvim-cmp',
	dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
		'mlaursen/vim-react-snippets',
		-- Adds LSP completion capabilities
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',

		-- Adds a number of user-friendly snippets
		'rafamadriz/friendly-snippets',
	},
}
