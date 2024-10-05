local function git_branch()
	local branch = vim.fn.system "git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'"
	if string.len(branch) > 0 then
		return branch
	else
		return ':'
	end
end

local function statusline()
	-- Grupos de colores basados en el esquema de color actual
	local git_branch_color = '%#ColorColumn#' -- Usa colores de Gitsigns si está instalado
	local file_name_color = '%#Directory#'  -- Usa el color del directorio para el nombre del archivo
	local modified_color = '%#WarningMsg#'  -- Color para archivos modificados
	local default_color = '%#Normal#'       -- Color por defecto para el resto de la línea
	local align_right = '%='                -- Para alinear a la derecha

	local branch = ' ' .. git_branch() .. ' '
	local file_name = ' %f '
	local modified = '%m'
	local linecol = ' L:%l/%L ' -- Muestra el número de línea actual y el total

	return string.format(
		'%s%s%s%s%s%s%s%s%s',
		git_branch_color,
		branch,
		file_name_color,
		file_name,
		modified_color,
		modified,
		align_right,
		git_branch_color,
		linecol
	)
end

vim.opt.statusline = statusline()
