------------------------------------------------
-- DT'S NEOVIM CONFIGURATION
-- Neovim website: https://neovim.io/
-- DT's dotfiles: https://gitlab.com/dwt1/dotfiles
-------------------------------------------------
-------------------------------------------------
-- COLORSCHEMES
-------------------------------------------------

 require('kanagawa').setup({
     commentStyle = { italic = true },
     functionStyle = {  },
     keywordStyle = { italic = true},
     statementStyle = { bold = true },
     typeStyle = { italic = true },
     variablebuiltinStyle = { italic = true},
     specialReturn = true,       -- special highlight for the return keyword
     specialException = true,    -- special highlight for exception handling keywords
     transparent = false,        -- do not set background color
     dimInactive = true,        -- dim inactive window `:h hl-NormalNC`
     globalStatus = true,       -- adjust window separators highlight for laststatus=3
     terminalColors = true,      -- define vim.g.terminal_color_{0,17}
     colors = {},
     overrides = {},
     theme = "default"           -- Load "default" theme or the experimental "light" theme
 })

--
--
--
local ok, _ = pcall(vim.cmd, 'colorscheme kanagawa')

-- Highlight the region on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = num_au,
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 120 })
	end,
})

local function update_hl( group, tbl )
    local old_hl = vim.api.nvim_get_hl_by_name( group, true )
    local new_hl = vim.tbl_extend( 'force', old_hl, tbl )
    vim.api.nvim_set_hl( 0, group, new_hl )
end

update_hl( 'Comment', { italic = true } )

