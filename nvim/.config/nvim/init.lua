vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

if vim.g.vscode then
	require 'vscode-keymaps'
	require 'vscode-settings'
else
	require 'lazy-bootstrap'
	require 'plugins'
	require 'keymaps'
	require 'setups'
	require 'options'
	require 'color-mode'



	vim.cmd [[
  augroup RestoreCursorShapeOnExit
		autocmd!
	  autocmd VimLeave * set guicursor=a:ver25-blinkon2000
  augroup END
]]
end

-- Abrir markdown preview nueva ventana
vim.cmd [[
  function OpenMarkdownPreview (url)
    execute "silent ! brave-browser --new-window " . a:url
  endfunction
  let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]]


-- Probando neovide
if vim.g.neovide then
	vim.o.guifont = "Hack Nerd Font:h10.5" -- text below applies for VimScript
	vim.g.neovide_transparency = 0.9
	vim.g.neovide_confirm_quit = true
	vim.g.neovide_cursor_animation_length = 0.02
	vim.g.neovide_cursor_trail_size = 0.3
	vim.g.neovide_cursor_animate_in_insert_mode = true
	vim.g.neovide_cursor_vfx_mode = "ripple"
end
