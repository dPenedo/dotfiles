# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from color import colors
import os
import subprocess
from libqtile import hook

mod = "mod4"
terminal = "kitty"
browser = "brave-browser"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "z", lazy.window.toggle_floating(), desc="Toggle floating"),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    # Volumen y media
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("pactl set-sink-volume 0 +5%"),
        desc="Volume Up",
    ),
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("pactl set-sink-volume 0 -5%"),
        desc="volume down",
    ),
    Key(
        [],
        "XF86AudioMute",
        lazy.spawn("amixer sset Master 1+ toggle"),
        desc="Volume Mute",
    ),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc="playerctl"),
    Key([mod], "p", lazy.spawn("playerctl play-pause"), desc="playerctl"),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc="playerctl"),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc="playerctl"),
    Key(
        [],
        "XF86MonBrightnessUp",
        lazy.spawn("brightnessctl s 10%+"),
        desc="brightness UP",
    ),
    Key(
        [],
        "XF86MonBrightnessDown",
        lazy.spawn("brightnessctl s 10%-"),
        desc="brightness Down",
    ),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "a", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    # Rofi
    Key(
        [mod],
        "d",
        lazy.spawn("rofi -combi-modi -show-icons -show drun"),
        desc="Elegir un programa y ejecutarlo",
    ),
    Key(
        [mod],
        "s",
        lazy.spawn("rofi -show window -show-icons"),
        desc="Ventanas/programas abiertos",
    ),
    Key(
        [mod, "shift"], "e", lazy.spawn("rofimoji"), desc="Toma un emoji mediante rofi"
    ),
    Key(
        [mod],
        "Escape",
        lazy.spawn("rofi -show powermenu -modi powermenu:~/scripts/rofi-power-menu"),
        desc="Powemenu propio a través de Rofi",
    ),
    # Programas
    Key([mod], "b", lazy.spawn(browser), desc="Navegador predeterminado"),
    Key([mod], "w", lazy.spawn("firefox"), desc="Navegador firefox"),
    Key([mod], "e", lazy.spawn("thunar"), desc="Thunar explorador de archivos"),
    Key([mod], "g", lazy.spawn("gpick"), desc="Toma y almacena colores de la pantalla"),
    # Key(["control", mod1], "supr", lazy.spawn("xkill"), desc="Selecciona una ventana con el raton para cerrarla"),
]

groups = [
    Group(name="1", label=""),
    Group(name="2", label=""),
    Group(name="3", label=""),
    Group(name="4", label=""),
    Group(name="5", label=""),
    Group(name="6", label=""),
    Group(name="7", label=""),
    Group(name="8", label=""),
    Group(name="9", label=""),
    Group(name="0", label=""),
]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    # layout.Columns(border_focus_stack=["#5B65AB", "#7E9CD8"], border_width=3),
    layout.MonadTall(
        border_focus=colors["blue"], border_normal=colors["bg2"], margin=4
    ),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="Lato",
    fontsize=14,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper="~/Imagenes/Fondos-de-pantalla/203553-mod.jpg",
        wallpaper_mode="fill",
        top=bar.Bar(
            [
                widget.GroupBox(
                    highlight_method="line",
                    highlight_color=colors["bg2"],
                    block_highlight_text_color=colors["orange"],
                    active=colors["fg"],
                    this_current_screen_border=colors["blue"],
                ),
                widget.Prompt(),
                widget.Spacer(length=250),
                widget.Spacer(length=bar.STRETCH),
                widget.TaskList(
                    borderwidth=2,
                    highlight_method="block",
                    foreground=colors["bg"],
                    border=colors["blue"],
                    unfocused_border=colors["brown"],
                    urgent_border=colors["red"],
                    center_aligned=True,
                    markup_floating="<i>{}</i>",
                    markup_minimized="<s>{}</s>",
                    window_name_location=True,
                    padding_x=20,
                ),
                widget.Spacer(length=bar.STRETCH),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.CPU(
                    format="C {load_percent}%",
                    foreground=colors["purple"],
                ),
                widget.Memory(
                    foreground=colors["purple"],
                    format="{MemUsed: .0f}{mm}",
                    fmt="M{} ",
                ),
                widget.Battery(
                    foreground=colors["blue"],
                    low_foreground=colors["red"],
                    low_percentage=0.30,
                    padding=4,
                    format=" {char} ",
                    charge_char="󰂄",
                    discharge_char="🔋",
                    full_char="󰁹",
                    unknown_char="⚡",
                    empty_char="⁉️ ",
                    update_interval=2,
                    show_short_text=False,
                    default_text="",
                ),
                widget.PulseVolume(emoji=True, foreground=colors["purple"], padding=4),
                widget.Volume(foreground=colors["purple"]),
                widget.Systray(),
                widget.Clock(format="    %A, %d de %B", foreground=colors["blue"]),
                widget.Clock(
                    format="   %H:%M ",
                    background=colors["blue"],
                    foreground=colors["bg"],
                ),
            ],
            24,
            background=colors["bg"],
        ),
    ),
    Screen(
        wallpaper="~/Imagenes/Fondos-de-pantalla/203553-mod.jpg",
        wallpaper_mode="fill",
        top=bar.Bar(
            [
                widget.GroupBox(
                    highlight_method="line",
                    highlight_color=colors["bg2"],
                    block_highlight_text_color=colors["orange"],
                    active=colors["fg"],
                    this_current_screen_border=colors["blue"],
                ),
                widget.Prompt(),
                widget.Spacer(length=250),
                widget.Spacer(length=bar.STRETCH),
                widget.TaskList(
                    borderwidth=2,
                    highlight_method="block",
                    foreground=colors["bg"],
                    border=colors["blue"],
                    unfocused_border=colors["brown"],
                    urgent_border=colors["red"],
                    center_aligned=True,
                    markup_floating="<i>{}</i>",
                    markup_minimized="<s>{}</s>",
                    window_name_location=True,
                    padding_x=20,
                ),
                widget.Spacer(length=bar.STRETCH),
                widget.Battery(
                    foreground=colors["blue"],
                    low_foreground=colors["red"],
                    low_percentage=0.30,
                    padding=4,
                    format=" {char} ",
                    charge_char="󰂄",
                    discharge_char="󰁾",
                    full_char="󰁹",
                    unknown_char="⚡",
                    empty_char="⁉️ ",
                    update_interval=2,
                    show_short_text=True,
                    default_text="",
                ),
                widget.PulseVolume(emoji=True, foreground=colors["purple"], padding=4),
                widget.Volume(foreground=colors["purple"]),
                widget.Clock(format="    %A, %d de %B", foreground=colors["blue"]),
                widget.Clock(
                    format="   %H:%M ",
                    background=colors["blue"],
                    foreground=colors["bg"],
                ),
            ],
            24,
            background=colors["bg"],
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.run([home])
