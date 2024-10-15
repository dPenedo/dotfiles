-- No funcionan los links

return {
  'toppair/peek.nvim',
  event = { 'VeryLazy' },
  build = 'deno task --quiet build:fast',
  config = function()
    require('peek').setup {
      auto_load = true, -- automatically load preview on entering markdown buffer
      close_on_bdelete = true, -- close preview when buffer is deleted
      syntax = true, -- enable syntax highlighting
      theme = 'dark', -- set theme to 'dark' or 'light'
      update_on_change = true, -- update preview on file changes

      app = { 'google-chrome', '--new-window' }, -- use Chromium as the previewer in a new window

      filetype = { 'markdown' }, -- recognized filetypes for preview

      throttle_at = 200000, -- start throttling if file size exceeds this value (bytes)
      throttle_time = 'auto', -- auto-throttle time for rendering updates
    }

    -- Set up commands for opening and closing the preview
    vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
    vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
  end,
  keys = {
    { '<leader>np', '<CMD>PeekOpen<cr> ', { desc = 'Peek Open' } },
    { '<leader>nx', '<CMD>PeekClose<cr> ', { desc = 'Peek Open' } },
  },
}
