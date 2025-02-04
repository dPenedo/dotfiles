local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("todo", {
    t("// TODO: "),
    i(1),
  }),
  s("warn", {
    t("// WARN: "),
    i(1),
  }),
  s("note", {
    t("// NOTE: "),
    i(1),
  }),
}
