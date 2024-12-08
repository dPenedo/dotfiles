local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({
		-- "FiraCode Nerd Font",
		-- "Hack Nerd Font",
		-- "IosevkaTerm Nerd Font",
		"JetBrainsMono Nerd Font Mono",
		-- "Azeret Mono",
		-- "Iosevka Nerd Font",
		-- "Hack Nerd Font",
		-- "Noto Sans SC",
	}),
	font_size = 12,
	line_height = 1,
	cell_width = 1,
	-- color scheme can be found here: https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master/wezterm
	-- color_scheme = "kanagawabones",
	-- color_scheme = "zenbones_dark",
	-- color_scheme = "Catppuccin Frappe", -- or Macchiato, Frappe, Latte
	-- color_scheme = "jmbi (terminal.sexy)",
	-- color_scheme = "jubi",
	-- color_scheme = "iceberg-dark",
	-- color_scheme = "tokyonight_night",
	-- color_scheme = "dayfox",
	-- color_scheme = "FishTank",

	-- color_scheme = "carbonfox",
	-- color_scheme = "duskfox",
	-- color_scheme = "ayu",
	-- color_scheme = "_bash (Gogh)",
	-- color_scheme = "Calamity",

	color_scheme = "kanagawa (Gogh)",

	colors = {
		background = "#16161d",
		foreground = "#fffef7",
		tab_bar = {
			-- The color of the strip that goes along the top of the window
			-- (does not apply when fancy tab bar is in use)
			background = "#16161d",

			-- The active tab is the one that has focus in the window
			active_tab = {
				-- The color of the background area for the tab
				bg_color = "#2b2042",
				-- The color of the text for the tab
				fg_color = "#c0c0c0",

				-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
				-- label shown for this tab.
				-- The default is "Normal"
				intensity = "Normal",

				-- Specify whether you want "None", "Single" or "Double" underline for
				-- label shown for this tab.
				-- The default is "None"
				underline = "None",

				-- Specify whether you want the text to be italic (true) or not (false)
				-- for this tab.  The default is false.
				italic = false,

				-- Specify whether you want the text to be rendered with strikethrough (true)
				-- or not for this tab.  The default is false.
				strikethrough = false,
			},

			-- Inactive tabs are the tabs that do not have focus
			inactive_tab = {
				bg_color = "#16161d",
				fg_color = "#808080",

				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `inactive_tab`.
			},

			-- You can configure some alternate styling when the mouse pointer
			-- moves over inactive tabs
			inactive_tab_hover = {
				bg_color = "#3b3052",
				fg_color = "#909090",
				italic = true,

				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `inactive_tab_hover`.
			},

			-- The new tab button that let you create new tabs
			new_tab = {
				bg_color = "#1b1032",
				fg_color = "#808080",

				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `new_tab`.
			},

			-- You can configure some alternate styling when the mouse pointer
			-- moves over the new tab button
			new_tab_hover = {
				bg_color = "#3b3052",
				fg_color = "#909090",
				italic = true,

				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `new_tab_hover`.
			},
		},
	},

	default_cursor_style = "BlinkingBar",
	cursor_blink_rate = 400,
	check_for_updates = false,
	force_reverse_video_cursor = false,
	-- enable_tab_bar = true,
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	tab_bar_at_bottom = true,
	window_padding = {
		left = 8,
		right = 2,
		top = 8,
		bottom = 8,
	},
	window_decorations = "TITLE | RESIZE",
	native_macos_fullscreen_mode = false,
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,
	use_ime = true,
	window_background_opacity = 0.93,
	-- term = "wezterm",
	-- set term to wezterm will break the nvim titlestring option, see https://github.com/wez/wezterm/issues/2112
	term = "xterm-256color",
	automatically_reload_config = false,
	mouse_bindings = {
		-- Change the default click behavior so that it populates
		-- the Clipboard rather the PrimarySelection.
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = wezterm.action.CompleteSelectionOrOpenLinkAtMouseCursor("Clipboard"),
		},
	},

	keys = {
		-- This will create a new split and run your default program inside it
		{
			key = "Enter",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{ key = "p", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "DefaultDomain" }) },
		{ key = "Ñ", mods = "CTRL|SHIFT", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		{
			key = "Enter",
			mods = "ALT",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		-- Create a new tab in the default domain
		{ key = "t", mods = "CTRL|SHIFT", action = wezterm.action({ SpawnTab = "DefaultDomain" }) },
		{ key = "k", mods = "CTRL|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "j", mods = "CTRL|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "l", mods = "CTRL|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		--    { key = "h", mods = "ALT|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 1 } })},
		-- { key = "l", mods = "ALT|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }) },
		-- { key = "k", mods = "ALT|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }) },
		-- { key = "j", mods = "ALT|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }) },
		{ key = "Space", mods = "ALT|SHIFT", action = "ActivateCopyMode" },
		{ key = "1", mods = "ALT|SHIFT", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "ALT|SHIFT", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "ALT|SHIFT", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "ALT|SHIFT", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "ALT|SHIFT", action = wezterm.action({ ActivateTab = 4 }) },
		{ key = "6", mods = "ALT|SHIFT", action = wezterm.action({ ActivateTab = 5 }) },
		{ key = "7", mods = "ALT|SHIFT", action = wezterm.action({ ActivateTab = 6 }) },
		{ key = "8", mods = "ALT|SHIFT", action = wezterm.action({ ActivateTab = 7 }) },
		{ key = "9", mods = "ALT|SHIFT", action = wezterm.action({ ActivateTab = 8 }) },
		{ key = "LeftArrow", mods = "ALT|CTRL", action = wezterm.action({ MoveTabRelative = -1 }) },
		{ key = "RightArrow", mods = "ALT|CTRL", action = wezterm.action({ MoveTabRelative = 1 }) },
		{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	},
}
