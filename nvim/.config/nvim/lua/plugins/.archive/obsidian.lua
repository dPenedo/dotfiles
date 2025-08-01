return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  opts = {
    workspaces = {
      {
        name = "notas",
        path = "~/Documentos/Dropbox/Notas/",
      },
    },
    completion = {
      nvim_cmp = false,
      blink = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
      -- Set to false to disable new note creation in the picker
      create_new = true,
    },
    disable_frontmatter = true,

    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
      name = "snacks.pick",
    },

    ui = {
      enable = false,
    },
    footer = {
      enabled = true,
      format = "{{backlinks}} backlinks ",
      hl_group = "Comment",
      separator = string.rep("-", 80),
    },
    checkbox = {
      order = { " ", "x", "!" },
    },
  },
  keys = {
    { "<leader>nT", "<CMD>ObsidianTags<CR>", desc = "Obsidian tags" },
    { "<leader>nb", "<CMD>ObsidianBacklinks<CR>", desc = "Obsidian backlinks" },
    { "<leader>nr", "<CMD>ObsidianRename<CR>", desc = "Obsidian rename" },
  },
}
