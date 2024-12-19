return {
  "amrbashir/nvim-docs-view",
  lazy = true,
  cmd = "DocsViewToggle",
  opts = {
    position = "right",
    width = 60,
  },
  keys = {
    { "<leader>K", "<cmd>DocsViewToggle<cr>", desc = "Toggle Docs view" },
  },
}
