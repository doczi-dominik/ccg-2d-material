
local m = {}

m.COIN_DIA = 64
m.COIN_RAD = m.COIN_DIA / 2

function m.createCoin()
    return {
        x = math.random(128, 512),
        y = math.random(128, 512),
        draw = function(c)
            love.graphics.setColor(1, 1, 0)

            -- c.x/y a négyzet bal felső sarka, de a circle() koordinátái
            -- a kör középpontját jelölik, így el kell tolni a rajzolt kört
            -- a szélesség/hossz felével
            love.graphics.circle("fill", c.x + m.COIN_RAD, c.y + m.COIN_RAD, m.COIN_RAD)

            --[[
            love.graphics.setColor(1, 0, 0)
            love.graphics.rectangle("line", c.x, c.y, m.COIN_DIA, m.COIN_DIA)
            ]]
        end
    }
end

return m