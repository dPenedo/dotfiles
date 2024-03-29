return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      local harpoon = require("harpoon")

      local function truncate_branch_name(branch)
        if not branch or branch == "" then
          return ""
        end

        -- Match the branch name to the specified format
        local _, _, ticket_number = string.find(branch, "skdillon/sko%-(%d+)%-")

        -- If the branch name matches the format, display sko-{ticket_number}, otherwise display the full branch name
        if ticket_number then
          return "sko-" .. ticket_number
        else
          return branch
        end
      end
      local function lineas()
        local current_line = vim.fn.line('.')
        local total_lines = vim.fn.line('$')
        return string.format('%3d:%-2d', current_line, total_lines)
      end


      require("lualine").setup({
        options = {
          globalstatus = true,
          icons_enabled = true,
          component_separators = { left = '|', right = '|' },
          section_separators = { left = "", right = '' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            { "branch", icon = "", fmt = truncate_branch_name },
            "diff",
            "diagnostics",
          },
          lualine_c = {
            { "filename", path = 1 },
          },
          lualine_x = {
            -- "fileformat",
            "filetype",
          },
          lualine_y = { '' },
          lualine_z = { lineas }
        },
      })
    end,
  },
}
