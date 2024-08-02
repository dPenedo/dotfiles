-- setups/snippets/snippets-python.lua

local ls = require("luasnip")
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node

local filename = function()
	local name = vim.fn.expand("%:t")
	name = name:gsub("%.py$", "") -- Remove .py extension
	name = name:gsub("_", " ") -- Replace underscores with spaces
	name = name:gsub("-", " ") -- Replace hyphens with spaces
	-- Capitalize the first letter
	name = name:gsub("^%l", string.upper)
	return { name }
end
local date = function() return { os.date('%d-%m-%Y') } end

ls.add_snippets("python", {
	-- print()
	snip({
		trig = "print",
		namr = "Print Statement",
		dscr = "Insert a print function",
	}, {
		text("print("),
		insert(1),
		text(")"),
	}),
	-- type()
	snip({
		trig = "type",
		namr = "type Statement",
		dscr = "Insert a type function",
	}, {
		text("type("),
		insert(1),
		text(")"),
	}),
	-- TODO
	snip({
		trig = "todo",
		namr = "TODO comment",
		dscr = "Insert a TODO comment",
	}, {
		text("# TODO: "),
	}),
	-- Add more Python snippets here
})
