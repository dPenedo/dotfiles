return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  opts = function()
    local dashboard = require 'alpha.themes.dashboard'
    dashboard.section.buttons.val = {
      -- dashboard.button("f", "󱝩" .. " Find file", ":Telescope find_files <CR>"),
      -- dashboard.button("e", "󰩡 " .. " LF", ":Lf <CR>"),
      dashboard.button('f', ' ' .. ' Buscar archivo', ':Telescope find_files <CR>'),
      dashboard.button('s', ' ' .. ' Restaurar Sesión', [[:lua require("persistence").load() <cr>]]),
      dashboard.button('q', '󰩈' .. '  Salir', ':qa<CR>'),

    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = 'AlphaButtons'
      button.opts.hl_shortcut = 'AlphaShortcut'
    end
    -- dashboard.section.header.opts.hl = 'AlphaHeader'
    dashboard.section.buttons.opts.hl = 'AlphaButtons'
    -- dashboard.section.footer.opts.hl = 'AlphaFooter'
    dashboard.opts.layout[1].val = 3
    return dashboard
  end,
  config = function(_, dashboard)

    require('alpha').setup(dashboard.opts)

  end,
}
