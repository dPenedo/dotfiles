return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "*",
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/Documentos/Dropbox/Notas/",
            },
            default_workspace = "notes",
          },
        },
      },
    })
    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
  keys = {
    { "<leader>uo", "<CMD>Neorg toggle-concealer<CR>", desc = "Neorg Toggle concealer" },
  },
}
