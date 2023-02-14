local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Fix * (Keep the cursor position, don't move to next match)
-- map('n', '*', '*N')

map('n', 'ñ', '/')
-- Fix n and N. Keeping cursor in center
-- map('n', 'n', 'nzz')
-- map('n', 'N', 'Nzz')

-- Resize with arrows
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Right>", ":vertical resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize +2<CR>", opts)


-- Mimic shell movements
map('i', '<C-E>', '<ESC>A')
map('i', '<C-A>', '<ESC>I')

-- Quickly save the current buffer or all buffers
map('n', '<leader>w', '<CMD>update<CR>')
map('n', '<leader>W', '<CMD>wall<CR>')

-- Quit neovim
map('n', '<C-Q>', '<CMD>q<CR>')

-- leader-o/O inserts blank line below/above
map('n', '<leader>o', 'o<ESC>')
map('n', '<leader>O', 'O<ESC>')

-- Move to the next/previous buffer
map('n', '<leader>m', '<CMD>bp<CR>')
map('n', '<leader>,', '<CMD>bn<CR>')

-- Move to last buffer
map('n', "''", '<CMD>b#<CR>')

-- Format prettierd

map('n', '<leader>p', ':Format prettierd<CR>')


-- Nohl
map('n', "0", ':nohlsearch<CR>')

-- Copying the vscode behaviour of making tab splits
map('n', '<A-v>', '<CMD>vsplit<CR>')
map('n', '<A-s>', '<CMD>split<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map('o', 'A', ':<C-U>normal! mzggVG<CR>`z')

-- File explorers
map('n', '<leader>e', ':Neotree<CR>')

map('n', '<leader>R', ':RnvimrToggle<CR>')


-- Notes
map('n', '<leader>nn', ':Telekasten new_note<CR>')
map('n', '<leader>nf', ':Telekasten find_notes<CR>')
map('n', '<leader>ng', ':Telekasten search_notes<CR>')
map('n', '<leader>np', ':Telekasten panel<CR>')
map('n', '<leader>nc', ':Telekasten show_calendar<CR>')


-- FZF
map('n', '<leader>~', ':Files ~/<CR>')
map('n', '<leader>F', ':Files<CR>')
map('n', '<leader>hh', ':History<CR>')

-- Telescope

map('n', '<leader>L', ':Telescope current_buffer_fuzzy_find<CR>')
map('n', '<leader>l', ':BLines<CR>')
map('n', '<leader>f', ':Telescope find_files<CR>')
map('n', '<leader>b', ':Telescope buffers<CR>')
map('n', '<leader>t', ':Telescope file_browser<CR>')
map('n', '<leader>g', ':Telescope live_grep<CR>')
map('n', '<leader>r', ':Telescope registers<CR>')
map('n', '<leader>H', ':Telescope help_tags<CR>')




-- Coc confirm Tab
--vim.cmd[[inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]]
-- vim.api.nvim_set_keymap("i", "<TAB>", "pumvisible() ? '<C-y>' : '<TAB>'", {noremap = true, silent = true, expr = true})
-- vim.api.nvim_set_keymap("i", "<S-TAB>", "pumvisible() ? '<C-y>' : '<C-h>'", {noremap = true, expr = true})
-- vim.api.nvim_set_keymap("i", "<CR>", "pumvisible() ? coc#_select_confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'", {silent = true, expr = true, noremap = true})

--
vim.api.nvim_set_keymap('i', '<c-j>', 'pumvisible() ? "\\<c-n>" : "\\<c-j>"' , { noremap = true, expr=true })
vim.api.nvim_set_keymap('i', '<c-k>', 'pumvisible() ? "\\<c-p>" : "\\<c-j>"' , { noremap = true, expr=true })
-- vim.cmd [[
-- cmap <C-j> <C-n>
-- cmap <C-k> <C-p>
-- ]] 
--


-- lsp
