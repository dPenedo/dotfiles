return {
	'folke/noice.nvim',
	event = 'VeryLazy',
	opts = {
		-- add any options here
		messages = {
			enabled = true, -- enables the Noice messages UI
		},
		popupmenu = {
			enabled = true,
		},
		presets = {
			bottom_search = false,  -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false,     -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true,  -- add a border to hover docs and signature help
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		'MunifTanjim/nui.nvim',
		-- -- OPTIONAL:
		-- --   `nvim-notify` is only needed, if you want to use the notification view.
		-- --   If not available, we use `mini` as the fallback
	},
}
