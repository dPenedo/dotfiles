return {
  -- Better `vim.notify()`
  "rcarriga/nvim-notify",
  opts = {
    "compact",
    stages = "fade",
    timeout = 500,
    max_height = function()
      return math.floor(vim.o.lines * 0.25)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.25)
    end,
  },
  init = function()
    -- when noice is not enabled, install notify on VeryLazy
    local Util = require("lazyvim.util")
    if not Util.has("noice.nvim") then
      Util.on_very_lazy(function()
        vim.notify = require("notify")
      end)
    end
  end,
  -- {
  --   "folke/noice.nvim",
  --   opts = {
  --     messages = {
  --       enable = false,
  --     },
  --     errors = {
  --       enable = false,
  --     },
  --   },
  -- },
}
