local utils = require("utils")
local wezterm = require("wezterm")

local M = {}


M.config = {}
-- if macos, import and merge
if wezterm.target_triple == "aarch64-apple-darwin" then
	local darwin = require("sys/darwin")
	M.config = utils.merge(M.config, darwin.config)
end

return M
