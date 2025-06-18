import os
import subprocess

from libqtile import bar, widget, layout
from libqtile.config import Click, Drag, Key, Group, Match, Screen
from libqtile import hook
from libqtile.lazy import lazy
from libqtile.config import ScratchPad, DropDown


from color import colors
from tabbed import Tabbed


MOD = "mod4"
TERM = os.path.expanduser("~/.local/kitty.app/bin/kitty")
WALLPAPER = os.path.expanduser("~/.config/qtile/wallpapers/yazi.webp")
BROWSER = "/opt/firefox/firefox"
FONT = "Atkinson Hyperlegible"


keys = [
    Key([MOD], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([MOD], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([MOD], "j", lazy.layout.down(), desc="Move focus down"),
    Key([MOD], "k", lazy.layout.up(), desc="Move focus up"),
    Key([MOD], "space", lazy.window.toggle_floating(), desc="Toggle floating"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [MOD, "shift"],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left",
    ),
    Key(
        [MOD, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([MOD, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([MOD, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([MOD, "control"], "k", lazy.layout.shrink(), desc="shrink window"),
    Key([MOD, "control"], "j", lazy.layout.grow(), desc="Grow window"),
    Key([MOD, "control"], "l", lazy.layout.grow_main(), desc="Grow main window"),
    Key([MOD, "control"], "h", lazy.layout.shrink_main(), desc="shrink main window"),
    # Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([MOD], "m", lazy.next_layout(), desc="Toggle layout"),
    Key([MOD], "f", lazy.window.toggle_fullscreen()),
    # Ventana previa y siguiente
    Key(["mod1"], "Tab", lazy.group.next_window(), desc="Focus next window"),
    Key(
        ["mod1", "shift"],
        "Tab",
        lazy.group.prev_window(),
        desc="Focus previous window",
    ),
    Key([MOD], "Tab", lazy.screen.toggle_group()),
    # Volumen y media
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc="playerctl"),
    Key([MOD], "p", lazy.spawn("playerctl play-pause"), desc="playerctl"),
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
    Key(
        [MOD, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([MOD], "Return", lazy.spawn(TERM), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    # Key([MOD], "a", lazy.next_layout(), desc="Toggle between layouts"),
    Key([MOD, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([MOD, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([MOD, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([MOD], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    # Rofi
    Key(
        [MOD],
        "d",
        lazy.spawn("rofi -combi-modi -show-icons -show drun"),
        desc="Elegir un programa y ejecutarlo",
    ),
    Key(
        [MOD],
        "w",
        lazy.spawn("rofi -show window -show-icons"),
        desc="Ventanas/programas abiertos",
    ),
    Key(
        [MOD, "shift"],
        "e",
        lazy.spawn("rofimoji"),
        desc="Toma un emoji mediante ofi",
    ),
    Key(
        [MOD],
        "Escape",
        lazy.spawn("rofi -show powermenu -modi powermenu:~/scripts/rofi-power-menu"),
        desc="Powemenu propio a través de Rofi",
    ),
    # Programas
    Key([MOD], "b", lazy.spawn(BROWSER), desc="Navegador predeterminado"),
    Key([MOD], "e", lazy.spawn("thunar"), desc="Thunar explorador de archivos"),
    Key([], "Print", lazy.spawn("xfce4-screenshooter"), desc="Captura de pantalla"),
    Key(
        [MOD],
        "g",
        lazy.spawn("gpick"),
        desc="Toma y almacena colores de la pantalla",
    ),
    Key([MOD], "i", lazy.group["5"].toscreen(), desc="Ir al grupo 5"),
    Key(
        ["control", "mod1"],
        "Delete",
        lazy.spawn("xkill"),
        desc="xkill",
    ),
    Key(["control", "mod1"], "x", lazy.spawn("xkill"), desc="xkill"),
    Key(
        [MOD, "mod1"],
        "i",
        lazy.spawn("/home/daniel/.local/bin/nvim_selection.sh"),
        desc="Seleccionar con nvim",
    ),
    Key(
        [MOD, "mod1"],
        "p",
        lazy.spawn("/home/daniel/scripts/rofi-prompts.sh"),
        desc="Rofi prompts",
    ),
]


groups = [
    Group(name="1", label=""),
    Group(name="2", label=""),
    Group(name="3", label=""),
    Group(name="4", label=""),
    Group(name="5", label=""),
    Group(name="6", label=""),
    Group(name="7", label=""),
    Group(name="8", label=""),
    Group(name="9", label=""),
    Group(name="0", label=""),
]

#
# Group keys
for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [MOD],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = move focused window to group
            Key(
                [MOD, "shift"],
                i.name,
                lazy.window.togroup(i.name),
                desc="Move focused window to group {}".format(i.name),
            ),
        ]
    )


layouts = [
    # layout.Columns(border_focus_stack=["#5B65AB", "#7E9CD8"], border_width=3),
    layout.MonadTall(
        border_focus=colors["blue"],
        border_normal=colors["bg2"],
        border_width=3,
        margin=3,
    ),
    layout.MonadWide(
        border_focus=colors["brown"],
        border_normal=colors["bg2"],
        border_width=3,
        margin=3,
    ),
    # layout.Max(),
    Tabbed(
        active_bg=colors["blue"],
        active_fg=colors["bg"],
        inactive_bg=colors["bg2"],
        inactive_fg=colors["brown"],
        fontsize=13,
        bar_height=20,
        show_single_tab=False,
    ),
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
    font=FONT,
    fontsize=14,
    padding=3,
)
extension_defaults = widget_defaults.copy()


# Scratchpad config
height = 0.7
width = 0.7
y_position = 0.1
x_position = 0
warp_pointer = False
on_focus_lost_hide = True
opacity = 1
# Scratchpads
groups.append(
    ScratchPad(
        "scratch",
        dropdowns=[
            DropDown(
                "term",
                TERM,
                opacity=opacity,
                y=y_position,
                height=height,
                width=width,
                on_focus_lost_hide=on_focus_lost_hide,
                warp_pointer=warp_pointer,
            ),
            DropDown(
                "yazi",
                f"{TERM} -e yazi",
                opacity=opacity,
                y=y_position,
                height=height,
                width=width,
                on_focus_lost_hide=on_focus_lost_hide,
                warp_pointer=warp_pointer,
            ),
            DropDown(
                "htop",
                f"{TERM} -e htop",
                opacity=opacity,
                y=y_position,
                height=height,
                width=width,
                on_focus_lost_hide=on_focus_lost_hide,
                warp_pointer=warp_pointer,
            ),
            DropDown(
                "nvim",
                f"{TERM} -e nvim",
                opacity=opacity,
                y=y_position,
                height=height,
                width=width,
                on_focus_lost_hide=on_focus_lost_hide,
                warp_pointer=warp_pointer,
            ),
            DropDown(
                "calcurse",
                f"{TERM} -e calcurse",
                opacity=opacity,
                y=y_position,
                height=height,
                width=width,
                on_focus_lost_hide=on_focus_lost_hide,
                warp_pointer=warp_pointer,
            ),
            DropDown(
                "gnome-calendar",
                "gnome-calendar",
                opacity=opacity,
                y=y_position,
                height=0.8,
                width=0.8,
                on_focus_lost_hide=on_focus_lost_hide,
                warp_pointer=warp_pointer,
            ),
        ],
    )
)


keys.extend(
    [
        Key(
            [MOD, "mod1"],
            "t",
            lazy.group["scratch"].dropdown_toggle("term"),
            desc="Toggle term dropdown",
        ),
        Key(
            [MOD, "mod1"],
            "y",
            lazy.group["scratch"].dropdown_toggle("yazi"),
            desc="Toggle yazi dropdown",
        ),
        Key(
            [MOD, "mod1"],
            "h",
            lazy.group["scratch"].dropdown_toggle("htop"),
            desc="Toggle htop dropdown",
        ),
        Key(
            [MOD],
            "n",
            lazy.group["scratch"].dropdown_toggle("nvim"),
            desc="Toggle nvim dropdown",
        ),
        Key(
            [MOD, "mod1"],
            "c",
            lazy.group["scratch"].dropdown_toggle("calcurse"),
            desc="Toggle calcurse dropdown",
        ),
        Key(
            [MOD],
            "c",
            lazy.group["scratch"].dropdown_toggle("gnome-calendar"),
            desc="Toggle gnome-calendar dropdown",
        ),
    ]
)


main_bar = bar.Bar(
    [
        widget.GroupBox(
            highlight_method="line",
            highlight_color=colors["bg2"],
            block_highlight_text_color=colors["orange"],
            active=colors["blue"],
            this_current_screen_border=colors["orange"],
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
        widget.CPU(
            format="   {load_percent}%",
            foreground=colors["brown"],
        ),
        widget.Memory(
            foreground=colors["brown"],
            format="{MemUsed: .0f}{mm}",
            measure_mem="M",
            fmt=" {} ",
        ),
        # widget.PulseVolume(emoji=True, foreground=colors["purple"], padding=4),
        # widget.Volume(foreground=colors["purple"], fmt="Vol: {}"),
        widget.Battery(
            foreground=colors["blue"],
            low_foreground=colors["red"],
            low_percentage=0.30,
            padding=4,
            format="{char} {percent:2.0%}",
            charge_char="󰂄",
            discharge_char="",
            full_char="󰁹",
            unknown_char="⚡",
            empty_char="⁉️ ",
            update_interval=2,
            show_short_text=False,
            default_text="",
        ),
        widget.Systray(),
        widget.Clock(format="    %A, %d de %B", foreground=colors["blue"]),
        widget.Clock(
            format="  %H:%M ",
            background=colors["blue"],
            foreground=colors["bg"],
        ),
    ],
    24,
    background=colors["bg"],
)
screens = [
    Screen(wallpaper=WALLPAPER, wallpaper_mode="fill", top=main_bar),
    Screen(
        wallpaper=WALLPAPER,
        wallpaper_mode="fill",
        top=main_bar,
    ),
]

mouse = [
    Drag(
        [MOD],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [MOD], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([MOD], "Button2", lazy.window.bring_to_front()),
]

# Drag floating layouts.
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
        Match(title="branchdialog"),  # git
        Match(title="pinentry"),  # GPG key password entry
        Match(wm_class="gpick"),
        Match(wm_class="copyq"),
    ],
    border_focus=colors["blue"],
    border_normal=colors["bg2"],
    border_width=3,
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = False


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.run([home])


@hook.subscribe.screen_change
def on_screen_change(qtile, ev):
    qtile.cmd_spawn(
        "dunstify -u low -r 2594 -a 'screen' 'Screen' 'Configuration changed'"
    )


# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = False

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
