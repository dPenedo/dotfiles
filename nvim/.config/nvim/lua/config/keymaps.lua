-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>wm")
vim.keymap.del("n", "<A-j>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<leader>l")
-- vim.keymap.del("n", "<leader>fn")
vim.keymap.del("n", "<C-l>")
vim.keymap.del("i", "<A-j>")
vim.keymap.del("v", "<A-j>")
vim.keymap.del("n", "<A-k>")
vim.keymap.del("i", "<A-k>")
vim.keymap.del("v", "<A-k>")
vim.keymap.del("n", "<leader>n")
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>e")

local map = LazyVim.safe_keymap_set

-- map("n", "<leader>w", "<cmd>update<cr>", { desc = "Windows", remap = true })
map("i", "jk", "<ESC>", { desc = "Salir del modo de inserción" })
map("n", "<leader>;", "m`A;<Esc>``", { desc = "Poner punto y coma al final" })
map("n", "zx", "zt6k6j", { desc = "Scrollear teniendo el cursor en el mismo sitio" })

vim.api.nvim_set_keymap("v", "<leader>r", "<Plug>SnipRun", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>r", "<Plug>SnipRun", { silent = true })

-- map("n", ";", ":", { desc = "Intercambiar ; y :", noremap = true })
-- map("v", ";", ":", { desc = "Intercambiar ; y :", noremap = true })
-- map("n", ":", ";", { desc = "Intercambiar : y ;", noremap = true })
-- map("v", ":", ";", { desc = "Intercambiar : y ;", noremap = true })

map("n", "<leader>v", "ggVG", { desc = "Seleccionar todo" })
map("v", "<leader>v", "ggVG", { desc = "Seleccionar todo" })

map("t", "<Esc>", "<C-\\><C-n>", { silent = true })
map("v", "<leader><cr>", ":lua send_to_tmux()<CR>", { noremap = true, silent = true })

-- Clipboard
map("v", "<leader>y", '"+y', { desc = "Copiar seleccion portapapeles" })
map("n", "<leader>y", 'm`V"+y``', { desc = "Copiar linea al portapapeles" })
map("n", "<leader>p", '"+p', { desc = "Pegar del portapapeles" })
map("v", "<leader>p", '"+p', { desc = "Pegar del portapapeles" })

map("n", "<leader>lp", "<cmd>w !python3<cr>", { desc = "Pegar del portapapeles" })

-- Notas

map("n", "<A-n>", function()
  local filename = vim.fn.expand("%:t:r")
  local title = "# " .. filename:gsub("-", " ")
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))

  vim.api.nvim_buf_set_lines(0, row, row, false, {
    title,
    "",
    "",
  })
end, { desc = "Insertar plantilla de nota" })

-- -- Tabs
--
-- map("n", "<leader>1", "<CMD>tabn 1<CR>", { desc = "Ir a la pestaña 1" })
-- map("n", "<leader>2", "<CMD>tabn 2<CR>", { desc = "Ir a la pestaña 2" })
-- map("n", "<leader>3", "<CMD>tabn 3<CR>", { desc = "Ir a la pestaña 3" })
-- map("n", "<leader>4", "<CMD>tabn 4<CR>", { desc = "Ir a la pestaña 4" })
-- map("n", "<leader>5", "<CMD>tabn 5<CR>", { desc = "Ir a la pestaña 5" })
-- map("n", "<leader>6", "<CMD>tabn 6<CR>", { desc = "Ir a la pestaña 6" })
-- map("n", "<leader>7", "<CMD>tabn 7<CR>", { desc = "Ir a la pestaña 7" })
-- map("n", "<leader>8", "<CMD>tabn 8<CR>", { desc = "Ir a la pestaña 8" })
-- map("n", "<leader>9", "<CMD>tabn 9<CR>", { desc = "Ir a la pestaña 9" })

