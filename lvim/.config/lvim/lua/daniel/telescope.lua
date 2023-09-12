-- Telescope
lvim.builtin.telescope.theme = "ivy"
lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "undo")
  -- any other extensions loading
end
