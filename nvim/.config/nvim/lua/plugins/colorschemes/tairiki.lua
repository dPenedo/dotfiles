return {
	'deparr/tairiki.nvim',
	lazy = false,
	priority = 1000, -- only necessary if you use tairiki as default theme
	config = function()
		require('tairiki').setup {
			-- optional configuration here
		}
	end,
}
