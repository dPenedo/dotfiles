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

map('n', '<leader>b', '<cmd>lua require("buffer_manager.ui").toggle_quick_menu()<cr>', { desc = 'buffer manager' })

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
map('n', '==', '<CMD>Format<CR>', { desc = 'Formato al archivo' })

--Borrar palabra
-- map('i', '<c-h>', '<Esc>cvb', { desc = 'Borrar palabra' })
map('i', '<C-h>', '<ESC>i', { desc = 'Desplazar una posicion a la izquierda' })

-- Mueve el bloque hacia la izquierda
map('v', '<', '<gv', { noremap = true, silent = true })
-- Mueve el bloque hacia la derecha
map('v', '>', '>gv', { noremap = true, silent = true })

-- Trouble
map('n', '<leader>xx', '<CMD>Trouble diagnostics toggle<cr>', { desc = 'Trouble diagnostics' })
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
-- New Notes
map('n', '<leader>nn', function()
	local filename = vim.fn.input('Enter file name: ', '', 'file')
	if filename ~= '' then
		local filepath = '~/Documentos/Dropbox/Notas//' .. filename .. '.md'
		vim.fn.writefile({}, vim.fn.expand(filepath))
		vim.cmd('edit ' .. vim.fn.expand(filepath))
	end
end, { desc = '[N]ew [N]otes' })

-- New Temp Notes
map('n', '<leader>nt', function()
	local filename = vim.fn.input('Enter Temp file name: ', '', 'file')
	if filename ~= '' then
		local filepath = '~/Documentos/Dropbox/Notas/Temp/' .. filename .. '.md'
		vim.fn.writefile({}, vim.fn.expand(filepath))
		vim.cmd('edit ' .. vim.fn.expand(filepath))
	end
end, { desc = '[N]ew [T]emp' })

-- New Atom Notes
map('n', '<leader>na', function()
	local filename = vim.fn.input('Enter Atom file name: ', '', 'file')
	if filename ~= '' then
		local filepath = '~/Documentos/Dropbox/Notas/Atomoak/' .. filename .. '.md'
		vim.fn.writefile({}, vim.fn.expand(filepath))
		vim.cmd('edit ' .. vim.fn.expand(filepath))
	end
end, { desc = '[N]ew [A]tom' })

map('i', '<A-=>', function()
	local telescope_builtin = require 'telescope.builtin'
	telescope_builtin.find_files {
		prompt_title = 'Selecciona una nota',
		cwd = '~/Documentos/Dropbox/Notas',
		attach_mappings = function(_, map_note)
			map_note('i', '<CR>', function(prompt_bufnr)
				local entry = require('telescope.actions.state').get_selected_entry()
				require('telescope.actions').close(prompt_bufnr)
				if entry and entry.path then
					local filename = vim.fn.fnamemodify(entry.path, ':t:r') -- nombre del archivo sin extensión
					local link = string.format('[[%s|%s]]', filename, filename)
					vim.api.nvim_put({ link }, '', true, true)
				end
			end)
			return true
		end,
	}
end, { desc = 'New Link' })

-- Plugin obsidian
map('n', '<leader>ns', '<CMD>ObsidianQuickSwitch<cr> ', { desc = 'Obsidian Quick Switch' })
map('n', '<leader>nT', '<CMD>ObsidianTags<cr> ', { desc = 'Obsidian Template' })
map('n', '<leader>nr', '<CMD>ObsidianRename<cr> ', { desc = 'Obsidian Rename' })
map('n', '<leader>nb', '<CMD>ObsidianBacklinks<cr> ', { desc = 'Obsidian backlinks' })
map('n', '<leader>nl', '<CMD>ObsidianLinks<cr> ', { desc = 'Obsidian Links' })

-- Markdown preview
map('n', '<leader>mp', '<CMD>MarkdownPreviewToggle<cr> ', { desc = 'MarkdownPreview' })

-- Buffer Next & Prev
map('n', '<leader>.', '<CMD>bn<cr> ', { desc = 'BufferNext' })
map('n', '<leader>,', '<CMD>bp<cr> ', { desc = 'BufferPrev' })

-- Neogit
-- map('n', '<leader>ng', ':Neogit<cr> ', { desc = 'Neogit' })

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
map('n', '<leader>c0', '<CMD>set conceallevel=0<cr> ', { desc = 'conceallevel 0 ' })
map('n', '<leader>c1', '<CMD>set conceallevel=1<cr> ', { desc = 'conceallevel 1 ' })
map('n', '<leader>c2', '<CMD>set conceallevel=2<cr> ', { desc = 'conceallevel 2 ' })

map('n', '<leader>o', '<CMD>delmarks ', { desc = 'Borrar mark' })

map('n', "'", '`', { desc = "backtick asignado a '" })

map('n', ',,', ',', { desc = 'coma para f' })

