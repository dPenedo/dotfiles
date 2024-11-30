# -- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<leader>wd")
-- vim.keymap.del("n", "<leader>l")
local map = LazyVim.safe_keymap_set

map("n", "<leader>w", "<cmd>update<cr>", { desc = "Windows", remap = true })
map("i", "jk", "<ESC>la", { desc = "Salir del modo de inserción y agregar una línea" })
map("n", "<leader>;", "m`A;<Esc>``", { desc = "Poner punto y coma al final" })
map("n", "'", "`", { desc = "backtick asignado a '" })
map("n", "zx", "zt6k6j", { desc = "Scrollear teniendo el cursor en el mismo sitio" })
map("n", "''", "<CMD>b#<CR>", { desc = "Ir al último búfer" })
map("n", "==", "<CMD>Format<CR>", { desc = "Formato al archivo" })
map("n", "<a-w>", ":set wrap!<CR>", { desc = "Alternar ajuste de línea" })

map("n", "<leader>k", "<CMD>bl<CR>", { desc = "Ir al búfer previo" })
map("n", "<leader>j", "<CMD>bn<CR>", { desc = "Ir al siguienteh búfer" })

-- Copiar/pegar Clipboard
map("v", "<leader>y", '"+y', { desc = "Copiar seleccion portapapeles" })
map("n", "<leader>y", 'm`V"+y``', { desc = "Copiar linea al portapapeles" })
map("n", "<leader>sp", "<CMD>Telescope registers<cr>", { desc = "Buscar registros en telescope" })
map("v", "<leader>sp", "<CMD>Telescope registers<cr>", { desc = "Buscar registros en telescope" })
map("n", "<leader>p", '"+p', { desc = "Pegar del portapapeles" })
map("v", "<leader>p", '"+p', { desc = "Pegar del portapapeles" })
map("n", "<leader>v", "ggVG", { desc = "Seleccionar todo" })

-- Notas --
-- Headings
vim.keymap.set("n", "#", function()
  -- Guarda la posición original del cursor
  local cursor_pos = vim.api.nvim_win_get_cursor(0)
  local line = vim.fn.getline(".")

  if line:match("^#") then
    -- Si la línea ya tiene un #, añade otro sin espacio
    vim.fn.setline(".", "#" .. line)
  else
    -- Si no tiene #, añade '# ' con un espacio
    vim.fn.setline(".", "# " .. line)
  end

  -- Restaura la posición del cursor y desplaza una columna a la derecha
  vim.api.nvim_win_set_cursor(0, { cursor_pos[1], cursor_pos[2] + 1 })
end, { desc = "Poner # al principio para headings con espacio si es necesario" })

-- New Notes
map("n", "<leader>nn", function()
  local filename = vim.fn.input("Enter file name: ", "", "file")
  if filename ~= "" then
    local filepath = "~/Documentos/Dropbox/Notas//" .. filename .. ".md"
    vim.fn.writefile({}, vim.fn.expand(filepath))
    vim.cmd("edit " .. vim.fn.expand(filepath))
  end
end, { desc = "[n]ew [n]otes" })
-- New Temp Notes
map("n", "<leader>nt", function()
  local filename = vim.fn.input("Enter Temp file name: ", "", "file")
  if filename ~= "" then
    local filepath = "~/Documentos/Dropbox/Notas/Temp/" .. filename .. ".md"
    vim.fn.writefile({}, vim.fn.expand(filepath))
    vim.cmd("edit " .. vim.fn.expand(filepath))
  end
end, { desc = "[n]ew [t]emp" })
-- New Atom Notes
map("n", "<leader>na", function()
  local filename = vim.fn.input("Enter Atom file name: ", "", "file")
  if filename ~= "" then
    local filepath = "~/Documentos/Dropbox/Notas/Atomoak/" .. filename .. ".md"
    vim.fn.writefile({}, vim.fn.expand(filepath))
    vim.cmd("edit " .. vim.fn.expand(filepath))
  end
end, { desc = "[n]ew [a]tom" })
-- New Note Link
map("i", "<A-=>", function()
  local telescope_builtin = require("telescope.builtin")
  telescope_builtin.find_files({
    prompt_title = "Selecciona una nota",
    cwd = "~/Documentos/Dropbox/Notas",
    attach_mappings = function(_, map_note)
      local function insert_link(prompt_bufnr)
        local entry = require("telescope.actions.state").get_selected_entry()
        require("telescope.actions").close(prompt_bufnr)
        if entry and entry.path then
          local filename = vim.fn.fnamemodify(entry.path, ":t:r") -- nombre del archivo sin extensión
          -- Reemplazar _ y - por espacios en la descripción
          local description = filename:gsub("[_-]", " ")
          local link = string.format("[[%s|%s]]", filename, description)
          vim.api.nvim_put({ link }, "", true, true)
        end
      end

      -- Mapear tanto <CR> como <C-i> a la función insert_link
      map_note("i", "<CR>", insert_link)
      map_note("i", "<C-l>", insert_link)

      return true
    end,
  })
end, { desc = "new link" })

