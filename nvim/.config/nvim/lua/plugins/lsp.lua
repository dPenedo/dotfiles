return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- marksman = {},
      pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
            },
          },
        },
      },
    },
  },
  -- keys = {
  --   { "<c-k>", false },
  -- },
}
