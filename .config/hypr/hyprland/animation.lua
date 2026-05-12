-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
-- Curves
hl.config({
    animations = {
        enabled = true
    }
})

-- Curves
hl.curve("mac", {
    type = "bezier",
    points = {{0.25, 0.1}, {0.25, 1.0}}
})

hl.curve("macClose", {
    type = "bezier",
    points = {{0.55, 0.0}, {1.0, 0.45}}
})

hl.curve("macMove", {
    type = "bezier",
    points = {{0.2, 0.0}, {0.0, 1.0}}
})

-- Window opening
hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 5,
    bezier = "mac",
    style = "slidefade 6%"
})

-- Window closing
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 5,
    bezier = "macClose",
    style = "slidefade 6%"
})

-- Tile rearranging
hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 5,
    bezier = "macMove"
})

-- Fade sync
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 4,
    bezier = "mac"
})

-- Border transitions
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 6,
    bezier = "mac"
})

-- Workspace switching
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 5,
    bezier = "mac",
    style = "slide"
})

-- Special workspace
hl.animation({
    leaf = "specialWorkspace",
    enabled = true,
    speed = 5,
    bezier = "mac",
    style = "slidefadevert 12%"
})

-- Notifications / rofi / bars
hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    bezier = "mac",
    style = "fade"
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 4,
    bezier = "macClose",
    style = "fade"
})
