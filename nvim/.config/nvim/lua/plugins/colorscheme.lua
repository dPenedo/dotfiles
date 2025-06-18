return {
  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        transparent = false,
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
  -- {
  --   "dpenedo/melange-nvim",
  -- },
  -- No va bien con snack picker
  -- {
  --   "Mofiqul/dracula.nvim",
  --   opts = {
  --     colors = {
  --       bg = "#000000", -- negro puro
  --     },
  --   },
  -- },
  -- No va bien con snack picker
  -- { "loctvl842/monokai-pro.nvim" },
  -- No va bien con snack picker
  -- {
  --   "ramojus/mellifluous.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     colorset = "tender",
  --     -- dim_inactive = true,
  --     transparent_background = {
  --       enabled = true,
  --       floating_windows = true,
  --       telescope = true,
  --       file_tree = true,
  --       cursor_line = false,
  --       status_line = false,
  --     },
  --   },
  -- },
  -- { "Domeee/mosel.nvim" },
  -- -- No va bien con snack picker
  -- { "clennys/orca.nvim" },
  -- poco contraste
  -- {
  --   "NTBBloodbath/doom-one.nvim",
  --   -- poco contraste y los relative numbers no se ven bien
  -- },
  -- { "iagorrr/noctishc.nvim", opts = {
  -- } },
  -- { "sainnhe/sonokai" },
  -- el fondo es demasiado claro, modificado podría estar bien
  -- {
  --   "navarasu/onedark.nvim",
  --   opts = {
  --     style = "dark",
  --     colors = {
  --       bg0 = "#0D0E1C",
  --       bg1 = "#282A33",
  --       purple = "#B093E6",
  --       fg = "#f0f0f0",
  --       grey = "#838674",
  --     }, -- Override default colors
  --     highlights = {
  --       ["@lsp.type.parameter"] = { fg = "#D0958b" },
  --       ["@variable.parameter"] = { fg = "#D0958b" },
  --       ["@variable.builtin"] = { fg = "#D0958b" },
  --       ["@lsp.typemod.variable.defaultLibrary"] = { fg = "#D0958b" },
  --       ["Special"] = { fg = "#D0958b" },
  --       ["@punctuation.special"] = { fg = "#D0958b" },
  --     },
  --   },
  -- },
  -- {
  --   "rmehri01/onenord.nvim",
  --   opts = {
  --     styles = {
  --       comments = "italic",
  --     },
  --     disable = {
  --       float_background = true,
  --     },
  --     custom_colors = {
  --       bg = "#0D0E1C",
  --       -- bg0 = "#0D0E1C",
  --       -- bg1 = "#282A33",
  --       -- purple = "#B093E6",
  --       -- fg = "#f0f0f0",
  --       -- grey = "#838674",
  --     }, -- Override default colors
  --   },
  -- },
  -- {
  --   "steguiosaur/fullerene.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     styles = { -- You can pass the style using the format: style = true
  --       comments = { italic = true },
  --       keywords = { bold = true },
  --     },
  --     highlight_overrides = {
  --       lCursor = { fg = "#1616dd" },
  --     },
  --   },
  -- },

  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    opts = {
      -- variant = "tinted", -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
      transparent = false, -- Transparent background (as supported by the terminal)
      dim_inactive = true, --
    },
  },
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
  },
  --
  -- -- { "tobi-wan-kenobi/zengarden", dependencies = "rktjmp/lush.nvim" },
  -- {
  --   "0xstepit/flow.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     -- Your configuration options here.
  --   },
  -- },
  -- {
  --   "pauchiner/pastelnight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --
  --     transparent = true,
  --   },
  -- },

  -- {
  --   "yorik1984/newpaper.nvim",
  --   priority = 1000,
  --   config = {
  --     style = "dark",
  --     saturation = 0.7,
  --     disable_background = true,
  --   },
  -- },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
    },
  },
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
  -- Sobreescribe el color que esté como determinado

  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --
  --     -- Enable italics comments
  --     italic_comments = true,
  --   },
  -- },
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      --
      -- transparent = true,
    },
  },
  {
    "neanias/everforest-nvim",
    config = function()
      require("everforest").setup({
        background = "hard",
        -- transparent_background_level = 1,
        ui_contrast = "high",
        dim_inactive_windows = true,
      })
    end,
  },

  -- { "bluz71/vim-moonfly-colors" },
  -- { "bluz71/vim-nightfly-colors" },
  -- { "kvrohit/rasmus.nvim" },
  -- { "nvimdev/zephyr-nvim" },
  -- { "kyazdani42/blue-moon" },
  -- {
  --   "armannikoyan/rusty",
  --   -- bien, agradable, pero no va en ssnack picker y en JAva se ve mas o menos
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --     italic_comments = true,
  --     underline_current_line = true,
  --   },
  -- },
  --{
  --
}
