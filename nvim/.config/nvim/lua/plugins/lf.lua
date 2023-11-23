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
    layout_mapping = "<M-f>", -- resize window with this key
    views = {                 -- window dimensions to rotate through
      { width = 0.990, height = 0.990 },
      { width = 0.750, height = 0.750 },
    },
    winblend = 6,
    -- highlights = { -- highlights passed to toggleterm
    --   Normal = { guibg = "#181820", guifg = "#f00" },
    -- },
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
