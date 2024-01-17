-- Default options that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt
opt.clipboard = ""
opt.wrap = true -- Disable line wrap
opt.showtabline = 2
opt.formatoptions:remove({ "c", "r", "o" })
vim.g.newpaper_style = "dark"
vim.g.newpaper_colors = { bg = "#1f1f1f", lightsilver = "#2E2E2E" }
-- Devuelve la forma del cursor al salir
vim.api.nvim_create_autocmd("ExitPre", {
  group = vim.api.nvim_create_augroup("Exit", { clear = true }),
  command = "set guicursor=a:ver90-BlinkOn100",
  desc = "Set cursor back to beam and enable blinking when leaving Neovim.",
})
--
