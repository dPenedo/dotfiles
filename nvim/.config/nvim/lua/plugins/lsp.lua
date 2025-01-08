return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off", -- Desactiva la comprobación de tipos estricta
            },
          },
        },
      },
    },

    inlay_hints = { enabled = false },
  },
  keys = {
    { "<c-k>", false },
  },
}
