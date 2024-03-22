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
            File = "/Users/insert/dotfiles/.config/nvim/images/loona7.png" --'/.config/nvim/images/loona7.png'
        },
        --brightness = 0.008,
        --hue = 1.0,
        --saturation = 1.0,
        horizontal_align = "Left",
        vertical_align = "Top",
        height = "100%",
        width = "Fixed",

        hsb = dimmed
    }
}

config.font = wezterm.font('New Font')

return config
