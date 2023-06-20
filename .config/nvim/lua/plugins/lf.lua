return {
  "lmburns/lf.nvim",
  dependencies = {
    "akinsho/toggleterm.nvim",
  },
  opts = {
    default_actions = { -- default action keybindings
      ["<C-t>"] = "tabedit",
      ["<C-s>"] = "split",
      ["<C-v>"] = "vsplit",
      ["<C-o>"] = "tab drop",
    },
    border = "single",
    winblend = 0,
    highlights = { -- highlights passed to toggleterm
      Normal = { guibg = "#181820" },
    },
  },
}
