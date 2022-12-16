local utils = require("utils")

local m = {}

m.SPRITE = LG.newImage("assets/shot.png")
m.SPRITE_W, m.SPRITE_H = m.SPRITE:getDimensions()
m.SPEED = 750

function m.createBullet(x, y)
    local b = {}

    b.x = x
    b.y = y

    function b.collidesWith(x, y, w, h)
        return utils.boxCollision(
            x, y, w, h,
            b.x - m.SPRITE_W/2,
            b.y - m.SPRITE_H/2,
            m.SPRITE_W,
            m.SPRITE_H
        )
    end

    function b:update(dt)
        self.y = self.y - m.SPEED * dt
    end

    function b:draw()
        LG.draw(m.SPRITE, self.x - m.SPRITE_W/2, self.y - m.SPRITE_H)
    end

    return b
end

return m