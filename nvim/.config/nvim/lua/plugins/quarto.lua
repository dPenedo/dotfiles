return {
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>qa", "<CMD>QuartoActivate<CR>", desc = "Activate quarto" },
      { "<leader>qp", "<CMD>QuartoPreview<CR>", desc = "Preview quarto" },
      { "<leader>qu", "<CMD>QuartoUpdatePreview<CR>", desc = "Update quarto preview" },
    },
  },
}
