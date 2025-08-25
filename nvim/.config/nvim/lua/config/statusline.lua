local function git_branch()
  local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  if string.len(branch) > 0 then
    return branch
  else
    return ":"
  end
end

local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = "lualine_a_normal" })
if ok and hl.bg then
  vim.api.nvim_set_hl(0, "StatusColumn", hl)
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
    errors = " %#DiagnosticError#  " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#DiagnosticWarn#  " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#DiagnosticHint#  " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#DiagnosticInfo#  " .. count["info"]
  end

  return errors .. warnings .. hints .. info
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
    local keys = { "fj", "fk", "fl", "f;" }
    index = keys[index] or index
  end
  return " 󰛢 " .. index .. " "
end

local function spaced(text)
  return " " .. text .. " "
end

local function modified_icon()
  if vim.bo.modified then
    return "   " -- o el icono que quieras
  else
    return ""
  end
end

local function statusline_focused()
  -- Styles
  local color_column = "%#StatusLine#"
  local file_name_color = "%#Normal#"
  local modified_color = "%#MatchParen#"
  local accent_color = "%#Title#"
  local align_right = "%="
  -- Content
  local lsp_info = spaced(lsp())
  local branch = spaced(" " .. git_branch())
  -- local file_name = spaced(vim.fn.expand("%:."))
  local buf = "%:." .. vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local file_name = (vim.fn.expand(buf) == "" and "Empty") or spaced(vim.fn.expand(buf .. ":t"))

  local modified = modified_icon()
  local grapple_info = grapple()
  local linecol = spaced("Col %c | Ln %l/%L")
  return string.format(
    "%s%s%s%s%s%s%s%s%s%s%s%s%s",
    color_column,
    branch,
    file_name_color,
    file_name,
    lsp_info,
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
  local file_name_color = "%#StatusLineNC#"
  local buf = "#" .. vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local file_name = (vim.fn.expand(buf) == "" and "Empty") or vim.fn.expand(buf .. ":t")
  local modified = "%m"

  return string.format("%s%s%s", file_name_color, file_name, modified)
end

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
