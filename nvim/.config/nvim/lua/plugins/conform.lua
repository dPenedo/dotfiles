return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- markdown = {}, -- Deshabilitar formateadores para Markdown
      -- Opcional: usa otro formateador como "markdownlint-cli2" si lo prefieres
      -- markdown = { "" },
      -- ["html"] = { "prettierd" },
      ["sh"] = {},
      ["javascript"] = { "prettierd" },
      ["html"] = { "prettierd" },
      ["javascriptreact"] = { "prettierd" },
      ["python"] = { "black" },
    },
  },
}
