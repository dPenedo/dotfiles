-- local function get_diagnostic_label(props)
--   local icons = { error = "", warn = "", info = "", hint = "" }
--
--   ]
--   local label = {}
--   for severity, icon in pairs(icons) do
--     local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
--     if n > 0 then
--       table.insert(label, { " ", icon .. n .. " ", group = "DiagnosticSign" .. severity })
--     end
--   end
--   if #label > 0 then
--     table.insert(label, { " ┊ " })
--   end
--   return label
-- end
--
--
--
return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  -- enabled = false,
  config = function()
    require("incline").setup({
      highlight = {
        groups = {
          InclineNormal = { guibg = "#1f1f28", guifg = "#7e9cd8" },
          InclineNormalNC = { guibg = "#1f1f28", guifg = "#727168" },
        },
      },
      window = { margin = { vertical = 0, horizontal = 1 } },

      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        local modified = vim.bo[props.buf].modified

        local function get_diagnostic_label()
          local icons = { error = "", warn = "", info = "", hint = "" }
          local label = {}

          for severity, icon in pairs(icons) do
            local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
            if n > 0 then
              table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
            end
          end
          if #label > 0 then
            table.insert(label, { " ┊ " })
          end
          return label
        end

        return {
          { icon, guifg = color },
          { " " },
          { get_diagnostic_label() },
          -- { get_diagnostic_label(props) },
          modified and { " 󰈸", guifg = "#ff9e3b", gui = "bold" } or "",
          { " " },
          { filename },
        }
      end,
    })
  end,
}
