return {
  -- kanagawa
  {
    "rebelot/kanagawa.nvim",
    opts = {
      -- transparent = true, -- do not set background color
      compile = true,
      transparent = false,
      functionStyle = { bold = false },
      dimInactive = false,
      typeStyle = { bold = false },
      keywordStyle = { bold = true },
      colors = {
        theme = {
          wave = {
            ui = {
              bg_gutter = "#1f1f28",
            },
          },
        },
        palette = {
          -- fujiWhite = "#DCD7Bb",
          oldWhite = "#DCD7Bb",
          fujiWhite = "#F6F1d3",
          -- oldWhite = "#F1eed7",
          -- sumiInk3 = "#1D1F21",
          sumiInk3 = "#1F1F1F",
          -- autumnGreen = "#037971",
          -- springGreen = "#9EBC9F",
        },
      },
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  { "Biscuit-Colorscheme/nvim" },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {},
  },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = true },
  -- Zenbones
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      -- custom options here
    },
  },
  {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
  },
  -- {
  --   "neanias/everforest-nvim",
  --   version = false,
  --   lazy = false,
  --   config = function()
  --     require("everforest").setup({
  --       background = "hard",
  --       ui_contrast = "high",
  --       dim_inactive_windows = true,
  --       diagnostic_text_highlight = true,
  --       ---Some plugins support highlighting error/warning/info/hint lines, but this
  --       ---feature is disabled by default in this colour scheme.
  --       diagnostic_line_highlight = true,
  --       -- Dark background, same as gruvbox dark hard
  --       colours_override = function(palette)
  --         palette.bg0 = "#282828"
  --       end,
  --     })
  --   end,
  -- },
  -- {
  --   "sainnhe/gruvbox-material",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     vim.g.gruvbox_material_background = "hard"
  --     vim.g.gruvbox_material_enable_bold = 1
  --     vim.g.gruvbox_material_visual = "red background"
  --     vim.g.gruvbox_material_ui_contrast = "hight"
  --     vim.g.gruvbox_material_transparent_background = 0
  --     vim.g.gruvbox_material_better_performance = 1
  --     vim.g.gruvbox_material_show_eob = 0
  --     vim.g.gruvbox_material_statusline_style = "default"
  --   end,
  -- },
  -- {
  --   "ramojus/mellifluous.nvim",
  --   config = function()
  --     require("mellifluous").setup({ --[[...]]
  --       color_set = "mellifluous",
  --
  --       mountain = {
  --         neutral = true, -- set this to false and bg_contrast to 'medium' for original mellifluous (then it was called meliora theme)
  --         bg_contrast = "hard", -- options: 'soft', 'medium', 'hard'
  --       },
  --
  --       alduin = {
  --         neutral = true, -- set this to false and bg_contrast to 'medium' for original mellifluous (then it was called meliora theme)
  --         bg_contrast = "hard", -- options: 'soft', 'medium', 'hard'
  --       },
  --       mellifluous = {
  --         neutral = true, -- set this to false and bg_contrast to 'medium' for original mellifluous (then it was called meliora theme)
  --         bg_contrast = "hard", -- options: 'soft', 'medium', 'hard'
  --       },
  --     }) -- optional, see configuration section.
  --   end,
  -- },
  --  Everblush
  --
  -- {
  --   "Everblush/nvim",
  --   name = "everblush",
  --   opts = {
  --     override = {
  --       Comment = { fg = "#ffffff" },
  --       Function = { bold = true },
  --     },
  --   },
  -- },
  -- { "rose-pine/neovim", name = "rose-pine" },

  {
    "HoNamDuong/hybrid.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      overrides = function(hl, c)
        local gris = "#737B87"
        hl.LineNr = {
          fg = gris,
        }
      end,
    },
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      bold_keywords = true,
      swap_backgrounds = true,
      telescope = "flat",
      cursorline = {
        bold_number = true,
        -- Avialable styles: 'dark', 'light'.
        theme = "light",
        -- Blending the cursorline bg with the buffer bg.
        -- blend = 0.96,
      },
    },
  },
  {
    "EdenEast/nightfox.nvim",
    opts = {
      styles = { -- Style to be applied to different syntax groups
        comments = "italic", -- Value is any valid attr-list value `:help attr-list`
        conditionals = "bold",
        constants = "bold",
        functions = "NONE",
        keywords = "bold",
        numbers = "NONE",
        operators = "bold",
        strings = "italic",
        types = "NONE",
        variables = "NONE",
      },
      palettes = {
        all = {
          bg1 = "#1F1F1F", -- Default bg
        },
      },
    },
  },

  -- {
  --   "rmehri01/onenord.nvim",
  --   opts = {
  --     custom_colors = { bg = "#1d1f21", active = "#242933" },
  --     disable = {
  --       float_background = true, -- Disable setting the background color for floating windows
  --     },
  --     inverse = {
  --       match_paren = true,
  --     },
  --   },
  -- },
  -- Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = true,
    config = true,
    opts = {
      contrast = "hard",
      palette_overrides = {
        bright_red = "#7E9CD8",
        bright_orange = "#DA702C",
        bright_green = "#9FC443",
        faded_blue = "#22578C",
        faded_green = "#177245",
      },
    },
  },
  -- { "stevedylandev/flexoki-nvim" },
  { "tobi-wan-kenobi/zengarden" },
  -- { "miikanissi/modus-themes.nvim" },
  { "metalelf0/jellybeans-nvim", dependencies = "rktjmp/lush.nvim" },
  { "Martin1887/melangeDarkerWarm-nvim" },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    config = function()
      require("cyberdream").setup({
        -- Recommended - see "Configuring" below for more config options
        transparent = false,
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = true,
      })
    end,
  },

  { "projekt0n/caret.nvim" },
  {
    "judaew/ronny.nvim",
    priority = 1000,
    config = true,
  },
  {
    "yorik1984/newpaper.nvim",
    priority = 1000,
    config = true,
  },

  -- Bamboo
  {
    "ribru17/bamboo.nvim",
    lazy = true,
    -- priority = 1000,
    config = function()
      require("bamboo").setup({
        style = "vulgaris", -- Choose between 'vulgaris' (regular) and 'multiplex' (greener)
        code_style = {
          keywords = "bold",
          functions = "bold",
          strings = "italic",
          variables = "none",
        },
      })
      --   require("bamboo").load()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nightfox",
      styles = {
        keyword = {
          bold = true,
        },
      },
    },
  },
}
