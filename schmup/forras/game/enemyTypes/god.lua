
local base = require("game.enemyTypes.base")

return function(x, y)
    local e = base(x, y)

    e.dx = 0
    e.dy = 0

    e.ddx = 0
    e.ddy = 0

    e.t = 0

    function e:update(dt)
        if e.t > 20 then
            e.ddx = math.random(-1, 1) * 150
            e.ddy = math.random(-1, 1) * 150

            e.t = 0
        end

        e.dx = e.dx + e.ddx * dt
        e.dy = e.dy + e.ddy * dt

        e.x = e.x + e.dx * dt
        e.y = e.y + e.dy * dt

        e.t = e.t + 1
    end

    function e:draw()
        LG.setColor(0, 1, 0)
        LG.rectangle("fill", self.x, self.y, 32, 32)
        LG.setColor(1, 1, 1)
    end

    return e
end