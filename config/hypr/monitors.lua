------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "eDP-1",
    mode     = "preferred",
	position = "0x0",
    scale    = "1",
})

hl.monitor({
		output   = "HDMI-A-3",
		mode     = "preferred",
--		position = "-1080x0",
        position = "-1920x0",
		scale    = "1",
--		transform = 3,
})


