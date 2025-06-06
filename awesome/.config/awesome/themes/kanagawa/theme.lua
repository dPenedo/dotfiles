local gears = require("gears")
local lain = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme = {}
theme.dir = os.getenv("HOME") .. "/.config/awesome/themes/kanagawa"
theme.wallpaper = theme.dir .. "/costa.jpg"
theme.font = "Hack Nerd Font 9"
theme.fg_normal = "#D0D9E2"
theme.fg_focus = "#A2B9F2"
theme.fg_accent = "#E1D29F"
theme.fg_inactive = "#5A5A5A"
theme.fg_urgent = "#CC9393"
theme.bg_normal = "#0A0E14"
theme.bg_focus = "#061A22"
theme.bg_urgent = "#1C1C1C"
theme.border_width = dpi(3)
theme.border_normal = "#1A1D23"
theme.border_focus = theme.fg_focus
theme.border_marked = "#CC9393"

theme.titlebar_bg_focus = theme.bg_focus
theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_fg_focus = theme.fg_focus
theme.menu_height = dpi(16)
theme.menu_width = dpi(140)
theme.menu_submenu_icon = theme.dir .. "/icons/submenu.png"
-- theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
-- theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile = theme.dir .. "/icons/tile.png"
theme.layout_tileleft = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv = theme.dir .. "/icons/fairv.png"
theme.layout_fairh = theme.dir .. "/icons/fairh.png"
theme.layout_spiral = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle = theme.dir .. "/icons/dwindle.png"
theme.layout_max = theme.dir .. "/icons/max.png"
theme.layout_fullscreen = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier = theme.dir .. "/icons/magnifier.png"
theme.layout_floating = theme.dir .. "/icons/floating.png"
theme.widget_ac = theme.dir .. "/icons/ac.png"
theme.widget_battery = theme.dir .. "/icons/battery.png"
theme.widget_battery_low = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty = theme.dir .. "/icons/battery_empty.png"
theme.widget_mem = theme.dir .. "/icons/mem.png"
theme.widget_cpu = theme.dir .. "/icons/cpu.png"
theme.widget_temp = theme.dir .. "/icons/temp.png"
theme.widget_net = theme.dir .. "/icons/net.png"
theme.widget_hdd = theme.dir .. "/icons/hdd.png"
theme.widget_music = theme.dir .. "/icons/note.png"
theme.widget_music_on = theme.dir .. "/icons/note_on.png"
theme.widget_vol = theme.dir .. "/icons/vol.png"
theme.widget_vol_low = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail = theme.dir .. "/icons/mail.png"
theme.widget_mail_on = theme.dir .. "/icons/mail_on.png"
theme.tasklist_plain_task_name = false
theme.tasklist_disable_icon = false
theme.useless_gap = dpi(3)
theme.titlebar_close_button_focus = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

local markup = lain.util.markup
local separators = lain.util.separators

local keyboardlayout = awful.widget.keyboardlayout:new()

-- Textclock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
-- local clock = awful.widget.watch("date +'%A, %d de %B ⌚<b> %R</b>'", 60, function(widget, stdout)
-- 	widget:set_markup(" " .. markup.font(theme.font, stdout))
-- end)

local days = {
	["lunes"] = "astelehena",
	["martes"] = "asteartea",
	-- WARN: está raro
	["rcoles"] = "asteazkena",
	["jueves"] = "osteguna",
	["viernes"] = "ostirala",
	["bado"] = "larunbata",
	["domingo"] = "igandea",
}

local months = {
	["enero"] = "urtarrila",
	["febrero"] = "otsaila",
	["marzo"] = "martxoa",
	["abril"] = "apirila",
	["mayo"] = "maiatza",
	["junio"] = "ekaina",
	["julio"] = "uztaila",
	["agosto"] = "abuztua",
	["setiembre"] = "iraila",
	["octubre"] = "urria",
	["noviembre"] = "azaroa",
	["diciembre"] = "abendua",
}

-- Function to capitalize the first letter of a string
local function capitalize(str)
	return (str:gsub("^%l", string.upper))
end

local function translate_to_euskera(date_str)
	local day, month, day_num, time = date_str:match("(%a+) | (%a+) (%d+) ⌚<b> (%d+:%d+)</b> ")
	if day and month then
		day = capitalize(days[day:lower()] or day)
		month = capitalize(months[month:lower()] or month)
		return string.format("%s | %sren %da ⌚<b> %s</b> ", day, month, day_num, time)
	end
	return date_str
end

local clock = awful.widget.watch("date +'%A | %B %d ⌚<b> %R</b> '", 60, function(widget, stdout)
	-- Translate to Euskera
	local translated = translate_to_euskera(stdout)

	widget:set_markup(" " .. translated)
	widget:set_markup(" " .. markup.font(theme.font, translated))
end)

