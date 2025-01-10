return {
  "echasnovski/mini.files",
  version = "*",
  opts = {
    mappings = {
      synchronize = "<leader>w",
      go_in_plus = "<cr>",
    },
    windows = {
      preview = true,
      width_preview = 50,
    },
  },
  keys = {
    {
      "<leader>m",
      function()
        local current_file = vim.api.nvim_buf_get_name(0)
        if current_file == "" then
          current_file = vim.loop.cwd()
        end
        require("mini.files").open(current_file, false)
        require("mini.files").reveal_cwd()
      end,
      desc = "Open mini.files (Directory of Current File)",
    },
    {
      "<leader>-",
      function()
        require("mini.files").open(vim.loop.cwd(), true)
      end,
      desc = "Open mini.files (cwd)",
    },
  },
}
