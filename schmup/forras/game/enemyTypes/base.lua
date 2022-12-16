
return function(x, y)
    local e = {}

    e.x = x
    e.y = y
    e.size = 32
    e.hp = 60

    function e.damage(amount)
        e.hp = e.hp - amount
    end

    function e.drawHP()
        LG.print(tostring(e.hp), e.x, e.y)
    end

    return e
end