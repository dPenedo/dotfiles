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

      {'sainnhe/everforest',
    lazy = true,
      config = function()
            vim.cmd([[
            " https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt
            " Important!!
            " For dark version.
            " set background=dark
            " Set contrast.
            " This configuration option should be placed before `colorscheme gruvbox-material`.
            " Available values: 'hard', 'medium'(default), 'soft'
            let g:everforest_background = 'hard'
            let g:everforest_transparent_background = 1
            " For better performance
            let g:everforest_better_performance = 1
            let g:everforest_enable_italic = 1
            let  g:everforest_enable_bold = 1
            let g:everforest_diagnostic_text_highlight = 1
            " let g:everforest_diagnostic_line_highlight = 1
            let g:everforest_diagnostic_virtual_text = "colored"
            let g:everforest_sign_column_background = 'none'

            colorscheme gruvbox-material
            ]])
        end,
      },
      {'sainnhe/gruvbox-material',
    lazy = true,
      config = function()
            vim.cmd([[
            " https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt
            " Important!!
            " For dark version.
            " set background=dark
            " Set contrast.
            " This configuration option should be placed before `colorscheme gruvbox-material`.
            " Available values: 'hard', 'medium'(default), 'soft'
            let g:gruvbox_material_background = 'hard'
            let g:gruvbox_material_transparent_background = 1
            " For better performance
            let g:gruvbox_material_ui_contrast = 'high'
            let g:gruvbox_material_better_performance = 1
            let g:gruvbox_material_enable_italic = 1
            let  g:gruvbox_material_enable_bold = 1
            let g:gruvbox_material_diagnostic_text_highlight = 1
            " let g:gruvbox_material_diagnostic_line_highlight = 1
            let g:gruvbox_material_diagnostic_virtual_text = "colored"
            let g:gruvbox_material_sign_column_background = 'none'

            colorscheme gruvbox-material
            ]])
        end,
      },
  {
  "folke/tokyonight.nvim",
  lazy = true,
  priority = 1000,
  opts = {
        transparent = true, -- Enable this to disable setting the background color

    },
},
  {
    'ramojus/mellifluous.nvim',
    lazy = true,
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
