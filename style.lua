local font_hdg = resource.load_font "font_Poppins-Regular.ttf"
local font_hdg_bold = resource.load_font "font_Poppins-BlackItalic.ttf"
local font_body = resource.load_font "font_QuattrocentoSans-Regular.ttf"
local font_body_bold = resource.load_font "font_QuattrocentoSans-Bold.ttf"

local sidebar_style = {
    heading = {
        style = "underline",
        font = font_hdg,
        font_size = 64,
        text_color = "333195",
        shadow_color = "333195",
        padding = 50,
    },
    text = {
        font = font_body,
        font_bold = font_body_bold,
        color = "333195",
    },
    margin = {70, 70, 70, 70},
    heading_y = 100,
    message_y = 180,
}

local main_style = {
    heading = {
        style = "box",
        font = font_hdg,
        text_color = "61491c",
        font_size = 64,
        padding = 50,
        bg_color = "ffc049",
        shadow_color = "785a22",
    },
    text = {
        font = font_body,
        font_bold = font_body_bold,
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