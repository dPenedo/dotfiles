return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
    },
  },
  keys = {
    -- disable the keymap to grep files
    { "<leader><space>", false },
    { "<c-p>", ":Telescope find_files <CR>", { desc = "Fzf lua files" } },
    -- change a keymap
  },
}
