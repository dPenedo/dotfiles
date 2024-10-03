require('lazy').setup({
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        '2html_plugin',
        'getscript',
        'getscriptPlugin',
        'gzip',
        'logipat',
        'matchit',
        'matchparen',
        'netrw',
        'netrwFileHandlers',
        'netrwPlugin',
        'netrwSettings',
        'rrhelper',
        'spec',
        'spellfile_plugin',
        'tar',
        'tarPlugin',
        'vimball',
        'vimballPlugin',
        'zip',
        'zipPlugin',
      },
    },
  },
  { import = 'plugins.plugins' },
  { import = 'plugins.colorschemes' },
}, {})

-- vim: ts=2 sts=2 sw=2 et
