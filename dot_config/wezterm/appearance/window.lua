local M = {}

local wezterm = require("wezterm")

M.config = {
	-- window_background_opacity = 0.9,
	window_frame = {
		-- The font used in the tab bar.
		-- Roboto Bold is the default; this font is bundled
		-- with wezterm.
		-- Whatever font is selected here, it will have the
		-- main font setting appended to it to pick up any
		-- fallback fonts you may have used there.
		font = wezterm.font({ family = "Roboto", weight = "DemiBold" }),

		-- The size of the font in the tab bar.
		-- Default to 10.0 on Windows but 12.0 on other systems
		font_size = 14,

		-- The overall background color of the tab bar when
		-- the window is focused
		-- active_titlebar_bg = color_bg_165,

		-- The overall background color of the tab bar when
		-- the window is not focused
		-- inactive_titlebar_bg = color_bg_100,
		-- inactive_titlebar_bg  = scheme_def.brights[1],

		-- border_top_height = '0.03cell',
		border_bottom_height = "1px",
		border_left_width = "1px",
		border_right_width = "1px",

		-- border_top_color = brightness_auto_adjust(scheme_def.background, 0.3),
		-- border_bottom_color = color_bg_300,
		-- border_left_color = color_bg_300,
		-- border_right_color = color_bg_300,
	},
	-- window_frame = {
	--   font_size = 13.0
	-- }
}

return M
