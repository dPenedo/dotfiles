return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    heading = {
      enabled = true,
      sign = true,
      position = 'overlay',
      icons = { '# ', '## ', '### ', '#### ', '##### ', '###### ' },
      signs = { '󰫎 ' },
      width = 'full',
      backgrounds = {
        'RenderMarkdownH2Bg',
        'RenderMarkdownH2Bg',
        'RenderMarkdownH2Bg',
        'RenderMarkdownH2Bg',
        'RenderMarkdownH2Bg',
        'RenderMarkdownH2Bg',
      },
      -- The 'level' is used to index into the list using a clamp
      -- Highlight for the heading and sign icons
      foregrounds = {
        'Constant',
        'Type',
        'Operator',
        'Number',
        'RenderMarkdownH1',
      },
    },
    bullet = {
      -- Turn on / off list bullet rendering
      enabled = true,
      icons = { '→', '‣', '→', '⇾' },
      -- icons = { '◉', '○', '✸', '✿' },
      -- Padding to add to the left of bullet point
      left_pad = 2,
      -- Padding to add to the right of bullet point
      right_pad = 1,
      -- Highlight for the bullet icon
      highlight = 'RenderMarkdownBullet',
    },
  },
}
