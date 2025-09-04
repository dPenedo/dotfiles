return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  opts = {
    compile = true,
    transparent = false,
    functionStyle = { bold = true },
    dimInactive = true,
    typeStyle = { bold = false },
    keywordStyle = { bold = false },
    colors = {
      palette = {
        -- Wave
        -- fujiWhite = "#E8DBCF",
        -- fujiWhite = "#e5e9f0",
        -- oldWhite = "#c9cbd1",
        -- surimiOrange = "#F9AB7B",
        -- oldWhite = '#CDD6F4',

        -- Brown:
        -- sumiInk0 = "#191715",
        -- sumiInk1 = "#1B1917",
        -- sumiInk2 = "#1D1B19",
        -- sumiInk3 = "#221F1C",
        -- sumiInk4 = "#3E3832",
        -- sumiInk5 = "#433E37",
        -- sumiInk6 = "#5A5349",

        -- Neutral:
        sumiInk0 = "#121212",
        sumiInk1 = "#181818",
        sumiInk2 = "#1a1a1a",
        sumiInk3 = "#121212",
        sumiInk4 = "#2A2A2A",
        sumiInk5 = "#363636",
        sumiInk6 = "#545454",
        -- -- Popup and Floats
        waveBlue1 = "#3A3D5F",
        waveBlue2 = "#464C8B",
      },
    },
    styles = {
      -- sidebars = "transparent",
      -- floats = "transparent",
    },
    overrides = function(colors)
      return {
        String = { fg = colors.palette.springGreen, italic = true },
        -- Comment = { fg = "#6D7A5C", italic = true },
        -- Ejemplo de sobrescritura para un grupo de highlight de un plugin
        CursorLineNr = { fg = colors.palette.crystalBlue },
        Pmenu = { bg = colors.palette.sumiInk1, fg = colors.palette.oldWhite },
        ["@markup.strong.markdown_inline"] = { fg = colors.palette.oniViolet2, bold = true },
      }
    end,
  },
}
