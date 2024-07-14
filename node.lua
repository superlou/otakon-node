gl.setup(1920, 1080)
local Heading = require "heading"
require "color_util"
require "json_util"
require "glass"
local Ticker = require "ticker"
local Clock = require "clock"
local offset = require "offset"
local json = require "json"
local TopicPlayer = require "topic_player"
local tw = require "tween"
local ServiceIndicator = require "service_indicator"

local main_bg = resource.load_image "img_right_bg_wide6.png"
local ticker_left_crop = resource.load_image "img_ticker_left_crop2.png"
local ticker_right_crop = resource.load_image "img_ticker_right_crop2.png"

local ticker = Ticker:new(0, HEIGHT - 116, WIDTH, 116)
local clock = Clock:new(200, 96)
local service_indicator = ServiceIndicator()

local style = require "style"
local topic_sidebar = TopicPlayer(640, 964, style["sidebar_style"])
local topic_main = TopicPlayer(1280, 964, style["main_style"])

util.data_mapper {
    ["clock/update"] = function(data)
        data = json.decode(data)
        clock:update(data.hh_mm, data.am_pm, data.month, data.date)
    end;
    ["guidebook/update"] = function(data)
        data = json.decode(data)
        service_indicator:update(data.updating, data.checks, data.desc)
    end;
}

json_watch("config.json", function(config)
    ticker:set_speed(config.ticker_speed)
    ticker:set_msgs_from_config(config)
    topic_sidebar:set_topics_from_config(config["left_topic_player"])
    topic_main:set_topics_from_config(config["right_topic_player"])
end)

function node.render()
    tw:update(1 / 60)

    gl.clear(1, 1, 1, 1)

    offset(1280, 0, function()
        topic_sidebar:draw()
    end)

    main_bg:draw(0, 0, 1280, 964)

    offset(0, 0, function()
        topic_main:draw()
    end)

    ticker:draw()

    ticker_left_crop:draw(0, 964, 85, 964 + 116)
    ticker_right_crop:draw(1697, 964, 1697 + 223, 964 + 116)

    offset(1710, 972, function()
        clock:draw()
    end)

    offset(10, 978, function()
        service_indicator:draw()
    end)
end