--[[
     Awesome WM configuration template
     github.com/lcpz
--]]

-- {{{ Required libraries

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local lain = require("lain")
--local menubar       = require("menubar")
local freedesktop = require("freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup")
local mytable = awful.util.table or gears.table -- 4.{0,1} compatibility

-- {{{ Error handling

-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Vaya, han habido errores al iniciar awesomewm!",
		text = awesome.startup_errors,
	})
end

-- Handle runtime errors after startup
do
	local in_error = false

	awesome.connect_signal("debug::error", function(err)
		if in_error then
			return
		end

		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Vaya, ha habido un error!",
			text = tostring(err),
		})

		in_error = false
	end)
end

-- }}}

-- {{{ Autostart windowless processes

-- This function will run once every time Awesome is started
local function run_once(cmd_arr)
	for _, cmd in ipairs(cmd_arr) do
		awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
	end
end

run_once({ "kitty", "unclutter -root" }) -- comma-separated entries

-- This function implements the XDG autostart specification
--[[
awful.spawn.with_shell(
    'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
    'xrdb -merge <<< "awesome.started:true";' ..
    -- list each of your autostart commands, followed by ; inside single quotes, followed by ..
    'dex --environment Awesome --autostart --search-paths "$XDG_CONFIG_DIRS/autostart:$XDG_CONFIG_HOME/autostart"' -- https://github.com/jceb/dex
)
--]]

-- }}}

-- {{{ Variable definitions

-- local chosen_theme  = "propio"
local chosen_theme = "kanagawa"
local modkey = "Mod4"
-- local altkey       = "Mod1"
-- local terminal     = "alacritty"
local terminal = "kitty"
local vi_focus = false -- vi-like client focus https://github.com/lcpz/awesome-copycats/issues/275
local cycle_prev = true -- cycle with only the previously focused client or all https://github.com/lcpz/awesome-copycats/issues/274
local editor = os.getenv("EDITOR") or "nvim"
local browser = "brave-browser"

awful.util.terminal = terminal
-- awful.util.tagnames = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" }
awful.util.tagnames = { " ", " ", " ", " ", " ", " ", " ", " ", " ", " " }
-- awful.util.tagnames = { "☰", "☷", "☵", "☲", "_", "_", "☳", "☴", "☶", "☱" }
-- awful.util.tagnames = { "一", "二", "三", "四", "五", "六", "七", "八", "九", "十" }
-- awful.util.tagnames = { "一", "二", "三", "四", "五", "六", "七", "八", "九", "十" }
--  ls
-- awful.util.tagnames = { "", "", "", "", "", "", "", "", "", "" }

awful.layout.layouts = {

	awful.layout.suit.tile,
	-- awful.layout.suit.floating,
	-- awful.layout.suit.spiral,
	-- awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
	-- awful.layout.suit.tile.top,
	-- awful.layout.suit.fair,
	-- awful.layout.suit.fair.horizontal,
	-- awful.layout.suit.spiral.dwindle,
	-- awful.layout.suit.max,
	-- awful.layout.suit.max.fullscreen,
	-- awful.layout.suit.magnifier,
	-- awful.layout.suit.corner.nw,
	-- awful.layout.suit.corner.ne,
	-- awful.layout.suit.corner.sw,
	-- awful.layout.suit.corner.se,
}

lain.layout.termfair.nmaster = 3
lain.layout.termfair.ncol = 1
lain.layout.termfair.center.nmaster = 3
lain.layout.termfair.center.ncol = 1
lain.layout.cascade.tile.offset_x = 2
lain.layout.cascade.tile.offset_y = 32
lain.layout.cascade.tile.extra_padding = 5
lain.layout.cascade.tile.nmaster = 5
lain.layout.cascade.tile.ncol = 2

awful.util.taglist_buttons = mytable.join(
	awful.button({}, 1, function(t)
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t)
		awful.tag.viewnext(t.screen)
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewprev(t.screen)
	end)
)

awful.util.tasklist_buttons = mytable.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end)
)

beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))

-- }}}

