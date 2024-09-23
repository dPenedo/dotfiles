return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
		'MunifTanjim/nui.nvim',
		-- 'mrbjarksen/neo-tree-diagnostics.nvim',
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		{
			's1n7ax/nvim-window-picker',
			version = '2.*',
			config = function()
				require('window-picker').setup {
					selection_chars = 'jkl;FJDKSLA;CMRUEIWOQP',
					filter_rules = {
						include_current_win = false,
						autoselect_one = true,
						-- filter using buffer options
						bo = {
							-- if the file type is one of following, the window will be ignored
							filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
							-- if the buffer type is one of following, the window will be ignored
							buftype = { 'terminal', 'quickfix' },
						},
					},
				}
			end,
		},
	},
	event = 'VeryLazy',
	config = function()
		require('neo-tree').setup {
			open_files_do_not_replace_types = { 'terminal', 'Trouble', 'qf', 'edgy' },
			close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
			-- popup_border_style = { "▄", "▄", "▄", "█", "▀", "▀", "▀", "█" },
			-- popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			sources = { 'filesystem', 'git_status' },

			window = {
				position = 'right',
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {
					['l'] = 'open',
					['S'] = 'open_split',
					['<c-v>'] = 'open_vsplit',
					-- ["S"] = "split_with_window_picker",
					-- ["s"] = "vsplit_with_window_picker",
				},
			},
			nesting_rules = {
				-- ["js"] = { "js.map" },
			},
			filesystem = {
				follow_current_file = {
					enabled = true, -- This will find and focus the file in the active buffer every
				},
				-- time the current file is changed while the tree is open.
				group_empty_dirs = false,       -- when true, empty folders will be grouped together
				hijack_netrw_behavior = 'open_default', -- netrw disabled, opening a directory opens neo-tree
				-- in whatever position is specified in window.position
				-- "open_current",  -- netrw disabled, opening a directory opens within the
				-- window like netrw would, regardless of window.position
				-- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
				use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
				-- instead of relying on nvim autocmd events.
				window = {
					mappings = {
						['H'] = 'navigate_up',
						['.'] = 'toggle_hidden',
						['f'] = 'filter_on_submit',
						['<c-x>'] = 'clear_filter',
						['[g'] = 'prev_git_modified',
						[']g'] = 'next_git_modified',
					},
				},
			},
		}
	end,
}
