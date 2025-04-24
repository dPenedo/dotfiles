-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Configuración de spell para archivos markdown y text
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- Crear nuevas notas (global)
vim.keymap.set("n", "<leader>nn", function()
  local filename = vim.fn.input("Enter file name: ", "", "file")
  if filename ~= "" then
    local filepath = "~/Documentos/Dropbox/Notas/" .. filename .. ".md"
    vim.fn.writefile({}, vim.fn.expand(filepath))
    vim.cmd("edit " .. vim.fn.expand(filepath))
  end
end, { desc = "[n]ew [n]otes" })

-- Crear notas temporales (global)
vim.keymap.set("n", "<leader>nt", function()
  local filename = vim.fn.input("Enter Temp file name: ", "", "file")
  if filename ~= "" then
    local filepath = "~/Documentos/Dropbox/Notas/Temp/" .. filename .. ".md"
    vim.fn.writefile({}, vim.fn.expand(filepath))
    vim.cmd("edit " .. vim.fn.expand(filepath))
  end
end, { desc = "[n]ew [t]emp" })

-- Crear notas atómicas (global)
vim.keymap.set("n", "<leader>na", function()
  local filename = vim.fn.input("Enter Atom file name: ", "", "file")
  if filename ~= "" then
    local filepath = "~/Documentos/Dropbox/Notas/Atomoak/" .. filename .. ".md"
    vim.fn.writefile({}, vim.fn.expand(filepath))
    vim.cmd("edit " .. vim.fn.expand(filepath))
  end
end, { desc = "[n]ew [a]tom" })

-- Formatear archivo
vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

local M = {}

-- Configuración de keymaps específicos para Markdown
function M.setup_markdown_keymaps()
  -- Alternar '- ' al inicio de la línea
  vim.keymap.set("n", "<leader>-", function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local line = vim.fn.getline(".")
    if line:match("^%- ") then
      line = line:gsub("^%- ", "")
    else
      line = "- " .. line
    end
    vim.fn.setline(".", line)
    vim.api.nvim_win_set_cursor(0, { cursor_pos[1], math.min(#line, cursor_pos[2]) })
  end, { desc = "Alternar '- ' al inicio de la línea", buffer = true })

  -- Alternar checkboxes
  vim.keymap.set("n", "<leader>ch", function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local line = vim.fn.getline(".")
    if line:match("^%- %[ %]") then
      line = line:gsub("%- %[ %]", "- [x]")
    elseif line:match("^%- %[x%]") then
      line = line:gsub("%- %[x%]", "- [ ]")
    else
      line = "- [ ] " .. line
    end
    vim.fn.setline(".", line)
    vim.api.nvim_win_set_cursor(0, { cursor_pos[1], math.min(#line, cursor_pos[2]) })
  end, { desc = "Alternar checkboxes markdown", buffer = true })

  -- Headings
  vim.keymap.set("n", "#", function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local line = vim.fn.getline(".")
    if line:match("^#") then
      vim.fn.setline(".", "#" .. line)
    else
      vim.fn.setline(".", "# " .. line)
    end
    vim.api.nvim_win_set_cursor(0, { cursor_pos[1], cursor_pos[2] + 1 })
  end, { desc = "Poner # al principio para headings con espacio si es necesario", buffer = true })

  -- Insertar plantilla de nota
  vim.keymap.set("n", "<A-n>", function()
    local filename = vim.fn.expand("%:t:r") -- Obtiene el nombre del archivo sin extensión
    local title = "# " .. filename:gsub("-", " ") -- Reemplaza los guiones por espacios

    -- Define el cuerpo del snippet
    local snippet = {
      title,
      "",
      "",
    }

    -- Inserta el snippet en el buffer
    vim.api.nvim_put(snippet, "", false, true)
  end, { desc = "Insertar plantilla de nota", buffer = true })

  -- Insertar enlaces a notas existentes usando Telescope
  vim.keymap.set("i", "<A-=>", function()
    local telescope = require("telescope.builtin")

    -- Función para insertar el enlace markdown
    local insert_markdown_link = function(selected)
      if selected and #selected > 0 then
        local path = selected[1]
        local filename = vim.fn.fnamemodify(path, ":t:r")
        local description = filename:gsub("[_-]", " ")
        local link = string.format("[[%s|%s]]", filename, description)

        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        local row = cursor_pos[1] - 1 -- Lua es 0-based para las filas
        local col = cursor_pos[2]
        local line = vim.api.nvim_buf_get_lines(0, row, row + 1, false)[1]

        -- Insertar preservando el espacio después del cursor
        local new_line = line:sub(1, col) .. link .. line:sub(col + 1)
        vim.api.nvim_buf_set_lines(0, row, row + 1, false, { new_line })

        -- Mover el cursor después del enlace insertado
        vim.api.nvim_win_set_cursor(0, { cursor_pos[1], col + #link })
      end
    end

    -- Abrir el selector de Telescope para buscar archivos en la carpeta de notas
    telescope.find_files({
      prompt_title = "Selecciona una nota",
      cwd = "~/Documentos/Dropbox/Notas", -- Ruta de la carpeta de notas
      attach_mappings = function(_, map)
        -- Mapear la tecla <CR> (Enter) para ejecutar la acción personalizada
        map("i", "<CR>", function(prompt_bufnr)
          local selected = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
          require("telescope.actions").close(prompt_bufnr) -- Cerrar Telescope
          insert_markdown_link({ selected.value }) -- Pasar la ruta seleccionada a la función
        end)
        map("n", "<CR>", function(prompt_bufnr)
          local selected = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
          require("telescope.actions").close(prompt_bufnr) -- Cerrar Telescope
          insert_markdown_link({ selected.value }) -- Pasar la ruta seleccionada a la función
        end)
        return true
      end,
    })
  end, { desc = "Insertar enlace a nota existente", buffer = true })
end

-- Configura el autocomando para los archivos Markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = M.setup_markdown_keymaps,
})

-- Entrar al terminal en modo insert
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert")
  end,
})

return M
