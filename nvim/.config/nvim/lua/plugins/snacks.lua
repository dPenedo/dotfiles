return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    styles = {
      snacks_image = {
        relative = "editor",
        col = -1,
      },
    },
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
          { icon = " ", key = "f", desc = "Fitxategiak bilatu", action = ":lua Snacks.dashboard.pick('files')" },
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
    picker = {
      sources = {

        explorer = {
          layout = { layout = { position = "right" } },
        },
      },
    },
  },
  keys = {
    { "<leader><space>", false },
    { "<space><space>", false },
    { "<leader>/", false },
    { "<leader>fg", false },
    { "<leader>ff", false },
    {
      "<leader>Z",
      function()
        Snacks.zen.zoom()
      end,
      desc = "Toggle Zoom",
    },
    {
      "<leader>cR",
      function()
        Snacks.rename.rename_file()
      end,
      desc = "Rename File",
    },
    {
      "<leader>gB",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git Browse",
      mode = { "n", "v" },
    },
    {
      "<leader>gb",
      function()
        Snacks.git.blame_line()
      end,
      desc = "Git Blame Line",
    },
    {
      "<leader>un",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
    {
      "<leader><space>",
      "<CMD>lua Snacks.picker.buffers({current = false})<CR>",
      desc = "Buffers",
    },
    {
      "<leader>/",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<C-p>",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fi",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    -- find
    {
      "<leader>fc",
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Find Config File",
    },
    -- Grep
    {
      "<leader>/",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sB",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Grep Open Buffers",
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
      "<leader>fg",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    -- search
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
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
    -- explorer
    -- {
    --   "<leader>e",
    --   function()
    --     Snacks.picker.explorer()
    --   end,
    --   desc = "Explorer",
    -- },
  },
}
