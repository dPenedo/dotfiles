return {
  {
    "dpenedo/kanagawa.nvim",
    lazy = false,
    opts = {
      compile = true,
      transparent = false,
      -- functionStyle = { bold = true },
      dimInactive = true,
      typeStyle = { bold = false },
      keywordStyle = { bold = false },
      overrides = function(colors)
        return {
          ["@markup.strong.markdown_inline"] = { fg = colors.palette.oniViolet2, bold = true },
        }
      end,
    },
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    opts = {
      compile = true,
      transparent = false,
      -- functionStyle = { bold = true },
      dimInactive = true,
      typeStyle = { bold = false },
      keywordStyle = { bold = false },
      overrides = function(colors)
        return {
          ["@markup.strong.markdown_inline"] = { fg = colors.palette.oniViolet2, bold = true },
        }
      end,
    },
  },
}
