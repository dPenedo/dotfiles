local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
map("n", "<leader>L", "<cmd>:Lazy<cr>")

-- Mimic shell movements
map("i", "<C-E>", "<ESC>A")
map("i", "<C-A>", "<ESC>I")
-- Quickly save the current buffer or all buffers
map("n", "<A-s>", "<CMD>update<CR>")
map("i", "<A-s>", "<CMD>update<CR>")
map("v", "<A-s>", "<CMD>update<CR>")
map("n", "<leader>W", "<CMD>wall<CR>")

-- Mapeando el jj como Escape
map("i", "jj", "<ESC>")
map("i", "jk", "<ESC>la")

-- Movimientos
map("n", "\\", "$")
map("v", "\\", "$")

-- Cambiar palabra
map("n", "<CR>", "ciw")

-- Notas
map("n", "<leader>nn", ":NuevaNota<CR>")
map("n", "<leader>nf", ":Telescope find_files cwd=" .. "/home/daniel/Documentos/Dropbox/Notas/" .. "<CR>")

-- Quit neovim
map("n", "<C-Q>", "<CMD>q<CR>")

-- leader-o/O inserts blank line below/above
-- map("n", "<leader>o", "o<ESC>")
-- map("n", "<leader>O", "O<ESC>")

-- Move to the next/previous buffer
map("n", "<leader>m", "<CMD>bp<CR>")
map("n", "<leader>,", "<CMD>bn<CR>")

-- Move to last buffer
map("n", "''", "<CMD>b#<CR>")

-- Format prettierd
-- map("n", "<leader>p", ":Format prettierd<CR>")

-- Set wrap!
map("n", "<a-w>", ":set wrap!<CR>")

-- Nohl
map("n", "0", ":nohlsearch<CR>")

-- Copying the vscode behaviour of making tab splits
map("n", "<leader>\\", "<CMD>vsplit<CR>")
map("n", "<leader>|", "<CMD>split<CR>")
-- map("n", "<A-->", "<CMD>split<CR>")

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map("o", "A", ":<C-U>normal! mzggVG<CR>`z")

-- File explorerskey
map("n", "<A-e>", ":Lf<CR>")
map("n", "<A-n>", ":NnnPicker<CR>")
map("n", "<A-r>", ":Ranger<CR>")
map("n", "<A-v>", ":EditVifm<CR>")
map("n", "<A-o>", ":Oil<CR>")
map("n", "-", ":Oil<CR>")
map("n", "<leader>e", ":NvimTreeToggle<CR>")

-- FZF
map("n", "<leader>~", ":Files ~/<CR>")
map("n", "<leader>F", ":Files<CR>")
map("n", "<leader>hh", ":History<CR>")

-- Colors
map("n", "<leader>cc", ':lua require("nvim-highlight-colors").toggle()<CR>')

-- Zen

map("n", "<A-z>", ":ZenMode<CR>")

-- Terminal
map("t", "<Esc>", "<C-\\><C-n><CR>")
map("t", "<C-l>", "<C-u>clear<CR>")

-- Telescope

map("n", ",,", ":Telescope find_files<CR>")
map("n", ",b", ":Telescope buffers<CR>")
map("n", ",B", ":Telescope builtin<CR>")
map("n", ",g", ":Telescope live_grep<CR>")
map("n", ",r", ":Telescope registers<CR>")
map("n", ",l", ":Telescope current_buffer_fuzzy_find<CR>")
map("n", ",u", ":Telescope undo<CR>")
map("n", ",t", ":Telescope treesitter<CR>")
map("n", ",H", ":Telescope help_tags<CR>")
map("n", "<Tab>", ":Telescope buffers<CR>")

-- map("n", "<leader>b", ":Telescope buffers<CR>")
-- map("n", "<leader>g", ":Telescope live_grep<CR>")
-- map("n", "<leader>r", ":Telescope registers<CR>")
-- map("n", "<leader>H", ":Telescope help_tags<CR>")
-- -- map("n", ",", ":Telescope current_buffer_fuzzy_find<CR>")
-- map("n", "<leader>l", ":Telescope current_buffer_fuzzy_find<CR>")
-- map("n", "<C-p>", ":Telescope find_files<CR>")
--
-- map("n", "<leader>u", ":Telescope undo<CR>")

-- Marks
map("n", ",?", ":Telescope marks<CR>")

-- ToggleTerm & terminal
map("n", "<C-t>", ':ToggleTerm direction="tab"<CR>')
map("n", "<leader>T", ":terminal<CR>:startinsert<CR>")
map("n", "<leader>Y", ":terminal yazi .<CR>:startinsert<CR>")
map("n", "<leader>E", ":terminal lf .<CR>:startinsert<CR>")

-- Gestión de tabs/pestañas
map("n", "<leader>1", ":tabn 1<CR>")
map("n", "<leader>2", ":tabn 2<CR>")
map("n", "<leader>3", ":tabn 3<CR>")
map("n", "<leader>4", ":tabn 4<CR>")
map("n", "<leader>5", ":tabn 5<CR>")
map("n", "<leader>6", ":tabn 6<CR>")
map("n", "<leader>7", ":tabn 7<CR>")
map("n", "<leader>8", ":tabn 8<CR>")
map("n", "<leader>9", ":tabn 9<CR>")

map("n", "<leader>tc", ":tabclose<CR>")
map("n", "<leader>tn", ":tabnew<CR>")
map("n", "<leader>to", ":tabonly<CR>")
map("n", "<leader>th", ":-tabmove<CR>")
map("n", "<leader>tl", ":+tabmove<CR>")

-- copiar/pegar
map("n", "<A-d>", '"_dd')
map("v", "<A-d>", '"_dd')
map("v", "<A-c>", '"+y')

map("v", "<leader>y", '"+y')
map("n", "<leader>y", '"+y')
