return {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require("luasnip")

    -- Cargar los snippets desde la carpeta 'lua' dentro de 'snippets'
    require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets/lua/" })
    -- Configuración global de LuaSnip
    ls.config.setup({
      update_events = "TextChanged,TextChangedI",
      enable_autosnippets = true,
    })
  end,
}
