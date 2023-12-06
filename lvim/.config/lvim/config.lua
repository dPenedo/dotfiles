-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6

reload("daniel.options")
reload("daniel.disable")
reload("daniel.alpha")
reload("daniel.plugins")
reload("daniel.telescope")
reload("daniel.notas")
reload("daniel.prueba")
reload("daniel.keymaps")

-- NvimTree
lvim.builtin.nvimtree.setup.view.side = "right"

lvim.colorscheme = "kanagawa"

lvim.format_on_save = true
lvim.builtin.cmp.preselect = true
