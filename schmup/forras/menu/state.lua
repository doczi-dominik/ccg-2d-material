
local m = {}

local function startGame()
    CURRENT_STATE = STATES.GAME
    CURRENT_STATE.init()
end

local function quit()
    love.event.quit()
end

function m.init()
    m.logo = LG.newImage("assets/logo.png")
    m.LOGO_W, m.LOGO_H = m.logo:getDimensions()

    m.buttons = {
        {
            name="Start Game",
            callback=startGame
        },
        {
            name="Quit",
            callback=quit
        }
    }

    m.cursor = 1
end

function m.update(dt)
   
end

function m.keypressed(key, scancode, isRepeat)
    if key == "up" and m.cursor > 1 then
        m.cursor = m.cursor - 1
    end

    if key == "down" and m.cursor < #m.buttons then
        m.cursor = m.cursor + 1
    end

    if key == "return" then
        m.buttons[m.cursor].callback()
    end
end

function m.draw()
    LG.draw(m.logo, WINDOW_W/2 - m.LOGO_W/2, WINDOW_H/2 - m.LOGO_H/2)

    for i=1, #m.buttons do
        local b=m.buttons[i]

        LG.print(b.name, 60, 300 + i * 16)
    end

    LG.print(">", 50, 300 + m.cursor * 16)
end

return m