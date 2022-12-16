local m = {}

m.enemies = {}

function m.addEnemy(enemyCtor)
    local x = math.random(WINDOW_W)
    local y = math.random(0, WINDOW_H/2)

    local e = enemyCtor(x, y)

    table.insert(m.enemies, e)
end

function m.updateAll(dt)
    for i = #m.enemies, 1, -1 do
        local e = m.enemies[i]

        e:update(dt)

        if e.hp <= 0 then
            table.remove(m.enemies, i)
        end
    end
end

function m.drawAll()
    for i = 1, #m.enemies do
        m.enemies[i]:draw()
    end
end

return m