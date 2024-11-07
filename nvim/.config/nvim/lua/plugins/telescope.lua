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
      },
    })
    require("telescope").load_extension("undo")
  end,
  keys = {
    -- disable the keymap to grep files
    { "<leader><space>", false },
    { "<leader>/", false },
    { "<leader>/", "<CMD>Tele current_buffer_fuzzy_find<CR>", { desc = "Fzf current buffer" } },
    { "<leader>fg", false },
    { "<leader>fg", "<CMD>Tele live_grep<CR>", { desc = "Fzf current buffer" } },
    { "<leader>ff", "<CMD>Tele find_files<CR>", { desc = "Fzf files on project" } },
    { "<c-p>", ":Telescope find_files <CR>", { desc = "Fzf lua files" } },
    -- change a keymap
  },
}
