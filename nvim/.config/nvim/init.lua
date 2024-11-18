-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  require("vscodium/vscodium-keymaps")
  require("vscodium/vscodium-settings")
else
  require("config.lazy")
end
