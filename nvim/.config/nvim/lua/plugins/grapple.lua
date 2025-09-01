return {
  "cbochs/grapple.nvim",
  opts = {
    scope = "cwd", -- also try out "git_branch"
    icons = true, -- setting to "true" requires "nvim-web-devicons"
    status = true,
  },
  keys = {
    { "<leader>fa", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
    { "<leader>f<space>", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },
    { "<leader>fj", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
    { "<leader>fk", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
    { "<leader>fl", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
    { "<leader>f:", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
    { "<leader>te", "<cmd>Grapple select name=term<cr>", desc = "Select fourth tag" },
  },
}
