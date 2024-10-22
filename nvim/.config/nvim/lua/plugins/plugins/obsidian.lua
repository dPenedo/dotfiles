-- Probando a quitarlo, se solapa la ui

return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'Notas',
        path = '~/Documentos/Dropbox/Notas/',
      },
    },
    disable_frontmatter = true,
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ['<leader>ch'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },

      -- Smart action depending on context, either follow link or toggle checkbox.
      ['<BS>'] = {
        action = function()
          return require('obsidian').util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },
    ui = {
      { enable = false },
      checkboxes = {
        -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
        [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
        ['x'] = { char = '', hl_group = 'ObsidianDone' },
      },
      hl_groups = {
        -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
        ObsidianTodo = { bold = true, fg = '#f78c6c' },
        ObsidianDone = { bold = true, fg = '#7e94dd' },
        ObsidianRightArrow = { bold = true, fg = '#f78c6c' },
        ObsidianTilde = { bold = true, fg = '#ff5370' },
        ObsidianImportant = { bold = true, fg = '#d73128' },
        ObsidianBullet = { bold = true, fg = '#7e94dd' },
        ObsidianRefText = { underline = true, fg = '#c792ea' },
        ObsidianExtLinkIcon = { fg = '#c792ea' },
        ObsidianTag = { italic = true, fg = '#7e94dd' },
        ObsidianBlockID = { italic = true, fg = '#7e94dd' },
        ObsidianHighlightText = { bg = '#75662e' },
      },
    },

    templates = {
      subdir = 'Graficos/templates',
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
      date_format = '%d/%m/%Y',
    },
  },
  keys = {
    { '<leader>ns', '<CMD>ObsidianQuickSwitch<cr> ', { desc = 'Obsidian Quick Switch' } },
    { '<leader>nT', '<CMD>ObsidianTags<cr> ', { desc = 'Obsidian Template' } },
    { '<leader>nr', '<CMD>ObsidianRename<cr> ', { desc = 'Obsidian Rename' } },
    { '<leader>nb', '<CMD>ObsidianBacklinks<cr> ', { desc = 'Obsidian backlinks' } },
    { '<leader>nl', '<CMD>ObsidianLinks<cr> ', { desc = 'Obsidian Links' } },
  },
}
