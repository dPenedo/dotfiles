return {
  "cbochs/grapple.nvim",
  opts = {
    scope = "git", -- also try out "git_branch"
    icons = false, -- setting to "true" requires "nvim-web-devicons"
    status = false,
  },
  keys = {
    { ";<space>", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
    { ";f", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },

    { ";j", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
    { ";k", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
    { ";l", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
    { ";;", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
  },
}
