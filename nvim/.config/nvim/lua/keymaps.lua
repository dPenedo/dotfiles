local function map(mode, key, value, options)
  vim.keymap.set(mode, key, value, options or { silent = true })
end

-- Mapeo para <Space> (espacio) usando vim.keymap
map({ 'n', 'v' }, '<Space>', '<Nop>')

-- Remapeo para manejar el salto de palabras
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Mapeos para diagnósticos
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Ir al mensaje de diagnóstico anterior' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Ir al siguiente mensaje de diagnóstico' })
map('n', '<leader>dd', vim.diagnostic.open_float, { desc = 'Abrir mensaje de diagnóstico flotante' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Abrir lista de diagnósticos' })

-- Resaltado al pegar (yank)
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
--Format
map('n', '==', ':Format<CR>', { desc = 'Formato al archivo' })

--Borrar palabra
-- map('i', '<c-h>', '<Esc>cvb', { desc = 'Borrar palabra' })
map('i', '<C-h>', '<ESC>i', { desc = 'Desplazar una posicion a la izquierda' })

map('n', '<CR>', ':', { desc = 'command con enter' })
map('v', '<CR>', ':', { desc = 'command con enter' })

-- Mueve el bloque hacia la izquierda
map('v', '<', '<gv', { noremap = true, silent = true })
-- Mueve el bloque hacia la derecha
map('v', '>', '>gv', { noremap = true, silent = true })

-- Trouble
map('n', '<leader>xx', ":Trouble diagnostics toggle<cr>", {desc = "Trouble diagnostics"})
map('n', '<leader>xw', function()
  require('trouble').toggle 'workspace_diagnostics'
end)
map('n', '<leader>xd', function()
  require('trouble').toggle 'document_diagnostics'
end)
map('n', '<leader>xq', function()
  require('trouble').toggle 'quickfix'
end)
map('n', '<leader>xl', function()
  require('trouble').toggle 'loclist'
end)
map('n', 'gR', function()
  require('trouble').toggle 'lsp_references'
end)

-- Notes
map('n', '<leader>nn', function()
  local filename = vim.fn.input('Enter file name: ', '', 'file')
  if filename ~= '' then
    local filepath = '~/Documentos/Dropbox/Notas//' .. filename .. '.md'
    vim.fn.writefile({}, vim.fn.expand(filepath))
    vim.cmd('edit ' .. vim.fn.expand(filepath))
  end
end, { desc = '[N]ew [N]otes' })

map('n', '<leader>ns', ':ObsidianQuickSwitch<cr> ', { desc = 'Obsidian Quick Switch' })
map('n', '<leader>ne', ':ObsidianExtractNote<cr> ', { desc = 'Obsidian Extract note' })
map('n', '<leader>nt', ':ObsidianTemplate<cr> ', { desc = 'Obsidian Template' })
map('n', '<leader>nT', ':ObsidianTags<cr> ', { desc = 'Obsidian Template' })
map('n', '<leader>nl', ':ObsidianLink<cr> ', { desc = 'Obsidian Link' })
map('n', '<leader>nr', ':ObsidianRename<cr> ', { desc = 'Obsidian Rename' })
map('n', '<leader>nb', ':ObsidianBacklinks<cr> ', { desc = 'Obsidian backlinks' })




 -- Neogit

map('n', '<leader>ng', ':Neogit<cr> ', { desc = 'Neogit' })

-- Diagnostics
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end
map('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
map('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
map('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
map('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
map('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
map('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
map('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

-- concealevel
map('n', '<leader>c0', ':set conceallevel=0<cr> ', { desc = 'conceallevel 0 ' })
map('n', '<leader>c1', ':set conceallevel=1<cr> ', { desc = 'conceallevel 1 ' })
map('n', '<leader>c2', ':set conceallevel=2<cr> ', { desc = 'conceallevel 2 ' })

map('n', '<leader>o', ':delmarks ', { desc = 'Borrar mark' })

map('n', "'", '`', { desc = "backtick asignado a '" })

map('n', ',,', ',', { desc = 'coma para f' })

-- Linea abajo/linea encima
map('n', '<leader>o', 'o<ESC>', { desc = 'Crea una linea debajo' })
map('n', '<leader>O', 'O<ESC>', { desc = 'Crea una linea encima' })

-- Zen mode
map('n', '<leader>z', ':ZenMode<CR>', { desc = 'Entra o sale  en Zen mode' })

-- Guardar rápidamente el búfer actual o todos los búferes
map('n', '<A-s>', '<CMD>update<CR>', { desc = 'Guardar el búfer actual' })
map('n', '<leader>w', '<CMD>update<CR>', { desc = 'Guardar el búfer actual' })
map('n', '<leader>qq', '<CMD>quit<CR>', { desc = 'Cerrar el búfer actual' })
map('i', '<A-s>', '<CMD>update<CR>', { desc = 'Guardar el búfer actual' })
map('v', '<A-s>', '<CMD>update<CR>', { desc = 'Guardar el búfer actual' })
map('n', '<leader>W', '<CMD>wall<CR>', { desc = 'Guardar todos los búferes' })
-- Mapeos para salir del modo de inserción
map('i', 'jj', '<ESC>', { desc = 'Salir del modo de inserción' })
map('i', 'jk', '<ESC>la', { desc = 'Desplazar una posicion a la derecha' })
map('i', '<C-l>', '<ESC>la', { desc = 'Desplazar una posicion a la derecha' })


-- Moverse al último búfer
map('n', "''", '<CMD>b#<CR>', { desc = 'Ir al último búfer' })

-- Alternar ajuste de línea
map('n', '<a-w>', ':set wrap!<CR>', { desc = 'Alternar ajuste de línea' })

-- Limpiar resaltado de búsqueda
map('n', '<Esc>', ':nohlsearch<CR>', { desc = 'Limpiar resaltado de búsqueda' })

-- Dividir ventanas
map('n', '<leader>\\', '<CMD>vsplit<CR><c-w>l', { desc = 'Dividir verticalmente la ventana' })
map('n', '<leader>|', '<CMD>split<CR><c-w>j', { desc = 'Dividir horizontalmente la ventana' })
map('n', '<leader><CR>', '<CMD>vsplit<CR><c-w>l', { desc = 'Dividir verticalmente la ventana' })
map('n', '<leader>-', '<CMD>split<CR><c-w>j', { desc = 'Dividir horizontalmente la ventana' })

-- Colores de resaltado
map('n', '<leader>cc', '<CMD>lua require("nvim-highlight-colors").toggle()<CR>', { desc = 'Alternar colores de resaltado' })

-- Administradores de archivos y terminales
-- map('n', '<leader>e', ':Neotree position=float float<CR>', { desc = 'Abrir administrador de archivos Neotree' })
map('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', { desc = 'Alternar visibilidad de Neotree' })
-- map('n', '<leader>e', ':lua require("mini.files").open(vim.api.nvim_buf_get_name(0), true)<CR>', {desc = 'Open mini.files floating file manager at current directory'})
-- map('n', '<leader>E', ':lua require("mini.files").open()<CR>', {desc = 'Open mini.files'})
-- map('n', '<leader>E', ':lua require("mini.files").open(vim.loop.cwd(), true)<CR>', { desc = 'Abrir mini files en la raíz' })
map('n', '-', ':Oil<CR>', { desc = 'Abrir Oil' })





-- Mapeos para el terminal
-- map('n', '<leader>ts', ':botright terminal<CR>:startinsert<CR>', { desc = 'Abrir terminal' })
map('n', '<leader>tn', ':terminal<CR>', { desc = 'Abrir terminal' })
map('n', '<leader>Y', ':terminal yazi .<CR>:startinsert<CR>', { desc = 'Abrir terminal Yazi' })
map('n', '<leader>L', ':terminal lf .<CR>:startinsert<CR>', { desc = 'Abrir terminal LF' })
map('t', '<C-\\>', '<C-\\><C-n><CR>', { desc = 'Salir del modo terminal' })
map('t', '<Esc><Esc>', '<C-\\><C-n><CR>', { desc = 'Salir del modo terminal' })
map('t', '<C-k>', '<C-\\><C-n><C-w>w', { desc = 'Cambiar de split desde el terminal' })
map('t', '<C-j>', '<C-\\><C-n><C-w>w', { desc = 'Cambiar de split desde el terminal' })
map('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Cambiar de split desde el terminal' })


map('t', '<A-`>', '<C-\\><C-n><CR>:TermToggle<CR>', { desc = 'Abrir ToggleTerm' })
map('n', '<A-`>', ':TermToggle<CR><CR>', { desc = 'Abrir ToggleTerm' })



-- map('t', '<A-`>', '<C-\\><C-n><CR>:ToggleTerm<CR>', { desc = 'Abrir ToggleTerm' })
-- map('n', '<A-`>', ':ToggleTerm<CR>', { desc = 'Abrir ToggleTerm' })
-- map('n', '<leader>tf', ':ToggleTerm direction=float <CR>', { desc = 'Abrir ToggleTerm' })
-- map('n', '<leader>ts', ':ToggleTerm direction=vertical size=60<CR> ', { desc = 'Abrir ToggleTerm' })
-- map('n', '<leader>th', ':ToggleTerm direction=horizontal<CR> ', { desc = 'Abrir ToggleTerm' })



-- map('n', '<A-e>', ':Lf<CR>', { desc = 'Abrir lf' })
-- map('n', '<A-e>', ':Yazi<CR>', { desc = 'Abrir lf' })

-- map('t', '<Esc>', '<C-\\><C-n><CR>', { desc = 'Salir del modo terminal' })
map('t', '<C-l>', '<C-u>clear<CR>', { desc = 'Limpiar la pantalla del terminal' })

-- Gestión de pestañas
map('n', '<leader><tab>', ':tabedit<CR>', { desc = 'Crear pestaña' })
map('n', '<leader>1', ':tabn 1<CR>', { desc = 'Ir a la pestaña 1' })
map('n', '<leader>2', ':tabn 2<CR>', { desc = 'Ir a la pestaña 2' })
map('n', '<leader>3', ':tabn 3<CR>', { desc = 'Ir a la pestaña 3' })
map('n', '<leader>4', ':tabn 4<CR>', { desc = 'Ir a la pestaña 4' })
map('n', '<leader>5', ':tabn 5<CR>', { desc = 'Ir a la pestaña 5' })
map('n', '<leader>6', ':tabn 6<CR>', { desc = 'Ir a la pestaña 6' })
map('n', '<leader>7', ':tabn 7<CR>', { desc = 'Ir a la pestaña 7' })
map('n', '<leader>8', ':tabn 8<CR>', { desc = 'Ir a la pestaña 8' })
map('n', '<leader>9', ':tabn 9<CR>', { desc = 'Ir a la pestaña 9' })

-- Copiar/pegar Clipboard
-- map('n', '<A-d>', '"_dd', { desc = 'Eliminar línea sin afectar el registro' })
-- map('v', '<A-d>', '"_dd', { desc = 'Eliminar línea sin afectar el registro' })
map('v', '<A-c>', '"+y', { desc = 'Copiar al portapapeles' })
map('v', '<leader>y', '"+y', { desc = 'Copiar seleccion portapapeles' })
map('n', '<leader>y', 'm`V"+y``', { desc = 'Copiar linea al portapapeles' })
map('v', '<leader>P', ':Tele registers<cr>', { desc = 'Pegar con fzf lua' })
map('n', '<leader>P', ':Tele registers<cr>', { desc = 'Pegar del portapapeles' })
map('n', '<leader>p', '"+p', { desc = 'Pegar del portapapeles' })
map('v', '<leader>p', '"+p', { desc = 'Pegar del portapapeles' })
map('n', '<leader>v', 'ggVG', { desc = 'Seleccionar todo' })




-- Scroll
map('n', 'zx', 'zt6k6j', { desc = 'Scrollear teniendo el cursor en el mismo sitio' })

-- Mapeos para moverse entre ventanas
map('n', '<Tab>', '<C-w>w', { desc = 'Moverse a la siguiente ventana' })
map('n', '<C-h>', '<C-w>h', { desc = 'Moverse a la ventana izquierda' })
map('n', '<C-j>', '<C-w>j', { desc = 'Moverse a la ventana inferior' })
map('n', '<C-k>', '<C-w>k', { desc = 'Moverse a la ventana superior' })
map('n', '<C-l>', '<C-w>l', { desc = 'Moverse a la ventana derecha' })
map('n', '<M-h>', '<C-w>h', { desc = 'Moverse a la ventana izquierda' })
map('n', '<M-j>', '<C-w>j', { desc = 'Moverse a la ventana inferior' })
map('n', '<M-k>', '<C-w>k', { desc = 'Moverse a la ventana superior' })
map('n', '<M-l>', '<C-w>l', { desc = 'Moverse a la ventana derecha' })

-- Mapeos para redimensionar ventanas
map('n', '<C-right>', ':vertical resize +5<CR>', { desc = 'Aumentar el tamaño de la ventana verticalmente' })
map('n', '<C-left>', ':vertical resize -5<CR>', { desc = 'Reducir el tamaño de la ventana verticalmente' })
map('n', '<C-down>', ':horizontal resize +2<CR>', { desc = 'Aumentar el tamaño de la ventana horizontalmente' })
map('n', '<C-up>', ':horizontal resize -2<CR>', { desc = 'Reducir el tamaño de la ventana horizontalmente' })

map('t', '<C-right>', ':vertical resize +5<CR>', { desc = 'Aumentar el tamaño de la ventana verticalmente' })
map('t', '<C-left>', ':vertical resize -5<CR>', { desc = 'Reducir el tamaño de la ventana verticalmente' })
map('t', '<C-down>', ':horizontal resize +2<CR>', { desc = 'Aumentar el tamaño de la ventana horizontalmente' })
map('t', '<C-up>', ':horizontal resize -2<CR>', { desc = 'Reducir el tamaño de la ventana horizontalmente' })
-- Java:
map('n', '<leader>;', 'm`A;<Esc>``', { desc = 'Poner punto y coma al final' })

-- Telescope

map('n', '<leader>gf', ':Telescope git_files<CR>', { desc = 'Search [G]it [F]iles' })
map('n', '<leader>sh', ':Telescope help_tags<CR>', { desc = '[S]earch [H]elp' })
map('n', '<leader>sw', ':Telescope grep_string<CR>', { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', ':Telescope live_grep<CR>', { desc = '[S]earch by [G]rep' })
map('n', '<leader>sG', ':LiveGrepGitRoot<cr><CR>', { desc = '[S]earch by [G]rep on Git Root' })
map('n', '<leader>sd', ':Telescope diagnostics<CR>', { desc = '[S]earch [D]iagnostics' })
map('n', '<leader>sr', ':Telescope resume<CR>', { desc = '[S]earch [R]esume' })
map('n', '<leader>nf', ':NotasBuscar<CR>', { desc = '[N]otas [F]ind' })
map('n', ',b', ':Telescope buffers<CR>', { desc = 'Telescope para buffers' })
map('n', ',B', ':Telescope builtin<CR>', { desc = 'Telescope para comandos internos' })
map('n', ',r', ':Telescope registers<CR>', { desc = 'Telescope para registros' })
map('n', ',u', ':Telescope undo<CR>', { desc = 'Telescope para en el historial de deshacer' })
map('n', '<leader>u', ':Telescope undo<CR>', { desc = 'Telescope para en el historial de deshacer' })
map('n', ',T', ':Telescope treesitter<CR>', { desc = 'Telescope para en Treesitter' })
map('n', ',t', ':TodoTelescope<CR>', { desc = 'Telescope para TODOs' })
map('n', '<leader>tt', ':TodoTelescope<CR>', { desc = 'Telescope para TODOs' })
map('n', ',h', ':Telescope help_tags<CR>', { desc = 'Telescope para etiquetas de ayuda' })
map('n', ',m', ':Telescope marks<CR>', { desc = 'Telescope para marks' })
map('n', '<leader>f', ':Telescope find_files <CR>', { desc = 'Fzf lua files' })

map('n', '<leader>l', ':Telescope current_buffer_fuzzy_find<CR>', { desc = 'fzflua para en el buffer actual' })
map('n', '<leader><space>', ':Telescope buffers<CR>', { desc = 'fzf grep' })
map('n', '<leader>gg', ':Tele live_grep<CR>', { desc = 'Telescope grep' })

-- FzfLua
map('n', ',g', ':FzfLua grep_visual<CR>', { desc = 'Telescope para búsqueda en vivo con grep' })
map('n', ',k', ':Tele keymaps<CR>', { desc = 'keymaps' })
map('n', ',f', ':FzfLua files <CR>', { desc = 'Fzf lua files' })
map('n', '<leader>?', ':Tele oldfiles<CR>', { desc = 'fzf grep' })
map('n', '<leader>co', ':FzfLua colorschemes<CR>', { desc = 'Fzf lua colorschemes' })
-- map('n', '<leader>ca', ':FzfLua lsp_code_actions<CR>', { desc = 'Fzf lua colorschemes' })
map('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<cr>', { desc = 'Fzf lua colorschemes' })

map('n', 'gr', ':Tele lsp_references<CR>', { desc = 'Fzf lua colorschemes' })
map('n', '<leader>aa', ':FzfLua commands<CR>', { desc = 'Fzf commands' })

-- vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
