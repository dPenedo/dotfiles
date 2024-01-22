-- TODO: Organizarlos con variables tipo lazyvim y agregar descripciones
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- Quickly save the current buffer or all buffers
vim.keymap.set('n', '<A-s>', '<CMD>update<CR>')
vim.keymap.set('i', '<A-s>', '<CMD>update<CR>')
vim.keymap.set('v', '<A-s>', '<CMD>update<CR>')
vim.keymap.set('n', '<leader>W', '<CMD>wall<CR>')
-- Mapeando el jj como Escape
vim.keymap.set('i', 'jj', '<ESC>')
vim.keymap.set('i', 'jk', '<ESC>la')

-- Move to last buffer
vim.keymap.set('n', "''", '<CMD>b#<CR>')
-- .setSet wrap!
vim.keymap.set('n', '<a-w>', ':set wrap!<CR>')
-- .setNohl
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')
-- .setCopying the vscode behaviour of making tab splits
vim.keymap.set('n', '<leader>\\', '<CMD>vsplit<CR>')
vim.keymap.set('n', '<leader>|', '<CMD>split<CR>')
vim.keymap.set('n', '<leader><CR>', '<CMD>vsplit<CR>')
vim.keymap.set('n', '<leader>-', '<CMD>split<CR>')


-- Highlight colors
vim.keymap.set('n', '<leader>cc', '<CMD>HighlightColorsToggle<CR>')
-- .setmap("n", "<A-->", "<CMD>split<CR>")
-- Filemanagers y terminales
-- vim.keymap.set('n', '<A-e>', ':Lf<CR>')
vim.keymap.set('n', '<leader>e', ':Neotree position=float float<CR>')
vim.keymap.set('n', '<A-o>', ':Oil<CR>')
vim.keymap.set('n', '<leader>t', ':terminal<CR>:startinsert<CR>')
vim.keymap.set('n', '<leader>E', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>Y', ':terminal yazi .<CR>:startinsert<CR>')
vim.keymap.set('n', '<leader>E', ':terminal lf .<CR>:startinsert<CR>')
vim.keymap.set("t", "<Esc>", "<C-\\><C-n><CR>")
vim.keymap.set("t", "<C-x>", "<C-\\><C-n><CR>")
vim.keymap.set("t", "<C-l>", "<C-u>clear<CR>")




-- setGestión de tabs/pestañas
vim.keymap.set('n', '<leader>1', ':tabn 1<CR>')
vim.keymap.set('n', '<leader>2', ':tabn 2<CR>')
vim.keymap.set('n', '<leader>3', ':tabn 3<CR>')
vim.keymap.set('n', '<leader>4', ':tabn 4<CR>')
vim.keymap.set('n', '<leader>5', ':tabn 5<CR>')
vim.keymap.set('n', '<leader>6', ':tabn 6<CR>')
vim.keymap.set('n', '<leader>7', ':tabn 7<CR>')
vim.keymap.set('n', '<leader>8', ':tabn 8<CR>')
vim.keymap.set('n', '<leader>9', ':tabn 9<CR>')
-- .setcopiar/pegar
vim.keymap.set('n', '<A-d>', '"_dd')
vim.keymap.set('v', '<A-d>', '"_dd')
vim.keymap.set('v', '<A-c>', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>y', '"+y')

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-right>', ':vertical resize +5<cr>')
vim.keymap.set('n', '<C-left>', ':vertical resize -5<cr>')
vim.keymap.set('n', '<C-down>', ':horizontal resize +2<cr>')
vim.keymap.set('n', '<C-up>', ':horizontal resize -2<cr>')



-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
