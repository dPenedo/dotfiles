return {
  "nvim-orgmode/orgmode",
  dependencies = {
    "nvim-orgmode/org-bullets.nvim",
    "Saghen/blink.cmp",
  },
  event = "VeryLazy",
  ft = { "org" },
  config = function()
    -- Setup orgmode
    require("orgmode").setup({
      org_agenda_files = "~/Documentos/Dropbox/Notas/**/*",
      org_default_notes_file = "~/Documentos/Dropbox/Notas/refile.org",
      mappings = {
        org = {
          org_toggle_checkbox = "<leader>oT",
          org_toggle_heading = "<leader>oh",
        },
      },
    })
    require("org-bullets").setup()

    -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
    -- add ~org~ to ignore_install
    -- require('nvim-treesitter.configs').setup({
    --   ensure_installed = 'all',
    --   ignore_install = { 'org' },
    -- })
  end,
}