-- {{{ Menu

-- Create a launcher widget and a main menu
local myawesomemenu = {
	{
		"Hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "Manual", string.format("%s -e man awesome", terminal) },
	{ "Edit config", string.format("%s -e %s %s", terminal, editor, awesome.conffile) },
	{ "Restart", awesome.restart },
	{
		"Quit",
		function()
			awesome.quit()
		end,
	},
}

awful.util.mymainmenu = freedesktop.menu.build({
	before = {
		{ "Awesome", myawesomemenu, beautiful.awesome_icon },
		-- other triads can be put here
	},
	after = {
		{ "Open terminal", terminal },
		-- other triads can be put here
	},
})

-- Set the Menubar terminal for applications that require it
--menubar.utils.terminal = terminal

-- }}}

-- {{{ Screen

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end)

-- No borders when rearranging only 1 non-floating or maximized client
screen.connect_signal("arrange", function(s)
	local only_one = #s.tiled_clients == 1
	for _, c in pairs(s.clients) do
		if only_one and not c.floating or c.maximized or c.fullscreen then
			c.border_width = 0
		else
			c.border_width = beautiful.border_width
		end
	end
end)

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s)
	beautiful.at_screen_connect(s)
end)

-- }}}

-- {{{ Mouse bindings

root.buttons(mytable.join(
	awful.button({}, 3, function()
		awful.util.mymainmenu:toggle()
	end)
	-- awful.button({ }, 4, awful.tag.viewnext),
	-- awful.button({ }, 5, awful.tag.viewprev)
))

-- }}}