-- Calendar
theme.cal = lain.widget.cal({
	attach_to = { clock },
	notification_preset = {
		font = "Lato 16",
		fg = theme.fg_normal,
		bg = theme.bg_focus,
	},
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
	settings = function()
		widget:set_markup(markup.font(theme.font, "" .. mem_now.used .. "MB "))
	end,
})

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
	settings = function()
		widget:set_markup(markup.font(theme.font, "" .. cpu_now.usage .. "% "))
	end,
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)

local temp = lain.widget.temp({
	settings = function()
		widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
	end,
})

-- / fs
local fsicon = wibox.widget.imagebox(theme.widget_hdd)
--[[ commented because it needs Gio/Glib >= 2.54
theme.fs = lain.widget.fs({
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "Terminus 10" },
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. fs_now["/"].percentage .. "% "))
    end
})
--]]

-- Battery
local baticon = wibox.widget.imagebox(theme.widget_battery)
local bat = lain.widget.bat({
	settings = function()
		if bat_now.status and bat_now.status ~= "N/A" then
			if bat_now.ac_status == 1 then
				baticon:set_image(theme.widget_ac)
			elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
				baticon:set_image(theme.widget_battery_empty)
			elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
				baticon:set_image(theme.widget_battery_low)
			else
				baticon:set_image(theme.widget_battery)
			end
			widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
		else
			widget:set_markup(markup.font(theme.font, " AC "))
			baticon:set_image(theme.widget_ac)
		end
	end,
})

local weather = lain.widget.weather()

-- Separators
local spr = wibox.widget.textbox(" ")
local arrl_dl = separators.arrow_left(theme.bg_focus, "alpha")
local arrl_ld = separators.arrow_left("alpha", theme.bg_focus)
-- local separr = separators.
-- local round_f = wibox.widget.textbox('')
-- local round_e = wibox.widget.textbox('')
--
--
-- separator_claro  = theme.fg_inactive
-- separator_oscuro = theme.bg_normal
-- -- Set fg and bg colors for the separator widget
-- round_f:set_markup_silently('<span foreground="' ..
--     separator_claro .. '" background="' .. separator_oscuro .. '"></span>')
-- round_e:set_markup_silently('<span foreground="' ..
--     separator_oscuro .. '" background="' .. separator_claro .. '"></span>')

function theme.at_screen_connect(s)
	-- Quake application
	s.quake = lain.util.quake({ app = awful.util.terminal })

	-- If wallpaper is a function, call it with the screen
	local wallpaper = theme.wallpaper
	if type(wallpaper) == "function" then
		wallpaper = wallpaper(s)
	end
	gears.wallpaper.maximized(wallpaper, s, true)

	-- Tags
	awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contains an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(my_table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 2, function()
			awful.layout.set(awful.layout.layouts[1])
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	-- s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)
	-- TODO: Color azul activos, amarillo focus y apagado no activos
	-- TODO: Solucionar espacios para iconos que no se ven
	-- TODO: Quitar el cuadradito?
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
		widget_template = {
			{
				{
					{
						id = "text_role",
						widget = wibox.widget.textbox,
					},
					layout = wibox.layout.fixed.horizontal,
				},
				left = 2,
				right = 2,
				widget = wibox.container.margin,
			},
			id = "background_role",
			shape = gears.shape.rounded_rect,
			widget = wibox.container.background,
		},
	})
	theme.taglist_fg_empty = theme.fg_inactive
	theme.taglist_fg_occupied = theme.fg_focus
	theme.taglist_fg_focus = theme.fg_accent
	theme.taglist_bg_focus = theme.bg_focus
	theme.taglist_fg_volatile = "#100110"
	theme.taglist_fg_urgent = theme.fg_urgent
	theme.taglist_spacing = 2
	theme.taglist_font = "Hack Nerd Font 10"

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

	theme.tasklist_fg_empty = theme.fg_inactive
	theme.tasklist_fg_occupied = theme.fg_normal
	theme.tasklist_fg_focus = theme.fg_focus
	theme.tasklist_bg_focus = theme.bg_focus
	theme.tasklist_fg_volatile = "#100110"
	theme.tasklist_fg_urgent = theme.fg_urgent
	theme.tasklist_spacing = 2

	-- Create the wibox
	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		height = dpi(18),
		bg = theme.bg_normal,
		fg = theme.fg_normal,
	})

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		-- Izquierda
		{
			layout = wibox.layout.fixed.horizontal,
			s.mytaglist,
			s.mypromptbox,
			spr,
		},
		-- Centro (centrado real)
		wibox.container.place(s.mytasklist, { halign = "center" }),
		-- Derecha
		{
			layout = wibox.layout.fixed.horizontal,
			wibox.widget.systray(),
			arrl_ld,
			wibox.container.background(cpuicon, theme.bg_focus),
			wibox.container.background(cpu.widget, theme.bg_focus),
			arrl_dl,
			memicon,
			mem.widget,
			arrl_ld,
			wibox.container.background(tempicon, theme.bg_focus),
			wibox.container.background(temp.widget, theme.bg_focus),
			arrl_dl,
			clock,
			spr,
		},
	})
end

return theme
