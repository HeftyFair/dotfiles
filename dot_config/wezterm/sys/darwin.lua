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
        wezterm.action { SpawnCommandInNewWindow = { args = { "/opt/homebrew/bin/nvim", file } } },
        pane
      )
      return false
    end
  end
)


table.insert(keys, {
  key = ",",
  mods = "SUPER",
  action = wezterm.action.SpawnCommandInNewTab({
    cwd = wezterm.home_dir,
    args = { "/opt/homebrew/bin/nvim", wezterm.config_file },
  }),
})

M.config = {
  keys = keys,
  window_background_opacity = wezterm.gui and wezterm.gui.get_appearance():find("Dark") and 0.80 or 0.70,
  macos_window_background_blur = 30,
  -- window_decorations = "INTEGRATED_BUTTONS | RESIZE",
  window_decorations = "RESIZE",
  front_end = "WebGpu",
  native_macos_fullscreen_mode = true,
  webgpu_power_preference = "HighPerformance",
  -- default_cursor_style = "SteadyBlock",
  default_cursor_style = "BlinkingBar",
}

return M
