return 	{
		"shellRaining/hlchunk.nvim",
		event = { "UIEnter" },
		opts = {
			chunk = {
				-- details about support_filetypes and exclude_filetypes in https://github.com/shellRaining/hlchunk.nvim/blob/main/lua/hlchunk/utils/filetype.lua
				style = {
					{ fg = "#54546D" },
					{ fg = "#c21f30" }, -- this fg is used to highlight wrong chunk
				},
				textobject = "",
				max_file_size = 1024 * 1024,
				error_sign = true,
			},
			line_num = {
				enable = false,
			},

			blank = {
				enable = false,}
		},
	exclude = {
    filetypes = {
      "oil",
      "minifiles",
      "alpha",
      "dashboard",
      "toggleterm",
      "lazyterm",
    },
  },
	}
