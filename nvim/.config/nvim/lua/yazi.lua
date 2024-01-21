local Terminal = require('toggleterm.terminal').Terminal
local yazi     = Terminal:new({ cmd = "yazi", hidden = false })

function _lazygit_toggle()
  yazi:toggle()
end

vim.api.nvim_set_keymap("n", "<A-y>", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
