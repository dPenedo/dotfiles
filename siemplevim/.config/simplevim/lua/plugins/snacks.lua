return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = false },
        explorer = { enabled = false },
        indent = { enabled = true },
        input = { enabled = false },
        picker = { enabled = true },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = true },
        dashboard = {
            preset = {
                keys = {
                    {
                        icon = " ",
                        key = "f",
                        desc = "Fitxategiak bilatu",
                        action = ":lua Snacks.dashboard.pick('files')",
                    },
                    { icon = " ", key = "s", desc = "Sesioa berreskuratu", section = "session" },
                    { icon = "󰩈 ", key = "q", desc = "Irten", action = ":qa" },
                },
                header = [[Simple Neovim]],
            },
        },
    },
    keys = {
        {
            "<leader>cR",
            function()
                Snacks.rename.rename_file()
            end,
            desc = "Rename File",
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
        -- Grep lines
        {
            "<leader>/",
            function()
                Snacks.picker.lines()
            end,
            desc = "Buffer Lines",
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
    },
}
