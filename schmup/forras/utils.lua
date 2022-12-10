
local m = {}

function m.boxCollision(x1, y1, w1, h1, x2, y2, w2, h2)
    return not (
        x1 + w1 < x2 or  -- false
        x1 > x2 + w2 or  -- false
        y1 + h1 < y2 or  -- false
        y1 > y2 + h2  -- true
    )
end

function m.mid(min, v, max)
    return math.max(min, math.min(v, max))
end

return m