-- map("n", "<tab>", function()
--   local line = vim.fn.line(".")
--   local current_foldlevel = vim.fn.foldlevel(line)
--   if current_foldlevel == 1 then
--     vim.cmd("set foldlevel=1")
--     vim.g.fold_toggle_state = 1 -- Inicializar el estado
--   end
--   if vim.g.fold_toggle_state == nil then
--     vim.g.fold_toggle_state = 1 -- Inicializar el estado
--   end
--
--   if vim.g.fold_toggle_state == 1 then
--     -- Estado 1: Solo foldlevel=1
--     vim.cmd("set foldlevel=1")
--     vim.g.fold_toggle_state = 2 -- Cambiar al siguiente estado
--   else
--     -- Estado 2: foldlevel=1 y alternar fold actual con zA
--     vim.cmd("set foldlevel=1")
--     vim.cmd("normal! zA")
--     vim.g.fold_toggle_state = 1 -- Cambiar al siguiente estado
--   end
-- end, { desc = "Alternar entre foldlevel=1 y foldlevel=1 + zA" })
--
map("n", "<leader>np", function()
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  local base_path = vim.fn.expand("~/Documentos/Dropbox/Notas/Proyectos/")
  local project_dir = base_path .. project_name
  local note_path = project_dir .. "/" .. project_name .. ".md"

  -- Crear carpeta si no existe
  if vim.fn.isdirectory(project_dir) == 0 then
    vim.fn.mkdir(project_dir, "p")
  end

  -- Abrir el archivo
  vim.cmd("edit " .. note_path)

  -- Si el archivo está vacío, escribir plantilla mínima
  if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
    local lines = {
      "# " .. project_name,
      "",
      "Fecha: " .. os.date("%d-%m-%Y"),
      "#Proyectos",
    }
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  end
end, { desc = "Abrir nota del proyecto" })

map("n", "<leader>no", function()
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  local note_path = "~/Documentos/Dropbox/Notas/Proyectos/" .. project_name .. "/" .. project_name .. ".org"
  vim.cmd("e " .. note_path)
end, { desc = "Abrir org del proyecto" })

map(
  "n",
  "<leader>ng",
  ":!python3 ~/Documentos/Dropbox/Notas/.gaur/aste_berria.py<CR>",
  { desc = "Generar una sección semanal en notas, Astekaria" }
)
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
  local day_names = { "Astelehena", "Asteartea", "Asteazkena", "Osteguna", "Ostirala" }
  local current_day = day_names[tonumber(os.date("%w"))] or ""
  vim.cmd("e " .. vim.fn.fnameescape(target_file))
  vim.fn.search("## " .. current_day .. " - \\d")
  vim.cmd("norm! 4j$zt6k6j")
end, { desc = "Ir al Egunerokoa semanal (día actual)" })

-- Debug
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

  -- Obtener la línea actual y su indentación
  local current_line_num = vim.api.nvim_win_get_cursor(0)[1]
  local current_line_content = vim.api.nvim_buf_get_lines(0, current_line_num - 1, current_line_num, false)[1]

  -- Solo si es Python, añadir la indentación
  if filetype == "python" then
    local indent = current_line_content:match("^%s*") or "" -- Obtener los espacios iniciales
    debug_command = indent .. debug_command
  end

  -- Insertar debajo de la línea actual
  vim.api.nvim_buf_set_lines(0, current_line_num, current_line_num, false, { debug_command })

  -- Mover el cursor a la nueva línea
  vim.api.nvim_win_set_cursor(0, { current_line_num + 1, 0 })
end, { desc = "Insert debug log (word or visual selection)", silent = true })

map("n", "<leader>lt", function()
  local word = vim.fn.expand("<cword>") -- Obtener la palabra bajo el cursor
  local filetype = vim.bo.filetype
  local debug_command

  -- Determinar qué comando de depuración usar según el tipo de archivo
  if
    filetype == "javascript"
    or filetype == "typescript"
    or filetype == "javascriptreact"
    or filetype == "typescriptreact"
  then
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
  vim.api.nvim_buf_set_lines(0, current_line, current_line, false, { debug_command })
end, { desc = "Insert typeof debug statement for word under cursor", silent = true })

-- Iron
-- Seleccionar bloque # %% o #%%
map("n", "<leader><cr>", function()
  -- Buscar hacia atrás el inicio del bloque
  vim.fn.search("# *%%", "bW")
  -- Entrar a modo visual línea
  vim.cmd("normal! jV")
  -- Buscar hacia adelante el próximo delimitador y moverse una línea arriba
  vim.fn.search("# *%%", "W")
  vim.cmd("normal! k")
end, { desc = "Seleccionar bloque #%%", remap = false })
