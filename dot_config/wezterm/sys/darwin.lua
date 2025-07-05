local wezterm = require 'wezterm';

local M = {}
local keys = {}


-- local wezterm = require 'wezterm'

wezterm.on('bell', function(window, pane)
  window:toast_notification('wezterm', 'configuration reloaded!', nil, 4000)

  wezterm.log_info('the bell was rung in pane ' .. pane:pane_id() .. '!')
  -- Send macOS notification using osascript
  local notification_title = "WezTerm Bell"
  local notification_message = "Bell rang in pane " .. pane:pane_id()
  -- Use wezterm.run_child_process to execute osascript
  local success, stdout, stderr = wezterm.run_child_process({
    'osascript',
    '-e',
    string.format(
      'display notification "%s" with title "%s" sound name "Morse"',
      notification_message,
      notification_title
    )
  })
  -- Log any errors
  if not success then
    wezterm.log_error('Failed to send notification: ' .. stderr)
  end
end)


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
  window_background_opacity = wezterm.gui and wezterm.gui.get_appearance():find("Dark") and 0.80 or 1.0,
  macos_window_background_blur = 30,
  -- window_decorations = "INTEGRATED_BUTTONS | RESIZE",
  window_decorations = "RESIZE",
  front_end = "WebGpu",
  native_macos_fullscreen_mode = true,
  webgpu_power_preference = "HighPerformance",
  default_cursor_style = "SteadyBlock",
  -- default_cursor_style = "BlinkingBar",
}

return M
