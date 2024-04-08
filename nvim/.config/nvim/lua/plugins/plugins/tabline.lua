  return {
    'crispgm/nvim-tabline',
	event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional
    config = true,
    opts = {
      show_icon = true, -- show file extension icon
      modify_indicator = '  󰈸 ', -- modify indicator
      no_name = 'Sin nombre', -- no name buffer name
      brackets = { ' ', '' }, -- file name brackets surrounding
    }
  }


