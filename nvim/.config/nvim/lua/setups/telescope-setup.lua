-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown {
				-- even more opts
			},

			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
		},
	},
	-- To get ui-select loaded and working with telescope, you need to call
	-- load_extension, somewhere after setup function:
	defaults = {
		prompt_prefix = '   ',
		selection_caret = '  ',
		entry_prefix = '  ',
		initial_mode = 'insert',
		selection_strategy = 'reset',
		sorting_strategy = 'ascending',
		layout_strategy = 'horizontal',
		layout_config = {
			horizontal = {
				prompt_position = 'top',
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},

		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
				-- ['<Tab>'] = false,
				-- ['<Tab>'] = 'select_default',
				['<C-s>'] = 'select_horizontal',
				['<C-v>'] = 'select_vertical',
				['<C-h>'] = 'which_key',
				['<C-j>'] = 'move_selection_next',
				['<C-k>'] = 'move_selection_previous',
				['<c-d>'] = 'delete_buffer',
			},
			n = {
				['<C-s>'] = 'select_horizontal',
				['<C-v>'] = 'select_vertical',
			},
		},
	},
}

-- Enable telescope fzf native, if installed

local function telescope_live_grep_open_files()
	require('telescope.builtin').live_grep {
		grep_open_files = true,
		prompt_title = 'Live Grep in Open Files',
	}
end
vim.api.nvim_create_user_command('NotasBuscar', function()
	require('telescope.builtin').find_files { cwd = '~/Documentos/Dropbox/Notas/', prompt_title = 'Notas' }
end, {})
vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
require('telescope').load_extension 'ui-select'
require('telescope').load_extension 'file_browser'
