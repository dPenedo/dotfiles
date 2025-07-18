local map = vim.keymap.set

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

map("n", "<leader>w", "<cmd>update<cr>", { desc = "Windows", remap = true })
map("i", "jj", "<ESC>", { desc = "Salir del modo de inserción" })
map("n", "<ESC>", "<CMD>noh<CR>", { desc = "Salir del modo de inserción" })
map("v", "<ESC>", "<CMD>noh<CR>", { desc = "Salir del modo de inserción" })
map("i", "jk", "<ESC>la", { desc = "Salir del modo de inserción y agregar un espacio" })
map("i", "kj", "<ESC>i", { desc = "Salir del modo de inserción y quitar un espacio" })
map("n", "<leader>;", "m`A;<Esc>``", { desc = "Poner punto y coma al final" })
map("n", "'", "`", { desc = "backtick asignado a '" })
map("n", "zx", "zt6k6j", { desc = "Scrollear teniendo el cursor en el mismo sitio" })
map("n", "''", "<CMD>b#<CR>", { desc = "Ir al último búfer" })
map("n", "==", "<CMD>Format<CR>", { desc = "Formato al archivo" })

-- Toggles
map("n", "<leader>uw", ":set wrap!<CR>", { desc = "Alternar ajuste de línea" })
map("n", "<leader>uc", function()
  local conceal = vim.wo.conceallevel
  vim.wo.conceallevel = conceal == 0 and 2 or 0
  print("Conceal Level -> ", vim.wo.conceallevel)
end, { desc = "Toggle Conceal Level" })



-- Terminal
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Normal mode desde el terminal" })
map("t", "jj", "<C-\\><C-n>", { desc = "Normal mode desde el terminal" })
map("n", "<leader>kk", "<CMD>terminal<CR>", { desc = "Terminal" })

-- Copiar/pegar Clipboard
map("v", "<leader>y", '"+y', { desc = "Copiar seleccion portapapeles" })
map("n", "<leader>y", 'm`V"+y``', { desc = "Copiar linea al portapapeles" })
map("n", "<leader>p", '"+p', { desc = "Pegar del portapapeles" })
map("v", "<leader>p", '"+p', { desc = "Pegar del portapapeles" })
map("n", "<leader>v", "ggVG", { desc = "Seleccionar todo" })
