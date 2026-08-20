-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 5,
		gaps_out = 5,

        border_size = 0,

        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 0.87,
        inactive_opacity = 0.40,

        shadow = {
            enabled      = true,
            range        = 5,
            render_power = 14,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 5,
            passes    = 1,
            vibrancy  = 5,
			ignore_opacity = true,
			new_optimizations = true,
			xray = false
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
