return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "junegunn/fzf",
  },
  config = function()
    local fzf = require("fzf-lua")

    fzf.setup({
      winopts = {
        height = 0.7,
        width = 0.7,
        row = 0.3,
        border = "rounded",
        treesitter = { enabled = false },
        preview = { hidden = false },
      },
      keymap = {
        builtin = {
          ["<C-u>"] = "preview-up",
          ["<C-d>"] = "preview-down",
          ["<C-s>"] = "split",
          ["<C-v>"] = "vsplit",
          ["<C-j>"] = "down",
          ["<C-k>"] = "up",
          ["<C-l>"] = "select",
          ["<C-p>"] = "toggle-preview",
        },
      },
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
    { "<leader>/", "<CMD>FzfLua blines fzf_colors=false<CR>", { desc = "Fzf current buffer" } },
    { "<leader>fg", "<CMD>FzfLua live_grep fzf_colors=false<CR>", { desc = "Fzf current buffer" } },
    { "<leader>ff", "<CMD>FzfLua files fzf_colors=false<CR>", { desc = "Fzf files on project" } },
    { "<c-p>", "<CMD>FzfLua files fzf_colors=false<CR>", { desc = "Fzf lua files" } },
    {
      "<leader><space>",
      "<CMD>FzfLua buffers fzf_colors=false<CR>",
      { desc = "FzfLua buffers" },
    },
  },
}
