return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    {
      "s1n7ax/nvim-window-picker",
      version = "2.*",
      config = function()
        require("window-picker").setup({
          selection_chars = "jkl;uiop",
          hint = "floating-big-letter",
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { "neo-tree", "neo-tree-popup", "notify" },
              -- if the buffer type is one of following, the window will be ignored
              buftype = { "terminal", "quickfix" },
            },
          },
        })
      end,
    },
  },
  opts = {
    window = {
      position = "current",
      mappings = {
        ["/"] = "none",
        ["?"] = "none",
        ["<C-f>"] = "fuzzy_finder",
        ["l"] = "open_with_window_picker",
        ["s"] = "none",
        ["g?"] = "show_help",
        ["<c-v>"] = "vsplit_with_window_picker",
        ["<c-s>"] = "split_with_window_picker",
        ["<tab>"] = {
          "toggle_node",
          nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
        },
      },
      default_component_configs = {
        modified = {
          symbol = "[+]",
          highlight = "NeoTreeModified",
        },
        file_size = {
          enabled = false,
        },
        type = {
          enabled = false,
        },
        last_modified = {
          enabled = false,
        },
        created = {
          enabled = false,
        },
      },
    },
    filesystem = {
      filtered_items = {
        visible = true, -- when true, they will just be displayed differently than normal items
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
  keys = {
    {
      "<leader>e",
      "<CMD>Neotree position=left<CR>",
      desc = "Explorer NeoTree (Root Dir)",
    },
    {
      "<C-h>",
      "<CMD>Neotree position=float reveal <CR>",
      desc = "Explorer NeoTree (Root Dir)",
    },
    {
      -- "<C-h>",
      "<leader>h",
      "<CMD>Neotree position=current reveal <CR>",
      desc = "Explorer NeoTree (Root Dir)",
    },
  },
}
