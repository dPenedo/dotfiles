return {
  'MeanderingProgrammer/render-markdown.nvim',
  event = 'VeryLazy',
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
        -- 'RenderMarkdownH1Bg',
        -- 'RenderMarkdownH2Bg',
        -- 'RenderMarkdownH2Bg',
        -- 'RenderMarkdownH2Bg',
        -- 'RenderMarkdownH2Bg',
        -- 'RenderMarkdownH2Bg',
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
    link = {
      enabled = true,
      image = '󰥶 ',
      email = '󰀓 ',
      hyperlink = '󰌹 ',
      highlight = 'RenderMarkdownLink',
      wiki = { icon = '󱗖 ', highlight = 'RenderMarkdownWikiLink' },
      custom = {
        web = { pattern = '^http[s]?://', icon = '󰖟 ', highlight = 'RenderMarkdownLink' },
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
      highlight = 'RenderMarkdownH1',
    },
    code = {
      style = 'full',
      sign = 'false',
      position = 'right',
      width = 'block',
      right_pad = 10,
      language_name = false,
    },
    checkbox = {
      -- Turn on / off checkbox state rendering
      enabled = true,
    },
  },
}
