return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruff_lsp = {
        init_options = {
          settings = {
            args = {},
          },
        },
      },
      jedi_language_server = {},
    },
  },
}
