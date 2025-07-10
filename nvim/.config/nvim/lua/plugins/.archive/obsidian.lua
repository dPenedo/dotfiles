return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  event = "VeryLazy",
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Notas",
        path = "/home/daniel/Documentos/Dropbox/Notas/",
      },
    },
    completion = {
      -- Enables completion using nvim_cmp
      nvim_cmp = false,
      -- Enables completion using blink.cmp
      blink = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
      name = "snacks.pick",
      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      note_mappings = {
        -- Create a new note from your query.
        new = "<C-x>",
        -- Insert a link to the selected note.
        insert_link = "<C-l>",
      },
      tag_mappings = {
        -- Add tag(s) to current note.
        tag_note = "<C-x>",
        -- Insert a tag at the current location.
        insert_tag = "<C-l>",
      },
    },
    disable_frontmatter = false,

    ---@return table
    note_frontmatter_func = function(note)
      local out = { id = note.id, aliases = note.aliases, tags = note.tags }

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end

      return out
    end,
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },

      -- Smart action depending on context, either follow link or toggle checkbox.
      ["<BS>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },
    ui = {
      enable = false,
      checkboxes = {
        -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
        [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        ["!"] = { char = "", hl_group = "ObsidianImportant" },
      },
      hl_groups = {
        -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#7e94dd" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianImportant = { bold = true, fg = "#d73128" },
        ObsidianBullet = { bold = true, fg = "#7e94dd" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#7e94dd" },
        ObsidianBlockID = { italic = true, fg = "#7e94dd" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },

    templates = {
      subdir = "Recursos/Templates",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
      date_format = "%d/%m/%Y",
    },
  },
  keys = {
    { "<cr>", mode = { "n", "o", "x" }, false },
    { "<leader>nT", "<CMD>ObsidianTags<cr> ", { desc = "Obsidian Template" } },
    { "<leader>nr", "<CMD>ObsidianRename<cr> ", { desc = "Obsidian Rename" } },
    { "<leader>nb", "<CMD>ObsidianBacklinks<cr> ", { desc = "Obsidian backlinks" } },
    { "<leader>nl", "<CMD>ObsidianLinks<cr> ", { desc = "Obsidian Links" } },
    { "<leader>nu", "<CMD>ObsidianTemplate<cr> ", { desc = "Obsidian Links" } },
    { "<leader>nf", "<CMD>ObsidianQuickSwitch<cr> ", { desc = "Obsidian [F]ind" } },
    { "<leader>no", "<CMD>ObsidianOpen<cr> ", { desc = "Obsidian Open" } },
    { "<M-n>", "<CMD>ObsidianLink<cr> ", { desc = "Obsidian Link" }, mode = { "v" } },
  },
}
