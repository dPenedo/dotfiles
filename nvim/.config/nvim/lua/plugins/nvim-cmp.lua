return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "enter",
      ["<C-j>"] = { "select_next" },
      ["<C-k>"] = { "select_prev", "fallback" },
    },
    completion = {
      ghost_text = {
        enabled = false,
      },
    },
  },
}
