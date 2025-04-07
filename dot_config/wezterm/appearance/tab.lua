
local wezterm = require 'wezterm';


local process_icons = { -- for get_process function
  ['docker'] = wezterm.nerdfonts.linux_docker,
  ['docker-compose'] = wezterm.nerdfonts.linux_docker,
  ['psql'] = wezterm.nerdfonts.dev_postgresql,
  ['kuberlr'] = wezterm.nerdfonts.linux_docker,
  ['kubectl'] = wezterm.nerdfonts.linux_docker,
  ['stern'] = wezterm.nerdfonts.linux_docker,
  ['nvim'] = wezterm.nerdfonts.custom_vim,
  ['make'] = wezterm.nerdfonts.seti_makefile,
  ['vim'] = wezterm.nerdfonts.dev_vim,
  ['go'] = wezterm.nerdfonts.seti_go,
  ['zsh'] = wezterm.nerdfonts.dev_terminal,
  ['bash'] = wezterm.nerdfonts.cod_terminal_bash,
  ['btm'] = wezterm.nerdfonts.mdi_chart_donut_variant,
  ['htop'] = wezterm.nerdfonts.mdi_chart_donut_variant,
  ['cargo'] = wezterm.nerdfonts.dev_rust,
  ['sudo'] = wezterm.nerdfonts.fa_hashtag,
  ['lazydocker'] = wezterm.nerdfonts.linux_docker,
  ['git'] = wezterm.nerdfonts.dev_git,
  ['lua'] = wezterm.nerdfonts.seti_lua,
  ['wget'] = wezterm.nerdfonts.mdi_arrow_down_box,
  ['curl'] = wezterm.nerdfonts.mdi_flattr,
  ['gh'] = wezterm.nerdfonts.dev_github_badge,
  ['ruby'] = wezterm.nerdfonts.cod_ruby,
  ['pwsh'] = wezterm.nerdfonts.seti_powershell,
  ['node'] = wezterm.nerdfonts.dev_nodejs_small,
  ['dotnet'] = wezterm.nerdfonts.md_language_csharp,
}

local function get_process(tab)
  local process_name = tab.active_pane.foreground_process_name:match("([^/\\]+)%.exe$") or
      tab.active_pane.foreground_process_name:match("([^/\\]+)$")

  -- local icon = process_icons[process_name] or string.format('[%s]', process_name)
  local icon = process_icons[process_name] or wezterm.nerdfonts.seti_checkbox_unchecked

  return icon
end

local function getDirectoryName(path)
  if not path then
    return 'Unknown'
  end
  -- Remove any trailing slashes from the path
  path = path:gsub("/+$", "")
  -- Extract the last part of the path (the directory name)
  local directoryName = path:match("([^/]+)$")
  return directoryName or 'Unknown'
end


wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane
  local cwd_uri = pane.current_working_dir
  local directoryName = 'Unknown'
  local process = get_process(tab)

  if cwd_uri then
    -- Convert the URI to a string, remove the hostname, and decode %20s:
    local cwd_path = cwd_uri.file_path
    -- cwd_path = cwd_path:gsub("^file://[^/]+", "") -- not needed
    -- cwd_path = decodeURI(cwd_path) -- not needed

    -- Extract the directory name from the decoded path:
    directoryName = getDirectoryName(cwd_path)
  end

  local title = string.format(' ⌘%s  %s  %s', (tab.tab_index + 1), directoryName, process) 

  return {
    { Text = title },
  }
end)



-- wezterm.on("format-tab-title", function(tab, tabs, panes, c, hover, max_width)
-- 	local palette = c.resolved_palette.tab_bar
-- 	local colors = {
-- 		bg = palette.background,
-- 		tab = tab.is_active and palette.active_tab.bg_color or palette.inactive_tab.bg_color,
-- 		fg = tab.is_active and palette.active_tab.fg_color or palette.inactive_tab.fg_color,
-- 	}
--
-- 	return {
-- 		{ Background = { Color = colors.bg } },
-- 		{ Foreground = { Color = colors.tab } },
-- 		{ Text = wezterm.nerdfonts.ple_lower_right_triangle },
-- 		{ Background = { Color = colors.tab } },
-- 		{ Foreground = { Color = colors.fg } },
-- 		{ Text = tab.active_pane.title },
-- 		{ Background = { Color = colors.tab } },
-- 		{ Foreground = { Color = colors.bg } },
-- 		{ Text = wezterm.nerdfonts.ple_upper_right_triangle },
-- 	}
-- end)
