
local bullet = require("bullet")

local p = {}

p.SPRITE = LG.newImage("assets/ship.png")
p.SPRITE_W, p.SPRITE_H = p.SPRITE:getDimensions()

p.LASER_SPRITE = LG.newImage("assets/laser.png")
p.LASER_SPRITE_W, p.LASER_SPRITE_H = p.LASER_SPRITE:getDimensions()

p.IDLE_SPEED = 275
p.LASER_SPEED = 100

p.x = 100
p.y = 400
p.bullets = {}
p.state = "idle"
p.laser_y = 0
p.speed = 0

function p.move(dt)
    if LK.isDown("left") then
        p.x = math.max(0, p.x - p.speed * dt)
    elseif LK.isDown("right") then
        p.x = math.min(WINDOW_W, p.x + p.speed * dt)
    end

    if LK.isDown("up") then
        p.y = math.max(0, p.y - p.speed * dt)
    elseif LK.isDown("down") then
        p.y = math.min(WINDOW_H, p.y + p.speed * dt)
    end
end

function p.updateIdle(dt)
    p.speed = p.IDLE_SPEED

    if LK.isDown("x") then
        table.insert(p.bullets, bullet.createBullet(p.x, p.y))
        p.state = "shooting"
    end

    if LK.isDown("lshift") then
        p.state = "laser"
    end
end

function p.updateShooting(dt)
    if not LK.isDown("x") then
        p.state = "idle"
    end
end

function p.updateLaser(dt)
    p.speed = p.LASER_SPEED

    p.laser_y = p.y

    while p.laser_y > 0 do
        p.laser_y = p.laser_y - 1
    end

    if not LK.isDown("lshift") then
        p.state = "idle"
    end
end

function p.update(dt)
    if p.state == "idle" then
        p.updateIdle(dt)
    elseif p.state == "shooting" then
        p.updateShooting(dt)
    elseif p.state == "laser" then
        p.updateLaser(dt)
    end

    p.move(dt)

    for i=#p.bullets, 1, -1 do
        p.bullets[i]:update(dt)
    end
end

function p.draw()
    if p.state == "laser" then
        local sy = (p.laser_y - p.y) / p.LASER_SPRITE_H

        LG.draw(p.LASER_SPRITE, p.x - p.LASER_SPRITE_W/2, p.y, 0, 1, sy)
    end

    LG.draw(p.SPRITE, p.x - p.SPRITE_W/2, p.y - p.SPRITE_H/2)

    for i=#p.bullets, 1, -1 do
        p.bullets[i]:draw()
    end
end

return p