local wezterm = require("wezterm")

local utils = require("utils")
-- This will hold the configuration.
local config = wezterm.config_builder()


if wezterm.gui.get_appearance():find("Dark") then
	-- config.color_scheme = "Darcula (base16)"
	-- config.color_scheme = "Tokyo Night"
	-- config.color_scheme = "catppuccin-frappe"
	-- config.color_scheme = "Dracula"
	config.color_scheme = "One Dark (Gogh)"
else
	config.color_scheme = "Tokyo Night Day"
	-- config.color_scheme = "Tomorrow (gogh)"
	-- config.color_scheme = "Tomorrow"
	-- config.color_scheme = "Tokyo Night"
end

local appearance = require("appearance")
local sys = require("sys")

-- if wezterm.target_triple == "aarch64-apple-darwin" then
-- 	table.insert(config.keys, {
-- 		key = ",",
-- 		mods = "SUPER",
-- 		action = wezterm.action.SpawnCommandInNewTab({
-- 			cwd = wezterm.home_dir,
-- 			args = { "/opt/homebrew/bin/nvim", wezterm.config_file },
-- 		}),
-- 	})
-- end

config = utils.merge(appearance.config, config)
config = utils.merge(sys.config, config)

-- and finally, return the configuration to wezterm
return config
