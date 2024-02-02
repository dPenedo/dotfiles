vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'options'
require 'lazy-bootstrap'
require 'lazy-plugins'
require 'keymaps'
require 'telescope-setup'
require 'treesitter-setup'
require 'lsp-setup'
require 'cmp-setup'
-- Filemanagers
require 'yazi'
require 'lf'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

vim.cmd.colorscheme = "kanagawa"
-- Devolver forma del cursor
