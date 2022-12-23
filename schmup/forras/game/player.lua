
local bullet = require("game.bullet")
local utils  = require("utils")

local p = {}

p.SPRITE = LG.newImage("assets/ship.png")
p.SPRITE_W, p.SPRITE_H = p.SPRITE:getDimensions()

p.LASER_SPRITE = LG.newImage("assets/laser.png")
p.LASER_SPRITE_W, p.LASER_SPRITE_H = p.LASER_SPRITE:getDimensions()

p.SHOT_SFX = LA.newSource("assets/shot.wav", "static")

p.LASER_SFX = LA.newSource("assets/laser_0.wav", "static")
p.LASER_SFX:setLooping(true)

p.IDLE_SPEED = 275
p.LASER_SPEED = 100

p.x = 100
p.y = 400
p.dx = 0
p.dy = 0
p.ddx = 0
p.ddy = 0
p.bullets = {}
p.state = "idle"
p.laser_cooldown = 180
p.speed = 0

function p.move(dt)
    if LK.isDown("left") then
        p.ddx = -3000
    elseif LK.isDown("right") then
        p.ddx = 3000
    else
        p.ddx = 0
    end

    if LK.isDown("up") then
        p.ddy = -3000
    elseif LK.isDown("down") then
        p.ddy = 3000
    else
        p.ddy = 0
    end

    p.dx = utils.mid(-200, p.dx + p.ddx * dt, 200)
    p.dy = utils.mid(-200, p.dy + p.ddy * dt, 200)

    p.x = utils.mid(0, p.x + p.dx * dt, WINDOW_W)
    p.y = utils.mid(0, p.y + p.dy * dt, WINDOW_H)

    p.dx = p.dx * 0.9
    p.dy = p.dy * 0.9
end

function p.updateIdle(dt)
    p.speed = p.IDLE_SPEED
    p.laser_cooldown = 180

    if LK.isDown("x") then
        table.insert(p.bullets, bullet.createBullet(p.x, p.y))
        p.SHOT_SFX:stop()
        p.SHOT_SFX:play()
        p.state = "shooting"
    end

    if LK.isDown("lshift") then
        p.LASER_SFX:play()
        p.state = "laser"
    end
end

function p.updateShooting(dt)
    if not LK.isDown("x") then
        p.state = "idle"
    end
end

function p.updateLasering(dt)
    if not LK.isDown("lshift") then
        p.state = "idle"
    end
end

function p.updateLaser(dt)
    p.speed = p.LASER_SPEED

    for _, e in ipairs(ENEMIES.enemies) do
        if utils.boxCollision(
            e.x, e.y, e.size, e.size,
            p.x - p.LASER_SPRITE_W/2,
            0,
            p.LASER_SPRITE_W,
            p.y
        ) then
            e.damage(math.ceil(dt * 60))  -- Folyamatos damage, kell dt
        end
    end

    p.laser_cooldown = p.laser_cooldown - 1

    if not LK.isDown("lshift") or p.laser_cooldown <= 0 then
        p.LASER_SFX:stop()
        p.state = "lasering"
    end
end

function p.update(dt)
    if p.state == "idle" then
        p.updateIdle(dt)
    elseif p.state == "shooting" then
        p.updateShooting(dt)
    elseif p.state == "lasering" then
        p.updateLasering(dt)
    elseif p.state == "laser" then
        p.updateLaser(dt)
    end

    p.move(dt)

    for i=#p.bullets, 1, -1 do
        local b = p.bullets[i]

        b:update(dt)

        for _, e in ipairs(ENEMIES.enemies) do
            if b.collidesWith(e.x, e.y, e.size, e.size) then
                e.damage(15)  -- Egyszeri damage, nem kell dt
                table.remove(p.bullets, i)
            end
        end
    end
end

function p.draw()
    if p.state == "laser" then
        local sy = (-p.y) / p.LASER_SPRITE_H

        LG.draw(p.LASER_SPRITE, p.x - p.LASER_SPRITE_W/2, p.y, 0, 1, sy)
    end

    LG.draw(p.SPRITE, p.x - p.SPRITE_W/2, p.y - p.SPRITE_H/2)

    for i=#p.bullets, 1, -1 do
        p.bullets[i]:draw()
    end
end

return p