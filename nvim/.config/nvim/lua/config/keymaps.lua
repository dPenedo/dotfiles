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
map("n", "<c-l>", "<CMD>noh<CR>", { desc = "Salir del modo de inserción" })
map("i", "jk", "<ESC>la", { desc = "Salir del modo de inserción y agregar un espacio" })
map("n", "<leader>;", "m`A;<Esc>``", { desc = "Poner punto y coma al final" })
map("n", "'", "`", { desc = "backtick asignado a '" })
map("n", "zx", "zt6k6j", { desc = "Scrollear teniendo el cursor en el mismo sitio" })
map("n", "''", "<CMD>b#<CR>", { desc = "Ir al último búfer" })
map("n", "==", "<CMD>Format<CR>", { desc = "Formato al archivo" })
-- map("n", "<a-w>", ":set wrap!<CR>", { desc = "Alternar ajuste de línea" })
map("n", "<leader>ng", ":!python3 ~/Documentos/Dropbox/Notas/.gaur/aste_berria.py<CR>", { desc = "Generar una sección semanal en notas, Astekaria" })
map("n", "<leader>nc", ":!python3 comidas.py<CR>", { desc = "Generar una sección diaria en comidas" })
map("n", "<leader>ne", function()
    local astekaria_files = vim.fn.glob("~/Documentos/Dropbox/Notas/Astekaria-*.md", true, true)
    if #astekaria_files == 0 then
        vim.notify("No se encontró ningún archivo Astekaria", vim.log.levels.WARN)
        return
    end

    table.sort(astekaria_files, function(a, b)
        return vim.fn.getftime(a) > vim.fn.getftime(b)
    end)
    local target_file = astekaria_files[1]
    local day_names = {"Astelehena", "Asteartea", "Asteazkena", "Osteguna", "Ostirala"}
    local current_day = day_names[tonumber(os.date("%w"))] or ""
    vim.cmd("e " .. vim.fn.fnameescape(target_file))
    vim.fn.search("## " .. current_day .. " - \\d")
    vim.cmd("norm! 4j$zt6k6j")
end, { desc = "Ir al Egunerokoa semanal (día actual)" })

-- Terminal
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Normal mode desde el terminal" })
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


vim.keymap.set("n", "<leader>ml", function()
    if vim.bo.filetype ~= "markdown" then
        vim.notify("Not in a Markdown file", vim.log.levels.WARN)
        return
    end
    local clipboard = vim.fn.getreg("+")  -- Obtiene el contenido del portapapeles
    if clipboard == "" then
        vim.notify("Clipboard is empty", vim.log.levels.WARN)
        return
    end
    local link = string.format("[](%s)", clipboard)
    vim.api.nvim_put({ link }, "", false, true)  -- Inserta en modo normal (no en command-line)
    vim.cmd("normal! F[l")  -- Busca el primer `[` hacia atrás en la línea
    vim.cmd("startinsert") -- Entra en modo inserción (equivalente a `a`)
end, { desc = "Insert [M]arkdown [L]ink from clipboard", silent = true })


map({ "n", "v" }, "<leader>ll", function()
    local filetype = vim.bo.filetype
    local selected_text = ""

    if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
        vim.cmd('noautocmd normal! "vy')
        selected_text = vim.fn.getreg("v")
        vim.fn.setreg("v", "") -- Limpiar registro
    else
        selected_text = vim.fn.expand("<cword>")
    end

    local debug_formats = {
        javascript = 'console.log("%s => ", %s);',
        typescript = 'console.log("%s => ", %s);',
        javascriptreact = 'console.log("%s => ", %s);',
        typescriptreact = 'console.log("%s => ", %s);',
        python = 'print("%s => ", %s)',
        lua = 'print("%s => ", %s)',
    }

    if not debug_formats[filetype] then
        vim.notify("❌ Unsupported filetype for debug: " .. filetype, vim.log.levels.WARN)
        return
    end

    -- Construir el comando de debug
    local debug_var = selected_text:gsub("%s+", "_") -- Reemplazar espacios si es una selección
    local debug_command = string.format(debug_formats[filetype], debug_var, selected_text)

    -- Insertar debajo de la línea actual
    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, current_line, current_line, false, { debug_command })

    -- (Opcional) Mover el cursor a la nueva línea
    vim.api.nvim_win_set_cursor(0, { current_line + 1, 0 })
end, { desc = "Insert debug log (word or visual selection)", silent = true })

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
