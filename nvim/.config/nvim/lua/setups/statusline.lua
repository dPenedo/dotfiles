local function git_branch()
  local branch = vim.fn.system "git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'"
  if string.len(branch) > 0 then
    return branch
  else
    return ':'
  end
end

local function statusline()
  local winbar_color = '%#Winbar#'
  local diff_change_color = '%#DiffChange#'
  local diff_text_color = '%#DiffText#'
  local WarningMsg = '%#WarningMsg#'

  local branch = ' ' .. git_branch() .. ' '
  local file_name = ' %f '
  local modified = '%m'
  local align_right = '%='
  local fileencoding = ' %{&fileencoding?&fileencoding:&encoding}'
  local fileformat = ' [%{&fileformat}]'
  local filetype = ' %y'
  local separator = ' '

  -- local linecol = ' L:%#Title#%l%#NormalFloat#/%L | C:%c'
  local linecol = ' L:%l/%L | C:%c'

  return string.format(
    '%s %s %s%s%s%s%s%s%s%s',
    diff_text_color,
    branch,
    diff_change_color,
    file_name,
    WarningMsg,

    modified,
    diff_change_color,
    align_right,
    -- diff_text_color,
    diff_text_color,
    linecol,
    separator
  )
end

vim.opt.statusline = statusline()
