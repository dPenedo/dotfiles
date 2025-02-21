return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  config = function()
    -- Setup orgmode
    require("orgmode").setup({
      org_agenda_files = "~/Documentos/Dropbox/Notas/**/*",
      org_default_notes_file = "~/Documentos/Dropbox/Notas/antolakuntza.org",
      org_capture_templates = {
        J = {
          description = "Journal",
          template = "\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?",
          target = "~/Documentos/Dropbox/Notas/journal/%<%Y-%m>.org",
        },
      },

      mappings = {
        org = {
          org_toggle_checkbox = "<leader>ch",
        },
      },
    })
  end,
}
