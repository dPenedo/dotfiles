return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = LazyVim.config.icons

    local function lineas()
      local current_line = vim.fn.line(".")
      local total_lines = vim.fn.line("$")
      local current_col = vim.fn.col(".")
      return string.format("C%d L%d/%d", current_col, current_line, total_lines)
    end
    vim.o.laststatus = vim.g.lualine_laststatus

    local opts = {
      options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "" },
        lualine_b = { "branch" },

        lualine_c = {
          LazyVim.lualine.root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          {
            "filename",
            newfile_status = false, -- Display new file status (new file means no write after created)
            path = 1, -- 0: Just the filename
            shorting_target = 60, -- Shortens path to leave 40 spaces in the window
            symbols = {
              modified = "󰈸",
            },
          },
          {
            function()
              local index = require("grapple").name_or_index() -- Obtiene el índice o nombre
              -- Si es un número, lo mapeamos a las teclas j, k, l, ;
              if type(index) == "number" then
                local keys = { "jj", "jk", "jl", "j;" }
                index = keys[index] or index -- Si el índice está fuera del rango, se mantiene el número
              end
              return "󰛢 " .. index -- Añade el icono y devuelve el índice mapeado o el nombre
            end,
            cond = function()
              return package.loaded["grapple"] and require("grapple").exists()
            end,
          },
          {
            function()
              return require("noice").api.status.command.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.command.has()
            end,
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
          },
        },
        lualine_x = {},
        lualine_y = {
          -- { lineas },
        },
        lualine_z = {
          { lineas },
          -- function()
          --   return " " .. os.date("%R")
          -- end,
        },
      },
      extensions = { "neo-tree", "lazy" },
    }
    return opts
  end,
}
