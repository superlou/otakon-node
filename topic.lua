local class = require "middleclass"

local Topic = class("Topic")

local mask_shader = resource.create_shader[[
    uniform sampler2D mask;
    uniform sampler2D Texture;
    uniform float alpha;
    varying vec2 TexCoord;

    void main() {
        vec4 img = texture2D(Texture, TexCoord).rgba;
        img.a = texture2D(mask, TexCoord).a * alpha;
        gl_FragColor = img;
    }
]]

function Topic:initialize(w, h, style, duration)
    self.w, self.h = w, h
    self.style = style
    self.duration = duration
    self.done = false
end

function Topic:set_done()
    self.done = true
end

function Topic:is_done()
    return self.done
end

function Topic:use_background_media(media, mask_filename)
    if media.filename ~= "img_no_media.png" and media.asset_name then
        self.background = resource.load_image(media.asset_name)
    end

    if mask_filename then
        self.mask = resource.load_image(mask_filename)
    end
end

function Topic:draw_background_media(alpha)
    if self.background then
        if self.mask then
            mask_shader:use {mask = self.mask, alpha = alpha}
        end
        self.background:draw(0, 0, self.w, self.h, alpha)
        if self.mask then
            mask_shader:deactivate()
        end
    end
end

return Topic