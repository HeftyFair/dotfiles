
local wezterm = require 'wezterm';


local M = {}
local keys = {}

wezterm.on(
    "open-uri",
    function(window, pane, uri)
        local start, match_end = uri:find("file://")
        if start == 1 then
            local file = uri:sub(match_end + 1)
            window:perform_action(
                wezterm.action {SpawnCommandInNewWindow = {args = {"/opt/homebrew/bin/nvim", file}}},
                pane
            )
            return false
        end
    end
)


table.insert(keys, {
  key = ",", mods = "SUPER",
  action = wezterm.action.SpawnCommandInNewTab({
    cwd = wezterm.home_dir,
    args = { "/opt/homebrew/bin/nvim", wezterm.config_file },
  }),
})

M.config = {
  keys = keys,
	window_background_opacity = 0.80,
	window_decorations = "INTEGRATED_BUTTONS | RESIZE",
	macos_window_background_blur = 35,
	front_end = "WebGpu",
	native_macos_fullscreen_mode = true,
	webgpu_power_preference = "HighPerformance",
}

return M
