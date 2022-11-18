
local player = {}

player.x = 64
player.y = 64
player.speed = 120
player.size = 64

function player.update(dt)
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed * dt
    elseif love.keyboard.isDown("right") then
        player.x = player.x + player.speed * dt
    end

    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed * dt
    elseif love.keyboard.isDown("down") then
        player.y = player.y + player.speed * dt
    end
end

function player.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", player.x, player.y, player.size, player.size)
end

return player