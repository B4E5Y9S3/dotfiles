-------------------
---- AUTOSTART ----
-------------------
-- Important system startups
hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	-- wallpaper
	hl.exec_cmd("awww-daemon --format xrgb")
	-- notification daemon
	-- hl.exec_cmd("swaync");
	hl.exec_cmd("mako")
	-- waybar, lockscreen
	hl.exec_cmd("sleep 1 && waybar")
	hl.exec_cmd("hypridle")

	hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("hyprpm reload")
	hl.exec_cmd("easyeffects --gapplication-service")
end)
