return {
  "hkupty/iron.nvim",
  config = function()
    local iron = require("iron.core")

    iron.setup({
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          sh = {
            command = { "zsh" },
          },
        },
        python = {
          command = { "python3" }, -- or { "ipython", "--no-autoindent" }
          format = require("iron.fts.common").bracketed_paste_python,

          block_dividers = { "# %%", "#%%" },
        },
        -- How the repl window will be displayed
        -- See below for more information
        repl_open_cmd = require("iron.view").right(80),
      },
      -- Iron doesn't set keymaps by default anymore.
      -- You can set them here or manually add keymaps to the functions in iron.core
      keymaps = {
        toggle_repl = "\rr", -- toggles the repl open and closed.
        -- If repl_open_command is a table as above, then the following keymaps are
        -- available
        -- toggle_repl_with_cmd_1 = "\rv",
        -- toggle_repl_with_cmd_2 = "\rh",
        send_motion = "\\sc",
        visual_send = "<leader><Cr>",
        send_file = "<leader>isf",
        send_line = "<leader>il",
        send_paragraph = "\\sp",
        send_until_cursor = "\\su",
        send_mark = "\\sm",
        send_code_block = "\\sb",
        send_code_block_and_move = "\\sn",
        mark_motion = "\\mc",
        mark_visual = "\\mc",
        remove_mark = "\\md",
        cr = "\\s<cr>",
        interrupt = "\\s<space>",
        exit = "\\sq",
        clear = "\\cl",
      },
      -- If the highlight is on, you can change how it looks
      -- For the available options, check nvim_set_hl
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
    })

    -- iron also has a list of commands, see :h iron-commands for all available commands
    vim.keymap.set("n", "<space>is", "<cmd>IronRepl<cr>")
    vim.keymap.set("n", "<space>ir", "<cmd>IronRestart<cr>")
    vim.keymap.set("n", "<space>if", "<cmd>IronFocus<cr>")
    vim.keymap.set("n", "<space>ih", "<cmd>IronHide<cr>")
  end,
}
