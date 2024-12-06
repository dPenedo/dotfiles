return {
  "cbochs/grapple.nvim",
  opts = {
    scope = "cwd", -- also try out "git_branch"
    icons = true, -- setting to "true" requires "nvim-web-devicons"
    status = true,
  },
  keys = {
    { "<leader>ja", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
    { "<leader>jf", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },
    { "<leader>jj", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
    { "<leader>jk", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
    { "<leader>jl", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
    { "<leader>j;", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
  },
}
