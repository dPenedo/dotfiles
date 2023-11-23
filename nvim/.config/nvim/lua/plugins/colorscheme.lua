return {
  -- kanagawa
  {
    "rebelot/kanagawa.nvim",
    opts = {
      -- transparent = true, -- do not set background color
      compile = false,
      transparent = true,
      functionStyle = { bold = true },
      dimInactive = false,
      typeStyle = { bold = true },
      keywordStyle = { bold = true },
      colors = {
        palette = {
          -- fujiWhite = "#DCD7Bb",
          oldWhite = "#C8C093",
          fujiWhite = "#F6F1d3",
          -- oldWhite = "#F1eed7",
          -- sumiInk3 = "#120309",
          autumnGreen = "#037971",
          -- springGreen = "#9EBC9F",
        },
      },
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  -- Zenbones
  {
    "mcchrish/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
  },
  { "dotsilas/darcubox-nvim" },
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
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    config = function()
      require("everforest").setup({
        background = "hard",
        ui_contrast = "high",
        dim_inactive_windows = true,
        diagnostic_text_highlight = true,
        ---Some plugins support highlighting error/warning/info/hint lines, but this
        ---feature is disabled by default in this colour scheme.
        diagnostic_line_highlight = true,
        -- Dark background, same as gruvbox dark hard
        colours_override = function(palette)
          palette.bg0 = "#282828"
        end,
      })
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_visual = "red background"
      vim.g.gruvbox_material_ui_contrast = "hight"
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_show_eob = 0
      vim.g.gruvbox_material_statusline_style = "default"
    end,
  },
  --  Everblush
  --
  {
    "Everblush/nvim",
    name = "everblush",
    opts = {
      override = {
        Comment = { fg = "#ffffff" },
        Function = { bold = true },
      },
    },
  },
  { "rose-pine/neovim", name = "rose-pine" },

  -- Nordic
  {
    "AlexvZyl/nordic.nvim",
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
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
  { "stevedylandev/flexoki-nvim" },
  { "tobi-wan-kenobi/zengarden" },

  -- Bamboo
  {
    "ribru17/bamboo.nvim",
    lazy = false,
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
      colorscheme = "kanagawa",
      styles = {
        keyword = {
          bold = true,
        },
      },
    },
  },
}
