return {
  "stevearc/conform.nvim", -- Asegúrate de que este plugin está instalado
  opts = {
    formatters_by_ft = {
      -- markdown = {}, -- Deshabilitar formateadores para Markdown
      -- Opcional: usa otro formateador como "markdownlint" si lo prefieres
      markdown = { "markdownlint" },
      ["html"] = { "prettierd" },
    },
  },
}
