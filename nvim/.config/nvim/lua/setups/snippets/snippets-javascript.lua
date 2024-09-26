local ls = require 'luasnip'
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node

-- Función para extraer y formatear el nombre de archivo
local filename = function()
	local name = vim.fn.expand '%:t'
	name = name:gsub('%.js$', '')       -- Remover extensión .js
	name = name:gsub('%.jsx$', '')      -- Remover extensión .jsx
	name = name:gsub('_', ' ')          -- Reemplazar guiones bajos con espacios
	name = name:gsub('-', ' ')          -- Reemplazar guiones con espacios
	name = name:gsub('^%l', string.upper) -- Capitalizar la primera letra
	return { name }
end

-- Snippets compartidos
local snippets_js = {
	-- className=""
	snip({
		trig = 'className',
		namr = 'className',
		dscr = 'Insert className for React',
	}, {
		text 'className="',
		insert(1),
		text '"',
	}),
	-- Comment on JSX
	snip({
		namr = 'commentJSX',
		trig = 'commentJSX',
		dscr = 'Comment on JSX',
	}, {
		text '{/* ',
		insert(1),
		text ' */}',
	}),
	-- Empty tag on JSX
	snip({
		namr = '<></>',
		trig = '<>',
		dscr = 'Empty tag  on JSX',
	}, {
		text '<>',
		insert(1),
		text '',
		text '</>',
	}),
	-- Arrow function
	-- Component with export
	snip({
		trig = 'rfc',
		namr = 'React Functional Component',
		dscr = 'Create a React functional component',
	}, {
		text 'export const ',
		func(filename, {}),
		text ' = () => {',
		text '\n  return (',
		text '\n    <div>',
		insert(1),
		text '</div>',
		text '\n  );',
		text '\n};',
	}),
}

-- Agregar los snippets para 'javascript' y 'javascriptreact'
ls.add_snippets('javascript', snippets_js)
ls.add_snippets('javascriptreact', snippets_js)
