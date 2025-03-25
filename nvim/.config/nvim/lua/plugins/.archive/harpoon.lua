return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()
    -- Tus keymaps originales con <leader>j
    vim.keymap.set("n", "<leader>ja", function()
      harpoon:list():add()
    end, { desc = "Tag a file" })
    vim.keymap.set("n", "<leader>jf", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Toggle tags menu" })
    vim.keymap.set("n", "<leader>jj", function()
      harpoon:list():select(1)
    end, { desc = "Select first tag" })
    vim.keymap.set("n", "<leader>jk", function()
      harpoon:list():select(2)
    end, { desc = "Select second tag" })
    vim.keymap.set("n", "<leader>jl", function()
      harpoon:list():select(3)
    end, { desc = "Select third tag" })
    vim.keymap.set("n", "<leader>j;", function()
      harpoon:list():select(4)
    end, { desc = "Select fourth tag" })
  end,
}
