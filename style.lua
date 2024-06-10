local font = resource.load_font "font_Lato-Regular.ttf"
local font_bold = resource.load_font "font_Lato-Bold.ttf"

local sidebar_style = {
    heading = {
        style = "underline",
        font = font,
        font_size = 64,
        text_color = "333195",
        shadow_color = "333195",
        padding = 50,
    },
    text = {
        font = font,
        font_bold = font_bold,
        color = "333195",
    },
    margin = {70, 70, 70, 70},
    heading_y = 100,
    message_y = 180,
}

local main_style = {
    heading = {
        style = "box",
        font = font,
        text_color = "61491c",
        font_size = 64,
        padding = 50,
        bg_color = "ffc049",
        shadow_color = "785a22",
    },
    text = {
        font = font,
        font_bold = font_bold,
        color = "ffffff",
    },
    player_bg_mask = nil,
    margin = {80, 60, 80, 60},
    heading_y = 100,
    message_y = 180,
}

return {
    sidebar_style = sidebar_style,
    main_style = main_style,
}