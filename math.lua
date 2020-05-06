gfx_maths = {}

function gfx_maths:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function gfx_maths:radian(angle)
    return angle * (3.14159265359 / 180)
end

function gfx_maths:project3d_vert(x,z,sx,sz,ox,oz)
    return {
        x = (sx * x) + ox,
        y = (sz * z) + oz
    }
end

function gfx_maths:rotate_xaxis(r,x,y,z)
    return {
        x = x,
        y = (y * cos(r)) - (z * sin(r)),
        z = (y * sin(r)) + (z * cos(r))
    }
end

function gfx_maths:rotate_yaxis(r,x,y,z)
    return {
        x = (x * cos(r)) + (z * sin(r)),
        y =y ,
        z = (z * cos(r)) - (x * sin(r))
    }
end

function gfx_maths:rotate_zaxis(r,x,y,z)
    return {
        x = (x * cos(r)) - (y * sin(r)),
        y = (x * sin(r)) + (y * cos(r)),
        z = z

    }
end
