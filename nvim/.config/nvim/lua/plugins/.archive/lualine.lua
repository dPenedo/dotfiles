return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      component_separators = "",
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = {},
      lualine_x = {
        "grapple",
      },
      lualine_z = {},
      lualine_y = {
        function()
          local current_line = vim.fn.line(".")
          local total_lines = vim.fn.line("$")
          local current_col = vim.fn.col(".")
          return string.format("Col %d | Ln %d/%d", current_col, current_line, total_lines)
        end,
      },
    },
  },
}
