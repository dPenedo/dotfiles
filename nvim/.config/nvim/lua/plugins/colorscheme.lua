return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    opts = {
      -- transparent = true, -- do not set background color
      compile = true,
      transparent = true,
      functionStyle = { bold = true },
      dimInactive = false,
      typeStyle = { bold = false },
      keywordStyle = { bold = false },
      colors = {
        theme = {
          wave = {
            ui = {
              -- bg_gutter = '#1a1a22',
              bg_gutter = "none",
              nontext = "#B1A9A0",
            },
          },
          lotus = {
            ui = {
              bg_gutter = "none",
              -- bg_gutter = '#161617',
              -- bg = '#f6f9e1',
            },
          },
        },
        palette = {
          -- Wave
          fujiWhite = "#E8DBCF",
          oldWhite = "#c9cbd1",
          -- oldWhite = '#CDD6F4',

          -- Brown:
          -- sumiInk0 = '#191715',
          -- sumiInk1 = '#1B1917',
          -- sumiInk2 = '#1D1B19',
          -- sumiInk3 = '#221F1C',
          -- sumiInk4 = '#2A2622',
          -- sumiInk5 = '#36322C',
          -- sumiInk6 = '#4A433D',

          --Neutral:
          sumiInk0 = "#121212",
          sumiInk1 = "#181818",
          sumiInk2 = "#1a1a1a",
          sumiInk3 = "#121212",
          sumiInk4 = "#2A2A2A",
          sumiInk5 = "#363636",
          sumiInk6 = "#545454",
          -- -- Popup and Floats
          waveBlue1 = "#223249",
          waveBlue2 = "#2D4F67",
          -- waveBlue1 = '#4A433D',
          -- waveBlue1 = '#2c2c2c',
          -- waveBlue2 = '#3A334c',
          --lotusInk1
          -- sumiInk6 = '#3A3A4B',
          -- Lotus
          lotusInk1 = "#141414",

          lotusWhite0 = "#B3BDFD",
          lotusWhite1 = "#dcd5ac",
          lotusWhite2 = "#e5ddb0",
          lotusWhite3 = "#F8F3F0",
          lotusWhite4 = "#DEE4F8",
          lotusWhite5 = "#CDD6F4",
        },
      },
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      overrides = function(colors)
        return {
          -- Ejemplo de sobrescritura para el grupo de highlight "String"
          String = { fg = colors.palette.springGreen, italic = true },

          -- Ejemplo de sobrescritura para un grupo de highlight de un plugin
          ["@markup.strong.markdown_inline"] = { fg = colors.palette.oniViolet2, bold = true },
          Pmenu = { bg = colors.palette.sumiInk1, fg = colors.palette.oldWhite },
          PmenuSel = { bg = colors.palette.waveBlue, fg = colors.palette.fujiWhite, bold = true },
          PmenuSbar = { bg = colors.palette.sumiInk2 },
          PmenuThumb = { bg = colors.palette.sumiInk4 },
        }
      end,
    },
  },
  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        styles = { -- Style to be applied to different syntax groups
          comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
          conditionals = "bold",
          constants = "bold",
          functions = "bold",
          keywords = "NONE",
          numbers = "NONE",
          operators = "NONE",
          strings = "NONE",
          types = "italic",
          variables = "NONE",
        },
      },
      palettes = {
        dayfox = {
          -- Defining multiple shades is done by passing a table
          blue = { base = "#464C8B", bright = "#7e94ed", dim = "#595C78" },
        },
        nordfox = {
          -- bg0 = "#232831", -- Dark bg (status line and float)
          bg1 = "#242424", -- Default bg
        },
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "sho-87/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = { transparent = true },
  },
  {
    "dpenedo/yorumi.nvim",
  },
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
      },
    },
  },
  -- {
  --   "rmehri01/onenord.nvim",
  --   opts = {
  --     styles = {
  --       comments = "italic",
  --       strings = "italic",
  --       keywords = "bold",
  --     },
  --     disable = {
  --       background = true,
  --       float_background = true,
  --     },
  --     inverse = {
  --       match_paren = true,
  --     },
  --     custom_colors = {
  --       float = "#2c2c2c",
  --     },
  --   },
  -- },
  -- lazy
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
