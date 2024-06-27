# this script is meant for obs, feel free to read more here: https://docs.obsproject.com/scripting
# obs 28+ required

# import obswebsocket
import obspython as obs
# from obswebsocket import obsws, requests

import mss
from PIL import Image

# ######################################################################
# global vars
# ######################################################################


# ######################################################################
# obs inputs vars
# ######################################################################

def script_properties():
    props = obs.obs_properties_create()
    # p = obs.obs_properties_add_list(
    #         props,
    #         "source",
    #         "Text Source",
    #         obs.OBS_COMBO_TYPE_EDITABLE,
    #         obs.OBS_COMBO_FORMAT_STRING
    #     )
    enabled = obs.obs_properties_add_bool(
            props,
            "enabled?",  # name
            "enabled?",  # description
        )
    monitor = obs.obs_properties_add_int(
            props,
            "monitor",  # name
            "monitor (the one program will run on)",  # description
            1,  # min
            9,  # max
            1,  # step
        )
    padding = obs.obs_properties_add_int(
            props,
            "padding",
            "padding",
            0,  # min
            50,  # max (this will assign all to middle ish)
            5, # step
        )
    interval = obs.obs_properties_add_int(
                props,
                "update_interval",
                "update interval",
                0,  # min, every frame
                10000,  # max, 10 seconds
                500,  # step
            )

    sources = obs.obs_enum_sources()
    if sources is not None:
        for source in sources:
            source_id = obs.obs_source_get_id(source)
            if source_id == "text_gdiplus" or source_id == "text_ft2_source":
                name = obs.obs_source_get_name(source)
                obs.obs_property_list_add_string(enabled, name, name)
                obs.obs_property_list_add_string(monitor, name, name)
                obs.obs_property_list_add_string(padding, name, name)

        obs.source_list_release(sources)

    # obs.obs_properties_add_button(props, "button", "Refresh", refresh_pressed)
    return props


# ######################################################################
# functions
# ######################################################################
def get_pixel_value(monitor, x, y):
    with mss.mss() as sct:
        # capture screen
        monitor = sct.monitors[2]  # Change this to the correct monitor
        screenshot = sct.grab(monitor)

        # convert the screenshot to PIL image
        img = Image.frombytes('RGB', (screenshot.width, screenshot.height), screenshot.rgb)

        # get pixel value at (x, y) within screen bounds
        if 0 <= x < screenshot.width and 0 <= y < screenshot.height:
            pixel_value = img.getpixel((x, y))
            return pixel_value
        else:
            raise ValueError(f"Coordinates ({x}, {y}) are out of screen bounds ({screenshot.width}, {screenshot.height})")


# def script_load(monitor_number, perfect_from_edge):
#     with mss.mss() as sct:
#         monitor = sct.monitors[monitor_number]  # Change this to the correct monitor index if needed
#         screenshot = sct.grab
#
#         img = Image.frombytes('RGB', (screenshot.width, screenshot.height), screenshot.rgb)
#
#         width = screenshot.width
#         height = screenshot.height


# ######################################################################
# main
# ######################################################################

# obs socket
# host = "localhost"
# port = 4444
# password = "646837"
#
# ws = obsws(host, port, password)
# ws.connect

# get input source (eg, a text source)
# input_monitor = 1

# set a new text value
# new_text = "obs test"
# ws.call(requests.SetTextGDIPlusProperties(source=input_monitor, text=new_text))

# disconnect
# ws.disconnect()

x = 2
y = 4
monitor_input = 0

arr = []

try:
    arr.append(get_pixel_value(monitor_input, 1000, 1000))
    arr.append(get_pixel_value(monitor_input, 1000, 1500))
    arr.append(get_pixel_value(monitor_input, 1000, 2000))

    arr.append(get_pixel_value(monitor_input, 2000, 1000))
    arr.append(get_pixel_value(monitor_input, 2000, 1500))
    arr.append(get_pixel_value(monitor_input, 2000, 2000))

    arr.append(get_pixel_value(monitor_input, 3000, 1000))
    arr.append(get_pixel_value(monitor_input, 3000, 1500))
    arr.append(get_pixel_value(monitor_input, 3000, 2000))
except ValueError as e:
    print(e)

# Print pixel values
print(arr)
