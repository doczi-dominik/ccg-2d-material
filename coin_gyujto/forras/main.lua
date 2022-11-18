

--[[
require()
---------
Lefuttat egy másik Lua fájlt. Ha a fájl egy return-el végződik,
a require return értékévé válik.
]]
local player = require("player")
local coin = require("coin")
local utils = require("utils")

local coins = {}

local function addCoins()
    for i=1, math.random(5) do
        table.insert(coins, coin.createCoin())
    end
end

local function checkCoins()
    -- Fordított for loop hogy lehessen
    -- iterálás közben törölni az indexek
    -- elcsúszása nélkül
    for i=#coins, 1, -1 do
        local c = coins[i]

        if utils.boxCollision(
            player.x, player.y, player.size, player.size,
            c.x, c.y, coin.COIN_DIA, coin.COIN_DIA
        ) then
            table.remove(coins, i)

            if #coins == 0 then
                addCoins()
            end
        end
    end
end


-- Alapból az RNG nincs seedelve, mindig ugyanazt az értéket dobja
-- így beállítjuk a seedet a jelenlegi rendszeridőre
math.randomseed(os.time())

addCoins()

function love.update(dt)
    player.update(dt)
    checkCoins()
end

function love.draw()
    for _, c in ipairs(coins) do
        c:draw()
    end

    player.draw()
end