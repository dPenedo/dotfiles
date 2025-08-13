return {
  "crispgm/nvim-tabline",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional
  opts = {

    show_icon = true, -- show file extension icon
    modify_indicator = "󰈸",
    brackets = { " ", " " }, -- file name brackets surrounding
  },
  keys = {
    { "<leader>1", "<CMD>tabn 1<CR>", desc = "Ir a la pestaña 1" },
    { "<leader>2", "<CMD>tabn 2<CR>", desc = "Ir a la pestaña 2" },
    { "<leader>3", "<CMD>tabn 3<CR>", desc = "Ir a la pestaña 3" },
    { "<leader>4", "<CMD>tabn 4<CR>", desc = "Ir a la pestaña 4" },
    { "<leader>5", "<CMD>tabn 5<CR>", desc = "Ir a la pestaña 5" },
    { "<leader>6", "<CMD>tabn 6<CR>", desc = "Ir a la pestaña 6" },
    { "<leader>7", "<CMD>tabn 7<CR>", desc = "Ir a la pestaña 7" },
    { "<leader>8", "<CMD>tabn 8<CR>", desc = "Ir a la pestaña 8" },
    { "<leader>9", "<CMD>tabn 9<CR>", desc = "Ir a la pestaña 9" },
  },
}
