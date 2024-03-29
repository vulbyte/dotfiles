-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- For example, changing the color scheme:
config.color_scheme = 'Adventure'

config.window_background_image = {
    source = {
        File = '~/.config/nvim/images/loona7.png'
    },
    width = "100%",     -- Replace with the actual width of your image
    height = "contain", -- Replace with the actual height of your image
    vertical_align = "bottom",
}

-- config.window_background_image = "~/dotfiles/.config/nvim/images/loona7.png"
-- config.window_background_image_width = "contain"
-- config.window_background_image_height = "contain"

config.window_background_image_hsb = {
    brightness = 0.08,
    hue = 1.0,
    saturation = 1.0,
}

return config
