-- love.graphics/keyboard is csak egy tábla, 
-- elmentjük egy rövidebb nevű globalba és 
-- így nem kell kiírni mindig
LG = love.graphics
LK = love.keyboard

-- Kimentjük az ablakméretet globalba
-- Az osztás a love.draw()-ban leírt nyújtáshoz
-- kapcsolódik
WINDOW_W = LG.getWidth() / 2
WINDOW_H = LG.getHeight() / 2

-- Ha átméretezünk képeket akkor maradjanak "pixelesek"
-- Példa a táblás kép alján
LG.setDefaultFilter("nearest", "nearest")

local player = require("player")

function love.update(dt)
    player.update(dt)
end

function love.draw()
    -- Kétszeresére nyújtjuk a koordináta rendszert
    -- így minden kétszer akkora lesz - és csak a
    -- koordináta rendszer fele marad a játék ablakban látható
    LG.scale(2, 2)
    player.draw()
end