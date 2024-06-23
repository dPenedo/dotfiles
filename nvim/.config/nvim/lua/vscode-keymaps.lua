local vscode = require('vscode')
local function vscode_action(cmd)
  return function()
    vscode.action(cmd)
  end
end


-- VS-CODE
local whichkey = {
  show = function()
    vim.fn.VSCodeNotify("whichkey.show")
  end
}

local comment = {
  selected = function()
    vim.fn.VSCodeNotifyRange("editor.action.commentLine", vim.fn.line("v"), vim.fn.line("."), 1)
  end
}

local file = {
  new = function()
    vim.fn.VSCodeNotify("workbench.explorer.fileView.focus")
    vim.fn.VSCodeNotify("explorer.newFile")
  end,

  save = function()
    vim.fn.VSCodeNotify("workbench.action.files.save")
  end,

  saveAll = function()
    vim.fn.VSCodeNotify("workbench.action.files.saveAll")
  end,

  format = function()
    vim.fn.VSCodeNotify("editor.action.formatDocument")
  end,

  showInExplorer = function()
    vim.fn.VSCodeNotify("workbench.files.action.showActiveFileInExplorer")
  end,

  rename = function()
    vim.fn.VSCodeNotify("workbench.files.action.showActiveFileInExplorer")
    vim.fn.VSCodeNotify("renameFile")
  end
}

local error = {
  list = function()
    vim.fn.VSCodeNotify("workbench.actions.view.problems")
  end,
  next = function()
    vim.fn.VSCodeNotify("editor.action.marker.next")
  end,
  previous = function()
    vim.fn.VSCodeNotify("editor.action.marker.prev")
  end,
}

local editor = {
  closeActive = function()
    vim.fn.VSCodeNotify("workbench.action.closeActiveEditor")
  end,

  closeOther = function()
    vim.fn.VSCodeNotify("workbench.action.closeOtherEditors")
  end,

  organizeImport = function()
    vim.fn.VSCodeNotify("editor.action.organizeImports")
  end
}

local workbench = {
  showCommands = function()
    vim.fn.VSCodeNotify("workbench.action.showCommands")
  end,
  previousEditor = function()
    vim.fn.VSCodeNotify("workbench.action.previousEditor")
  end,
  nextEditor = function()
    vim.fn.VSCodeNotify("workbench.action.nextEditor")
  end,
}

local toggle = {
  toggleActivityBar = function()
    vim.fn.VSCodeNotify("workbench.action.toggleActivityBarVisibility")
  end,
  toggleSideBarVisibility = function()
    vim.fn.VSCodeNotify("workbench.action.toggleSidebarVisibility")
  end,
  toggleZenMode = function()
    vim.fn.VSCodeNotify("workbench.action.toggleZenMode")
  end,
  theme = function()
    vim.fn.VSCodeNotify("workbench.action.selectTheme")
  end,
}

local symbol = {
  rename = function()
    vim.fn.VSCodeNotify("editor.action.rename")
  end,
}

-- if bookmark extension is used
local bookmark = {
  toggle = function()
    vim.fn.VSCodeNotify("bookmarks.toggle")
  end,
  list = function()
    vim.fn.VSCodeNotify("bookmarks.list")
  end,
  previous = function()
    vim.fn.VSCodeNotify("bookmarks.jumpToPrevious")
  end,
  next = function()
    vim.fn.VSCodeNotify("bookmarks.jumpToNext")
  end,
}

local search = {
  reference = function()
    vim.fn.VSCodeNotify("editor.action.referenceSearch.trigger")
  end,
  referenceInSideBar = function()
    vim.fn.VSCodeNotify("references-view.find")
  end,
  project = function()
    vim.fn.VSCodeNotify("editor.action.addSelectionToNextFindMatch")
    vim.fn.VSCodeNotify("workbench.action.findInFiles")
  end,
  text = function()
    vim.fn.VSCodeNotify("workbench.action.findInFiles")
  end,
}

local project = {
  findFile = function()
    vim.fn.VSCodeNotify("workbench.action.quickOpen")
  end,
  switch = function()
    vim.fn.VSCodeNotify("workbench.action.openRecent")
  end,
  tree = function()
    vim.fn.VSCodeNotify("workbench.view.explorer")
  end,
}

