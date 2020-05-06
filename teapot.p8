pico-8 cartridge // http://www.pico-8.com
version 21
__lua__

#include strings.lua
#include math.lua
#include off.lua
#include teapot.lua

local off_viewer = off:new()
local teapot_data = teapot:new()

function _init()
    off:init({
        data1 = teapot_data.data1,
        data2 = teapot_data.data2,
        data3 = teapot_data.data3,
        data4 = teapot_data.data4,
        data5 = teapot_data.data5,
        data6 = teapot_data.data6,
        data7 = teapot_data.data7,
        data8 = teapot_data.data8,
        data9 = teapot_data.data9,
        data10 = teapot_data.data10,
    })
end

function _update()
    off:update()
end

function _draw()
    cls()
    off:draw()
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000