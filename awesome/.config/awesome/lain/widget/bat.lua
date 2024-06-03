local helpers = require("lain.helpers")
local fs = require("gears.filesystem")
local naughty = require("naughty")
local wibox = require("wibox")
local math = math
local string = string
local ipairs = ipairs
local tonumber = tonumber

local function factory(args)
	local pspath = args.pspath or "/sys/class/power_supply/"

	if not fs.is_dir(pspath) then
		naughty.notify({ text = "lain.widget.bat: invalid power supply path", timeout = 0 })
		return
	end

	args = args or {}

	local bat = { widget = args.widget or wibox.widget.textbox() }
	local timeout = args.timeout or 30
	local notify = args.notify or "on"
	local full_notify = args.full_notify or notify
	local n_perc = args.n_perc or { 5, 15 }
	local batteries = args.batteries or (args.battery and { args.battery }) or {}
	local ac = args.ac or "AC0"
	local settings = args.settings or function() end

	function bat.get_batteries()
		helpers.line_callback("ls -1 " .. pspath, function(line)
			local bstr = string.match(line, "BAT%w+")
			if bstr then
				batteries[#batteries + 1] = bstr
			else
				ac = string.match(line, "A%w+") or ac
			end
		end)
	end

	if #batteries == 0 then
		bat.get_batteries()
	end

	bat_notification_critical_preset = {
		title = "Battery exhausted",
		text = "Shutdown imminent",
		timeout = 30,
		fg = "#000000",
		bg = "#FFFFFF",
	}

	bat_notification_low_preset = {
		title = "Battery low",
		text = "Plug the cable!",
		timeout = 15,
		fg = "#202020",
		bg = "#CDCDCD",
	}

	bat_notification_charged_preset = {
		title = "Battery full",
		timeout = 15,
		fg = "#202020",
		bg = "#CDCDCD",
	}

	bat_now = {
		status = "N/A",
		ac_status = "N/A",
		perc = "N/A",
		time = "N/A",
		watt = "N/A",
		capacity = "N/A",
	}

	bat_now.n_status = {}
	bat_now.n_perc = {}
	bat_now.n_capacity = {}
	for i = 1, #batteries do
		bat_now.n_status[i] = "N/A"
		bat_now.n_perc[i] = 0
		bat_now.n_capacity[i] = 0
	end

	local fullnotification = false

	function bat.update()
		local sum_rate_current = 0
		local sum_rate_voltage = 0
		local sum_rate_power = 0
		local sum_rate_energy = 0
		local sum_energy_now = 0
		local sum_energy_full = 0
		local sum_charge_full = 0
		local sum_charge_design = 0

		for i, battery in ipairs(batteries) do
			local bstr = pspath .. battery
			local present = helpers.first_line(bstr .. "/present")

			if tonumber(present) == 1 then
				local rate_current = tonumber(helpers.first_line(bstr .. "/current_now"))
				local rate_voltage = tonumber(helpers.first_line(bstr .. "/voltage_now"))
				local rate_power = tonumber(helpers.first_line(bstr .. "/power_now"))
				local charge_now = tonumber(helpers.first_line(bstr .. "/charge_now"))
				local charge_full = tonumber(helpers.first_line(bstr .. "/charge_full"))
				local charge_design = tonumber(helpers.first_line(bstr .. "/charge_full_design"))

				local energy_now = charge_now
				local energy_full = charge_full
				local energy_percentage = tonumber(helpers.first_line(bstr .. "/capacity"))
					or math.floor((energy_now / energy_full) * 100)

				bat_now.n_status[i] = helpers.first_line(bstr .. "/status") or "N/A"
				bat_now.n_perc[i] = energy_percentage or bat_now.n_perc[i]

				if not charge_design or charge_design == 0 then
					bat_now.n_capacity[i] = 0
				else
					bat_now.n_capacity[i] = math.floor((charge_full / charge_design) * 100)
				end

				sum_rate_current = sum_rate_current + (rate_current or 0)
				sum_rate_voltage = sum_rate_voltage + (rate_voltage or 0)
				sum_rate_power = sum_rate_power + (rate_power or (((rate_voltage or 0) * (rate_current or 0)) / 1e6))
				sum_energy_now = sum_energy_now + (energy_now or 0)
				sum_energy_full = sum_energy_full + (energy_full or 0)
				sum_charge_full = sum_charge_full + (charge_full or 0)
				sum_charge_design = sum_charge_design + (charge_design or 0)
			end
		end

		bat_now.capacity = math.floor(math.min(100, (sum_charge_full / sum_charge_design) * 100))

		bat_now.status = bat_now.n_status[1] or "N/A"
		for _, status in ipairs(bat_now.n_status) do
			if status == "Discharging" or status == "Charging" then
				bat_now.status = status
			end
		end
		bat_now.ac_status = tonumber(helpers.first_line(string.format("%s%s/online", pspath, ac))) or "N/A"

		if bat_now.status ~= "N/A" then
			if bat_now.status ~= "Full" and sum_rate_power == 0 and bat_now.ac_status == 1 then
				bat_now.perc = math.floor(math.min(100, (sum_energy_now / sum_energy_full) * 100))
				bat_now.time = "00:00"
				bat_now.watt = 0
			elseif bat_now.status ~= "Full" then
				local rate_time = 0
				if sum_rate_power > 0 or sum_rate_current > 0 then
					local div = (sum_rate_power > 0 and sum_rate_power) or sum_rate_current

					if bat_now.status == "Charging" then
						rate_time = (sum_energy_full - sum_energy_now) / div
					else
						rate_time = sum_energy_now / div
					end

					if 0 < rate_time and rate_time < 0.01 then
						rate_time = rate_time * 100
					end
				end

				local hours = math.floor(rate_time)
				local minutes = math.floor((rate_time - hours) * 60)
				bat_now.perc = math.floor(math.min(100, (sum_energy_now / sum_energy_full) * 100))
				bat_now.time = string.format("%02d:%02d", hours, minutes)
				bat_now.watt = tonumber(string.format("%.2f", sum_rate_energy / 1e6))
			elseif bat_now.status == "Full" then
				bat_now.perc = 100
				bat_now.time = "00:00"
				bat_now.watt = 0
			end
		end

		widget = bat.widget
		settings()

		if notify == "on" then
			if bat_now.status == "Discharging" then
				if tonumber(bat_now.perc) <= n_perc[1] then
					naughty.notify(bat_notification_critical_preset)
				elseif tonumber(bat_now.perc) <= n_perc[2] then
					naughty.notify(bat_notification_low_preset)
				end
			elseif full_notify == "on" and bat_now.status == "Full" and not fullnotification then
				naughty.notify(bat_notification_charged_preset)
				fullnotification = true
			elseif bat_now.status == "Discharging" then
				fullnotification = false
			end
		end
	end

	helpers.newtimer("battery", timeout, bat.update)

	return bat
end

return factory
