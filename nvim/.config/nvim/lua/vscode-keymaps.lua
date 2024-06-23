local vscode = require('vscode')
local function vscode_call(action)
    return string.format('<CMD>lua require("vscode").call("%s")<CR>', action)
end
vim.g.mapleader = " "
local function map(mode, key, value, options)
  vim.keymap.set(mode, key, value, options or { silent = true })
end

-- Neovim
map('n', '<CR>', ':', { desc = 'command con enter' })
map('n', "'", '`', { desc = "backtick asignado a '" })
map('n', '<leader>o', 'o<ESC>', { desc = 'Crea una linea debajo' })
map('n', '<leader>O', 'O<ESC>', { desc = 'Crea una linea encima' })
map('n', 'zx', 'zt6k6j', { desc = 'Scrollear teniendo el cursor en el mismo sitio' })
map('n', '<leader>;', 'm`A;<Esc>``', { desc = 'Poner punto y coma al final' })


-- Splits 
map('n', '<leader><CR>', vscode_call("workbench.action.splitEditorRight"))
map('n', '<leader>-', vscode_call("workbench.action.splitEditorDown"))
map('n', '<leader>qq', vscode_call("workbench.action.closeActiveEditor"))
map('n', '<Tab>', vscode_call("workbench.action.navigateEditorGroups"))
map('n', '<C-j>', vscode_call("workbench.action.navigateDown"))
map('x', '<C-j>', vscode_call("workbench.action.navigateDown"))
map('n', '<C-k>', vscode_call("workbench.action.navigateUp"))
map('x', '<C-k>', vscode_call("workbench.action.navigateUp"))
map('n', '<C-h>', vscode_call("workbench.action.navigateLeft"))
map('x', '<C-h>', vscode_call("workbench.action.navigateLeft"))
map('n', '<C-l>', vscode_call("workbench.action.navigateRight"))
map('x', '<C-l>', vscode_call("workbench.action.navigateRight"))
map('n', '<C-Up>', vscode_call("workbench.action.increaseViewHeight"))
map('n', '<C-Down>', vscode_call("workbench.action.decreaseViewHeight"))
map('n', '<C-Left>', vscode_call("workbench.action.decreaseViewWidth"))
map('n', '<C-Right>', vscode_call("workbench.action.increaseViewWidth"))
-- noo
map('n', "''", vscode_call("workbench.action.navigateLast"))

-- Clipboard
map('n', '<leader>v', vscode_call("editor.action.selectAll"))
map('v', '<leader>y', '"+y')


-- VS CODE

-- Files
map('n', '<leader>w', vscode_call("workbench.action.files.save"))
map('n', '<leader>W', vscode_call("workbench.action.files.saveAll"))
map('n', '<leader>F', vscode_call("workbench.action.formatDocument"))
-- Search
map('n', '<leader>f', vscode_call("workbench.action.quickOpen"))
map('n', '<leader>l', vscode_call("fuzzySearch.activeTextEditor"))
map('n', '<leader><leader>', vscode_call("workbench.action.showAllEditors"))
map('n', '<leader>g', vscode_call("workbench.action.findInFiles"))
map('n', '<Esc>', ":nohlsearch<CR>")
-- LSP
map('n', '<leader>ca', vscode_call("editor.action.quickFix"))
map('n', '<leader>aa', vscode_call("workbench.action.showCommands"))
map('n', '<leader>R', vscode_call("editor.action.refactor"))
map('n', ']e', vscode_call("editor.action.marker.next"))
map('n', '[e', vscode_call("editor.action.marker.prev"))
map('n', '<leader>xx', vscode_call("workbench.action.problems.focus"))


-- Actions
map('n', '<leader>e', vscode_call("workbench.files.action.focusFilesExplorer"))
map('n', '<leader>bb', vscode_call("workbench.action.toggleSidebarVisibility"))
map('n', '<leader>tt', vscode_call("workbench.view.extension.todo-tree-container"))