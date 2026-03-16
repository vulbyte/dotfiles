local wezterm = require 'wezterm'

local window = window;

local config = {}

local dimmed = {
	brightness = 0.02,
	hue = 1.0,
	saturation = 1.0,
}

local height_val, width_val

function recompute_padding(window)
	local window_dims = window:get_dimensions()

	height_val = window_dims.height;
	width_val = window_dims.width;
	-- local win_height = window.get_dimentions().pixel_height;
	-- local win_width = window.get_dimentions().pixel_width;	
end

--wezterm.on("window-resized", function(window, pane)
--	recompute_padding(window)
--end)

config.enable_scroll_bar = true

config.background = {
	{
		source = { Color = "black" },
		width = "100%",
		height = "100%"
	},
	{
		source = {
			File =
			"/Users/insert/dotfiles/.config/nvim/images/pixel_mangle.webp" --'/.config/nvim/images/loona7.png'
		},

		hsb = dimmed, --{  hue = 1.0,saturation = 1.5, brightness = 1.0,} ,

		horizontal_align = "Right",
		vertical_align = "Bottom",
		vertical_offset = "-3.5cell",

		-- height = "Cover", USE THIS WITH NO WIDTH TO SET BG THAT WILL SCALE WITHOUT STRETCH

		height = "956px", --(win_height*0.1),
		width = "938px", --(win_width*0.1),	-- auto, maybe a "aspect-ratio = 1/1;" ?

		repeat_x = 'NoRepeat',
		repeat_y = 'NoRepeat',
	},
}

-- local test09 = File("~/dotfiles/fonts/test09-v1r42.otf");]
--
----consistent errors with this, just specify the one you want
config.font = wezterm.font_with_fallback {
	{ family = "New Font", weight = 'Medium' },
	--"Source Code Pro",
	--{ family = 'JetBrains Mono', weight = 'Medium' },
	-- { family = 'Terminus', weight = 'medium' },
	--'Noto Color Emoji',
	--"Comic Sans MS",
}
-- config.font_dirs = "~/dotfiles/fonts/";

return config
