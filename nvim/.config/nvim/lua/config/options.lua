-- Default options that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt
opt.clipboard = ""
opt.wrap = true -- Disable line wrap
opt.formatoptions:remove({ "c", "r", "o" })

-- vim.cmd('command! NuevaNota lua require("config/Notas/nueva").nueva_nota()')
-- vim.api.nvim_create_autocmd("ExitPre", {
--   group = vim.api.nvim_create_augroup("Exit", { clear = true }),
--   command = "set guicursor=a:ver90-BlinkOn100",
--   desc = "Set cursor back to beam and enable blinking when leaving Neovim.",
-- })