-- Linea abajo/linea encima
map('n', '<leader>o', 'o<ESC>', { desc = 'Crea una linea debajo' })
map('n', '<leader>O', 'O<ESC>', { desc = 'Crea una linea encima' })

-- Zen mode
map('n', '<leader>z', ':ZenMode<CR>', { desc = 'Entra o sale  en Zen mode' })

-- Guardar rápidamente el búfer actual o todos los búferes
map('n', '<leader>w', '<CMD>update<CR>', { desc = 'Guardar el búfer actual' })
map('n', '<leader>W', '<CMD>wall<CR>', { desc = 'Guardar todos los búferes' })
-- Mapeos para salir del modo de inserción
map('i', 'jj', '<ESC>', { desc = 'Salir del modo de inserción' })
map('i', 'jk', '<ESC>la', { desc = 'Desplazar una posicion a la derecha' })
map('i', '<C-l>', '<ESC>la', { desc = 'Desplazar una posicion a la derecha' })

-- Moverse al último búfer
map('n', "''", '<CMD>b#<CR>', { desc = 'Ir al último búfer' })

-- Alternar ajuste de línea
map('n', '<a-w>', '<CMD>set wrap!<CR>', { desc = 'Alternar ajuste de línea' })

-- Limpiar resaltado de búsqueda
map('n', '<Esc>', '<CMD>nohlsearch<CR>', { desc = 'Limpiar resaltado de búsqueda' })

-- Dividir ventanas
-- map('n', '<leader>\\', '<CMD>vsplit<CR><c-w>l', { desc = 'Dividir verticalmente la ventana' })
-- map('n', '<leader>|', '<CMD>split<CR><c-w>j', { desc = 'Dividir horizontalmente la ventana' })key
map('n', '<leader><CR>', '<CMD>vsplit<CR><c-w>l', { desc = 'Dividir verticalmente la ventana' })
-- map('n', '<leader>-', '<CMD>split<CR><c-w>j', { desc = 'Dividir horizontalmente la ventana' })

-- Colores de resaltado
map('n', '<leader>cc', '<CMD>lua require("nvim-highlight-colors").toggle()<CR>',
	{ desc = 'Alternar colores de resaltado' })

-- Administradores de archivos y terminales
-- map('n', '<leader>e', ':Neotree position=float float<CR>', { desc = 'Abrir administrador de archivos Neotree' })
-- map('n', '<leader>e', ':Neotree filesystem reveal toggle right<CR>', { desc = 'Alternar visibilidad de Neotree' })
map('n', '<leader>e', '<CMD>NvimTreeFindFileToggle<CR>', { desc = 'NvimTree' })

-- map('n', '<leader>e', ':lua require("mini.files").open(vim.api.nvim_buf_get_name(0), true)<CR>', {desc = 'Open mini.files floating file manager at current directory'})
-- map('n', '<leader>E', ':lua require("mini.files").open()<CR>', {desc = 'Open mini.files'})
-- map('n', '<leader>E', ':lua require("mini.files").open(vim.loop.cwd(), true)<CR>', { desc = 'Abrir mini files en la raíz' })
map('n', '-', '<CMD>Oil --float<CR>', { desc = 'Abrir Oil' })
map('n', '<leader>h', '<CMD>Oil --float<CR>', { desc = 'Abrir Oil' })
map('n', '<leader>-', '<CMD>Oil . --float<CR>', { desc = 'Abrir Oil en root' })

-- Mapeos para el terminal
-- map('n', '<leader>ts', '<CMD>botright terminal<CR>:startinsert<CR>', { desc = 'Abrir terminal' })
map('n', '<leader>tn', '<CMD>terminal<CR>:startinsert<CR>', { desc = 'Abrir terminal' })
map('n', '<leader>`', '<CMD>terminal<CR>:startinsert<CR>', { desc = 'Abrir terminal' })
map('n', '<leader>Y', '<CMD>terminal yazi .<CR>:startinsert<CR>', { desc = 'Abrir terminal Yazi' })
map('n', '<leader>L', '<CMD>terminal lf .<CR>:startinsert<CR>', { desc = 'Abrir terminal LF' })
map('t', '<C-\\>', '<C-\\><C-n><CR>', { desc = 'Salir del modo terminal' })
map('t', '<C-q>', '<C-\\><C-n><CR>', { desc = 'Salir del modo terminal' })
map('t', '<Esc>', '<C-\\><C-n><CR>', { desc = 'Salir del modo terminal' })

map('t', '<C-h>', '<C-\\><C-n><CR><C-w>w', { desc = 'Salir del modo terminal' })

-- map('t', '<A-`>', '<C-\\><C-n><CR><CMD>TermToggle<CR>', { desc = 'Abrir ToggleTerm' })
-- map('n', '<A-`>', '<CMD>TermToggle<CR><CR>', { desc = 'Abrir ToggleTerm' })