-- {{{ Key bindings

globalkeys = mytable.join(
	-- Destroy all notifications
	awful.key({ "Control" }, "space", function()
		naughty.destroy_all_notifications()
	end, { description = "destroy all notifications", group = "hotkeys" }),
	-- Take a screenshot
	-- https://github.com/lcpz/dots/blob/master/bin/screenshot
	-- i3Lock - locker
	awful.key({ modkey, "Mod1" }, "l", function()
		os.execute("i3lock --color=#282828")
	end, { description = "lockscreen", group = "hotkeys" }),

	-- Show help
	awful.key({ modkey, "Mod1" }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	awful.key({ modkey }, "Tab", awful.tag.history.restore, { description = "go back", group = "tag" }),

	-- Tag browsing
	awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
	-- awful.key({ modkey, }, "Escape", awful.tag.history.restore,
	--     { description = "go back", group = "tag" }),
	awful.key({ modkey }, "r", function()
		awful.util.spawn("dmenu_run")
	end, { description = "run prompt", group = "launcher" }),

	awful.key({}, "Print", function()
		awful.util.spawn("xfce4-screenshooter")
	end, { description = "take a screenshot", group = "hotkeys" }),
	-- My applications
	awful.key({ modkey }, "e", function()
		awful.util.spawn("thunar")
	end, { description = "thunar", group = "Mis programas" }),
	awful.key({ modkey }, "w", function()
		awful.util.spawn("firefox-developer-edition")
	end, { description = "firefox", group = "Mis programas" }),
	awful.key({ modkey }, "b", function()
		awful.util.spawn("brave-browser")
	end, { description = "brave", group = "Mis programas" }),
	awful.key({ modkey }, "o", function()
		awful.util.spawn("obsidian")
	end, { description = "obsidian", group = "Mis programas" }),
	awful.key({ modkey }, "d", function()
		awful.util.spawn("rofi -combi-modi -show-icons -show drun")
	end, { description = "programas", group = "Mis programas" }),
	awful.key({ modkey }, "s", function()
		awful.util.spawn("rofi -show window -show-icons")
	end, { description = "activos", group = "Mis programas" }),
	awful.key({ modkey }, "Escape", function()
		awful.util.spawn("rofi -show powermenu -modi powermenu:~/scripts/rofi-power-menu")
	end, { description = "Powermenu", group = "Mis programas" }),
	awful.key({ modkey, "Shift" }, "e", function()
		awful.util.spawn("emojipick")
	end, { description = "emojipick", group = "Mis programas" }),
	awful.key({ modkey }, "c", function()
		awful.util.spawn("gnome-calendar")
	end, { description = "Calendario", group = "Mis programas" }),
	awful.key({ modkey }, "g", function()
		awful.util.spawn("gpick")
	end, { description = "gpick", group = "Mis programas" }),
	awful.key({ modkey }, "G", function()
		awful.util.spawn("thunderbird")
	end, { description = "Thunderbird", group = "Mis programas" }),
	awful.key({ modkey, "Mod1" }, "e", function()
		awful.util.spawn("gitmoji-rofi")
	end, { description = "Emoji commit", group = "Mis programas" }),
	awful.key({ "Control", "Mod1" }, "x", function()
		awful.util.spawn("xkill")
	end, { description = "Xkill", group = "Mis programas" }),
	-- Brillo
	awful.key({}, "XF86MonBrightnessUp", function()
		awful.util.spawn("brightnessctl s 10%+")
	end, { description = "+ brillo", group = "Mis programas" }),
	awful.key({}, "XF86MonBrightnessDown", function()
		awful.util.spawn("brightnessctl s 10%-")
	end, { description = "- brillo", group = "Mis programas" }),

	-- Media reproduccion
	awful.key({ modkey }, "p", function()
		awful.util.spawn("playerctl play-pause")
	end, { description = "Pausar/reproducir media", group = "Mis programas" }),
	awful.key({}, "XF86AudioPlay", function()
		awful.util.spawn("playerctl play-pause")
	end, { description = "Pausar/reproducir media", group = "Mis programas" }),
	awful.key({}, "XF86AudioPrev", function()
		awful.util.spawn("playerctl previous")
	end, { description = "Siguiente audio o video", group = "Mis programas" }),
	awful.key({}, "XF86AudioNext", function()
		awful.util.spawn("playerctl next")
	end, { description = "Anterior audio o video", group = "Mis programas" }),
	-- awful.key({ modkey }, "`", function()
	-- 	local screen = awful.screen.focused()
	-- 	local tag = screen.tags[5] -- Accede al workspace 5
	-- 	if tag then
	-- 		tag:view_only() -- Alterna entre el workspace actual y el workspace 5
	-- 	end
	-- end, { description = "Ir al espacio 5 toggle", group = "Workspace" }),

	awful.key({ modkey }, "`", function()
		local screen = awful.screen.focused()
		local current_tag = screen.selected_tag -- Obtener la etiqueta actual
		local target_tag = screen.tags[5] -- Acceder al workspace 5

		if current_tag == target_tag then
			-- Si la etiqueta actual es la etiqueta 5, cambia a la última etiqueta almacenada
			awful.tag.history.restore()
		else
			-- Si la etiqueta actual no es la etiqueta 5, cambia a la etiqueta 5
			if target_tag then
				target_tag:view_only()
			end
		end
	end, { description = "Ir al espacio 5 toggle", group = "Workspace" }),

	-- Default client focus
	awful.key({ modkey }, "z", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "<", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),

	-- By-direction client focus
	awful.key({ modkey }, "j", function()
		awful.client.focus.global_bydirection("down")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "focus down", group = "client" }),
	awful.key({ modkey }, "k", function()
		awful.client.focus.global_bydirection("up")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "focus up", group = "client" }),
	awful.key({ modkey }, "h", function()
		awful.client.focus.global_bydirection("left")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "focus left", group = "client" }),
	awful.key({ modkey }, "l", function()
		awful.client.focus.global_bydirection("right")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "focus right", group = "client" }),

	-- Menu
	awful.key({ modkey, "Control" }, "w", function()
		awful.util.mymainmenu:show()
	end, { description = "show main menu", group = "awesome" }),
	-- Menubar
	awful.key({ modkey, "Control" }, "p", function()
		menubar.show()
	end, { description = "show the menubar", group = "launcher" }),

	-- Layout manipulation
	awful.key({ modkey, "Shift" }, "h", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "l", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),

	awful.key({ modkey, "Mod1" }, "j", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	awful.key({ modkey, "Mod1" }, "k", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	awful.key({ "Mod1" }, "Tab", function()
		if cycle_prev then
			awful.client.focus.history.previous()
		else
			awful.client.focus.byidx(-1)
		end
		if client.focus then
			client.focus:raise()
		end
	end, { description = "cycle with previous/go back", group = "client" }),

	-- Show/hide wibox
	awful.key({ modkey }, "'", function()
		for s in screen do
			s.mywibox.visible = not s.mywibox.visible
			if s.mybottomwibox then
				s.mybottomwibox.visible = not s.mybottomwibox.visible
			end
		end
	end, { description = "toggle wibox", group = "awesome" }),

	-- On-the-fly useless gaps change
	awful.key({ modkey, "Control" }, "+", function()
		lain.util.useless_gaps_resize(1)
	end, { description = "increment useless gaps", group = "tag" }),
	awful.key({ modkey, "Control" }, "-", function()
		lain.util.useless_gaps_resize(-1)
	end, { description = "decrement useless gaps", group = "tag" }),

	-- Dynamic tagging
	awful.key({ modkey, "Shift" }, "n", function()
		lain.util.add_tag()
	end, { description = "add new tag", group = "tag" }),
	awful.key({ modkey, "Shift" }, "r", function()
		lain.util.rename_tag()
	end, { description = "rename tag", group = "tag" }),
	awful.key({ modkey, "Shift" }, "Left", function()
		lain.util.move_tag(-1)
	end, { description = "move tag to the left", group = "tag" }),
	awful.key({ modkey, "Shift" }, "Right", function()
		lain.util.move_tag(1)
	end, { description = "move tag to the right", group = "tag" }),
	awful.key({ modkey, "Shift" }, "d", function()
		lain.util.delete_tag()
	end, { description = "delete tag", group = "tag" }),

	-- Standard program
	awful.key({ modkey }, "Return", function()
		awful.spawn("kitty")
	end, { description = "open a alacritty aterminal", group = "launcher" }),
	awful.key({ modkey, "Shift" }, "Return", function()
		awful.spawn(terminal)
	end, { description = "open a terminal", group = "launcher" }),
	awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift", "Control" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),

	awful.key({ modkey, "Control" }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey, "Control" }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),

	awful.key({ modkey, "Shift" }, "j", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),
	awful.key({ modkey, "Shift" }, "k", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),
	awful.key({ modkey, "Control" }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),

	awful.key({ modkey, "Control", "Shift" }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),
	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	-- awful.key({ modkey, "Shift" }, "space", function() awful.layout.inc(-1) end,
	--     { description = "select previous", group = "layout" }),

	awful.key({ modkey, "Control" }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),

	-- Dropdown application
	awful.key({ modkey }, "z", function()
		awful.screen.focused().quake:toggle()
	end, { description = "dropdown application", group = "launcher" }),

	-- Widgets popups
	awful.key({ modkey, "Control" }, "c", function()
		if beautiful.cal then
			beautiful.cal.show(7)
		end
	end, { description = "show calendar", group = "widgets" }),
	awful.key({ modkey, "Control" }, "h", function()
		if beautiful.fs then
			beautiful.fs.show(7)
		end
	end, { description = "show filesystem", group = "widgets" }),
	awful.key({ modkey, "Control" }, "w", function()
		if beautiful.weather then
			beautiful.weather.show(7)
		end
	end, { description = "show weather", group = "widgets" }),

	-- Screen brightness
	awful.key({}, "XF86MonBrightnessUp", function()
		os.execute("xbacklight -inc 10")
	end, { description = "+10%", group = "hotkeys" }),
	awful.key({}, "XF86MonBrightnessDown", function()
		os.execute("xbacklight -dec 10")
	end, { description = "-10%", group = "hotkeys" }),

	-- Copy primary to clipboard (terminals to gtk)
	awful.key({ modkey }, "c", function()
		awful.spawn.with_shell("xsel | xsel -i -b")
	end, { description = "copy terminal to gtk", group = "hotkeys" }),
	-- Copy clipboard to primary (gtk to terminals)
	awful.key({ modkey }, "v", function()
		awful.spawn.with_shell("xsel -b | xsel")
	end, { description = "copy gtk to terminal", group = "hotkeys" }),

	awful.key({ modkey }, "x", function()
		awful.prompt.run({
			prompt = "Run Lua code: ",
			textbox = awful.screen.focused().mypromptbox.widget,
			exe_callback = awful.util.eval,
			history_path = awful.util.get_cache_dir() .. "/history_eval",
		})
	end, { description = "lua execute prompt", group = "awesome" })
	--]]
)

