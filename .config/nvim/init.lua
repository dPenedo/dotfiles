-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- vim.opt.guifont = { "FiraCode", "h6" }
  -- vim.o.guifont = "JetBrains Mono:h11" -- text below applies for VimScript
  -- vim.o.guifont = "JetBrains Mono:h11" -- text below applies for VimScript
  vim.o.guifont = "Fira Code:h11" -- text below applies for VimScript
  -- vim.g.neovide_scale_factor = 0.7
  vim.g.neovide_cursor_animation_length = 0.02
  vim.g.neovide_cursor_trail_length = 0.02
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_vfx_mode = "ripple"
  -- vim.g.neovide_fullscreen = true
  -- vim.g.neovide_remember_window_size = true
end
