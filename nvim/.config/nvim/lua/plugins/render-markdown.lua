return {
  "MeanderingProgrammer/render-markdown.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  opts = {
    heading = {
      enabled = true,
      sign = true,
      position = "overlay",
      icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
      signs = { "󰫎 " },
      width = "full",
      -- The 'level' is used to index into the list using a clamp
      -- Highlight for the heading and sign icons
      foregrounds = {
        "Constant",
        "Operator",
        "Type",
        "Function",
        "RenderMarkdownH1",
      },
    },
    link = {
      enabled = true,
      image = "󰥶 ",
      email = "󰀓 ",
      hyperlink = "󰌹 ",
      highlight = "RenderMarkdownLink",
      wiki = { icon = "󱗖 ", highlight = "RenderMarkdownWikiLink" },
      custom = {
        web = { pattern = "^http[s]?://", icon = "󰖟 ", highlight = "RenderMarkdownLink" },
      },
    },
    bullet = {
      -- Turn on / off list bullet rendering
      enabled = true,
      icons = { "", "→", "‣", "›", "●" },
      -- icons = { '◉', '○', '✸', '✿' },
      -- Padding to add to the left of bullet point
      -- left_pad = 2,
      -- Padding to add to the right of bullet point
      -- right_pad = 2,
      -- Highlight for the bullet icon
      -- highlight = "RenderMarkdownH1",
    },
    code = {
      style = "full",
      sign = "false",
      position = "right",
      width = "block",
      right_pad = 10,
      -- left_pad = 2,
      language_name = false,
    },
    checkbox = {
      -- Turn on / off checkbox state rendering
      enabled = true,
      -- Additional modes to render checkboxes
      render_modes = false,
      -- Determines how icons fill the available space:
      --  inline:  underlying text is concealed resulting in a left aligned icon
      --  overlay: result is left padded with spaces to hide any additional text
      position = "inline",
      unchecked = {
        -- Replaces '[ ]' of 'task_list_marker_unchecked'
        icon = "󰄱 ",
        -- Highlight for the unchecked icon
        highlight = "RenderMarkdownUnchecked",
        -- Highlight for item associated with unchecked checkbox
        scope_highlight = nil,
      },
      checked = {
        -- Replaces '[x]' of 'task_list_marker_checked'
        icon = "󰱒 ",
        -- Highlight for the checked icon
        highlight = "RenderMarkdownChecked",
        -- Highlight for item associated with checked checkbox
        scope_highlight = nil,
      },
      -- Define custom checkbox states, more involved as they are not part of the markdown grammar
      -- As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks
      -- Can specify as many additional states as you like following the 'todo' pattern below
      --   The key in this case 'todo' is for healthcheck and to allow users to change its values
      --   'raw':             Matched against the raw text of a 'shortcut_link'
      --   'rendered':        Replaces the 'raw' value when rendering
      --   'highlight':       Highlight for the 'rendered' icon
      --   'scope_highlight': Highlight for item associated with custom checkbox
      custom = {
        todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
        next = { raw = "[>]", rendered = " ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
        warn = { raw = "[!]", rendered = " ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
        noo = { raw = "[~]", rendered = "󰰱 ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
      },
    },
  },
  keys = {
    { "<leader>um", "<CMD>RenderMarkdown toggle<CR>", { desc = "Toggle RenderMarkdown" } },
  },
}