clientkeys = mytable.join(
	awful.key({ modkey }, "f", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = "toggle fullscreen", group = "client" }),
	awful.key({ modkey, "Shift" }, "q", function(c)
		c:kill()
	end, { description = "close", group = "client" }),
	awful.key(
		{ modkey, "Control" },
		"space",
		awful.client.floating.toggle,
		{ description = "toggle floating", group = "client" }
	),
	awful.key({ modkey, "Control" }, "Return", function(c)
		c:swap(awful.client.getmaster())
	end, { description = "move to master", group = "client" }),
	awful.key({ modkey, "Control" }, "o", function(c)
		c:move_to_screen()
	end, { description = "move to screen", group = "client" }),
	awful.key({ modkey }, "t", function(c)
		c.ontop = not c.ontop
	end, { description = "toggle keep on top", group = "client" }),
	awful.key(
		{ modkey },
		"n",

		function(c)
			c.minimized = not c.minimized
			c:raise()
		end,

		--
		-- function (c)
		--     -- The client currently has the input focus, so it cannot be
		--     -- minimized, since minimized clients can't have the focus.
		--     c.minimized = true
		-- end ,
		{ description = "minimize", group = "client" }
	),
	awful.key({ modkey }, "m", function(c)
		c.maximized = not c.maximized
		c:raise()
	end, { description = "(un)maximize", group = "client" }),
	awful.key({ modkey, "Control" }, "m", function(c)
		c.maximized_vertical = not c.maximized_vertical
		c:raise()
	end, { description = "(un)maximize vertically", group = "client" }),
	awful.key({ modkey, "Shift" }, "m", function(c)
		c.maximized_horizontal = not c.maximized_horizontal
		c:raise()
	end, { description = "(un)maximize horizontally", group = "client" })
)

