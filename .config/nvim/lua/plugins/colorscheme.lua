return {
  -- kanagawa
  {
    "rebelot/kanagawa.nvim",
    opts = {
      transparent = true, -- do not set background color
      compile = true,
      functionStyle = { bold = true },
      dimInactive = true,
      typeStyle = { bold = true },
      keywordStyle = { bold = true },
      colors = {
        palette = {
          fujiWhite = "#DCD7Bb",
          oldWhite = "#C8C093",
          -- fujiWhite = "#F1eed7",
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
  -- Zenbones
  {
    "mcchrish/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
  },
  -- gruvbox-material
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
  -- Nordic
  {
    "AlexvZyl/nordic.nvim",
  },
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
      colorscheme = "kanagawabones",
      styles = {
        keyword = {
          bold = true,
        },
      },
    },
  },
}