local git = {
  init = function()
    vim.fn.VSCodeNotify("git.init")
  end,
  status = function()
    vim.fn.VSCodeNotify("workbench.view.scm")
  end,
  switch = function()
    vim.fn.VSCodeNotify("git.checkout")
  end,
  deleteBranch = function()
    vim.fn.VSCodeNotify("git.deleteBranch")
  end,
  push = function()
    vim.fn.VSCodeNotify("git.push")
  end,
  pull = function()
    vim.fn.VSCodeNotify("git.pull")
  end,
  fetch = function()
    vim.fn.VSCodeNotify("git.fetch")
  end,
  commit = function()
    vim.fn.VSCodeNotify("git.commit")
  end,
  publish = function()
    vim.fn.VSCodeNotify("git.publish")
  end,

  -- if gitlens installed
  graph = function()
    vim.fn.VSCodeNotify("gitlens.showGraphPage")
  end,
}

local fold = {
  toggle = function()
    vim.fn.VSCodeNotify("editor.toggleFold")
  end,

  all = function()
    vim.fn.VSCodeNotify("editor.foldAll")
  end,
  openAll = function()
    vim.fn.VSCodeNotify("editor.unfoldAll")
  end,

  close = function()
    vim.fn.VSCodeNotify("editor.fold")
  end,
  open = function()
    vim.fn.VSCodeNotify("editor.unfold")
  end,
  openRecursive = function()
    vim.fn.VSCodeNotify("editor.unfoldRecursively")
  end,

  blockComment = function()
    vim.fn.VSCodeNotify("editor.foldAllBlockComments")
  end,

  allMarkerRegion = function()
    vim.fn.VSCodeNotify("editor.foldAllMarkerRegions")
  end,
  openAllMarkerRegion = function()
    vim.fn.VSCodeNotify("editor.unfoldAllMarkerRegions")
  end,
}

local vscode = {
  focusEditor = function()
    vim.fn.VSCodeNotify("workbench.action.focusActiveEditorGroup")
  end,
  moveSideBarRight = function()
    vim.fn.VSCodeNotify("workbench.action.moveSideBarRight")
  end,
  moveSideBarLeft = function()
    vim.fn.VSCodeNotify("workbench.action.moveSideBarLeft")
  end,
}

local refactor = {
  showMenu = function()
    vim.fn.VSCodeNotify("editor.action.refactor")
  end,
}

-- https://vi.stackexchange.com/a/31887
local nv_keymap = function(lhs, rhs)
  vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', lhs, rhs, { noremap = true, silent = true })
end

local nx_keymap = function(lhs, rhs)
  vim.api.nvim_set_keymap('n', lhs, rhs, { silent = true })
  vim.api.nvim_set_keymap('v', lhs, rhs, { silent = true })
end

--#region keymap
vim.g.mapleader = " "

local function map(mode, key, value, options)
  vim.keymap.set(mode, key, value, options or { silent = true })
end

local function map_action(mode, key, input, opts)
  -- Asynchronous keymaps
  vim.keymap.set(mode, key,
    function()
      vscode.action(input, opts)
    end,
    { noremap = true, silent = true }
  )
end

nv_keymap('s', '}')
nv_keymap('S', '{')

nv_keymap('<leader>h', '^')
nv_keymap('<leader>l', '$')
nv_keymap('<leader>a', '%')

nx_keymap('j', 'gj')
nx_keymap('k', 'gk')

-- map({ 'n', 'v' }, "<leader>", whichkey.show)
map({ 'n', 'v' }, "<leader>/", comment.selected)

map({ 'n' }, "<leader>i", editor.organizeImport)

-- no highlight
map({ 'n' }, "<leader>n", "<cmd>noh<cr>")

map({ 'n', 'v' }, "<leader> ", workbench.showCommands)

map({ 'n', 'v' }, "H", workbench.previousEditor)
map({ 'n', 'v' }, "L", workbench.nextEditor)

-- error
map({ 'n' }, "<leader>el", error.list)
map({ 'n' }, "<leader>en", error.next)
map({ 'n' }, "<leader>ep", error.previous)

