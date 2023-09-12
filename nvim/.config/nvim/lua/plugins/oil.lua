return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  config = function()
    require("oil").setup({
      keymaps = {
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-s>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
      },
    })
  end,
}
