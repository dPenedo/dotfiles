return {
  'EdenEast/nightfox.nvim',
  opts = {
    options = {
      styles = { -- Style to be applied to different syntax groups
        comments = 'italic', -- Value is any valid attr-list value `:help attr-list`
        conditionals = 'bold',
        constants = 'bold',
        functions = 'bold',
        keywords = 'NONE',
        numbers = 'NONE',
        operators = 'NONE',
        strings = 'NONE',
        types = 'italic',
        variables = 'NONE',
      },
      modules = {
        barbar = true,
      },
    },
    palettes = {
      dayfox = {
        -- Defining multiple shades is done by passing a table
        bg3 = '#e4dcd4',
        sel0 = '#CDD6F4',
        -- sel1 = "#7e94ed",
        -- blue = { base = '#464C8B', bright = '#7e94ed', dim = '#595C78' },
      },
    },
  },
}
