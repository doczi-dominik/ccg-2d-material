
local m = {}

PLAYER = require("game.player")
ENEMIES = require("game.enemies")

local staticEnemy = require("game.enemyTypes.static")
local linerEnemy = require("game.enemyTypes.linear")
local godEnemy = require("game.enemyTypes.god")

function m.init()
    ENEMIES.addEnemy(staticEnemy)
    ENEMIES.addEnemy(linerEnemy)
    ENEMIES.addEnemy(godEnemy)
end

function m.update(dt)
    PLAYER.update(dt)
    ENEMIES.updateAll(dt)
end

function m.keypressed(key, scancode, isRepeat)
end

function m.draw()
    ENEMIES.drawAll()
    PLAYER.draw()
end

return m