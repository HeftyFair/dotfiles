local wezterm = require("wezterm")

local M = {}

M.config = {
	font = wezterm.font_with_fallback({
		-- { family = "Iosevka Term", weight = "Medium" },
		-- { family = "Cascadia Code", weight = "Medium" },
		-- { family = "JetBrains Mono", weight = "Medium" },
		{
			-- family = "Monaspace Argon Var",
			-- family='Monaspace Neon',
			-- family='Monaspace Xenon',
			family = 'Monaspace Radon Var',
			-- family='Monaspace Krypton',
			-- family='Iosevka Term',
			-- family='Cascadia Code',
			-- family='JetBrains Mono',
			-- family='Menlo',

			weight = "Regular",
			harfbuzz_features = {
				"calt",
				"liga",
				"ss01",
				"ss02",
				"ss03",
				"ss04",
				"ss05",
				"ss06",
				"ss07",
				"ss08",
				"ss09",
				"ss10",
				"ss11"
			},
		},
		-- { family = "Menlo", weight = "Medium" },
		-- "Noto Color Emoji",
		-- "Symbols Nerd Font",
	}),
	font_size = 14.0,
}

return M