--
--
--
-- clientkeys = mytable.join(
--     awful.key({ modkey, "Shift"   }, "'",      lain.util.magnify_client,
--               {description = "magnify client", group = "client"}),
--     awful.key({ modkey,           }, "f",
--         function (c)
--             c.fullscreen = not c.fullscreen
--             c:raise()
--         end,
--         {description = "toggle fullscreen", group = "client"}),
--     awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
--               {description = "close", group = "client"}),
--     awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
--               {description = "toggle floating", group = "client"}),
--     awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
--               {description = "move to master", group = "client"}),
--     awful.key({ modkey,  "control"    }, "o",      function (c) c:move_to_screen()               end,
--               {description = "move to screen", group = "client"}),
--     awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
--               {description = "toggle keep on top", group = "client"}),
--     awful.key({ modkey,           }, "n",
--         function (c)
--             -- The client currently has the input focus, so it cannot be
--             -- minimized, since minimized clients can't have the focus.
--             c.minimized = false
--         end ,
--         {description = "minimize", group = "client"}),
--     awful.key({ modkey,           }, "m",
--         function (c)
--             c.maximized = not c.maximized
--             c:raise()
--         end ,
--         {description = "(un)maximize", group = "client"}),
--     awful.key({ modkey, "Control" }, "m",
--         function (c)
--             c.maximized_vertical = not c.maximized_vertical
--             c:raise()
--         end ,
--         {description = "(un)maximize vertically", group = "client"}),
--     awful.key({ modkey, "Shift"   }, "m",
--         function (c)
--             c.maximized_horizontal = not c.maximized_horizontal
--             c:raise()
--         end ,
--         {description = "(un)maximize horizontally", group = "client"})
-- )
--
-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 10 do
	globalkeys = mytable.join(
		globalkeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag #" .. i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ modkey, "Control" }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag #" .. i, group = "tag" }),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end

clientbuttons = mytable.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)

