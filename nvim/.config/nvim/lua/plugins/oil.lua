return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  config = function()
    require("oil").setup({
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      keymaps = {
        ["<M-v>"] = "actions.select_vsplit",
        ["<M-s>"] = "actions.select_split",
        ["<M-t>"] = "actions.select_tab",
        ["<leader>t"] = "actions.open_terminal",

        ["gd"] = {
          desc = "Toggle detail view",
          callback = function()
            local oil = require("oil")
            local config = require("oil.config")
            if #config.columns == 1 then
              oil.set_columns({ "icon", "permissions", "size", "mtime" })
            else
              oil.set_columns({ "icon" })
            end
          end,
        },
      },
    })
  end,
}
