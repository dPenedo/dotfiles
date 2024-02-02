-- TODO: modularizar los que tienen config
return {
  {
    'willothy/flatten.nvim',
    -- config = true,
    -- or pass configuration with
    opts = {
      window = {
        open = 'alternate',
      },
    },
    -- Ensure that it runs first to minimize delay when opening file from terminal
    priority = 1001,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    }
  },
  { "xiyaowong/transparent.nvim" },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },
  {
    'chentoast/marks.nvim',
    config = function()
      require("marks").setup()
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },


  --funciona?
  -- {
  --   'BartSte/nvim-project-marks',
  --   lazy = false,
  --   config = function()
  --     require('projectmarks').setup({})
  --   end
  -- },

  -- {
  --   'lmburns/lf.nvim',
  --   dependencies = {
  --     'akinsho/toggleterm.nvim',
  --   },
  --   opts = {
  --     default_actions = {
  --       -- default action keybindings
  --       ['<C-t>'] = 'tabedit',
  --       ['<C-s>'] = 'split',
  --       ['<C-v>'] = 'vsplit',
  --       ['<C-o>'] = 'tab drop',
  --     },
  --   },
  -- },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      direction = "float",
      size = 90,
      float_opts = {
        border = "curved",
      }
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  -- {
  --   'lukas-reineke/headlines.nvim',
  --   lazy = true,
  --   opts = function()
  --     local opts = {}
  --     for _, ft in ipairs { 'markdown', 'norg', 'rmd', 'org' } do
  --       opts[ft] = {
  --         headline_highlights = {},
  --       }
  --       for i = 1, 6 do
  --         local hl = 'Headline' .. i
  --         vim.api.nvim_set_hl(0, hl, { link = 'Headline', default = true })
  --         table.insert(opts[ft].headline_highlights, hl)
  --       end
  --     end
  --     return opts
  --   end,
  --   ft = { 'markdown', 'norg', 'rmd', 'org' },
  --   config = function(_, opts)
  --     -- PERF: schedule to prevent headlines slowing down opening a file
  --     vim.schedule(function()
  --       require('headlines').setup(opts)
  --       require('headlines').refresh()
  --     end)
  --   end,
  -- },
  {
    'brenoprata10/nvim-highlight-colors',
  },
  {
    'stevearc/oil.nvim',
    opts = {
      keymaps = {
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-s>"] = "actions.select_split",
        ["<C-r>"] = "actions.refresh",
        ["<C-h>"] = "actions.toggle_hidden",
      },
    },
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          side = "left",
        },
      })
    end,
  },
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'Notas',
          path = '~/Documentos/Dropbox/Notas/',
        },
      },
      disable_frontmatter = true,
    },
  },
  {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon").setup()
    end,
    keys = {
      { "<leader>sa",  function() require("harpoon"):list():append() end,  desc = "harpoon file", },
      {
        "<leader>ss",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon quick menu",
      },
      { "<leader>sj",  function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
      { "<leader>sk",  function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
      { "<leader>sl",  function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
      { "<leader>sñ", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
      { "<leader>sh",  function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
    },
  },

}
