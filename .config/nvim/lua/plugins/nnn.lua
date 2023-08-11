return {
  {
    "luukvbaal/nnn.nvim",
    config = function()
      require("nnn").setup()
      picker = {
        cmd = "nnn -Pp",
        style = {
          width = 0.98, -- percentage relative to terminal size when < 1, absolute otherwise
          height = 0.98,
        },
      }
    end,
  },
}
