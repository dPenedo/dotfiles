local function git_branch()
  local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  if string.len(branch) > 0 then
    return branch
  else
    return ":"
  end
end

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }
  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " %#DiagnosticError# " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#DiagnosticWarn# " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#DiagnosticHint# " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#DiagnosticInfo# " .. count["info"]
  end

  return errors .. warnings .. hints .. info .. "%#Normal#"
end

local function grapple()
  if not package.loaded["grapple"] then
    return ""
  end
  local ok, grapple_api = pcall(require, "grapple")
  if not ok then
    return ""
  end
  if not grapple_api.exists() then
    return ""
  end
  local index = grapple_api.name_or_index()
  if type(index) == "number" then
    local keys = { "jj", "jk", "jl", "j;" }
    index = keys[index] or index
  end
  return " 󰛢 " .. index .. " "
end

local function statusline_focused()
  local color_column = "%#ColorColumn#"
  local file_name_color = "%#StatusLine#"
  local modified_color = "%#WarningMsg#"
  local accent_color = "%#Title#"
  local align_right = "%="
  local lsp_info = lsp() .. " "
  local branch = "  " .. git_branch() .. " "
  local file_name = " %f "
  local modified = "%m"
  local grapple_info = grapple()
  local linecol = "Col %c | Ln %l/%L"
  return string.format(
    "%s%s%s%s%s%s%s%s%s%s%s%s%s%s",
    color_column,
    branch,
    file_name_color,
    lsp_info,
    file_name_color,
    file_name,
    modified_color,
    modified,
    accent_color,
    grapple_info,
    file_name_color,
    align_right,
    color_column,
    linecol
  )
end

local function statusline_not_focused()
  local file_name_color = "%#StatusLine#"
  local file_name = " %f "
  local modified = "%m"

  return string.format("%s%s%s", file_name_color, file_name, modified)
end

-- Exponer la función statusline en el ámbito global
_G.statusline = statusline

-- Hacer que la statusline sea reactiva
function gen_statusline()
  local focus = vim.g.statusline_winid == vim.fn.win_getid()
  if focus then
    return statusline_focused()
  else
    return statusline_not_focused()
  end
end

vim.o.statusline = "%!v:lua.gen_statusline()"

-- Actualizar la statusline cuando cambian los diagnósticos de LSP
vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function()
    vim.cmd("redrawstatus")
  end,
})

-- Actualizar la statusline cuando cambia el buffer o se guarda un archivo
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  callback = function()
    vim.cmd("redrawstatus")
  end,
})
