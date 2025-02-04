local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  s("className", {
    t('className="'),
    i(1),
    t('"'),
  }),
  s("commentJSX", {
    t("{/* "),
    i(1),
    t(" */}"),
  }),
  s("<>", {
    t({ "<>", "\t" }),
    i(1),
    t({ "", "</>" }),
  }),
  s("rfc", {
    t({ "export const " }),
    f(function(args)
      return vim.fn.expand("%:t:r") -- Obtiene el nombre del archivo sin extensión
    end, {}),
    t({ " = () => {", "\treturn (", "\t\t<div>", "\t\t\t" }),
    i(1),
    t({ "", "\t\t</div>", "\t);", "};" }),
  }),
}
