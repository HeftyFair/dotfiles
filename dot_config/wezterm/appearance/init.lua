local font = require("appearance/font")
local window = require("appearance/window")
local utils = require("utils")
local graphics = require("appearance/graphics")
local theme = require("appearance/theme")
require("appearance/status")
require("appearance/tab")

local M = {}

M.config = {}
M.config = utils.merge(M.config, font.config)
M.config = utils.merge(M.config, window.config)
M.config = utils.merge(M.config, graphics.config)
M.config = utils.merge(M.config, theme.config)

return M
