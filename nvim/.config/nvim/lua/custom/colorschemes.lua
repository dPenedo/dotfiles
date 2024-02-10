return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    config = function()
      vim.cmd.colorscheme 'kanagawa'
    end,
    opts = {
      -- transparent = true, -- do not set background color
      compile = true,
      transparent = false,
      functionStyle = { bold = true },
      dimInactive = false,
      typeStyle = { bold = true },
      keywordStyle = { bold = true },
      colors = {
        theme = {
          wave = {
            ui = {
              bg_gutter = '#ff4444',
            },
          },
        },
        palette = {
          -- fujiWhite = "#DCD7Bb",
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
    "oxfist/night-owl.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      transparent_background = true,
    },
    config = function()
      -- load the colorscheme here
      -- vim.cmd.colorscheme("night-owl")
    end,
  },
}
