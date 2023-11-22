lvim.keys.normal_mode["<A-s>"] = ":update<CR>"

-- Telescope
lvim.keys.normal_mode[","] = ":Telescope current_buffer_fuzzy_find<CR>"
lvim.keys.normal_mode[";"] = ":Telescope find_files<CR>"
lvim.keys.normal_mode["ñ"] = ":Telescope buffers<CR>"
lvim.keys.normal_mode["<leader>H"] = ":Telescope help_tags<CR>"
lvim.keys.normal_mode["<leader>fg"] = ":Telescope live_grep<CR>"
lvim.keys.normal_mode["<leader>u"] = ":Telescope undo<CR>"
lvim.keys.normal_mode["<leader>G"] = ":Telescope live_grep<CR>"
lvim.keys.normal_mode["<leader>r"] = ":Telescope registers<CR>"


-- Mapeando el jj como Escape
lvim.keys.insert_mode["jj"] = "<ESC>"
lvim.keys.insert_mode["jk"] = "<ESC>la"


-- ZenMode
lvim.keys.normal_mode["<A-z>"] = ":ZenMode<CR>"

-- Exploradores
lvim.keys.normal_mode["-"] = ":Oil<CR>"
lvim.keys.normal_mode["<A-o>"] = ":Oil<CR>"
lvim.keys.normal_mode["<A-e>"] = ":Lf<CR>"

-- Splits
lvim.keys.normal_mode["<A-_>"] = ":vsplit<CR>"
lvim.keys.normal_mode["<A-->"] = ":split<CR>"

-- Nohighlsearch
lvim.keys.normal_mode["<ESC>"] = ":nohlsearch<CR>"

-- Tabs
lvim.keys.normal_mode["<leader>1"] = ":tabn 1<CR>"
lvim.keys.normal_mode["<leader>2"] = ":tabn 2<CR>"
lvim.keys.normal_mode["<leader>3"] = ":tabn 3<CR>"
lvim.keys.normal_mode["<leader>4"] = ":tabn 4<CR>"
lvim.keys.normal_mode["<leader>5"] = ":tabn 5<CR>"
lvim.keys.normal_mode["<leader>6"] = ":tabn 6<CR>"
lvim.keys.normal_mode["<leader>7"] = ":tabn 7<CR>"
lvim.keys.normal_mode["<leader>8"] = ":tabn 8<CR>"
lvim.keys.normal_mode["<leader>9"] = ":tabn 9<CR>"

-- Buffers
lvim.keys.normal_mode["''"] = ":b#<CR>"

-- Blank line
lvim.keys.normal_mode["<leader>o"] = "o<ESC>"
lvim.keys.normal_mode["<leader>O"] = "O<ESC>"


-- Copiar-pegar
lvim.keys.normal_mode["<A-d>"] = "_dd"
lvim.keys.visual_mode["<A-d>"] = "_dd"
lvim.keys.visual_mode["<A-c>"] = '"+y'

lvim.keys.normal_mode["<leader>y"] = "+y"
lvim.keys.visual_mode["<leader>y"] = "+y"
