-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

config.warn_about_missing_glyphs = false
-- config.enable_wayland = false
config.window_background_opacity = 0.95

config.font_size = 14.5
config.color_scheme = "rose-pine-moon"
config.front_end = "WebGpu"
config.font = wezterm.font("GeistMono Nerd Font")
config.line_height = 1.1

config.keys = {
	{
		key = "P",
		mods = "CTRL",
		action = wezterm.action.ActivateCommandPalette,
	},
}
config.keys = {
	{
		key = "C",
		mods = "CTRL",
		action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
	},
}

config.keys = {
	-- paste from the clipboard
	{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },

	-- paste from the primary selection
	{ key = "v", mods = "CTRL", action = act.PasteFrom("PrimarySelection") },
}
-- and finally, return the configuration to wezterm
--
config.enable_tab_bar = false
return config
