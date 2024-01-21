local Terminal = require('toggleterm.terminal').Terminal
local lf       = Terminal:new({ cmd = "lfcd", hidden = false })

function _lf_toggle()
  lf:toggle()
end

vim.api.nvim_set_keymap("n", "<A-e>", "<cmd>lua _lf_toggle()<CR>", { noremap = true, silent = true })
