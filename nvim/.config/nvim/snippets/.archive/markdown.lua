local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node

local date = os.date("%d-%m-%Y")

return {
  -- Snippet para crear un encabezado con el nombre del archivo
  s("nueva", {
    t("# "),
    f(function()
      local filename = vim.fn.expand("%:t:r")
      return filename:gsub("-", " ")
    end, {}),
    t({ "", "", "", "-------------------", "Etiquetas: #" }),
  }),

  -- Snippet temporal que incluye la fecha de creación
  s("temporal", {
    t("# "),
    f(function()
      local filename = vim.fn.expand("%:t:r")
      return filename:gsub("-", " ")
    end, {}),
    t({ "", "", "", "-------------------", "Fecha de creación: " .. date, "Etiquetas: #" }),
  }),

  -- Snippet para insertar la fecha actual
  s("fecha", {
    t("Fecha: "),
    f(function()
      return os.date("%d-%m-%Y")
    end, {}),
  }),

  -- Snippet para insertar un elemento de lista en negrita
  s("lista", {
    t("- **"),
    i(1, "Elemento"), -- Posición para editar el texto de la lista
    t("**: "),
    i(0, "Descripción"),
  }),

  -- Snippet para insertar un comentario de output en Python
  s("outputpython", {
    t("# Output: "),
    i(1, "Resultado"),
  }),

  -- Snippet para insertar un comentario de output en JavaScript
  s("outputjavascript", {
    t("// Output: "),
    i(1, "Resultado"),
  }),

  -- Snippet para crear un bloque de relacionados
  s("relacionados", {
    t("### Relacionados\n- [["),
    i(1, "Enlace relacionado"),
    t("]]"),
  }),

  -- Snippet para crear un checkbox
  s("checkbox", {
    t("- [ ] "),
    i(0, "Tarea por hacer"),
  }),
}
