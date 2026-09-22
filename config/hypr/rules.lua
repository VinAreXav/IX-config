-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})
hl.window_rule({
		name = "move-fullscreen",
		match = {
				fullscreen = true,
				fullscreen_state_client = 2
		},
		opaque = true,
		workspace = "name:empty",
})

hl.window_rule({
		name = "blur",
		match = {
				focus = true,
		},
		no_blur = true,
})

hl.window_rule ({
		name = "nsxiv",
		match = {
				class = "Nsxiv",
		},
		opaque = true,
		float = true,
		pin = true,
		move = {500, 150},
		size = {900, 900}

})
hl.window_rule ({
		name = "obsidian",
		match = {
				class = "obsidian",
		},
		opaque = true,
})
hl.window_rule ({
				name = "set_fullscreen",
				match = {
						class = "electron",
						initial_class = "electron",
				},
				no_blur = false,
				fullscreen = true,
				workspace = "special:trinkets",
})

hl.window_rule({
		name = "csp 2",
		match = {
				class = "clipstudiopaint.exe",
				title = "CLIP STUDIO PAINT",
		},
		opaque = true,
})
hl.window_rule({
		name = "csp",
		match = {
				class = "clipstudiopaint.exe",
				title = "Sub View",
		},
		opaque = true,
})


hl.window_rule({
		name = "time-stuff",
		match = {
				class = "kitty",
				initial_class = "kitty",
				initial_title = "kitty"
		},
		tile = true,
		move = {100, 200},
		size = {400, 200},
})
	
-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.layer_rule({
  match        = { namespace = "rofi" },
  blur         = true,
  ignore_alpha = 0.5,
})
hl.layer_rule({
  match        = { namespace = "wallpaper" },
  blur         = true,
  ignore_alpha = 0.5,
})

