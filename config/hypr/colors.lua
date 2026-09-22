-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
require("borders")
hl.config({
    general = {
        gaps_in  = 0,
		gaps_out = 0,

        border_size = 0,

        resize_on_border = false,
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 0,
        rounding_power = 0,

        active_opacity   = 0.90,
        inactive_opacity = 0.60,
		dim_inactive = true,
		dim_strength = 0.2,
		dim_modal = true,

        blur = {
            enabled   = true,
            size      = 7,
            passes    = 1,
			noise = 0.2,
            vibrancy  = -10,
			vibrancy_darkness = 0.6,
			special = true,
			ignore_opacity = true,
			new_optimizations = true,
			popups = true,
			xray = true,
			variant = drops,
		},
		shadow = {
				enabled	= false,
				range	= 500,
				render_power = 4,
				scale = 1,
		},
		glow = {
				enabled = true,
				range = 30,
				render_power = 2,
				color_inactive = "0xFF",
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
