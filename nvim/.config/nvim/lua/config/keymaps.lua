# -- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>wm")
vim.keymap.del("n", "<A-j>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<C-l>")
vim.keymap.del("i", "<A-j>")
vim.keymap.del("v", "<A-j>")
vim.keymap.del("n", "<A-k>")
vim.keymap.del("i", "<A-k>")
vim.keymap.del("v", "<A-k>")
vim.keymap.del("n", "<leader>n")
vim.keymap.del("n", "<leader>-")
-- vim.keymap.del("n", "<leader>l")
local map = LazyVim.safe_keymap_set



map("n", "<leader>w", "<cmd>update<cr>", { desc = "Windows", remap = true })
map("i", "jj", "<ESC>", { desc = "Salir del modo de inserción" })
map("i", "jk", "<ESC>la", { desc = "Salir del modo de inserción y agregar un espacio" })
map("n", "<leader>;", "m`A;<Esc>``", { desc = "Poner punto y coma al final" })
map("n", "'", "`", { desc = "backtick asignado a '" })
map("n", "zx", "zt6k6j", { desc = "Scrollear teniendo el cursor en el mismo sitio" })
map("n", "''", "<CMD>b#<CR>", { desc = "Ir al último búfer" })
map("n", "==", "<CMD>Format<CR>", { desc = "Formato al archivo" })
-- map("n", "<a-w>", ":set wrap!<CR>", { desc = "Alternar ajuste de línea" })
map("n", "<leader>ng", ":!python ~/Documentos/Dropbox/Notas/.gaur/gaur.py<CR>", { desc = "Generar una sección diaria en notas, eguneroka_" })
map("n", "<leader>nc", ":!python comidas.py<CR>", { desc = "Generar una sección diaria en comidas" })
map("n", "<leader>ne", ":e /home/daniel/Documentos/Dropbox/Notas/egunerokoa_2025.md<CR>", { desc = "Ir a Egunerokoa" })

-- Terminal
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Normal mode desde el terminal" })
map("t", "jj", "<C-\\><C-n>", { desc = "Normal mode desde el terminal" })
map("n", "<leader>tk", "<CMD>terminal<CR>", { desc = "Terminal" })

-- Copiar/pegar Clipboard
map("v", "<leader>y", '"+y', { desc = "Copiar seleccion portapapeles" })
map("n", "<leader>y", 'm`V"+y``', { desc = "Copiar linea al portapapeles" })
map("n", "<leader>p", '"+p', { desc = "Pegar del portapapeles" })
map("v", "<leader>p", '"+p', { desc = "Pegar del portapapeles" })

map("n", "<leader>v", "ggVG", { desc = "Seleccionar todo" })

map("n", "<C-u>", "10k", { desc = "10 up" })
map("n", "<C-d>", "10j", { desc = "10 down" })


-- Recargar
map("n", "<leader>r", "<cmd>checktime<cr>", { desc = "Reload" })

map("n", "<leader>ll", function()
    local word = vim.fn.expand("<cword>") -- Obtener la palabra bajo el cursor
    local filetype = vim.bo.filetype
    local debug_command

    -- Determinar qué comando de depuración usar según el tipo de archivo
    if filetype == "javascript" or filetype == "typescript" or filetype == "javascriptreact" or filetype == "typescriptreact" then
        debug_command = string.format('console.log("%s => ", %s);', word, word)
    elseif filetype == "python" then
        debug_command = string.format('print("%s => ", %s)', word, word)
    else
        print("Unsupported filetype for debug statement")
        return
    end

    -- Obtener la línea actual del cursor
    local current_line = vim.api.nvim_win_get_cursor(0)[1]

    -- Insertar la línea de depuración debajo de la actual
    vim.api.nvim_buf_set_lines(0, current_line, current_line, false, {debug_command})
end, { desc = "Insert debug statement for word under cursor", silent = true })

map("n", "<leader>lt", function()
    local word = vim.fn.expand("<cword>") -- Obtener la palabra bajo el cursor
    local filetype = vim.bo.filetype
    local debug_command

    -- Determinar qué comando de depuración usar según el tipo de archivo
    if filetype == "javascript" or filetype == "typescript" or filetype == "javascriptreact" or filetype == "typescriptreact" then
        debug_command = string.format('console.log("typeof %s => ",typeof %s);', word, word)
    elseif filetype == "python" then
        debug_command = string.format('print("type of %s => ", type(%s))', word, word)
    else
        print("Unsupported filetype for debug statement")
        return
    end

    -- Obtener la línea actual del cursor
    local current_line = vim.api.nvim_win_get_cursor(0)[1]

    -- Insertar la línea de depuración debajo de la actual
    vim.api.nvim_buf_set_lines(0, current_line, current_line, false, {debug_command})
end, { desc = "Insert typeof debug statement for word under cursor", silent = true })


map("n", "<tab>", function()
    local line = vim.fn.line(".")
    local current_foldlevel = vim.fn.foldlevel(line)
    if current_foldlevel == 1 then
        vim.cmd("set foldlevel=1")
        vim.g.fold_toggle_state = 1 -- Inicializar el estado
    end
    if vim.g.fold_toggle_state == nil then
        vim.g.fold_toggle_state = 1 -- Inicializar el estado
    end

    if vim.g.fold_toggle_state == 1 then
        -- Estado 1: Solo foldlevel=1
        vim.cmd("set foldlevel=1")
        vim.g.fold_toggle_state = 2 -- Cambiar al siguiente estado
    else
        -- Estado 2: foldlevel=1 y alternar fold actual con zA
        vim.cmd("set foldlevel=1")
        vim.cmd("normal! zA")
        vim.g.fold_toggle_state = 1 -- Cambiar al siguiente estado
    end
end, {desc = "Alternar entre foldlevel=1 y foldlevel=1 + zA"})