-- map('n', '<A-e>', ':Lf<CR>', { desc = 'Abrir lf' })
-- map('n', '<A-e>', ':Yazi<CR>', { desc = 'Abrir lf' })
-- map('t', '<Esc>', '<C-\\><C-n><CR>', { desc = 'Salir del modo terminal' })
map('t', '<C-l>', '<C-u>clear<CR>', { desc = 'Limpiar la pantalla del terminal' })

-- Gestión de pestañas
map('n', '<leader><tab>', '<CMD>tabedit<CR>', { desc = 'Crear pestaña' })
map('n', '<leader>1', '<CMD>tabn 1<CR>', { desc = 'Ir a la pestaña 1' })
map('n', '<leader>2', '<CMD>tabn 2<CR>', { desc = 'Ir a la pestaña 2' })
map('n', '<leader>3', '<CMD>tabn 3<CR>', { desc = 'Ir a la pestaña 3' })
map('n', '<leader>4', '<CMD>tabn 4<CR>', { desc = 'Ir a la pestaña 4' })
map('n', '<leader>5', '<CMD>tabn 5<CR>', { desc = 'Ir a la pestaña 5' })
map('n', '<leader>6', '<CMD>tabn 6<CR>', { desc = 'Ir a la pestaña 6' })
map('n', '<leader>7', '<CMD>tabn 7<CR>', { desc = 'Ir a la pestaña 7' })
map('n', '<leader>8', '<CMD>tabn 8<CR>', { desc = 'Ir a la pestaña 8' })
map('n', '<leader>9', '<CMD>tabn 9<CR>', { desc = 'Ir a la pestaña 9' })
-- map('n', '<leader>b', '<Cmd>BufferPick<CR>', { desc = 'Telescope buffers' })
-- Copiar/pegar Clipboard
-- map('n', '<A-d>', '"_dd', { desc = 'Eliminar línea sin afectar el registro' })
-- map('v', '<A-d>', '"_dd', { desc = 'Eliminar línea sin afectar el registro' })
map('v', '<A-c>', '"+y', { desc = 'Copiar al portapapeles' })
map('v', '<leader>y', '"+y', { desc = 'Copiar seleccion portapapeles' })
map('n', '<leader>y', 'm`V"+y``', { desc = 'Copiar linea al portapapeles' })
map('n', '<leader>p', '<CMD>Telescope registers<cr>', { desc = 'Buscar registros en telescope' })
map('v', '<leader>p', '<CMD>Telescope registers<cr>', { desc = 'Buscar registros en telescope' })
-- map('n', '<leader>p', '"+p', { desc = 'Pegar del portapapeles' })
-- map('v', '<leader>p', '"+p', { desc = 'Pegar del portapapeles' })
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

-- Telescope
map('n', '<leader>f', '<CMD>Telescope find_files <CR>', { desc = 'Telescope files' })
map('n', '<leader>/', '<CMD>Telescope current_buffer_fuzzy_find<CR>', { desc = 'Telescope para en el buffer actual' })
map('n', '<leader><space>', '<CMD>Telescope buffers<CR>', { desc = 'Telescope buffers' })
map('n', '<leader>gg', '<CMD>Telescope live_grep<CR>', { desc = 'Telescope grep' })
map('n', '<leader>nf', '<CMD>NotasBuscar<CR>', { desc = '[N]otas [F]ind' })
map('n', '<leader>u', '<CMD>Telescope undo<CR>', { desc = 'Telescope para en el historial de deshacer' })
map('n', '<leader>tt', '<CMD>TodoTelescope<CR>', { desc = 'Telescope para TODOs' })
map('n', ',h', '<CMD>Telescope help_tags<CR>', { desc = 'Telescope para etiquetas de ayuda' })
map('n', ',k', '<CMD>Telescope keymaps<CR>', { desc = 'keymaps' })
map('n', '<leader>so', '<CMD>Telescope oldfiles<CR>', { desc = 'Telescope oldfiles' })
map('n', '<leader>ca', '<CMD>lua vim.lsp.buf.code_action()<cr>', { desc = 'Code actions' })
map('n', 'gr', '<CMD>Telescope lsp_references<CR>', { desc = 'Telescope lsp references' })
map('n', '<leader>aa', '<CMD>Telescope commands<CR>', { desc = 'Telescope commands' })

-- load the session for the current directory
map('n', '<leader>S', function()
	require('persistence').load()
end)
-- select a session to load
map('n', '<leader>se', function()
	require('persistence').select()
end)
-- load the last session
map('n', '<leader>sL', function()
	require('persistence').load { last = true }
end)
-- stop Persistence => session won't be saved on exit
map('n', '<leader>sq', function()
	require('persistence').stop()
end)
