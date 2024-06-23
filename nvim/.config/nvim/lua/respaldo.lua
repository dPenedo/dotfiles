local function vscode_action(cmd)
  return function()
    vscode.action(cmd)
  end
end


-- VS-CODE

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

map({ 'n' }, "<leader>sr", search.reference)
map({ 'n' }, "<leader>sR", search.referenceInSideBar)
map({ 'n' }, "<leader>sp", search.project)
map({ 'n' }, "<leader>st", search.text)

map({ 'n' }, "<leader>ve", vscode.focusEditor)
map({ 'n' }, "<leader>vl", vscode.moveSideBarLeft)
map({ 'n' }, "<leader>vr", vscode.moveSideBarRight)