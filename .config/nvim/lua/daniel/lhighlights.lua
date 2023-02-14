------------------------------------------------
-- DT'S NEOVIM CONFIGURATION
-- Neovim website: https://neovim.io/
-- DT's dotfiles: https://gitlab.com/dwt1/dotfiles
-------------------------------------------------
-------------------------------------------------
-- COLORSCHEMES
-------------------------------------------------
local ok, _ = pcall(vim.cmd, 'colorscheme tokyonight-day')

-- Highlight the region on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = num_au,
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 120 })
	end,
})



-- require('kanagawa').setup({
--     commentStyle = { italic = true },
--     functionStyle = { },
--     keywordStyle = { italic = true},
--     statementStyle = { bold = true },
--     typeStyle = { italic = true },
--     variablebuiltinStyle = { italic = true},
--     specialReturn = true,       -- special highlight for the return keyword
--     specialException = true,    -- special highlight for exception handling keywords
--     transparent = false,        -- do not set background color
--     dimInactive = true,        -- dim inactive window `:h hl-NormalNC`
--     globalStatus = false,       -- adjust window separators highlight for laststatus=3
--     terminalColors = true,      -- define vim.g.terminal_color_{0,17}
--     colors = {},
--     overrides = {},
--     theme = "default"           -- Load "default" theme or the experimental "light" theme
-- })
--
-- -- setup must be called before loading
-- vim.cmd("colorscheme kanagawa")
--
--





-- autocmd CursorHold * silent call CocActionAsync('highlight')
-- highlight CocHintFloat ctermfg=Red  guifg=#fff guibg=#252535
-- highlight TSVariable gui=underline
-- highlight TSFunction gui=bold

