vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

if vim.g.vscode then
	require 'vscode/vscode-keymaps'
	require 'vscode/vscode-settings'
else
	require 'lazy-bootstrap'
	require 'plugins'
	require 'keymaps'
	require 'setups'
	require 'options'
	require 'color-mode'

	-- Restaurar el cursor
	vim.cmd [[
  augroup RestoreCursorShapeOnExit
		autocmd!
	  autocmd VimLeave * set guicursor=a:ver25-blinkon2000
  augroup END
]]
end
