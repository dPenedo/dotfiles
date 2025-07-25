-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "norg" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- Notes
-- Crear nuevas notas (global)
vim.keymap.set("n", "<leader>nn", function()
  local filename = vim.fn.input("Enter file name: ", "", "file")
  if filename ~= "" then
    local filepath = "~/Documentos/Dropbox/Notas/" .. filename .. ".md"
    vim.fn.writefile({}, vim.fn.expand(filepath))
    vim.cmd("edit " .. vim.fn.expand(filepath))
  end
end, { desc = "[n]ew [n]otes" })

-- Crear notas temporales (global)
vim.keymap.set("n", "<leader>nt", function()
  local filename = vim.fn.input("Enter Temp file name: ", "", "file")
  if filename ~= "" then
    local filepath = "~/Documentos/Dropbox/Notas/Temp/" .. filename .. ".md"
    vim.fn.writefile({}, vim.fn.expand(filepath))
    vim.cmd("edit " .. vim.fn.expand(filepath))
  end
end, { desc = "[n]ew [t]emp" })

-- Crear notas atómicas (global)
vim.keymap.set("n", "<leader>na", function()
  local filename = vim.fn.input("Enter Atom file name: ", "", "file")
  if filename ~= "" then
    local filepath = "~/Documentos/Dropbox/Notas/Atomoak/" .. filename .. ".md"
    vim.fn.writefile({}, vim.fn.expand(filepath))
    vim.cmd("edit " .. vim.fn.expand(filepath))
  end
end, { desc = "[n]ew [a]tom" })

local M = {}
function M.setup_markdown_keymaps()
  -- Alternar '- ' al inicio de la línea
  vim.keymap.set("n", "<leader>-", function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local line = vim.fn.getline(".")
    if line:match("^%- ") then
      line = line:gsub("^%- ", "")
    else
      line = "- " .. line
    end
    vim.fn.setline(".", line)
    vim.api.nvim_win_set_cursor(0, { cursor_pos[1], math.min(#line, cursor_pos[2]) })
  end, { desc = "Alternar '- ' al inicio de la línea", buffer = true })
  -- Headings
  vim.keymap.set("n", "<leader>#", function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local line = vim.fn.getline(".")
    if line:match("^#") then
      vim.fn.setline(".", "#" .. line)
    else
      vim.fn.setline(".", "# " .. line)
    end
    vim.api.nvim_win_set_cursor(0, { cursor_pos[1], cursor_pos[2] + 1 })
  end, { desc = "Poner # al principio para headings con espacio si es necesario", buffer = true })
end

-- Configura el autocomando para los archivos Markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "norg" },
  callback = M.setup_markdown_keymaps,
})

return M
