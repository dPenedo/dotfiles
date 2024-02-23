return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    opts = {
      -- transparent = true, -- do not set background color
      -- compile = true,
      transparent = true,
      functionStyle = { bold = true },
      dimInactive = false,
      typeStyle = { bold = true },
      keywordStyle = { bold = true },
      colors = {
        theme = {
          wave = {
            ui = {
              bg_gutter = '#161617',
            },
          },
        },
        palette = {
          -- fujiWhite = "#DCD7Bb",
          sumiInk1 = "#161617",
          oldWhite = '#DCD7Bb',
          fujiWhite = '#F6F1d3',
          -- oldWhite = "#F1eed7",
          -- sumiInk3 = "#120309",
          -- autumnGreen = "#037971",
          -- springGreen = "#9EBC9F",
        },
      },
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
    },
  },
  {
    "marko-cerovac/material.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    opts = {
      -- transparent_background = true,
    },
    -- config = function()
    --   -- load the colorscheme here
    --   -- vim.cmd.colorscheme("night-owl")
    -- end,
  },
  {
    'ramojus/mellifluous.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      color_set = 'mountain',
      dim_inactive = true,
      transparent = false,   -- Enable this to disable setting the background color
      mellifluous = {
        neutral = false,     -- set this to false and bg_contrast to 'medium' for original mellifluous (then it was called meliora theme)
        bg_contrast = 'hard' -- options: 'soft', 'medium', 'hard'
      },
      mountain = {
        bg_contrast = 'medium' -- options: 'soft', 'medium', 'hard'
      }
    },
    -- config = function()
    --   vim.cmd.colorscheme 'melange'
    --   -- vim.cmd.Mellifluous 'mountain'
    -- end,
  },
  -- { 'cryptomilk/nightcity.nvim', version = '*' },
  -- { 'mellow-theme/mellow.nvim' },

  -- { "savq/melange-nvim" },
  { "dpenedo/melange-nvim" },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  }

}
