-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.conceallevel = 0
vim.cmd([[
  autocmd FileType markdown setlocal conceallevel=1
]])

vim.o.undofile = true

-- Mostrar siempre el indicador de pestañas/tabs
vim.o.showtabline = 1

vim.opt.clipboard = "unnamed"
-- Ancho del texto antes de hace wrap
-- vim.opt.breakindent = true
-- vim.opt.linebreak = true
-- vim.opt.textwidth = 100

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- probando para tabs en 4 espacios
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- vim: ts=2 sts=2 sw=2 et
-- Para que deje de crear un comentario al dar enter
-- vim.opt_local.formatoptions:remove { 'r', 'o' }
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})

-- Desactivar la barra de estado en nvim-tree
vim.opt.laststatus = 3
