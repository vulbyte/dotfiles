local wezterm = require 'wezterm'
local config = {}

--config.window_background_image = "./Users/insert/loona7.png"
local dimmed = {
    brightness = 0.02,
    hue = 1.0,
    saturation = 1.0,
}

config.enable_scroll_bar = true

config.background = {
    {
        source = {
            File = './Users/insert/.config/nvim/images/loona7.jpg'
        },
        --brightness = 0.008,
        --hue = 1.0,
        --saturation = 1.0,
        horizontal_align = "Left",
        height = "Cover",
        width = "Cover",

        hsb = dimmed
    }
}

config.font = wezterm.font('New Font')

--config.window_background_image_hsb = {
--  -- Darken the background image by reducing it to 1/3rd
--  brightness = 0.008,
--
--  -- You can adjust the hue by scaling its value.
--  -- a multiplier of 1.0 leaves the value unchanged.
--  hue = 1.0,
--
--  -- You can adjust the saturation also.
--  saturation = 1.0,
--
--
--  --repeat_x = 'NoRepeat',
--  height = "Cover",
--  width = "Cover",
--}

return config
