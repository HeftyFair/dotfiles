local wezterm = require("wezterm")

local utils = require("utils")
-- This will hold the configuration.
local config = wezterm.config_builder()

local appearance = require("appearance")
local sys = require("sys")

config = utils.merge(appearance.config, config)
config = utils.merge(sys.config, config)

-- and finally, return the configuration to wezterm
return config
