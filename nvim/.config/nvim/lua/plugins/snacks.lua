return {

  "folke/snacks.nvim",
  opts = {
    image = {
      enabled = true,
      doc = {
        inline = false,
        float = true,
        max_width = 60,
        max_height = 30,
      },
    },
    dashboard = {
      preset = {
        keys = {
          -- { icon = " ", key = "f", desc = "Fitxategiak bilatu", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "s", desc = "Sesioa berreskuratu", section = "session" },
          { icon = "󰩈 ", key = "q", desc = "Irten", action = ":qa" },
        },
        header = [[
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡶⠛⠉⠉⢹⡆⠀
      ⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⢰⡏⢀⡴⠀⠀⣾⠁⠀
      ⠰⣟⠋⠉⠙⠛⢶⣄⠀⠀⠀⢸⣷⠟⠁⣀⡼⠋⠀⠀
      ⠀⢻⡄⠀⠰⢦⣄⣹⡆⠀⠀⣼⠿⠛⠛⠉⠀⠀⠀⠀
      ⠀⠀⠻⢦⣄⣀⣈⣻⣿⡀⢰⡏⠀⠀⠀⠀⠀⣀⠀⠀
      ⠀⠀⠀⠀⠈⠉⠉⠉⠈⠻⣼⡇⠀⢀⡴⠛⠋⠉⢙⡿
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡇⢀⣾⣥⠾⠃⢀⣼⠃
      ⠀⠀⠀⠀⣤⣤⣤⣤⣀⠀⢸⣇⣼⠿⠷⠶⠶⠛⠁⠀
      ⠀⠀⠀⠀⢻⡄⠀⣤⣹⣧⢸⡿⠁⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠛⢶⣤⣽⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡇⠀⠀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡼⢧⣄⡀⠀⠀⠀⠀⠀⠀
      ⠀⠀⠀⠀⣀⣀⣤⣾⣋⣁⣀⣀⣈⣙⣷⣤⣀⣀⠀⠀
      ⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠀⠀
      ]],
      },
    },
    words = {
      enabled = false,
    },
  },
  keys = {
    {
      "<leader>fi",
      function()
        Snacks.picker.files()
      end,
      desc = "Find files",
    },
    {
      "<leader>fz",
      function()
        Snacks.picker.zoxide()
      end,
      desc = "zoxide",
    },
    {
      "<leader>fu",
      function()
        Snacks.picker.undo()
      end,
      desc = "undo",
    },
    {
      "<leader>fd",
      function()
        local find_command = {
          "fd",
          "--type",
          "d",
          "--color",
          "never",
        }

        vim.fn.jobstart(find_command, {
          stdout_buffered = true,
          on_stdout = function(_, data)
            if data then
              local filtered = vim.tbl_filter(function(el)
                return el ~= ""
              end, data)

              local items = {}
              for _, v in ipairs(filtered) do
                table.insert(items, { text = v })
              end

              ---@module 'snacks'
              Snacks.picker.pick({
                source = "directories",
                items = items,
                layout = { preset = "select" },
                format = "text",
                confirm = function(picker, item)
                  picker:close()
                  vim.cmd("Oil " .. item.text)
                end,
              })
            end
          end,
        })
      end,
      desc = "Search a directory and open it with Oil",
    },
  },
}
