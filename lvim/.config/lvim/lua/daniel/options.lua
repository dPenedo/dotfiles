vim.opt.wrap = true           -- wrap lines
vim.opt.relativenumber = true -- relative line numbers
vim.opt.clipboard = ""
vim.opt.background = "light"
vim.cmd('command! Guagua lua require("daniel/prueba").imprimirFrase()')
