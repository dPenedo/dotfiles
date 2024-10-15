-- Le falta contraste

return {
  'vague2k/vague.nvim',
  config = function()
    require('vague').setup {
      -- optional configuration here
      transparent = true,
      style = {

        functions = 'bold',
        keyword_return = 'bold',
      },
    }
  end,
}
