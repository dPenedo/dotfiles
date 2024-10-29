local function git_branch()
  local branch = vim.fn.system "git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'"
  if string.len(branch) > 0 then
    return branch
  else
    return ':'
  end
end

-- WARN:no se actualiza
local function lsp()
  local count = {}
  local levels = {
    errors = 'Error',
    warnings = 'Warn',
    info = 'Info',
    hints = 'Hint',
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ''
  local warnings = ''
  local hints = ''
  local info = ''

  if count['errors'] ~= 0 then
    errors = ' %#DiagnosticError# ' .. count['errors']
  end
  if count['warnings'] ~= 0 then
    warnings = ' %#WarningMsg# ' .. count['warnings']
  end
  if count['hints'] ~= 0 then
    hints = ' %#LspDiagnosticsSignHint# ' .. count['hints']
  end
  if count['info'] ~= 0 then
    info = ' %#LspDiagnosticsSignInformation# ' .. count['info']
  end

  return errors .. warnings .. hints .. info .. '%#Normal#'
end

local function statusline()
  -- local color_column = '%#ColorColumn#' -- Usa colores de Gitsigns si está instalado
  local color_column = '%#CursorLineNr#' -- Usa colores de Gitsigns si está instalado
  local file_name_color = '%#Directory#' -- Usa el color del directorio para el nombre del archivo
  local modified_color = '%#WarningMsg#' -- Color para archivos modificados
  local default_color = '%#Normal#' -- Color por defecto para el resto de la línea
  local align_right = '%=' -- Para alinear a la derecha
  local lsp_info = '' .. lsp()
  local branch = '  ' .. git_branch() .. ' '
  local file_name = ' %f '
  local modified = '%m'
  local linecol = ' l:%l/%L ' -- Muestra el número de línea actual y el total

  return string.format(
    '%s%s%s%s%s%s%s%s%s%s%s',
    color_column,
    branch,
    lsp_info,
    file_name_color,
    file_name,
    modified_color,
    modified,
    file_name_color,
    align_right,
    color_column,
    linecol
  )
end

-- Asigna la statusline generada a la opción de statusline
vim.opt.statusline = statusline()
