local ls = require 'luasnip'
local p = ls.parser
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local sn = ls.snippet_node


local v = {
    p.parse_snippet('ti', 'import $1 from "$2"'),
    p.parse_snippet('ti', 'import $1 from "$2"'),
    -- p.parse_snippet('cl', 'console.log({$1})'),
    p.parse_snippet('cl', 'console.log($1)'),
}
ls.add_snippets("all", {
    s("trigger", {
        t({ "After expanding, the cursor is here ->" }), i(1),
        t({ "", "After jumping forward once, cursor is here ->" }), i(2),
        t({ "", "After jumping once more, the snippet is exited there ->" }), i(0),
    })
})

ls.add_snippets("markdown", {
    s("Tag", {
        t({ "### Tags:", "- " })
    })
})


ls.add_snippets(nil, {
    javascript = v,
    javascriptreact = v,
    typescript = v,
    typescriptreact = v,
    rust = {
        p.parse_snippet('pp', 'println!("{}",$1)'),
    },
    java = {
        p.parse_snippet('pp', 'System.out.println($1)'),
    },
})
