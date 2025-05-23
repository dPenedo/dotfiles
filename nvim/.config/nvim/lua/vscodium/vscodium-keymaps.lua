local vscode = require("vscode")
local function vscode_call(action)
  return string.format('<CMD>lua require("vscode").call("%s")<CR>', action)
end
vim.g.mapleader = " "
local function map(mode, key, value, options)
  vim.keymap.set(mode, key, value, options or { silent = true })
end

-- Neovim
-- map('n', '<CR>', ':', { desc = 'command con enter' })
-- map('v', '<CR>', ':', { desc = 'command con enter' })
map("n", "'", "`", { desc = "backtick asignado a '" })
map("n", "<leader>o", "o<ESC>", { desc = "Crea una linea debajo" })
map("n", "<leader>O", "O<ESC>", { desc = "Crea una linea encima" })
map("n", "zx", "zt6k6j", { desc = "Scrollear teniendo el cursor en el mismo sitio" })
map("n", "<leader>;", "m`A;<Esc>``", { desc = "Poner punto y coma al final" })
map("n", "down", vscode_call("cursorDown"))
map("n", "up", vscode_call("cursorUp"))
-- map('n', 'j', "gj")
-- map('n', 'k', "gk")
--
-- no funciona
map("n", "<C-;>", "<ESC>")

map("i", "<C-l>", "<ESC>la", { desc = "Desplazar una posicion a la derecha" })
map("i", "<C-h>", "<ESC>i", { desc = "Desplazar una posicion a la izquierda" })

-- Splits
map("n", "<leader><CR>", vscode_call("workbench.action.splitEditorRight"))
map("n", "<leader>-", vscode_call("workbench.action.splitEditorDown"))
map("n", "<leader>qq", vscode_call("workbench.action.closeActiveEditor"))
map("n", "<Tab>", vscode_call("workbench.action.navigateEditorGroups"))
map("n", "<C-Up>", vscode_call("workbench.action.increaseViewHeight"))
map("n", "<C-Down>", vscode_call("workbench.action.decreaseViewHeight"))
map("n", "<C-Left>", vscode_call("workbench.action.decreaseViewWidth"))
map("n", "<C-Right>", vscode_call("workbench.action.increaseViewWidth"))
map("n", "''", vscode_call("workbench.action.navigateBack"))

map("n", "<leader>j", vscode_call("workbench.action.quickOpenNavigateNextInEditorPicker"))
map("n", "<leader>k", vscode_call("workbench.action.quickOpenNavigatePreviousInEditorPicker"))

-- Clipboard
map("n", "<leader>v", vscode_call("editor.action.selectAll"))
map("v", "<leader>y", '"+y')
map("n", "<leader>y", '"+yy')
map("n", "<leader>p", '"+p')
map("v", "<leader>p", '"+p')

-- Tabs
map("n", "<leader>1", vscode_call("workbench.action.openEditorAtIndex1"))
map("n", "<leader>2", vscode_call("workbench.action.openEditorAtIndex2"))
map("n", "<leader>3", vscode_call("workbench.action.openEditorAtIndex3"))
map("n", "<leader>4", vscode_call("workbench.action.openEditorAtIndex4"))
map("n", "<leader>5", vscode_call("workbench.action.openEditorAtIndex5"))
map("n", "<leader>6", vscode_call("workbench.action.openEditorAtIndex6"))
map("n", "<leader>7", vscode_call("workbench.action.openEditorAtIndex7"))
map("n", "<leader>8", vscode_call("workbench.action.openEditorAtIndex8"))
map("n", "<leader>9", vscode_call("workbench.action.openEditorAtIndex9"))

-- VS CODE
-- Files
map("n", "<leader>w", vscode_call("workbench.action.files.save"))
map("n", "<leader>W", vscode_call("workbench.action.files.saveAll"))
map("n", "<leader>F", vscode_call("workbench.action.formatDocument"))
-- Search
map("n", "<leader>ff", vscode_call("workbench.action.quickOpen"))
map("n", "<leader>l", vscode_call("workbench.action.showAllEditors"))
map("n", "<leader><leader>", vscode_call("workbench.action.showAllEditors"))
map("n", "<leader>fg", vscode_call("workbench.action.findInFiles"))
map("n", "<Esc>", ":nohlsearch<CR>")

-- LSP
map("n", "<leader>ca", vscode_call("editor.action.quickFix"))
map("n", "<leader>aa", vscode_call("workbench.action.showCommands"))
map("n", "<leader>cr", vscode_call("editor.action.rename"))
map("n", "K", vscode_call("editor.action.showHover"))
map("n", "gd", vscode_call("editor.action.goToDeclaration"))
map("n", "gi", vscode_call("editor.action.goToImplementation"))
map("n", "gr", vscode_call("editor.action.referenceSearch.trigger"))
map("n", "gt", vscode_call("editor.action.goToTypeDefinition"))
map("n", "gh", vscode_call("editor.action.showDefinitionPreviewHover"))
map("n", "]e", vscode_call("editor.action.marker.next"))
map("n", "[e", vscode_call("editor.action.marker.prev"))
map("n", "<leader>xx", vscode_call("workbench.action.problems.focus"))

-- Actions
map("n", "<leader>e", vscode_call("workbench.files.action.focusFilesExplorer"))
map("n", "<leader>bb", vscode_call("workbench.action.toggleSidebarVisibility"))
map("n", "<leader>h", vscode_call("vsnetrw.open"))
map("n", "<leader>tt", vscode_call("workbench.view.extension.todo-tree-container"))
map("n", "==", vscode_call("editor.action.formatDocument"))



-- Harpoon
map("n", "<leader>fa", vscode_call("vscode-harpoon.addEditor"))
map("n", "<leader>f<space>", vscode_call("vscode-harpoon.editorQuickPick"))
map("n", "<leader>fe", vscode_call("vscode-harpoon.editEditors"))
map("n", "<leader>fj", vscode_call("vscode-harpoon.gotoEditor1"))
map("n", "<leader>fk", vscode_call("vscode-harpoon.gotoEditor2"))
map("n", "<leader>fl", vscode_call("vscode-harpoon.gotoEditor3"))
map("n", "<leader>f;", vscode_call("vscode-harpoon.gotoEditor4"))

