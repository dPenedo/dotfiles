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
      theme = {
        wave = {
          ui = {
            -- bg_gutter = "#1a1a22",
            -- bg_gutter = "none",
            nontext = "#545454",
          },
        },
        dragon = {
          ui = {
            -- bg_gutter = "#1a1a22",
            bg_gutter = "none",
            nontext = "#B1A9A0",
          },
        },
        lotus = {
          ui = {
            -- bg_gutter = "none",
            bg_gutter = "#161617",
            -- bg = '#f6f9e1',
          },
        },
      },
      palette = {
        -- Wave
        -- fujiWhite = "#E8DBCF",
        fujiWhite = "#e5e9f0",
        oldWhite = "#c9cbd1",
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
        -- sumiInk0 = "#121212",
        -- sumiInk1 = "#181818",
        -- sumiInk2 = "#1a1a1a",
        -- sumiInk3 = "#121212",
        -- sumiInk4 = "#2A2A2A",
        -- sumiInk5 = "#363636",
        -- sumiInk6 = "#545454",
        -- -- Popup and Floats
        waveBlue1 = "#3A3D5F",
        waveBlue2 = "#464C8B",
        -- waveBlue1 = '#4A433D',
        -- waveBlue1 = '#2c2c2c',
        -- waveBlue2 = '#3A334c',
        --lotusInk1
        -- sumiInk6 = '#3A3A4B',
        -- Lotus
        lotusInk1 = "#141414",

        lotusWhite0 = "#B3BDFD",
        lotusWhite1 = "#E2E0DB",
        lotusWhite2 = "#CFCBC5",
        lotusWhite3 = "#F8F3F0",
        lotusWhite4 = "#DEE4F8",
        lotusWhite5 = "#CDD6F4",
        lotusGreen3 = "#9DBF91",
      },
    },
    styles = {
      -- sidebars = "transparent",
      -- floats = "transparent",
    },
    overrides = function(colors)
      return {
        -- Ejemplo de sobrescritura para el grupo de highlight "String"
        String = { fg = colors.palette.springGreen, italic = true },
        Comment = { fg = "#6D7A5C", italic = true },

        -- Ejemplo de sobrescritura para un grupo de highlight de un plugin
        ["@markup.strong.markdown_inline"] = { fg = colors.palette.oniViolet2, bold = true },
        Pmenu = { bg = colors.palette.sumiInk1, fg = colors.palette.oldWhite },
        PmenuSel = { bg = colors.palette.waveBlue, fg = colors.palette.fujiWhite, bold = true },
        PmenuSbar = { bg = colors.palette.sumiInk2 },
        PmenuThumb = { bg = colors.palette.sumiInk4 },
        WinSeparator = { fg = colors.palette.boatYellow1 },
        RenderMarkdownLink = { fg = colors.palette.springBlue },
        RainbowDelimiterOrange = { fg = colors.palette.springBlue },
        RainbowDelimiterRed = { fg = colors.palette.carpYellow },
        RenderMarkdownWikiLink = { fg = colors.palette.springBlue },
        TabLine = { fg = colors.palette.dragonBlue, bg = colors.palette.sumiInk4 },
        TabLineSel = { fg = colors.palette.oldWhite, bg = colors.palette.sumiInk5 },
        FlashBackdrop = {
          fg = colors.palette.boatYellow1,
        },
        FlashLabel = {
          fg = colors.palette.roninYellow,
          bg = colors.palette.oniViolet,
          bold = true,
        },
        -- FzfLuaHeaderText = { fg = colors.palette.springViolet1, bg = colors.palette.sumiInk1 },
        -- FzfLuaHeaderBind = { fg = colors.palette.springViolet1, bg = colors.palette.sumiInk1 },
        -- FzfLuaBufNr = { fg = colors.palette.oniViolet, bg = colors.palette.sumiInk1 },
        -- FzfLuaBufId = { fg = colors.palette.oniViolet, bg = colors.palette.sumiInk1 },
        -- FzfLuaBufLineNr = { fg = colors.palette.oniViolet, bg = colors.palette.sumiInk1 },
        -- FzfLuaBufFlagCur = { fg = colors.palette.oniViolet, bg = colors.palette.sumiInk1 },
        -- FzfLuaBufFlagAlt = { fg = colors.palette.oniViolet, bg = colors.palette.sumiInk1 },
        -- FzfLuaFzfHeader = { fg = colors.palette.oniViolet, bg = colors.palette.sumiInk1 },
        -- FzfLuaFzfPointer = { fg = colors.palette.oniViolet, bg = colors.palette.sumiInk1 },
        -- FzfLuaFzfSpinner = { fg = colors.palette.oniViolet, bg = colors.palette.sumiInk1 },
        -- FzfLuaFzfInfo = { fg = colors.palette.oniViolet, bg = colors.palette.sumiInk1 },
        -- FzfLuaHelpNormal = { fg = colors.palette.oniViolet, bg = colors.palette.sumiInk1 },
        -- FzfLuaFzfMatch = { fg = colors.palette.autumnYellow, bg = colors.palette.sumiInk1 },
        -- FzfLuaSearch = { fg = colors.palette.autumnYellow, bg = colors.palette.sumiInk1 },
        -- TabLineFill = { fg = colors.palette.sumiInk1, bg = colors.palette.sumiInk1 },
      }
    end,
  },
}
