return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- markdown = {}, -- Deshabilitar formateadores para Markdown
      -- Opcional: usa otro formateador como "markdownlint" si lo prefieres
      markdown = { "markdownlint" },
      ["html"] = { "prettierd" },
      ["sh"] = {},
      ["javascript"] = { "prettierd" },
      ["javascriptreact"] = { "prettierd" },
    },
  },
}
