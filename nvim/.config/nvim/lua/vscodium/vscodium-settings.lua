-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", -- latest stable release
--     lazypath,
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)

vim.g.clipboard = vim.g.vscode_clipboard
vim.o.hlsearch = true
vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.o.mouse = "a"
vim.o.ignorecase = true
vim.o.smartcase = true
