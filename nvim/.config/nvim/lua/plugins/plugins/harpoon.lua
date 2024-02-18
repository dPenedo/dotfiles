return {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon").setup()
  end,
  keys = {
    { "<leader>sa", function() require("harpoon"):list():append() end,  desc = "harpoon file", },
    {
      "<leader>ss",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "harpoon quick menu",
    },
    { "<leader>sj", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
    { "<leader>sk", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
    { "<leader>sl", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
    { "<leader>sñ", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
    { "<leader>sh", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
  },
}
