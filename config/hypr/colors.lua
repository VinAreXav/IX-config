-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 0,
		gaps_out = 0,

        border_size = 2,

        resize_on_border = false,
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 0,
        rounding_power = 0,

        active_opacity   = 0.90,
        inactive_opacity = 0.60,

        shadow = {
            enabled      = true,
            range        = 300,
            render_power = 10,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = false,
            size      = 5,
            passes    = 1,
            vibrancy  = 5,
			ignore_opacity = true,
			new_optimizations = true,
			xray = false,
			variant = drops,
			--drops = {
			--		speed = 7.0
			--},
        },
    },

    animations = {
        enabled = true,
    },
	misc = {
		middle_click_paste = false,
        force_default_wallpaper = 1, 
        disable_hyprland_logo   = true,
    },

})
