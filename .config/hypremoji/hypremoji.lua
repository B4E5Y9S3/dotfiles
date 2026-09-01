-- HyprEmoji Configuration

-- Keybind to open hypremoji
hl.bind("SUPER + period", hl.dsp.exec_cmd("hypremoji"))

-- Window rules for HyprEmoji
hl.window_rule({
    match = { title = "^(HyprEmoji)$" },
    float = true,
    move  = {525, 232},
    size  = {316, 340},
})
