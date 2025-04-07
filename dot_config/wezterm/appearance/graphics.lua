local M = {}

local wezterm = require("wezterm")

local isMac = wezterm.os == "macos"

local mac_config = {}

M.config = {
  -- status_update_interval = 100,
	enable_scroll_bar = true,
	-- window_background_opacity = 0.80,
	-- window_decorations = "INTEGRATED_BUTTONS | RESIZE",
	-- macos_window_background_blur = 35,
	-- front_end = "WebGpu",
	-- native_macos_fullscreen_mode = true,
	-- webgpu_power_preference = "HighPerformance",
	animation_fps = 60,
	max_fps = 60,
	window_padding = {
		left = 8,
		right = 8,
		top = 8,
		bottom = 8,
	},
  use_fancy_tab_bar = true

}

return M
