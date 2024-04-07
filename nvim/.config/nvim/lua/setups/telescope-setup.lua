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
        ['<Tab>'] = false,
        ['<Tab>'] = "select_default",
        ["<C-s>"] = "select_horizontal",
        ["<C-v>"] = "select_vertical",
        ["<C-h>"] = "which_key",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
      n = {
        ["<C-s>"] = "select_horizontal",
        ["<C-v>"] = "select_vertical",
      },

    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'fzf')

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == '' then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ':h')
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 then
    print 'Not a git repository. Searching on current working directory'
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep {
      search_dirs = { git_root },
    }
  end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
-- vim.keymap.set('n', '<leader>/', function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, { desc = '[/] Fuzzily search in current buffer' })

local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end
vim.api.nvim_create_user_command(
    'NotasBuscar',
    function ()
        require('telescope.builtin').find_files({cwd="~/Documentos/Dropbox/Notas/", prompt_title="Notas"})
    end,
    {}
)
vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>nb', ':NotasBuscar<CR>', { desc = '[N]otas [Buscar]' })
vim.keymap.set('n', ',b', ':Telescope buffers<CR>', { desc = 'Telescope para buffers' })
vim.keymap.set('n', ',B', ':Telescope builtin<CR>', { desc = 'Telescope para comandos internos' })
vim.keymap.set('n', ',g', ':Telescope live_grep<CR>', { desc = 'Telescope para búsqueda en vivo con grep' })
vim.keymap.set('n', ',r', ':Telescope registers<CR>', { desc = 'Telescope para registros' })
vim.keymap.set('n', ',k', ':Telescope keymaps<CR>', { desc = 'keymaps' })
vim.keymap.set('n', '<leader>l', ':Telescope current_buffer_fuzzy_find<CR>',
	{ desc = 'Telescope para en el buffer actual' })
vim.keymap.set('n', ',u', ':Telescope undo<CR>', { desc = 'Telescope para en el historial de deshacer' })
vim.keymap.set('n', '<leader>u', ':Telescope undo<CR>',
	{ desc = 'Telescope para en el historial de deshacer' })
vim.keymap.set('n', ',T', ':Telescope treesitter<CR>', { desc = 'Telescope para en Treesitter' })
vim.keymap.set('n', ',t', ':TodoTelescope<CR>', { desc = 'Telescope para TODOs' })
vim.keymap.set('n', '<leader>tt', ':TodoTelescope<CR>', { desc = 'Telescope para TODOs' })
vim.keymap.set('n', ',h', ':Telescope help_tags<CR>', { desc = 'Telescope para etiquetas de ayuda' })
vim.keymap.set('n', ',m', ':Telescope marks<CR>', { desc = 'Telescope para marks' })
