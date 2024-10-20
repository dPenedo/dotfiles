local function map(mode, key, value, options)
  vim.keymap.set(mode, key, value, options or { silent = true })
end

-- Leader
map({ 'n', 'v' }, '<Space>', '<Nop>')

map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })
map('v', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
map('v', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })
-- Save
map('n', '<leader>w', '<CMD>update<CR>', { desc = 'Guardar el búfer actual' })
map('n', '<leader>W', '<CMD>wall<CR>', { desc = 'Guardar todos los búferes' })
--Format
map('n', '==', '<CMD>Format<CR>', { desc = 'Formato al archivo' })

-- Indent move:
map('v', '<', '<gv', { noremap = true, silent = true })
map('v', '>', '>gv', { noremap = true, silent = true })

-- Mapeos para salir del modo de inserción
map('i', 'jj', '<ESC>', { desc = 'Salir del modo de inserción' })
map('i', 'jk', '<ESC>la', { desc = 'Desplazar una posicion a la derecha' })
map('i', '<C-l>', '<ESC>la', { desc = 'Desplazar una posicion a la derecha' })

-- concealevel
map('n', '<leader>c0', '<CMD>set conceallevel=0<cr> ', { desc = 'conceallevel 0 ' })
map('n', '<leader>c1', '<CMD>set conceallevel=1<cr> ', { desc = 'conceallevel 1 ' })
map('n', '<leader>c2', '<CMD>set conceallevel=2<cr> ', { desc = 'conceallevel 2 ' })

map('n', "'", '`', { desc = "backtick asignado a '" })

-- Linea abajo/linea encima
map('n', '<leader>o', 'o<ESC>', { desc = 'Crea una linea debajo' })
map('n', '<leader>O', 'O<ESC>', { desc = 'Crea una linea encima' })

-- Moverse al último búfer
map('n', "''", '<CMD>b#<CR>', { desc = 'Ir al último búfer' })

-- map('n', '<leader>,', '<CMD>bprev<CR>', { desc = 'Ir al búfer anterior' })
-- map('n', '<leader>.', '<CMD>bnext<CR>', { desc = 'Ir al siguiente búfer' })

-- Alternar ajuste de línea
map('n', '<a-w>', '<CMD>set wrap!<CR>', { desc = 'Alternar ajuste de línea' })

-- Limpiar resaltado de búsqueda
map('n', '<Esc>', '<CMD>nohlsearch<CR>', { desc = 'Limpiar resaltado de búsqueda' })

-- Dividir ventanas
map('n', '<leader><CR>', '<CMD>vsplit<CR><c-w>l', { desc = 'Dividir verticalmente la ventana' })
map('n', '<leader>\\', '<CMD>split<CR><c-w>j', { desc = 'Dividir horizontalmente la ventana' })

-- Mapeos para el terminal
-- map('n', '<leader>ts', '<CMD>botright terminal<CR>:startinsert<CR>', { desc = 'Abrir terminal' })
map('n', '<leader>tn', '<CMD>terminal<CR>:startinsert<CR>', { desc = 'Abrir terminal' })
map('n', '<leader>`', '<CMD>terminal<CR>:startinsert<CR>', { desc = 'Abrir terminal' })
map('n', '<leader>Y', '<CMD>terminal yazi .<CR>:startinsert<CR>', { desc = 'Abrir terminal Yazi' })
map('n', '<leader>L', '<CMD>terminal lf .<CR>:startinsert<CR>', { desc = 'Abrir terminal LF' })
map('t', '<C-\\>', '<C-\\><C-n><CR>', { desc = 'Salir del modo terminal' })
map('t', '<C-q>', '<C-\\><C-n><CR>', { desc = 'Salir del modo terminal' })
map('t', '<Esc>', '<C-\\><C-n><CR>', { desc = 'Salir del modo terminal' })
map('t', '<C-l>', '<C-u>clear<CR>', { desc = 'Limpiar la pantalla del terminal' })
map('t', '<C-h>', '<C-\\><C-n><CR><C-w>w', { desc = 'Salir del modo terminal' })

-- Gestión de pestañas
map('n', '<leader><tab>', '<CMD>tabedit<CR>', { desc = 'Crear pestaña' })

-- Copiar/pegar Clipboard
map('v', '<leader>y', '"+y', { desc = 'Copiar seleccion portapapeles' })
map('n', '<leader>y', 'm`V"+y``', { desc = 'Copiar linea al portapapeles' })
map('n', '<leader>sp', '<CMD>Telescope registers<cr>', { desc = 'Buscar registros en telescope' })
map('v', '<leader>sp', '<CMD>Telescope registers<cr>', { desc = 'Buscar registros en telescope' })
map('n', '<leader>p', '"+p', { desc = 'Pegar del portapapeles' })
map('v', '<leader>p', '"+p', { desc = 'Pegar del portapapeles' })
map('n', '<leader>v', 'ggVG', { desc = 'Seleccionar todo' })

-- Scroll
map('n', 'zx', 'zt6k6j', { desc = 'Scrollear teniendo el cursor en el mismo sitio' })

-- Mapeos para redimensionar ventanas
map('n', '<C-right>', '<CMD>vertical resize +5<CR>', { desc = 'Aumentar el tamaño de la ventana verticalmente' })
map('n', '<C-left>', '<CMD>vertical resize -5<CR>', { desc = 'Reducir el tamaño de la ventana verticalmente' })
map('n', '<C-down>', '<CMD>horizontal resize +2<CR>', { desc = 'Aumentar el tamaño de la ventana horizontalmente' })
map('n', '<C-up>', '<CMD>horizontal resize -2<CR>', { desc = 'Reducir el tamaño de la ventana horizontalmente' })

-- Java
map('n', '<leader>;', 'm`A;<Esc>``', { desc = 'Poner punto y coma al final' })

--QuickFix
map('n', '<leader>qf', '<CMD>copen<CR>', { desc = 'Abrir lista QuickFix' })
map('n', '<leader>J', '<CMD>cnext<CR>', { desc = 'Siguiente QuickFix' })
map('n', '<leader>K', '<CMD>cprev<CR>', { desc = 'Anterior QuickFix' })
map('n', '<leader>ll', '<CMD>lua vim.diagnostic.setqflist()<CR>', { desc = 'Set Local List' })

-- Crear un comando para abrir Thunar en el archivo o directorio actual
vim.api.nvim_create_user_command('OpenThunar', function()
  local file_path = vim.fn.expand '%:p:h'

  if file_path:match '^oil://' then
    file_path = file_path:gsub('^oil://', '')
  end

  -- Ejecutar Thunar con la ruta corregida
  vim.fn.jobstart { 'thunar', file_path }
end, {})

vim.api.nvim_set_keymap('n', '<leader>e', ':OpenThunar<CR>', { noremap = true, silent = true })
