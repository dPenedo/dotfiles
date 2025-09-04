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
      -- basedpyright = {
      -- Va demasiado lentoo
      --   settings = {
      --     basedpyright = {
      --       analysis = {
      --         typeCheckingMode = "off",
      --         autoSearchPaths = true,
      --         useLibraryCodeForTypes = true,
      --         diagnosticMode = "openFilesOnly",
      --         reportUnknownMemberType = false,
      --         reportGeneralTypeIssues = false,
      --       },
      --     },
      --   },
      -- },
    },
  },
}
