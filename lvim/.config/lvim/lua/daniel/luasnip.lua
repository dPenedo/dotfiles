local ls = require("luasnip")
local snip_loader = require("luasnip/loaders/from_vscode")
-- Load my snippets
snip_loader.lazy_load()
snip_loader.lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets/" })

ls.config.set_config({

  history = true,

  updateevents = "TextChanged, TextChangedI",

  enable_autosnippets = true,
})

ls.snippets = {
  all = {
    ls.parser.parse_snippet("expand", "--a gua gua la gua guaaa"),
  },
}
