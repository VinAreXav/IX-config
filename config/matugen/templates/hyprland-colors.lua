hl.config({
		general = {
				col = {
						active_border = {
								colors = { "rgba({{ colors.on_primary.dark.hex_alpha_stripped }})", "rgba({{ colors.on_tertiary_fixed.dark.hex_alpha_stripped }})" }, angle = 45 },
						inactive_border = "rgba({{ colors.surface.dark.hex_alpha_stripped | lighten: 20.0 }})",
						},
				}
})
