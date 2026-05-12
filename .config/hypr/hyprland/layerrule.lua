local layer_rules = { -- 1. Global Xray
{
    match = {
        namespace = [[.*]]
    },
    xray = true
}, -- 2. No Animation (Launchers, Pickers, Indicators)
{
    match = {
        namespace = [[^(walker|selection|overview|anyrun|indicator.*|osk|hyprpicker|noanim|gtk4-layer-shell)$]]
    },
    no_anim = true
}, -- 3. Standard Blur & Ignore Alpha (GTK Shell & Launchers)
{
    match = {
        namespace = [[gtk-layer-shell]]
    },
    blur = true,
    ignore_alpha = 0
}, {
    match = {
        namespace = [[launcher]]
    },
    blur = true,
    ignore_alpha = 0.5
}, {
    match = {
        namespace = [[notifications]]
    },
    blur = true,
    ignore_alpha = 0.69
}, {
    match = {
        namespace = [[logout_dialog]]
    },
    blur = true
}, -- 4. AGS Components (Bars, Docks, Indicators, etc.)
{
    match = {
        namespace = [[^(session[0-9]*|bar[0-9]*|barcorner.*|dock[0-9]*|indicator.*|overview[0-9]*|cheatsheet[0-9]*|sideright[0-9]*|sideleft[0-9]*|osk[0-9]*)$]]
    },
    blur = true,
    ignore_alpha = 0.6
}, -- 5. Directional Animations (AGS Sidebars)
{
    match = {
        namespace = [[sideleft.*]]
    },
    animation = "slide left"
}, {
    match = {
        namespace = [[sideright.*]]
    },
    animation = "slide right"
}}

-- Apply Layer Rules
for _, rule in ipairs(layer_rules) do
    hl.layer_rule(rule)
end
