return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {
    skip_confirm_for_simple_edits = true,
    default_file_explorer = false,
    keymaps = {

      ["<C-p>"] = false,
      ["<leader>r"] = "actions.refresh",
      ["<a-p>"] = "actions.preview",
      ["<C-h>"] = "actions.parent",
      ["<C-l>"] = "actions.select",
      ["<leader>."] = "actions.toggle_hidden",
      ["<leader>q"] = "actions.close",
    },
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
    },
  },
  -- optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>o", "<CMD>Oil <CR>", { desc = "Abrir Oil" } },
    -- { "-", "<CMD>Oil .<CR>", { desc = "Abrir Oil en root" } },
    { "<leader>O", "<CMD>OilDirectory<CR>", { desc = "Abrir Oil en root" } },
  },
}
