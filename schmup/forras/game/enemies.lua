local m = {}

local enemies = {}

function m.addEnemy(enemyCtor)
    local x = math.random(WINDOW_W)
    local y = math.random(0, WINDOW_H/2)

    local e = enemyCtor(x, y)

    table.insert(enemies, e)
end

function m.updateAll(dt)
    for i = #enemies, 1, -1 do
        local e = enemies[i]

        e:update(dt)

        if e.dead then
            table.remove(enemies, i)
        end
    end
end

function m.drawAll()
    for i = 1, #enemies do
        enemies[i]:draw()
    end
end

return m