
local base = require("game.enemyTypes.base")

return function(x, y)
    local e = base(x, y)

    function e:update(dt)
    end

    function e:draw()
        LG.setColor(1, 1, 0)
        LG.rectangle("fill", self.x, self.y, self.size, self.size)
        LG.setColor(0, 0, 0)
        self.drawHP()
        LG.setColor(1, 1, 1)
    end

    return e
end