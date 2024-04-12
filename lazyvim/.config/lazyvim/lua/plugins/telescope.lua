return {
  "nvim-telescope/telescope.nvim",
  keys = {

{ "<leader>s/", "<cmd>Telescope live_grep_open_files<CR>", desc = "[S]earch [/] in Open Files" },
{ "<leader>gf", "<cmd>lua require('telescope.builtin').git_files()<CR>", desc = "Search [G]it [F]iles" },
{ "<leader>f", "<cmd>Telescope find_files<CR>", desc = "[S]earch [F]iles" },
{ "<leader>sh", "<cmd>Telescope help_tags<CR>", desc = "[S]earch [H]elp" },
{ "<leader>sw", "<cmd>Telescope grep_string<CR>", desc = "[S]earch current [W]ord" },
{ "<leader>sg", "<cmd>Telescope live_grep<CR>", desc = "[S]earch by [G]rep" },
{ "<leader>sG", "<cmd>LiveGrepGitRoot<CR>", desc = "[S]earch by [G]rep on Git Root" },
{ "<leader>sd", "<cmd>Telescope diagnostics<CR>", desc = "[S]earch [D]iagnostics" },
{ "<leader>sr", "<cmd>Telescope resume<CR>", desc = "[S]earch [R]esume" },
{ "<leader>nb", "<cmd>NotasBuscar<CR>", desc = "[N]otas [Buscar]" },
{ "<leader><leader>", "<cmd>Telescope buffers<CR>", desc = "Telescope para buffers" },
{ ",b", "<cmd>Telescope buffers<CR>", desc = "Telescope para buffers" },
{ ",B", "<cmd>Telescope builtin<CR>", desc = "Telescope para comandos internos" },
{ ",g", "<cmd>Telescope live_grep<CR>", desc = "Telescope para búsqueda en vivo con grep" },
{ ",r", "<cmd>Telescope registers<CR>", desc = "Telescope para registros" },
{ ",k", "<cmd>Telescope keymaps<CR>", desc = "keymaps" },
{ "<leader>l", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "ope para en el buffer actual" },
{ ",u", "<cmd>Telescope undo<CR>", desc = "Telescope para en el historial de deshacer" },
{ "<leader>u", "<cmd>Telescope undo<CR>", desc = "ope para en el historial de deshacer" },
{ ",T", "<cmd>Telescope treesitter<CR>", desc = "Telescope para en Treesitter" },
{ ",t", "<cmd>TodoTelescope<CR>", desc = "Telescope para TODOs" },
{ "<leader>tt", "<cmd>TodoTelescope<CR>", desc = "Telescope para TODOs" },
{ ",h", "<cmd>Telescope help_tags<CR>", desc = "Telescope para etiquetas de ayuda" },
{ ",m", "<cmd>Telescope marks<CR>", desc = "Telescope para marks" },
},

opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<Tab>'] = false,
        ['<Tab>'] = "select_default",
        ["<C-s>"] = "select_horizontal",
        ["<C-v>"] = "select_vertical",
        ["<C-h>"] = "which_key",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
      n = {
        ["<C-s>"] = "select_horizontal",
        ["<C-v>"] = "select_vertical",
      },

    },

    },


}
