return {
  "leath-dub/snipe.nvim",
  opts = {
    ui = {
      position = "center",
      preselect_current = true,
      text_align = "right",
    },
    hints = {
      dictionary = "asdflewcmpghio",
    },
    navigate = {
      cancel_snipe = "q",
      open_split = "S",
      change_tag = "T",
    },
  },
  keys = {
    {
      "<leader>k",
      function()
        require("snipe").open_buffer_menu()
      end,
      desc = "Open Snipe buffer menu",
    },
  },
}
