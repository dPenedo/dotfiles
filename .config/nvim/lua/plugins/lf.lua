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
    escape_quit = true,
    border = "curved",
    winblend = 6,
    highlights = { -- highlights passed to toggleterm
      Normal = { guibg = "#181820", guifg = "#f00" },
    },
    -- highlights = { -- highlights passed to toggleterm
    --   Normal = { guibg = "#333333" },
    --   NormalFloat = { link = "Normal" },
    --   FloatBorder = {
    --     guifg = "#D0C9C2",
    --     guibg = "#333333",
    --   },
    -- },
  },
}
