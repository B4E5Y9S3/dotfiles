-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
-- Variables & Paths
local scripts = os.getenv("HOME") .. "/.config/hypr/scripts/"
local MAINMOD = "SUPER" -- Sets "Windows" key as main modifier

local closeWindowBind = hl.bind(MAINMOD .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)

local directions = {"up", "down", "left", "right"}

-- Binds related config
hl.config({
    binds = {
        scroll_event_delay = 50
    }
})
local app_binds = { -- Default Apps
{
    key = "T",
    cmd = DEFAULT_TERMINAL
}, {
    key = "E",
    cmd = DEFAULT_FILE_MANAGER
}, {
    key = "W",
    cmd = DEFAULT_BROWSER
}, {
    key = "SPACE",
    cmd = DEFAULT_MENU
}, {
    key = "CTRL + ALT + DELETE",
    cmd = DEFAULT_POWER_MANAGER,
    custom_mod = true
}, -- App Launch
{
    key = "Z",
    cmd = "zen-browser"
}, {
    key = "C",
    cmd = "code"
}, {
    key = "CTRL + " .. MAINMOD .. " + V",
    cmd = "pavucontrol",
    custom_mod = true
}, {
    key = "M",
    cmd = "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
}, -- Clipboard & Emoji
{
    key = "PERIOD",
    cmd = "hypremoji"
}, {
    key = "V",
    cmd = scripts .. "clipmenu.sh"
}, -- Screenshot
{
    key = "ALT + SHIFT + S",
    cmd = "grimblast -n --freeze copysave area",
    custom_mod = true
}, {
    key = "PRINT",
    cmd = "grimblast --freeze --notify copy",
    custom_mod = true
}, -- Scripts
{
    key = "ALT + SHIFT + W",
    cmd = scripts .. "changewallpaper.sh",
    custom_mod = true
}, -- Multimedia Keys (Audio)
{
    key = "XF86AudioRaiseVolume",
    cmd = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+",
    custom_mod = true,
    flags = {
        locked = true,
        repeating = true
    }
}, {
    key = "XF86AudioLowerVolume",
    cmd = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
    custom_mod = true,
    flags = {
        locked = true,
        repeating = true
    }
}, {
    key = "XF86AudioMute",
    cmd = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
    custom_mod = true,
    flags = {
        locked = true,
        repeating = true
    }
}, {
    key = "XF86AudioMicMute",
    cmd = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle",
    custom_mod = true,
    flags = {
        locked = true,
        repeating = true
    }
}, -- Multimedia Keys (Brightness)
{
    key = "XF86MonBrightnessUp",
    cmd = "brightnessctl -e4 -n2 set 5%+",
    custom_mod = true,
    flags = {
        locked = true,
        repeating = true
    }
}, {
    key = "XF86MonBrightnessDown",
    cmd = "brightnessctl -e4 -n2 set 5%-",
    custom_mod = true,
    flags = {
        locked = true,
        repeating = true
    }
}, -- Player Controls
{
    key = "XF86AudioNext",
    cmd = "playerctl next",
    custom_mod = true,
    flags = {
        locked = true
    }
}, {
    key = "XF86AudioPause",
    cmd = "playerctl play-pause",
    custom_mod = true,
    flags = {
        locked = true
    }
}, {
    key = "XF86AudioPlay",
    cmd = "playerctl play-pause",
    custom_mod = true,
    flags = {
        locked = true
    }
}, {
    key = "XF86AudioPrev",
    cmd = "playerctl previous",
    custom_mod = true,
    flags = {
        locked = true
    }
}}

-- Screens
hl.bind(MAINMOD .. " + F", hl.dsp.window.fullscreen())
hl.bind("ALT + F", hl.dsp.window.float())
hl.bind(MAINMOD .. " + P", hl.dsp.window.pseudo())

-- Switch workspaces with MAINMOD + [0-9]
-- Move active window to a workspace with MAINMOD + SHIFT + [0-9]
for i = 1, 9 do
    local key = i % 10

    hl.bind(MAINMOD .. " + " .. key, hl.dsp.focus({
        workspace = i
    }))

    hl.bind(MAINMOD .. " + SHIFT + " .. key, hl.dsp.window.move({
        workspace = i
    }))
end

-- move focused window to directions with MAINMOD + SHIFT + arrow keys
for _, dir in ipairs(directions) do
    hl.bind(MAINMOD .. " + SHIFT + " .. dir, hl.dsp.window.move({
        direction = dir
    }))
end

-- Move focus with MAINMOD + arrow keys
for _, dir in ipairs(directions) do
    hl.bind(MAINMOD .. " + " .. dir, hl.dsp.focus({
        direction = dir
    }))
end

-- 
hl.bind("ALT + TAB", hl.dsp.window.cycle_next({}))
-- move to next/prev workspace
hl.bind(MAINMOD .. " + page_up", hl.dsp.focus({
    workspace = "-1"
}))
hl.bind(MAINMOD .. " + page_down", hl.dsp.focus({
    workspace = "+1"
}))
-- move active window to next/prev workspace
hl.bind(MAINMOD .. " + SHIFT + page_up", hl.dsp.window.move({
    workspace = "-1"
}))
hl.bind(MAINMOD .. " + SHIFT + page_down", hl.dsp.window.move({
    workspace = "+1"
}))

-- Example special workspace (scratchpad)
hl.bind(MAINMOD .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(MAINMOD .. " + SHIFT + S", hl.dsp.window.move({
    workspace = "special:magic"
}))

-- Scroll through existing workspaces with MAINMOD + scroll
hl.bind(MAINMOD .. " + mouse_down", hl.dsp.focus({
    workspace = "-1",
    repeating = true,
    locked = true
}))
hl.bind(MAINMOD .. " + SHIFT + mouse_down", hl.dsp.window.move({
    workspace = "-1"
}))
hl.bind(MAINMOD .. " + mouse_up", hl.dsp.focus({
    workspace = "+1",
    repeating = true,
    locked = true
}))
hl.bind(MAINMOD .. " + SHIFT + mouse_up", hl.dsp.window.move({
    workspace = "+1"
}))

-- Move/resize windows with MAINMOD + LMB/RMB and dragging
hl.bind(MAINMOD .. " + mouse:272", hl.dsp.window.drag(), {
    mouse = true
})
hl.bind(MAINMOD .. " + mouse:273", hl.dsp.window.resize(), {
    mouse = true
})

for _, app in ipairs(app_binds) do
    local trigger
    if app.custom_mod then
        trigger = app.key
    else
        trigger = MAINMOD .. " + " .. app.key
    end

    hl.bind(trigger, hl.dsp.exec_cmd(app.cmd), app.flags or {})
end
