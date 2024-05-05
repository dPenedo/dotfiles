return {
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      opts.config.center = {
        {
          action = "Telescope find_files",
          desc = " Find files",
          icon = " ",
          key = "f",
        },
        {
          action = "Telescope oldfiles",
          desc = " Recent Files",
          icon = " ",
          key = "r",
        },
        {
          action = 'lua require("persistence").load()',
          desc = " Restore Session",
          icon = " ",
          key = "s",
        },
        {
          action = "LazyExtras",
          desc = " Lazy Extras",
          icon = " ",
          key = "x",
        },
        {
          action = "Lazy",
          desc = " Lazy",
          icon = "󰒲 ",
          key = "l",
        },
        {
          action = "qa",
          desc = " Quit",
          icon = " ",
          key = "q",
        },
      }
    end,
  },
}
