
local m = {}

local player = require("game.player")
local enemies = require("game.enemies")

local staticEnemy = require("game.enemyTypes.static")
local linerEnemy = require("game.enemyTypes.linear")
local godEnemy = require("game.enemyTypes.god")

function m.init()
    enemies.addEnemy(staticEnemy)
    enemies.addEnemy(linerEnemy)
    enemies.addEnemy(godEnemy)
end

function m.update(dt)
    player.update(dt)
    enemies.updateAll(dt)
end

function m.keypressed(key, scancode, isRepeat)
end

function m.draw()
    enemies.drawAll()
    player.draw()
end

return m