local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS NF")
config.font_size = 10

config.initial_cols = 156
config.initial_rows = 38
config.enable_tab_bar = false
config.window_background_opacity = 0.99
config.window_close_confirmation = 'NeverPrompt'
config.window_padding = {
	left = 6,
	right = 0,
	top = 0,
	bottom = 0,
}
config.colors = {
	foreground = "#dee2ff",
	background = "#000000",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#eb6f92", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#4ca9b5", "#eb6f92", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

return config
