# -- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>wm")
vim.keymap.del("n", "<A-j>")
vim.keymap.del("i", "<A-j>")
vim.keymap.del("v", "<A-j>")
vim.keymap.del("n", "<A-k>")
vim.keymap.del("i", "<A-k>")
vim.keymap.del("v", "<A-k>")
vim.keymap.del("n", "<leader>n")
-- vim.keymap.del("n", "<leader>l")
local map = LazyVim.safe_keymap_set

map("n", "<leader>w", "<cmd>update<cr>", { desc = "Windows", remap = true })
map("i", "jj", "<ESC>", { desc = "Salir del modo de inserción" })
map("i", "jk", "<ESC>la", { desc = "Salir del modo de inserción y agregar un espacio" })
map("i", "kj", "<ESC>i", { desc = "Salir del modo de inserción y quitar un espacio" })
map("n", "<leader>;", "m`A;<Esc>``", { desc = "Poner punto y coma al final" })
map("n", "'", "`", { desc = "backtick asignado a '" })
map("n", "zx", "zt6k6j", { desc = "Scrollear teniendo el cursor en el mismo sitio" })
map("n", "''", "<CMD>b#<CR>", { desc = "Ir al último búfer" })
map("n", "==", "<CMD>Format<CR>", { desc = "Formato al archivo" })
map("n", "<a-w>", ":set wrap!<CR>", { desc = "Alternar ajuste de línea" })
map("n", "<leader>ng", ":!python gaur.py<CR>", { desc = "Generar una sección diaria en notas, eguneroka_" })
map("n", "<leader>nc", ":!python comidas.py<CR>", { desc = "Generar una sección diaria en comidas" })
map("n", "<leader>ne", ":e /home/daniel/Documentos/Dropbox/Notas/egunerokoa_2025.md<CR>", { desc = "Ir a Egunerokoa" })

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

