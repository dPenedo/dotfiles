return {
  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        transparent = true,
        dim_inactive = true,
        styles = { -- Style to be applied to different syntax groups
          comments = "italic", -- Value is any valid attr-list value `:help attr-list`
          conditionals = "italic",
          constants = "bold",
          functions = "NONE",
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
          blue = { base = "#5E69AF" },
          red = { base = "#7E586B", bright = "#907265", dim = "#907265" },
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
    "dpenedo/melange-nvim",
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
    "steguiosaur/fullerene.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      styles = { -- You can pass the style using the format: style = true
        comments = { italic = true },
        keywords = { bold = true },
      },
      highlight_overrides = {
        lCursor = { fg = "#1616dd" },
      },
    },
  },
  { "iagorrr/noctishc.nvim" },

  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    opts = {
      variant = "tinted", -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
      transparent = false, -- Transparent background (as supported by the terminal)
      dim_inactive = true, --
    },
  },

  -- { "tobi-wan-kenobi/zengarden", dependencies = "rktjmp/lush.nvim" },
  {
    "0xstepit/flow.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- Your configuration options here.
    },
  },
  {
    "pauchiner/pastelnight.nvim",
    lazy = false,
    priority = 1000,
    opts = {

      transparent = true,
    },
  },

  -- {
  --   "yorik1984/newpaper.nvim",
  --   priority = 1000,
  --   config = {
  --     style = "dark",
  --   },
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --   },
  -- },
  -- {
  --   "catppuccin/nvim",
  --   lazy = false,
  --   name = "catppuccin",
  --   -- you can do it like this with a config function
  --   config = function()
  --     require("catppuccin").setup({
  --       -- configurations
  --       transparent_background = true,
  --     })
  --   end,
  --   -- or just use opts table
  --   opts = {
  --     -- configurations
  --   },
  -- },
  -- -- {
  -- --   "f4z3r/gruvbox-material.nvim",
  -- --   name = "gruvbox-material",
  -- --   lazy = false,
  -- --   priority = 1000,
  -- --   opts = {
  -- --     contrast = "hard",
  -- --   },
  -- {
  --   "wtfox/jellybeans.nvim",
  --   opts = {
  --     -- transparent = false,
  --   },
  -- },

  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,

      -- Enable italics comments
      italic_comments = true,
    },
  },
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    opts = {

      transparent = true,
    },
  },
}
