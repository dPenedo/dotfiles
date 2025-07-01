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
  { "datsfilipe/vesper.nvim" },
  -- {
  --   "killitar/obscure.nvim",
  --   -- Falta contraste
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  -- },
  {
    "dpenedo/melange-nvim",
  },
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
  -- -- No va bien con snack picker, un poco briloso
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
  --   -- Demasiado brilloso
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
  -- {
  --   "kimjbaran/voyager.nvim",
  --   -- Mucho contraste
  --   lazy = false,
  -- },
  {
    "rjshkhr/shadow.nvim",
    -- Agradable, minimalista, me gusta el tono verdoso, le faltan un par de implementaciones de plugins, los comentarios casi no se ven y los numeros de linea tampooc y opciones para configurar
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
    end,
  },
  {
    "romanaverin/charleston.nvim",
    name = "charleston",
    priority = 1000,
  },
  -- {
  --   "cpplain/flexoki.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
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
  { "aliqyan-21/darkvoid.nvim" },
  {
    "vague2k/vague.nvim",
    opts = {
      transparent = false, -- don't set background
      colors = {
        bg = "#1E2325",
        fg = "#cdcdcd",
        floatBorder = "#878787",
        line = "#252530",
        comment = "#606079",
        builtin = "#b4d4cf",
        func = "#c48282",
        string = "#e8b589",
        number = "#e0a363",
        property = "#c3c3d5",
        constant = "#aeaed1",
        parameter = "#bb9dbd",
        visual = "#4C3D52",
        error = "#d8647e",
        warning = "#f3be7c",
        hint = "#7e98e8",
        operator = "#90a0b5",
        keyword = "#6e94b2",
        type = "#9bb4bc",
        search = "#516176",
        plus = "#7fa563",
        delta = "#f3be7c",
      },
    },
  },
  --
  -- { "tobi-wan-kenobi/zengarden", dependencies = "rktjmp/lush.nvim" },
  -- Tiene un par de colores que se ven poco, como el marrón
  -- {
  --   "0xstepit/flow.nvim",
  --   -- Brilloso
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
  -- {
  --   "f4z3r/gruvbox-material.nvim",
  --   name = "gruvbox-material",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     contrast = "hard",
  --   },
  -- },
  {
    "wtfox/jellybeans.nvim",
    opts = {
      -- transparent = false,
    },
  },
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
    -- Bien, pero le falta contraste con el bg, se le puede dar cambiando el fondo
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
  -- {
  --   "neanias/everforest-nvim",
  --   config = function()
  --     require("everforest").setup({
  --       background = "hard",
  --       -- transparent_background_level = 1,
  --       ui_contrast = "high",
  --       dim_inactive_windows = true,
  --     })
  --   end,
  -- },

  -- { "bluz71/vim-moonfly-colors" },
  -- Usa rojo
  -- { "bluz71/vim-nightfly-colors" },
  -- Usa rojo
  {
    "kvrohit/rasmus.nvim",
    lazy = false,

    config = function()
      vim.g.rasmus_transparent = true
    end,
  },
  {
    "rose-pine/neovim",
  },
  { "nvimdev/zephyr-nvim" },
  -- { "kyazdani42/blue-moon" },
  --{
  --
}
