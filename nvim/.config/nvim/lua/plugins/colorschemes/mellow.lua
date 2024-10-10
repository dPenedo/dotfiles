return {
  'kvrohit/mellow.nvim',
  config = function()
    vim.g.mellow_transparent = true
    vim.g.mellow_italic_keywords = true
    vim.g.mellow_bold_functions = true
    vim.g.mellow_highlight_overrides = {
      ['LineNr'] = { fg = '#9998a8' }, -- Line number for " =number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
      ['CursorLineNr'] = { fg = '#ffae9f' }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

      ['CursorLine'] = { bg = '#3e3e43' }, -- the screen line that the cursor is in when 'cursorline' is set
      ['Visual'] = { bg = '#2F3A79' }, -- Visual mode selection
      -- ['Cursor'] = { fg = c.black, bg = c.fg }, -- the character under the cursor
      -- ['markdownH1'] = { fg = c.bright_blue, bold = true },
      -- ['markdownH2'] = { fg = c.bright_blue, bold = true },
      -- ['markdownH3'] = { fg = c.bright_blue, bold = true },
      -- ['markdownH4'] = { fg = c.bright_blue, bold = true },
      -- ['markdownH5'] = { fg = c.bright_blue, bold = true },
      -- ['markdownH6'] = { fg = c.bright_blue, bold = true },
    }
  end,
}
