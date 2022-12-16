math.randomseed(os.time())

-- love.graphics/keyboard is csak egy tábla, 
-- elmentjük egy rövidebb nevű globalba és 
-- így nem kell kiírni mindig
LG = love.graphics
LK = love.keyboard
LA = love.audio

-- Kimentjük az ablakméretet globalba
-- Az osztás a love.draw()-ban leírt nyújtáshoz
-- kapcsolódik
WINDOW_W = LG.getWidth() / 2
WINDOW_H = LG.getHeight() / 2

-- Ha átméretezünk képeket akkor maradjanak "pixelesek"
-- Példa a táblás kép alján
LG.setDefaultFilter("nearest", "nearest")

STATES = {
    MENU = require("menu.state"),
    GAME = require("game.state")
}

CURRENT_STATE = STATES.MENU
CURRENT_STATE.init()

function love.update(dt)
    CURRENT_STATE.update(dt)
end

function love.keypressed(key, scancode, isRepeat)
    CURRENT_STATE.keypressed(key, scancode, isRepeat)
end

function love.draw()
    -- Kétszeresére nyújtjuk a koordináta rendszert
    -- így minden kétszer akkora lesz - és csak a
    -- koordináta rendszer fele marad a játék ablakban látható
    LG.scale(2, 2)
    CURRENT_STATE.draw()
end