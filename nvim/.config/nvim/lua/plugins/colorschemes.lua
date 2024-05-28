return {
  {
    'rebelot/kanagawa.nvim',
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
              -- bg_gutter = '#161617',
              bg_gutter = 'none',
              nontext = '#5E6982',
            },
          },
          lotus = {
            ui = {
              -- bg_gutter = 'none',
              -- bg_gutter = '#161617',
              -- bg = '#f6f9e1',
            },
          },
        },
        palette = {
          -- Wave
          fujiWhite = '#e9e4dd',
          oldWhite = '#CDD6F4',
          sumiInk6 = '#3A3A4B',

          -- Lotus
          lotusInk1 = '#161617',
          lotusWhite0 = '#B3BDFD',
          lotusWhite1 = '#dcd5ac',
          lotusWhite2 = '#e5ddb0',
          -- lotusWhite3 = '#F5E0DC',
          -- lotusWhite3 = '#F2e7de',
          -- lotusWhite3 = '#F7EFE9',
          -- lotusWhite3 = '#E9E4DD',
          lotusWhite3 = '#F8F3F0',
          lotusWhite4 = '#CDD6F4',
          lotusWhite5 = '#CDD6F4',
        },
      },
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          NvimTreeIndentMarker = { fg = theme.syn.comment },
        }
      end,
    },
  },

  --   {'sainnhe/everforest',
  -- lazy = false,
  --   config = function()
  --         vim.cmd([[
  --         " https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt
  --         " Important!!
  --         " For dark version.
  --         " set background=dark
  --         " Set contrast.
  --         " This configuration option should be placed before `colorscheme gruvbox-material`.
  --         " Available values: 'hard', 'medium'(default), 'soft'
  --         let g:everforest_background = 'hard'
  --         let g:everforest_transparent_background = 1
  --         " For better performance
  --         let g:everforest_better_performance = 1
  --         let g:everforest_enable_italic = 1
  --         let  g:everforest_enable_bold = 1
  --         let g:everforest_diagnostic_text_highlight = 1
  --         " let g:everforest_diagnostic_line_highlight = 1
  --         let g:everforest_diagnostic_virtual_text = "colored"
  --         let g:everforest_sign_column_background = 'none'
  --
  --         colorscheme gruvbox-material
  --         ]])
  --     end,
  --   },
  --   {'sainnhe/gruvbox-material',
  -- lazy = false,
  --   config = function()
  --         vim.cmd([[
  --         " https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt
  --         " Important!!
  --         " For dark version.
  --         " set background=dark
  --         " Set contrast.
  --         " This configuration option should be placed before `colorscheme gruvbox-material`.
  --         " Available values: 'hard', 'medium'(default), 'soft'
  --         let g:gruvbox_material_background = 'hard'
  --         let g:gruvbox_material_transparent_background = 1
  --         " For better performance
  --         let g:gruvbox_material_ui_contrast = 'high'
  --         let g:gruvbox_material_better_performance = 1
  --         let g:gruvbox_material_enable_italic = 1
  --         let  g:gruvbox_material_enable_bold = 1
  --         let g:gruvbox_material_diagnostic_text_highlight = 1
  --         " let g:gruvbox_material_diagnostic_line_highlight = 1
  --         let g:gruvbox_material_diagnostic_virtual_text = "colored"
  --         let g:gruvbox_material_sign_column_background = 'none'
  --
  --         colorscheme gruvbox-material
  --         ]])
  --     end,
  --   },
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     -- transparent = true, -- Enable this to disable setting the background color
  --   },
  -- },
  -- {
  --   'ramojus/mellifluous.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     color_set = 'mountain',
  --     dim_inactive = true,
  --     transparent = false, -- Enable this to disable setting the background color
  --     mellifluous = {
  --       neutral = false, -- set this to false and bg_contrast to 'medium' for original mellifluous (then it was called meliora theme)
  --       bg_contrast = 'hard', -- options: 'soft', 'medium', 'hard'
  --     },
  --     mountain = {
  --       bg_contrast = 'medium', -- options: 'soft', 'medium', 'hard'
  --     },
  --   },
  --   -- config = function()
  --   --   vim.cmd.colorscheme 'melange'
  --   --   -- vim.cmd.Mellifluous 'mountain'
  --   -- end,
  -- },
  --   { "dpenedo/melange-nvim" },
  --
  -- {
  --   'ribru17/bamboo.nvim',
  --   lazy = false,
  --   config = function()
  --     require('bamboo').setup {
  --       -- optional configuration here
  --       -- transparent = true, -- Show/hide background
  --     }
  --     require('bamboo').load()
  --   end,
  -- },
  -- 	{'kvrohit/rasmus.nvim',
  -- 	},
  --
  -- {
  --   "loctvl842/monokai-pro.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --
  --
  {
    'EdenEast/nightfox.nvim',
    opts = {
      options = {
        styles = { -- Style to be applied to different syntax groups
          comments = 'NONE', -- Value is any valid attr-list value `:help attr-list`
          conditionals = 'bold',
          constants = 'bold',
          functions = 'bold',
          keywords = 'NONE',
          numbers = 'NONE',
          operators = 'NONE',
          strings = 'NONE',
          types = 'italic',
          variables = 'NONE',
        },
      },
      palettes = {
        dayfox = {
          -- Defining multiple shades is done by passing a table
          blue = { base = '#464C8B', bright = '#7e94ed', dim = '#595C78' },
        },
      },
    },
  }, -- lazy
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    opts = {
      -- transparent_background = true, -- disables setting the background color.
      color_overrides = {
        mocha = {
          pink = '#F5C5C2',
          base = '#161722',
          mauve = '#A8A6F7',
          text = '#dee4f8',
          -- lavender = '#CBD1FB',
        },
        latte = {
          mantle = '#c9cddf',
        },
      },
      highlight_overrides = {
        mocha = function(colors)
          return {
            LineNr = { fg = colors.overlay2 },
            CursorLineNr = { fg = colors.yellow },
            NvimTreeOpenedFolderName = { fg = colors.lavender },
            NvimTreeEmptyFolderName = { fg = colors.teal },
          }
        end,
      },
    },
    priority = 1000,
  },
}
