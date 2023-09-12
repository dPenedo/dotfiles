return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      height = 0.9,
    },
    plugins = {
      tmux = { enabled = false }, -- disables the tmux statusline
      alacritty = {
        enabled = false,
        font = "16 ", -- font size
      },
    },
  },
}
