return {
  "mikavilpas/yazi.nvim",
  opts = {},
  cmd = {
    "Yazi",
    "Yazi cwd",
    "Yazi toggle",
  },
  keys = {
    {
      "<leader>e",
      "<CMD>Yazi<CR>",
      desc = "Explorer yazi (Current Dir)",
    },
    {
      "<leader>E",
      "<CMD>Yazi cwd<CR>",
      desc = "Explorer yazi (Root Dir)",
    },
  },
}
