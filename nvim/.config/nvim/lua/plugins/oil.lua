return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    skip_confirm_for_simple_edits = true,
    default_file_explorer = true,
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
    },
    keymaps = {

      ["<C-p>"] = false,
      ["<leader>r"] = "actions.refresh",
      ["<tab>"] = "actions.preview",
      ["<C-h>"] = "actions.parent",
      ["<C-l>"] = "actions.select",
      ["<leader>."] = "actions.toggle_hidden",
      ["<leader>q"] = "actions.close",
    },
  },
  -- optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>h", "<CMD>Oil <CR>", { desc = "Abrir Oil" } },
    { "<leader>-", "<CMD>Oil .<CR>", { desc = "Abrir Oil en root" } },
  },
}