-- git
map({ 'n' }, "<leader>gb", git.switch)
map({ 'n' }, "<leader>gi", git.init)
map({ 'n' }, "<leader>gd", git.deleteBranch)
map({ 'n' }, "<leader>gf", git.fetch)
map({ 'n' }, "<leader>gs", git.status)
map({ 'n' }, "<leader>gp", git.pull)
map({ 'n' }, "<leader>gg", git.graph)

-- project
map({ 'n' }, "<leader>pf", project.findFile)
map({ 'n' }, "<leader>pp", project.switch)
map({ 'n' }, "<leader>pt", project.tree)

-- file
map({ 'n', 'v' }, "<leader>w", file.save)
map({ 'n', 'v' }, "<leader>wa", file.saveAll)
map({ 'n', 'v' }, "<leader>fs", file.save)
map({ 'n', 'v' }, "<leader>fS", file.saveAll)
map({ 'n' }, "<leader>ff", file.format)
map({ 'n' }, "<leader>fn", file.new)
map({ 'n' }, "<leader>ft", file.showInExplorer)
map({ 'n' }, "<leader>fr", file.rename)

-- buffer/editor
map({ 'n', 'v' }, "<leader>c", editor.closeActive)
map({ 'n', 'v' }, "<leader>bc", editor.closeActive)
map({ 'n', 'v' }, "<leader>k", editor.closeOther)
map({ 'n', 'v' }, "<leader>bk", editor.closeOther)

-- toggle
map({ 'n', 'v' }, "<leader>ta", toggle.toggleActivityBar)
map({ 'n', 'v' }, "<leader>tz", toggle.toggleZenMode)
map({ 'n', 'v' }, "<leader>bb", toggle.toggleSideBarVisibility)
map({ 'n', 'v' }, "<leader>tt", toggle.theme)

-- refactor
map({ 'v' }, "<leader>r", refactor.showMenu)
map({ 'n' }, "<leader>R", symbol.rename)
vim.api.nvim_set_keymap('n', '<leader>rd', 'V%d', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>rv', 'V%', { silent = true })

-- bookmark
map({ 'n' }, "<leader>m", bookmark.toggle)
map({ 'n' }, "<leader>mt", bookmark.toggle)
map({ 'n' }, "<leader>ml", bookmark.list)
map({ 'n' }, "<leader>mn", bookmark.next)
map({ 'n' }, "<leader>mp", bookmark.previous)

map({ 'n' }, "<leader>sr", search.reference)
map({ 'n' }, "<leader>sR", search.referenceInSideBar)
map({ 'n' }, "<leader>sp", search.project)
map({ 'n' }, "<leader>st", search.text)

map({ 'n' }, "<leader>ve", vscode.focusEditor)
map({ 'n' }, "<leader>vl", vscode.moveSideBarLeft)
map({ 'n' }, "<leader>vr", vscode.moveSideBarRight)


-- Propios
-- Remapeo para manejar el salto de palabras
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Resize horizontally with Ctrl-Up and Ctrl-Down
-- map_action('n', '<C-Up>', vscode_action('workbench.action.increaseViewHeight'))
-- map_action('n', '<C-Down>', vscode_action('workbench.action.decreaseViewHeight'))
--
-- -- Resize vertically with Ctrl-Right and Ctrl-Left
-- map_action('n', '<C-Left>', vscode_action('workbench.action.decreaseViewWidth'))
-- map_action('n', '<C-Right>', vscode_action('workbench.action.increaseViewWidth'))

local function vscode_call(action)
    return string.format('<CMD>lua require("vscode").call("%s")<CR>', action)
end

-- Mapeos utilizando la función vscode_call
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

map('n', '<leader><CR>', vscode_call("workbench.action.splitEditorRight"))
map('n', '<leader>-', vscode_call("workbench.action.splitEditorDown"))


map('n', '<leader>f', vscode_call("workbench.action.quickOpen"))
map('n', '<leader>l', vscode_call("fuzzySearch.activeTextEditor"))
map('n', '<leader>ca', vscode_call("editor.action.quickFix"))
map('n', '<leader><leader>', vscode_call("workbench.action.showAllEditors"))
map('n', '<leader>g', vscode_call("workbench.action.findInFiles"))
map('n', '<leader>aa', vscode_call("workbench.action.showAllEditors"))