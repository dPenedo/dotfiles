return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  opts = {
    compile = true,
    transparent = true,
    -- functionStyle = { bold = true },
    dimInactive = true,
    typeStyle = { bold = false },
    keywordStyle = { bold = false },
    colors = {
      theme = {
        wave = {
          ui = {
            bg_gutter = "#002029",
            -- bg_gutter = "none",
            nontext = "#B1A9A0",
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

        sumiInk4 = "#1c1c21",
        -- Neutral:
        -- sumiInk0 = "#282A33",
        sumiInk1 = "#002029",
        -- sumiInk2 = "#1a1a1a",
        -- sumiInk3 = "#121218",
        -- sumiInk4 = "#2A2A2A",
        -- sumiInk5 = "#363636",
        -- sumiInk6 = "#545454",
        -- -- Popup and Floats
        waveBlue1 = "#44696F",
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
        -- mas brillo
        -- autumnGreen = "#9FBF92",
        autumnRed = "#E36A6D",
        -- autumnYellow = "#F6C58A",

        -- Diag
        samuraiRed = "#FF4444",
        roninYellow = "#FFBE6A",
        waveAqua1 = "#8AB5AA",
        dragonBlue = "#85A5B4",

        -- Fg and Comments
        fujiGray = "#929189",

        oniViolet = "#AB92D3",
        oniViolet2 = "#C8C3EA",
        crystalBlue = "#9EBCFF",
        springViolet1 = "#B3AAC9",
        springViolet2 = "#BCCBEA",
        springBlue = "#7DC5E3",
        lightBlue = "#C3F4F5", -- unused yet
        waveAqua2 = "#9AC8BF", -- improve lightness: desaturated greenish Aqua

        -- waveAqua2  = "#88CDA9",
        -- waveAqua4  = "#9AC8A0",
        -- waveAqua5  = "#8CCFA5",
        -- waveAqua3  = "#88CDA9",

        springGreen = "#B8DB8C",
        boatYellow1 = "#B3A076",
        boatYellow2 = "#E0C38E",
        carpYellow = "#FFE3A4",

        sakuraPink = "#F29EB9",
        waveRed = "#FF8896",
        peachRed = "#FF7D82",
        -- surimiOrange = "#FFC086",
        katanaGray = "#919C9C",
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
        Comment = { fg = "#A29581", italic = true },

        -- Ejemplo de sobrescritura para un grupo de highlight de un plugin
        ["@markup.strong.markdown_inline"] = { fg = colors.palette.oniViolet2, bold = true },
        Pmenu = { bg = colors.palette.sumiInk1, fg = colors.palette.oldWhite },
        PmenuSel = { bg = colors.palette.waveBlue, fg = colors.palette.fujiWhite, bold = true },
        PmenuSbar = { bg = colors.palette.sumiInk2 },
        PmenuThumb = { bg = colors.palette.sumiInk4 },
        -- WinSeparator = { fg = colors.palette.boatYellow1 },
        RenderMarkdownLink = { fg = colors.palette.springBlue },
        RainbowDelimiterOrange = { fg = colors.palette.springBlue },
        RainbowDelimiterRed = { fg = colors.palette.carpYellow },
        RenderMarkdownWikiLink = { fg = colors.palette.springBlue },
        TabLine = { fg = colors.palette.dragonViolet, bg = colors.palette.sumiInk2 },
        TabLineSel = { fg = colors.palette.boatYellow2, bg = colors.palette.sumiInk5 },
        FlashBackdrop = {
          fg = colors.palette.boatYellow1,
        },
        FlashLabel = {
          fg = colors.palette.winterBlue,
          bg = "#4CFF7D",
          bold = true,
        },
      }
    end,
  },
}
