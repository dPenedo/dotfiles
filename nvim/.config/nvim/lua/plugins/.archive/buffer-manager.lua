return {
  "j-morano/buffer_manager.nvim",
  opts = {
    width = 120,
    height = 30,
  },
  keys = {

    {
      "<leader><space>",
      "<CMD>lua require('buffer_manager.ui').toggle_quick_menu()<CR>",
      desc = "Toggle quick menu and initiate search",
      mode = { "n", "t" }, -- Aplica en modo normal y terminal
    },
    { "<leader>jj", "<CMD>lua require('buffer_manager.ui').nav_file(1)<CR>", desc = "Navfile 1" },
    { "<leader>jk", "<CMD>lua require('buffer_manager.ui').nav_file(2)<CR>", desc = "Navfile 2" },
    { "<leader>jl", "<CMD>lua require('buffer_manager.ui').nav_file(3)<CR>", desc = "Navfile 3" },
    { "<leader>j;", "<CMD>lua require('buffer_manager.ui').nav_file(4)<CR>", desc = "Navfile 4" },
  },
}
