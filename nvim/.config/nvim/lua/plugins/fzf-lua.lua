return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "junegunn/fzf",
  },
  config = function()
    local fzf = require("fzf-lua")

    fzf.setup({
      winopts = {
        height = 0.85,
        width = 0.80,
        row = 0.30,
        col = 0.50,
        border = "rounded",
        preview = {
          horizontal = "right:60%",
        },
        layout = "horizontal",
        prompt = "> ",
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
        },
        fzf = {
          ["ctrl-s"] = "toggle-preview",
          ["ctrl-x"] = "toggle-preview-wrap",
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
    { "<leader>/", "<CMD>FzfLua blines<CR>", { desc = "Fzf current buffer" } },
    { "<leader>fg", "<CMD>FzfLua live_grep<CR>", { desc = "Fzf current buffer" } },
    { "<leader>ff", "<CMD>FzfLua files<CR>", { desc = "Fzf files on project" } },
    { "<c-p>", "<CMD>FzfLua files <CR>", { desc = "Fzf lua files" } },
    {
      "<leader><space>",
      "<CMD>FzfLua buffers<CR>",
      { desc = "FzfLua buffers" },
    },
  },
}
