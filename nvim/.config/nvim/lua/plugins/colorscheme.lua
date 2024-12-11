return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    opts = {
      compile = true,
      transparent = true,
      functionStyle = { bold = true },
      dimInactive = true,
      typeStyle = { bold = false },
      keywordStyle = { bold = false },
      colors = {
        theme = {
          wave = {
            ui = {
              -- bg_gutter = "#1a1a22",
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
          surimiOrange = "#F9AB7B",
          -- oldWhite = '#CDD6F4',

          -- Brown:
          -- sumiInk0 = "#191715",
          -- sumiInk1 = "#1B1917",
          -- sumiInk2 = "#1D1B19",
          -- sumiInk3 = "#221F1C",
          -- sumiInk4 = "#2A2622",
          -- sumiInk5 = "#433E37",
          -- sumiInk6 = "#5A5349",

          --Neutral:
          -- sumiInk0 = "#121212",
          -- sumiInk1 = "#181818",
          -- sumiInk2 = "#1a1a1a",
          -- sumiInk3 = "#121212",
          -- sumiInk4 = "#2A2A2A",
          -- sumiInk5 = "#363636",
          -- sumiInk6 = "#545454",
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

          -- Ejemplo de sobrescritura para un grupo de highlight de un plugin
          ["@markup.strong.markdown_inline"] = { fg = colors.palette.oniViolet2, bold = true },
          Pmenu = { bg = colors.palette.sumiInk1, fg = colors.palette.oldWhite },
          PmenuSel = { bg = colors.palette.waveBlue, fg = colors.palette.fujiWhite, bold = true },
          PmenuSbar = { bg = colors.palette.sumiInk2 },
          PmenuThumb = { bg = colors.palette.sumiInk4 },
          VertSplit = { fg = colors.palette.oniViolet2 },
          WinSeparator = { fg = colors.palette.winterYellow },

          RenderMarkdownLink = { fg = colors.palette.springBlue },
          RenderMarkdownWikiLink = { fg = colors.palette.springBlue },
          -- TabLine = { fg = "#888888", bg = "#333333" },
          -- TabLineSel = { fg = "#7e9cd8", bg = "#121212" },
          -- TabLineFill = { fg = "#888888", bg = "#222222" },
        }
      end,
    },
  },
  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        transparent = true,
        dim_inactive = true,
        styles = { -- Style to be applied to different syntax groups
          comments = "italic", -- Value is any valid attr-list value `:help attr-list`
          conditionals = "bold",
          constants = "bold",
          functions = "bold",
          keywords = "NONE",
          numbers = "NONE",
          operators = "NONE",
          strings = "italic",
          types = "italic",
          variables = "NONE",
        },
      },
      palettes = {
        dayfox = {
          -- Defining multiple shades is done by passing a table
          blue = { base = "#464C8B", bright = "#7e94ed", dim = "#595C78" },
          bg0 = "#E2E0DB", -- Lighter bg (colorcolm folds)
          bg2 = "#D6D3CD", -- Lighter bg (colorcolm folds)
        },
        nordfox = {
          -- bg0 = "#232831", -- Dark bg (status line and float)
          bg1 = "#242424", -- Default bg
        },
      },
      groups = {
        dayfox = {
          RenderMarkdownLink = { fg = "#5E69AF" },
          RenderMarkdownH1 = { fg = "#AC5402" },
          RenderMarkdownH2 = { fg = "#6E33CE" },
          RenderMarkdownH3 = { fg = "#709244" },
          RenderMarkdownH4 = { fg = "#464C8B" },
          RenderMarkdownH5 = { fg = "#464C8B" },
          RenderMarkdownH6 = { fg = "#464C8B" },
          ["@markup.heading"] = { fg = "#464C8B", style = "bold" },
          ["@markup.link.label"] = { fg = "#709244" },
        },
      },
    },
  },
  {
    "cdmill/neomodern.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("neomodern").setup({
        -- optional configuration here
      })
    end,
  },
  {
    "dpenedo/melange-nvim",
  },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Configuración básica
      vim.g.forestbones_darkness = "stark" -- Otras opciones: 'stark'
      vim.g.forestbones_lighten_noncurrent_window = true -- Ajustar color de comentarios
      vim.g.forestbones_solid_vert_split = true -- Ajustar color de comentarios
      vim.g.forestbones_solid_line_nr = true -- Ajustar color de comentarios
      vim.g.forestbones_lighten_cursor_line = 8 -- Ajustar color de comentarios

      -- Aplicar el esquema de colores
    end,
  },
  {
    "ramojus/mellifluous.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      colorset = "tender",
      -- dim_inactive = true,
      transparent_background = {
        enabled = true,
        floating_windows = true,
        telescope = true,
        file_tree = true,
        cursor_line = false,
        status_line = false,
      },
    },
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        background = "hard",
        transparent_background_level = 0,
        italics = true,
        dim_inactive_windows = true,
      })
    end,
  },
  {
    "f4z3r/gruvbox-material.nvim",
    name = "gruvbox-material",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  -- Using lazy.nvim
}
