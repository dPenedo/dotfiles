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
      "<leader>Y",
      "<CMD>Yazi<CR>",
      desc = "Explorer yazi (Current Dir)",
    },
    {
      "<leader>Y-",
      "<CMD>Yazi cwd<CR>",
      desc = "Explorer yazi (Root Dir)",
    },
  },
}
