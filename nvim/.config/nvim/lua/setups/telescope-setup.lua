-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
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
	pickers = {
		buffers = {
			ignore_current_buffer = true,
			sort_lastused = true,
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
