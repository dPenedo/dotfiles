--[[

     Licensed under GNU General Public License v2
      * (c) 2013, Luca CPZ

--]]

local helpers = require("lain.helpers")
local wibox = require("wibox")
local tonumber = tonumber
local beautiful = require("beautiful") -- Añadir beautiful para acceder a la configuración del tema

-- {thermal,core} temperature info
-- lain.widget.temp

local function factory(args)
	args = args or {}

	local temp = { widget = args.widget or wibox.widget.textbox() }
	local timeout = args.timeout or 30
	-- local tempfile = args.tempfile or "/sys/devices/virtual/thermal/thermal_zone0/temp"
	local tempfile = "/sys/class/hwmon/hwmon1/temp1_input"

	local format = args.format or "%.1f"
	local settings = args.settings or function() end

	function temp.update()
		helpers.async({ "cat", tempfile }, function(f)
			local temp_value = tonumber(f)
			if temp_value then
				temp_value = temp_value / 1000 -- Convertir a grados Celsius
				coretemp_now = string.format(format, temp_value)
			else
				coretemp_now = "N/A"
			end
			-- temp.widget:set_text(coretemp_now) -- Actualizar el widget

			temp.widget:set_markup_silently(" <span font='" .. beautiful.font .. "'>" .. coretemp_now .. "</span>")

			settings()
		end)
	end

	helpers.newtimer("thermal", timeout, temp.update)

	return temp
end

return factory
