local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local filename = function()
	local name = vim.fn.expand("%:t")
	name = name:gsub("%.md$", "") -- Remove .md extension
	name = name:gsub("_", " ") -- Replace underscores with spaces
	name = name:gsub("-", " ") -- Replace hyphens with spaces
	-- Capitalize the first letter
	name = name:gsub("^%l", string.upper)
	return { name }
end
local date = function() return { os.date('%d-%m-%Y') } end

ls.add_snippets("markdown", {
	-- Date
	snip({
		trig = "fecha",
		namr = "Fecha",
		dscr = "Fecha en formaro DD-MM-YYYY",
	}, {
		func(date, {}),
	}),
	-- List
	snip({
		trig = "lista",
		namr = "Lista",
		dscr = "Insert a list item with bold text",
	}, {
		text("- **"),
		insert(1),
		text("**: "),
		insert(0),
	}),
	-- Python code block
	snip({
		trig = "python",
		namr = "Código python",
		dscr = "code block python",
	}, {
		text({ "```python", "" }),
		insert(1),
		text({ "", "```" }),
		insert(0),
	}),
	-- Bash code block
	snip({
		trig = "bash",
		namr = "Código bash",
		dscr = "code block bash",
	}, {
		text({ "```bash", "" }),
		insert(1),
		text({ "", "```" }),
		insert(0),
	}),
	-- Java code block
	snip({
		trig = "java",
		namr = "Código java",
		dscr = "code block java",
	}, {
		text({ "```java", "" }),
		insert(1),
		text({ "", "```" }),
		insert(0),
	}),
	-- JavaScript code block
	snip({
		trig = "javascript",
		namr = "Código JavaScript",
		dscr = "code block JavaScript",
	}, {
		text({ "```javascript", "" }),
		insert(1),
		text({ "", "```" }),
		insert(0),
	}),
	-- Lua code block
	snip({
		trig = "lua",
		namr = "Código lua",
		dscr = "code block lua",
	}, {
		text({ "```lua", "" }),
		insert(1),
		text({ "", "```" }),
		insert(0),
	}),
	-- Etiquetas
	snip({
		trig = "output",
		namr = "Output en Python",
		dscr = "Comentario de output en python",
	}, {
		text({ "# Output: " }),
		insert(1),
	}),
	-- Output
	snip({
		trig = "relacionados",
		namr = "Relacionados",
		dscr = "Bloque de relacionados",
	}, {
		text({ "### Relacionados", "" }),
		text({ "- [[" }),
		insert(1),
		text({ "]]" }),
	}),
	-- Relacionados
	snip({
		trig = "relacionados",
		namr = "Relacionados",
		dscr = "Bloque de relacionados",
	}, {
		text({ "### Relacionados", "" }),
		text({ "- [[" }),
		insert(1),
		text({ "]]" }),
	}),
	-- Nueva nota
	snip({
		trig = "nueva",
		namr = "Nueva nota",
		dscr = "Insert una nueva nota",
	}, {
		text({ "# " }),
		func(filename, {}),
		text({
			"",
			"",
			"",
			"",
			"",
			"------------------",
			"Etiquetas: #"
		}),
	}),
	-- Nota temporal
	snip({
		trig = "temporal",
		namr = "Nueva nota temporal",
		dscr = "Insert una nueva nota temporal",
	}, {
		text({ "# " }),
		func(filename, {}),
		text({
			"",
			"",
			"",
			"",
			"",
			"------------------",
		}),
		text({
			"",
			"Fecha de creación: "
		}),
		func(date, {}),
		text({
			"",
			"Etiquetas: #"
		}),
	}),



})
