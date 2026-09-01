-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- require("layerrule")
local window_rules = { -- 1. Global / General Rules
	{
		match = {
			class = [[^()$]],
			title = [[^()$]],
		},
		no_blur = true,
	},
	{
		match = {
			class = [[.*]],
		},
		no_blur = true,
	},
	{
		match = {
			float = false,
		},
		no_shadow = true,
	},
	{
		match = {
			title = "Unlock Login Keyring",
		},
		float = true,
	}, -- 2. Floating & Centering (Common UI Elements)
	{
		match = {
			title = [[^(Choose Files|Open File.*|Select a File.*|Choose wallpaper.*|Open Folder.*|Save.*|Library.*|File Upload.*|.*wants to save|.*wants to open)$]],
		},
		float = true,
		center = true,
	},
	{
		match = {
			class = [[^(nwg-look|blueberry\.py|guifetch|nm-connection-editor|Zotero|org\.freedesktop\.impl\.portal\.desktop\.kde)$]],
		},
		float = true,
		center = true,
	},
	{
		match = {
			class = [[^(pavucontrol|org\.pulseaudio\.pavucontrol)$]],
		},
		float = true,
		center = true,
		size = { "45%", "45%" },
	}, -- 3. Specific App Rules (Unique sizes/positions)
	{
		match = {
			title = [[^HyprEmoji$]],
		},
		float = true,
		move = { "100%-400", "100%-400" },
	},
	{
		match = {
			class = [[^nwg-look$]],
		},
		size = { "60%", "65%" },
	},
	{
		match = {
			title = [[^Choose wallpaper.*$]],
		},
		size = { "60%", "65%" },
	},
	{
		match = {
			class = [[org\.freedesktop\.impl\.portal\.desktop\.kde]],
		},
		size = { "60%", "65%" },
	},
	{
		match = {
			class = [[^Zotero$]],
		},
		size = { "45%", "45%" },
	},
	{
		match = {
			class = [[^org\.gnome\.Loupe$]],
		},
		float = true,
		center = true,
		size = { "80%", "80%" },
	}, -- 4. Simple Floating (No centering/sizing)
	{
		match = {
			class = [[.*plasmawindowed.*|kcm_.*|.*bluedevilwizard]],
		},
		float = true,
	},
	{
		match = {
			title = [[.*Welcome|^illogical-impulse Settings$|.*Shell conflicts.*]],
		},
		float = true,
	}, -- 5. Positioning & Focus Rules
	{
		match = {
			class = [[^plasma-changeicons$]],
		},
		float = true,
		no_initial_focus = true,
		move = { 999999, 999999 },
	},
	{
		match = {
			title = [[^Copying — Dolphin$]],
		},
		move = { 40, 80 },
	},
	{
		match = {
			class = [[^dev\.warp\.Warp$]],
		},
		tile = true,
	}, -- 6. Picture-in-Picture
	{
		match = {
			title = [[^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$]],
		},
		float = true,
		pin = true,
		keep_aspect_ratio = true,
		size = { "25%", "25%" },
		move = { "73%", "72%" },
	}, -- 7. Tearing (Immediate mode for games)
	{
		match = {
			title = [[.*\.exe|.*minecraft.*]],
			class = [[^(steam_app).*]],
		},
		immediate = true,
	}, -- 8. Technical Fixes (JetBrains)
	{
		match = {
			class = [[^jetbrains-.*$]],
			float = true, -- match:float 1
			title = [[^$|^\s$|^win\d+$]],
		},
		no_initial_focus = true,
	},
}

-- Apply Window Rules
for _, rule in ipairs(window_rules) do
	hl.window_rule(rule)
end

-- Rule to tile scrcpy and suppress maximize events
hl.window_rule({
	name = "scrcpy_management",
	match = {
		class = "^scrcpy$",
	},
	tile = true,
})
