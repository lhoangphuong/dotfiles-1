local wezterm = require 'wezterm'
return {
	font = wezterm.font('SFMono Nerd Font', { weight = 'Bold' }),
	font_size = 11.0,
	window_decorations = 'RESIZE',
	hide_tab_bar_if_only_one_tab = true,
	-- window_background_opacity = 0.8,
	colors = {
		foreground = 'white',
	},

}
