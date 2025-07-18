return {
  "folke/noice.nvim",
  event = "VeryLazy",
  config = function()
    local noice = require("noice")
    noice.setup({
      routes = {
        {
          view = "notify",
          filter = { event = "msg_showmode" },
        },
      },
    })
  end,
}
