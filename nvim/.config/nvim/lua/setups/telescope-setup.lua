-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
	defaults = {
		sorting_strategy = 'ascending',
		layout_strategy = 'bottom_pane',
		layout_config = {
			horizontal = {
				prompt_position = 'top',
			},
			vertical = {
				mirror = false,
			},
		},
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = false,
				-- ['<Tab>'] = false,
				-- ['<Tab>'] = 'select_default',
				['<C-s>'] = 'select_horizontal',
				['<C-v>'] = 'select_vertical',
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
		find_command = { 'fdfind', '-t', 'd' },
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

vim.api.nvim_create_user_command('OilDirectory', function()
	require('telescope.builtin').find_files {
		find_command = { 'fdfind', '--type', 'd' },
		attach_mappings = function(_, map)
			map('i', '<CR>', function(prompt_bufnr)
				local selection = require('telescope.actions.state').get_selected_entry()
				require('telescope.actions').close(prompt_bufnr)
				require('oil').open(selection.path)
			end)
			return true
		end,
	}
end, {})
