-- require("daniel.base") 
require("daniel.bootstrap") -- Packer Auto-Installer
require('daniel.settings')-- General Settings
require("daniel.plugins") -- Plugins
require("daniel.maps") -- Keymaps
require("daniel.highlights") -- Colourscheme and other highlights
require("daniel.notas") --  Notas
-- require("daniel.lsp") --  LSP config
-- require("daniel.cmp") --  LSP cmp
--
--
-- vscode
if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
end
