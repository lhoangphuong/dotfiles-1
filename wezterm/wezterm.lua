local wezterm = require 'wezterm'
return {
	font = wezterm.font {
		family = 'SFMono Nerd Font',
	},
	font_size = 11.0,
	window_decorations = 'RESIZE',
	hide_tab_bar_if_only_one_tab = true,
}
