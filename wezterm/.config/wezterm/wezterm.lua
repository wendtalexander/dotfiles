-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main
config.colors = theme.colors()
config.window_frame = theme.window_frame()

config.font = wezterm.font("JetBrains Mono")
config.enable_wayland = true
config.window_background_opacity = 0.9

-- and finally, return the configuration to wezterm
return config
