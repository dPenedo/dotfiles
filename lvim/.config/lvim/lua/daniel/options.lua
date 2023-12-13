vim.opt.wrap = true           -- wrap lines
vim.opt.relativenumber = true -- relative line numbers
vim.opt.clipboard = ""
vim.opt.showtabline = 2
lvim.builtin.telescope.defaults.layout_config.width = 0.75
lvim.builtin.telescope.defaults.layout_config.height = 0.75
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
vim.cmd('command! Guagua lua require("daniel/prueba").imprimirFrase()')
