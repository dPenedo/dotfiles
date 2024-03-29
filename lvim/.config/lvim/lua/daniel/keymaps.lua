lvim.keys.normal_mode["<A-s>"] = ":update<CR>"

-- Telescope
lvim.keys.normal_mode[",,"] = ":Telescope find_files<CR>"
lvim.keys.normal_mode[",b"] = ":Telescope buffers<CR>"
lvim.keys.normal_mode[",l"] = ":Telescope current_buffer_fuzzy_find<CR>"
lvim.keys.normal_mode[",u"] = ":Telescope undo<CR>"
lvim.keys.normal_mode[",g"] = ":Telescope live_grep<CR>"
lvim.keys.normal_mode[",r"] = ":Telescope registers<CR>"
lvim.keys.normal_mode[",B"] = ":Telescope builtin<CR>"
lvim.keys.normal_mode[",t"] = ":Telescope treesitter<CR>"
lvim.keys.normal_mode[",H"] = ":Telescope help_tags<CR>"
lvim.keys.normal_mode["<Tab>"] = ":Telescope buffers<CR>"

lvim.keys.normal_mode["<leader>H"] = ":Telescope help_tags<CR>"
lvim.keys.normal_mode["<leader>u"] = ":Telescope undo<CR>"
lvim.keys.normal_mode["<leader>G"] = ":Telescope live_grep<CR>"
lvim.keys.normal_mode["<leader>r"] = ":Telescope registers<CR>"






-- Rename

lvim.keys.normal_mode["<leader>R"]  = vim.lsp.buf.rename
lvim.keys.normal_mode["<leader>ca"] = vim.lsp.buf.code_action


-- Mapeando el jj como Escape
lvim.keys.insert_mode["jj"] = "<ESC>"
lvim.keys.insert_mode["jk"] = "<ESC>la"


-- Colores
lvim.builtin.which_key.mappings     = {
  ["c"] = { "" },
}
lvim.keys.normal_mode["<leader>cc"] = ":lua require(\"nvim-highlight-colors\").toggle()<CR>"

-- ZenMode
lvim.keys.normal_mode["<A-z>"]      = ":ZenMode<CR>"

-- Set wrap
lvim.keys.normal_mode["<A-w>"]      = ":set wrap!<CR>"

-- buffer next- prev
lvim.keys.normal_mode["<S-h>"]      = ":bprevious<CR>"
lvim.keys.normal_mode["<S-l>"]      = ":bnext<CR>"



lvim.keys.insert_mode["<C-h>"]         = "<C-w>"
lvim.keys.insert_mode["<C-l>"]         = "<C-o>dw"

-- Exploradores
lvim.keys.normal_mode["-"]             = ":Oil<CR>"
lvim.keys.normal_mode["<A-o>"]         = ":Oil<CR>"
lvim.keys.normal_mode["<A-e>"]         = ":Lf<CR>"
lvim.keys.normal_mode["<leader>e"]     = ":NvimTreeOpen<CR>"

-- Splits
lvim.keys.normal_mode["<leader><CR>"]  = ":vsplit<CR>"
lvim.keys.normal_mode["<leader>-"]     = ":split<CR>"

-- Nohighlsearch
lvim.keys.normal_mode["<ESC>"]         = ":nohlsearch<CR>"

-- Tabs
lvim.keys.normal_mode["<leader><Tab>"] = ":tabedit<CR>"
lvim.keys.normal_mode["<leader>L"]     = ":+tabmove<CR>"
lvim.keys.normal_mode["<leader>H"]     = ":-tabmove<CR>"
lvim.keys.normal_mode["<leader>1"]     = ":tabn 1<CR>"
lvim.keys.normal_mode["<leader>2"]     = ":tabn 2<CR>"
lvim.keys.normal_mode["<leader>3"]     = ":tabn 3<CR>"
lvim.keys.normal_mode["<leader>4"]     = ":tabn 4<CR>"
lvim.keys.normal_mode["<leader>5"]     = ":tabn 5<CR>"
lvim.keys.normal_mode["<leader>6"]     = ":tabn 6<CR>"
lvim.keys.normal_mode["<leader>7"]     = ":tabn 7<CR>"
lvim.keys.normal_mode["<leader>8"]     = ":tabn 8<CR>"
lvim.keys.normal_mode["<leader>9"]     = ":tabn 9<CR>"

-- Buffers
lvim.keys.normal_mode["''"]            = ":b#<CR>"

-- Blank line
lvim.keys.normal_mode["<leader>o"]     = "o<ESC>"
lvim.keys.normal_mode["<leader>O"]     = "O<ESC>"

-- Terminal
lvim.keys.term_mode["<c-l>"]           = "<C-u>clear<CR>"
lvim.keys.term_mode["<Esc>"]           = "<C-\\><C-n><CR>"

vim.api.nvim_exec([[
  augroup TerminalMappings
    autocmd!
    autocmd TermOpen * tnoremap <buffer> <Esc>[3~ <C-\><C-n>
  augroup END
]], false)




lvim.keys.normal_mode["<leader>t"] = ":terminal<CR>:startinsert<CR>"
lvim.keys.normal_mode["<leader>T"] = ":terminal<CR>:startinsert<CR>"
lvim.keys.normal_mode["<leader>Y"] = ":terminal yazi .<CR>:startinsert<CR>"
lvim.keys.normal_mode["<leader>E"] = ":terminal lf .<CR>:startinsert<CR>"

lvim.keys.normal_mode["<c-t>"] = ":ToggleTermToggleAll<CR>"
lvim.keys.normal_mode["<c-o>"] = ":vs | terminal <cr> :startinsert<CR>"




-- Copiar-pegar
lvim.keys.normal_mode["<A-d>"] = '"_dd"'
lvim.keys.visual_mode["<A-d>"] = '"_dd"'
lvim.keys.visual_mode["<A-c>"] = '"+y'

lvim.keys.normal_mode["<leader>y"] = '"+y'
lvim.keys.visual_mode["<leader>y"] = '"+y'
