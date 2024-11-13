-- Keymaps are automatically loaded on the VeryLazy event
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
      map_note("i", "<CR>", function(prompt_bufnr)
        local entry = require("telescope.actions.state").get_selected_entry()
        require("telescope.actions").close(prompt_bufnr)
        if entry and entry.path then
          local filename = vim.fn.fnamemodify(entry.path, ":t:r") -- nombre del archivo sin extensión
          -- Reemplazar _ y - por espacios en la descripción
          local description = filename:gsub("[_-]", " ")
          local link = string.format("[[%s|%s]]", filename, description)
          vim.api.nvim_put({ link }, "", true, true)
        end
      end)
      return true
    end,
  })
end, { desc = "new link" })

-- Toggle Inlay Hints keymap
map(
  "n",
  "<leader>ci",
  [[:lua local is = vim.lsp.inlay_hint.is_enabled() vim.lsp.inlay_hint.enable(not is, nil)<CR>]],
  { desc = "Toggle [C]ode [I]nlay hints" }
)
