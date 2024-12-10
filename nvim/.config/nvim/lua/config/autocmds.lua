-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- Format
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

  -- Crear nuevas notas
  vim.keymap.set("n", "<leader>nn", function()
    local filename = vim.fn.input("Enter file name: ", "", "file")
    if filename ~= "" then
      local filepath = "~/Documentos/Dropbox/Notas/" .. filename .. ".md"
      vim.fn.writefile({}, vim.fn.expand(filepath))
      vim.cmd("edit " .. vim.fn.expand(filepath))
    end
  end, { desc = "[n]ew [n]otes", buffer = true })

  -- Crear notas temporales
  vim.keymap.set("n", "<leader>nt", function()
    local filename = vim.fn.input("Enter Temp file name: ", "", "file")
    if filename ~= "" then
      local filepath = "~/Documentos/Dropbox/Notas/Temp/" .. filename .. ".md"
      vim.fn.writefile({}, vim.fn.expand(filepath))
      vim.cmd("edit " .. vim.fn.expand(filepath))
    end
  end, { desc = "[n]ew [t]emp", buffer = true })

  -- Crear notas atómicas
  vim.keymap.set("n", "<leader>na", function()
    local filename = vim.fn.input("Enter Atom file name: ", "", "file")
    if filename ~= "" then
      local filepath = "~/Documentos/Dropbox/Notas/Atomoak/" .. filename .. ".md"
      vim.fn.writefile({}, vim.fn.expand(filepath))
      vim.cmd("edit " .. vim.fn.expand(filepath))
    end
  end, { desc = "[n]ew [a]tom", buffer = true })

  -- Insertar enlaces a notas existentes
  vim.keymap.set("i", "<A-=>", function()
    local telescope_builtin = require("telescope.builtin")
    telescope_builtin.find_files({
      prompt_title = "Selecciona una nota",
      cwd = "~/Documentos/Dropbox/Notas",
      attach_mappings = function(_, map_note)
        local function insert_link(prompt_bufnr)
          local entry = require("telescope.actions.state").get_selected_entry()
          require("telescope.actions").close(prompt_bufnr)
          if entry and entry.path then
            local filename = vim.fn.fnamemodify(entry.path, ":t:r")
            local description = filename:gsub("[_-]", " ")
            local link = string.format("[[%s|%s]]", filename, description)
            vim.api.nvim_put({ link }, "", true, true)
          end
        end
        map_note("i", "<CR>", insert_link)
        map_note("i", "<C-l>", insert_link)
        return true
      end,
    })
  end, { desc = "new link", buffer = true })
end

-- Configura el autocomando para los archivos Markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = M.setup_markdown_keymaps,
})

return M
