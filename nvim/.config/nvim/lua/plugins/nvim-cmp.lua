return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      -- ["<C-l>"] = cmp.mapping.confirm({ select = true }),
      ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
      -- ["<CR>"] = cmp.config.disable,
    })

    opts.experimental = opts.experimental or {}
    opts.experimental.ghost_text = false
    return opts
  end,
}
