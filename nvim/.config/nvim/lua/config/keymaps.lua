# -- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<leader>wd")
-- vim.keymap.del("n", "<leader>l")
local map = LazyVim.safe_keymap_set

map("n", "<leader>w", "<cmd>update<cr>", { desc = "Windows", remap = true })
map("i", "jk", "<ESC>la", { desc = "Salir del modo de inserción y agregar una línea" })
map("n", "<leader>;", "m`A;<Esc>``", { desc = "Poner punto y coma al final" })
map("n", "'", "`", { desc = "backtick asignado a '" })
map("n", "zx", "zt6k6j", { desc = "Scrollear teniendo el cursor en el mismo sitio" })
map("n", "''", "<CMD>b#<CR>", { desc = "Ir al último búfer" })
map("n", "==", "<CMD>Format<CR>", { desc = "Formato al archivo" })
map("n", "<a-w>", ":set wrap!<CR>", { desc = "Alternar ajuste de línea" })

map("n", "<leader>k", "<CMD>bl<CR>", { desc = "Ir al búfer previo" })
map("n", "<leader>j", "<CMD>bn<CR>", { desc = "Ir al siguienteh búfer" })

-- Copiar/pegar Clipboard
map("v", "<leader>y", '"+y', { desc = "Copiar seleccion portapapeles" })
map("n", "<leader>y", 'm`V"+y``', { desc = "Copiar linea al portapapeles" })
map("n", "<leader>sp", "<CMD>Telescope registers<cr>", { desc = "Buscar registros en telescope" })
map("v", "<leader>sp", "<CMD>Telescope registers<cr>", { desc = "Buscar registros en telescope" })
map("n", "<leader>p", '"+p', { desc = "Pegar del portapapeles" })
map("v", "<leader>p", '"+p', { desc = "Pegar del portapapeles" })
map("n", "<leader>v", "ggVG", { desc = "Seleccionar todo" })

