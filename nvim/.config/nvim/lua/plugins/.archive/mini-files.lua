return {
  "echasnovski/mini.files",
  version = "*",
  opts = {
    mappings = {
      synchronize = "<leader>w",
      go_in = "<c-l>",
      go_in_plus = "<cr>",
      go_out = "H",
      go_out_plus = "<c-h>",
    },
    windows = {
      preview = true,
      width_preview = 50,
    },
  },
  keys = {
    {
      "<C-h>",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "Open mini.files (Directory of Current File)",
    },
    {
      "<leader>m",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "Open mini.files (Directory of Current File)",
    },
    {
      "<leader>-",
      function()
        require("mini.files").open(vim.uv.cwd(), true)
      end,
      desc = "Open mini.files (cwd)",
    },
  },
}
