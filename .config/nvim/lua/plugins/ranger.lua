return {
  {
    "kelly-lin/ranger.nvim",
    config = function()
      local ranger_nvim = require("ranger-nvim")
      require("ranger-nvim").setup({
        replace_netrw = true,
        keybinds = {
          ["_"] = ranger_nvim.OPEN_MODE.vsplit,
          ["-"] = ranger_nvim.OPEN_MODE.split,
          ["<C-t>"] = ranger_nvim.OPEN_MODE.tabedit,
          ["or"] = ranger_nvim.OPEN_MODE.rifle,
        },
        vim.cmd('command! Ranger lua require("ranger-nvim").open(true)'),
      })
      -- vim.api.nvim_set_keymap("n", "<A-e>", "", {
      --     noremap = true,
      --     callback = function()
      --         require("ranger-nvim").open(true)
      --     end,
      -- })
    end,
  },
}
