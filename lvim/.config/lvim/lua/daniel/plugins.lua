lvim.plugins = {
  {
    "lmburns/lf.nvim",
    dependencies = {
      "akinsho/toggleterm.nvim",
    },
    opts = {
      default_actions = { -- default action keybindings
        ["<C-t>"] = "tabedit",
        ["<C-s>"] = "split",
        ["<C-v>"] = "vsplit",
        ["<C-o>"] = "tab drop",
      },
      escape_quit = true,
      border = "curved",
      layout_mapping = "<M-f>", -- resize window with this key
      views = {                 -- window dimensions to rotate through
        { width = 0.990, height = 0.990 },
        { width = 0.750, height = 0.750 },
      },
      winblend = 6,
      highlights = { -- highlights passed to toggleterm
        Normal = { guibg = "#181820", guifg = "#f00" },
      },
    },
  },
  { 'dstein64/vim-startuptime' },

  {
    "crispgm/nvim-tabline",
    lazy = true,
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional
    config = function()
      require("tabline").setup({
        show_icon = true,        -- show file extension icon
        brackets = { " ", " " }, -- file name brackets surrounding
      })
    end,
  },

  -- Probando a comentar
  {
    "folke/todo-comments.nvim",
    lazy = true,
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    lazy = true,
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  -- {
  --   "folke/zen-mode.nvim",
  --   opts = {
  --     window = { height = 0.9 },
  --   },
  -- },

  { "brenoprata10/nvim-highlight-colors" },
  {
    "willothy/flatten.nvim",
    -- config = true,
    -- or pass configuration with
    opts = {
      window = {
        open = "alternate",
      },
    },
    -- Ensure that it runs first to minimize delay when opening file from terminal
    lazy = false,
    priority = 1001,
  },

  -- {
  -- 	"xiyaowong/transparent.nvim",
  -- },
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    config = function()
      require("oil").setup({
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        keymaps = {
          ["<C-v>"] = "actions.select_vsplit",
          ["<C-s>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
        },
      })
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "Notas",
          path = "~/Documentos/Dropbox/Notas/",
        },
      },
      disable_frontmatter = true,
    },
  },
  -- {
  --   "lukas-reineke/headlines.nvim",
  --   dependencies = "nvim-treesitter/nvim-treesitter",
  --   config = true, -- or `opts = {}`
  -- },
  {
    "debugloop/telescope-undo.nvim",
    lazy = true
  },
  { "nvim-telescope/telescope-file-browser.nvim" },


  -- {
  --   "Pocco81/auto-save.nvim",
  --   config = function()
  --     require("auto-save").setup()
  --   end,
  -- },
  -- JAVA
  { "mfussenegger/nvim-jdtls",                   lazy = true, ft = { "java" } },

  {
    "deparr/tairiki.nvim",
    lazy = true,
  },
  { "tobi-wan-kenobi/zengarden", lazy = true },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = {},
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      transparent = false,
      functionStyle = { bold = true },
      dimInactive = true,
      typeStyle = { bold = true },
      keywordStyle = { bold = true },
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "#1f1f28",
            },
          },
        },
        palette = {
          -- fujiWhite = "#DCD7Bb",
          oldWhite = "#DCD7Bb",
          fujiWhite = "#F6F1d3",
          -- oldWhite = "#C8C093",
          -- fujiWhite = "#F1eed7",
          -- oldWhite = "#F1eed7",
          -- sumiInk3 = "#120309",
          -- autumnGreen = "#037971",
          -- springGreen = "#9EBC9F",
        },
      },
    },
  },

  -- {
  --   "sainnhe/gruvbox-material",
  --   lazy = true,    -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     vim.g.gruvbox_material_background = "hard"
  --     vim.g.gruvbox_material_enable_bold = 1
  --     vim.g.gruvbox_material_visual = "red background"
  --     vim.g.gruvbox_material_ui_contrast = "hight"
  --     -- vim.g.gruvbox_material_transparent_background = 1
  --     vim.g.gruvbox_material_better_performance = 1
  --     vim.g.gruvbox_material_show_eob = 0
  --     vim.g.gruvbox_material_statusline_style = "default"
  --   end,
  -- },
  {
    "ribru17/bamboo.nvim",
    lazy = true,
    priority = 1000,
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
    end,
  },
}
