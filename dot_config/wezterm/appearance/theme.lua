
local wezterm = require 'wezterm'

local M = {}

local config = {

}

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



M.config = config

M.scheme = wezterm.color.get_builtin_schemes()[config.color_scheme]

return M
