return {
  "cbochs/grapple.nvim",
  opts = {
    scope = "cwd", -- also try out "git_branch"
    icons = true, -- setting to "true" requires "nvim-web-devicons"
    status = true,
  },
  keys = {
    { "<leader>da", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
    { "<leader>dd", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },
    { "<leader>dj", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
    { "<leader>dk", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
    { "<leader>dl", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
    { "<leader>d;", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
  },
}
