return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "junegunn/fzf",
  },
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({
      winopts = {
        height = 0.6,
        width = 0.6,
        row = 0.2,
        col = 0.2,
        border = "single",
        treesitter = { enabled = false },
        preview = { hidden = true },
      },
      keymap = {
        builtin = {
          ["<C-s>"] = "split",
          ["<C-v>"] = "vsplit",
          ["<C-j>"] = "down",
          ["<C-k>"] = "up",
          ["<C-l>"] = "select",
          ["<C-p>"] = "toggle-preview",
          ["<down>"] = "preview-down",
          ["<up>"] = "preview-up",
          ["<F1>"] = "toggle-help",
        },
      },

      -- files = {
      --   git_icons = false, -- show git icons?
      --   file_icons = false, -- show file icons (true|"devicons"|"mini")?
      --   color_icons = false, -- colorize file|git icons
      -- },
      -- buffers = {
      --   git_icons = false, -- show git icons?
      --   file_icons = false, -- show file icons (true|"devicons"|"mini")?
      --   color_icons = false, -- colorize file|git icons
      -- },
      actions = {
        files = {
          ["default"] = fzf.actions.file_edit,
          ["ctrl-s"] = fzf.actions.file_split,
          ["ctrl-v"] = fzf.actions.file_vsplit,
        },
      },
    })

    -- Opciones de comandos para fzf-lua
  end,
  keys = {

    -- disable the keymap to grep files
    { "<leader><space>", false },
    { "<leader>/", false },
    { "<leader>fg", false },
    { "<leader>/", "<CMD>FzfLua blines fzf_colors=true<CR>", { desc = "Fzf current buffer" } },
    { "<leader>fg", "<CMD>FzfLua live_grep fzf_colors=true<CR>", { desc = "Fzf current buffer" } },
    { "<leader>ff", "<CMD>FzfLua files fzf_colors=true<CR>", { desc = "Fzf files on project" } },
    { "<c-p>", "<CMD>FzfLua files fzf_colors=true<CR>", { desc = "Fzf lua files" } },
    {
      "<leader><space>",
      "<CMD>FzfLua buffers fzf_colors=true<CR>",
      { desc = "FzfLua buffers" },
    },
  },
}
