-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6

reload("daniel.options")
reload("daniel.disable")
reload("daniel.telescope")
reload("daniel.alpha")
reload("daniel.plugins")
reload("daniel.notas")
reload("daniel.keymaps")




lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "fzf")
  pcall(telescope.load_extension, "undo")
  pcall(telescope.load_extension, "file_browser")
  -- any other extensions loading
end
