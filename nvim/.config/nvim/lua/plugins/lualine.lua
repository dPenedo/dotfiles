local function get_file_status_color()
  if not vim.bo.modifiable then
    return { fg = "#9D839E" } -- readonly color
  elseif vim.bo.modified then
    return { fg = "#EDB397" } -- unsaved color
  else
    return { fg = "#F0E7D5" } -- normal color
  end
end

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      component_separators = "",
      section_separators = { left = "", right = "" },
      symbols = {
        modified = " ", -- Text to show when the file is modified.
      },
    },
    sections = {
      lualine_a = {},
      lualine_c = {
        {
          "filetype",
          icon_only = true,
          padding = { left = 1, right = 0 },
          color = get_file_status_color,
        },
        {
          "filename",
          path = 1,
          color = get_file_status_color,
        },
      },
      lualine_x = {
        -- "grapple",
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
    tabline = {
      lualine_a = {
        { "tabs", show_modified_status = false },
      },
      lualine_b = {
        {
          "filetype",
          icon_only = true,
          padding = { left = 1, right = 0 },
          color = get_file_status_color,
        },
        {
          "filename",
          path = 1,
          color = get_file_status_color,
        },
      },
      lualine_c = {},

      lualine_x = {},
      lualine_y = { "grapple" },
      lualine_z = { "searchcount" },
    },
  },
}
