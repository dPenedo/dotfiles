return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruff = {
        enabled = true,
        executable = "ruff",
        args = { "--quiet" },
        format = { enable = true },
      },
      jedi_language_server = {},
    },
  },
}
