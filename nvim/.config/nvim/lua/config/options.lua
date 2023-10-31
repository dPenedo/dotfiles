-- Default options that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt
opt.clipboard = ""
opt.background = "light"
opt.wrap = true -- Disable line wrap
opt.formatoptions:remove({ "c", "r", "o" })

vim.cmd('command! NuevaNota lua require("config/Notas/nueva").nueva_nota()')
