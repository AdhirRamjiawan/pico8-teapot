off = {}
local counts = {}
local maths = gfx_maths:new()

function off:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    self.vertices1 = {}
    self.vertices2 = {}
    self.vertices3 = {}
    self.vertices4 = {}
    self.vertices5 = {}
    self.vertices6 = {}
    self.vertices7 = {}
    self.vertices8 = {}
    self.vertices9 = {}
    self.vertices10 = {}

    self.faces = {}

    self.vertice_count = 0
    self.face_count = 0
    self.edge_count = 0

    self.scale = 1

    return o
end

function off:init(data)
    self.data = data
    self.vertice_count = self.data.data1[1]
    self.face_count = self.data.data1[2]
    self.edge_count =  self.data.data1[3]


    local vertice_end_index = self.vertice_count + 2

    for r = 4, #data.data1, 3 do
        add(self.vertices1, self.data.data1[r])
        add(self.vertices1, self.data.data1[r + 1])
        add(self.vertices1, self.data.data1[r + 2])
    end

    for r = 1, #data.data2, 3 do
        add(self.vertices2, self.data.data2[r])
        add(self.vertices2, self.data.data2[r + 1])
        add(self.vertices2, self.data.data2[r + 2])
    end

    for r = 1, #data.data3, 3 do
        add(self.vertices3, self.data.data3[r])
        add(self.vertices3, self.data.data3[r + 1])
        add(self.vertices3, self.data.data3[r + 2])
    end

    for r = 1, #data.data4, 3 do
        add(self.vertices4, self.data.data4[r])
        add(self.vertices4, self.data.data4[r + 1])
        add(self.vertices4, self.data.data4[r + 2])
    end

    for r = 1, #data.data5, 3 do
        add(self.vertices5, self.data.data5[r])
        add(self.vertices5, self.data.data5[r + 1])
        add(self.vertices5, self.data.data5[r + 2])
    end

    for r = 1, #data.data6, 3 do
        add(self.vertices6, self.data.data6[r])
        add(self.vertices6, self.data.data6[r + 1])
        add(self.vertices6, self.data.data6[r + 2])
    end

    for r = 1, #data.data7, 3 do
        add(self.vertices7, self.data.data7[r])
        add(self.vertices7, self.data.data7[r + 1])
        add(self.vertices7, self.data.data7[r + 2])
    end

    for r = 1, #data.data8, 3 do
        add(self.vertices8, self.data.data8[r])
        add(self.vertices8, self.data.data8[r + 1])
        add(self.vertices8, self.data.data8[r + 2])
    end

    for r = 1, #data.data9, 3 do
        add(self.vertices9, self.data.data9[r])
        add(self.vertices9, self.data.data9[r + 1])
        add(self.vertices9, self.data.data9[r + 2])
    end

    for r = 1, #data.data10, 3 do
        add(self.vertices10, self.data.data10[r])
        add(self.vertices10, self.data.data10[r + 1])
        add(self.vertices10, self.data.data10[r + 2])
    end

   -- for r = vertice_end_index + 1, #self.rows do
    --    local face = split(self.rows[r], " ")
        -- TODO: SEE https://github.com/AdhirRamjiawan/offviewer/blob/master/src/app.ts#L57

    --end
end

function off:update()
end

function off:draw_part(data)
    for r = 1, #data, 3 do
    
        local radian = maths:radian(time() * 15)
        local rot = {
            x = data[r],
            y = data[r + 1],
            z = data[r + 2],
        }


        rot = maths:rotate_yaxis(maths:radian(-29), data[r], data[r+1], data[r+2])
        rot = maths:rotate_yaxis(radian, rot.x, rot.y, rot.z)
        rot = maths:rotate_xaxis(radian, rot.x, rot.y, rot.z)
        rot = maths:rotate_zaxis(radian, rot.x, rot.y, rot.z)
        local xy = maths:project3d_vert(rot.x, rot.z, 50 * self.scale, 50 * self.scale, 84, 84)
    
        pset(xy.x, xy.y, 7)
    end
end

function off:update()
    if btnp(4) then 
        self.scale = self.scale - 0.25
    end

    if btnp(5) then 
        self.scale = self.scale + 0.25
    end
end

function off:draw()
    local t = [[utah teapot
source http://www.holmes3d.net/
graphics/teapot/teapot.off
    ]]
    print(t, 0, 0, 9 )
    
    print(#self.data.data1, 0, 120, 8)

    off:draw_part(self.data.data1)
    off:draw_part(self.data.data2)
    off:draw_part(self.data.data3)
    off:draw_part(self.data.data4)
    off:draw_part(self.data.data5)
    
end