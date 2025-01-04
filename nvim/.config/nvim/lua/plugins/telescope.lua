return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "debugloop/telescope-undo.nvim",
  },
  config = function()
    require("telescope").setup({
      extensions = {
        undo = {},
      },
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,

        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
            ["<C-l>"] = false,
            -- ['<Tab>'] = false,
            -- ['<Tab>'] = 'select_default',
            ["<C-s>"] = "select_horizontal",
            ["<C-v>"] = "select_vertical",
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<c-d>"] = "delete_buffer",
            ["<c-l>"] = "select_default",
          },
          n = {
            ["<C-s>"] = "select_horizontal",
            ["<C-v>"] = "select_vertical",
            ["<c-l>"] = "select_default",
          },
        },
      },
    })
    require("telescope").load_extension("undo")
  end,
  keys = {
    -- -- disable the keymap to grep files
    -- { "<leader><space>", false },
    -- { "<leader>/", false },
    -- { "<leader>fg", false },
    -- { "<leader>/", "<CMD>Tele current_buffer_fuzzy_find<CR>", { desc = "Fzf current buffer" } },
    -- { "<leader>fg", "<CMD>Tele live_grep<CR>", { desc = "Fzf current buffer" } },
    { "<leader>fi", "<CMD>Tele find_files<CR>", { desc = "Fzf files on project" } },
    { "<leader>fu", "<CMD>Tele undo<CR>", { desc = "Fzf undo" } },
    -- { "<c-p>", ":Telescope find_files <CR>", { desc = "Fzf lua files" } },
    -- {
    --   "<leader><space>",
    --   "<CMD>Telescope buffers  sort_lastused=true  ignore_current_buffer=true<CR>",
    --   { desc = "Telescop buffers" },
    -- },
    -- change a keymap
  },
}