-- Set keys
root.keys(globalkeys)

-- }}}

-- {{{ Rules

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			callback = awful.client.setslave,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
			size_hints_honor = false,
		},
	},
	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"pavucontrol",
				"Kruler",
				"MessageWin", -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true },
	},

	-- Add titlebars to normal clients and dialogs
	{
		rule_any = { type = { "normal", "dialog" } },
		properties = { titlebars_enabled = false },
	},

	-- Set Firefox to always map on the tag named "2" on screen 1.
	-- { rule = { class = "firefox" },
	--   properties = { screen = 1, tag = "1" } },
	-- { rule = { class = "Brave-browser" },
	--   properties = { screen = 1, tag = "1" } },
	{
		rule_any = { class = { "Spotify", "spotify" }, name = { "spotify", "Spotify" } },
		properties = { screen = 1, tag = "8" },
	},
	{
		rule_any = { name = { "ChatGPT" } },
		properties = { tag = "17" },
	},
	{
		rule_any = { name = { "WhatsApp Web" } },
		properties = { tag = "18" },
	},
	{
		rule_any = { class = { "obsidian", "Obsidian" } },
		properties = { tag = "17" },
	},
}

-- }}}

-- {{{ Signals

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then awful.client.setslave(c) end

	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
	-- Custom
	if beautiful.titlebar_fun then
		beautiful.titlebar_fun(c)
		return
	end

	-- Default
	-- buttons for the titlebar
	local buttons = mytable.join(
		awful.button({}, 1, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.move(c)
		end),
		awful.button({}, 3, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.resize(c)
		end)
	)

	awful.titlebar(c, { size = 10 }):setup({
		{
			-- Left
			-- awful.titlebar.widget.iconwidget(c),
			buttons = buttons,
			layout = wibox.layout.fixed.horizontal,
		},
		{
			-- Middle
			{
				-- Title
				align = "center",
				widget = awful.titlebar.widget.titlewidget(c),
			},
			buttons = buttons,
			layout = wibox.layout.flex.horizontal,
		},
		{
			-- Right
			awful.titlebar.widget.floatingbutton(c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.stickybutton(c),
			awful.titlebar.widget.ontopbutton(c),
			awful.titlebar.widget.closebutton(c),
			layout = wibox.layout.fixed.horizontal(),
		},
		layout = wibox.layout.align.horizontal,
	})
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = vi_focus })
end)

client.connect_signal("focus", function(c)
	c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
end)

-- switch to parent after closing child window
local function backham()
	local s = awful.screen.focused()
	local c = awful.client.focus.history.get(s, 0)
	if c then
		client.focus = c
		c:raise()
	end
end

-- attach to minimized state
client.connect_signal("property::minimized", backham)
-- attach to closed state
client.connect_signal("unmanage", backham)
-- ensure there is always a selected client during tag switching or logins
tag.connect_signal("property::selected", backham)

-- }}}
--
-- Ocultar el wibar en el tag 2
tag.connect_signal("property::selected", function(t)
	local s = t.screen
	if t.index == 1 then
		s.mywibox.visible = not s.mywibox.visible
	else
		s.mywibox.visible = true
	end
end)

-- Autostart
awful.spawn.with_shell("pkill picom &")
awful.spawn.with_shell("$HOME/scripts/xmodmap.sh &")
awful.spawn.with_shell("$HOME/scripts/xpantallas.sh &")
-- Network applet
awful.spawn.with_shell("sleep 3; nm-applet &")
awful.spawn.with_shell("sleep 1; pkill volumeicon &")
awful.spawn.with_shell("sleep 1; pkill cbatticon &")
-- WARN: quitado para pruebas
awful.spawn.with_shell("$HOME/scripts/inicio.sh &")
-- awful.spawn.with_shell("pkill copyq &")

awful.spawn.with_shell("sleep 3; picom -b --config  $HOME/.config/picom/picom.conf")
awful.spawn.with_shell("sleep 2; copyq &")
awful.spawn.with_shell("sleep 3; volumeicon &")
awful.spawn.with_shell("sleep 2; cbatticon &")
