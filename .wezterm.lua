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
	source = {Color="black"},
		width = "100%",
		height = "100%"
    },
    {
        source = {
            File = "/Users/insert/dotfiles/.config/nvim/images/pixel_mangle.gif"--'/.config/nvim/images/loona7.png'
        },

	hsb = dimmed, --{  hue = 1.0,saturation = 1.5, brightness = 1.0,} ,

        horizontal_align = "Right",
        vertical_align = "Bottom",
	vertical_offset = "-3.5cell",

        -- height = "Cover", USE THIS WITH NO WIDTH TO SET BG THAT WILL SCALE WITHOUT STRETCH

	height = "428px", --(win_height*0.1),
	width =  "536px", --(win_width*0.1),	-- auto, maybe a "aspect-ratio = 1/1;" ?

	repeat_x = 'NoRepeat',
	repeat_y = 'NoRepeat',
    },
}



config.font = wezterm.font('New Font')

return config
