local widget = require("menu.widget")

local m = {}

local function startGame()
    local BGM = LA.newSource("assets/music.wav", "stream")
    BGM:setLooping(true)
    BGM:play()

    CURRENT_STATE = STATES.GAME
    CURRENT_STATE.init()
end

local function quit()
    love.event.quit()
end

local function toggleFullscreen()
    love.window.setFullscreen(not love.window.getFullscreen())
end

function m.loadMenu()
    m.widgets = {
        widget.createWidget({
            label = "Start Game",
            onConfirm = startGame
        }),
        widget.createWidget({
            label = "Options",
            onConfirm = m.loadOptions
        }),
        widget.createWidget({
            label = "Quit",
            onConfirm = quit
        })
    }

    m.cursor = 1
end

function m.loadOptions()
    m.widgets = {
        widget.createWidget({
            label = "Toggle Fullscreen",
            onConfirm = toggleFullscreen
        }),
        widget.createWidget({
            label = "Volume",
            getValue = LA.getVolume,
            onLeft = function() 
                LA.setVolume(LA.getVolume() - 0.1)
            end,
            onRight = function()
                LA.setVolume(LA.getVolume() + 0.1)
            end
        }),
        widget.createWidget({
            label = "Go Back",
            onConfirm = m.loadMenu
        })
    }

    m.cursor = 1
end

function m.init()
    m.logo = LG.newImage("assets/logo.png")
    m.LOGO_W, m.LOGO_H = m.logo:getDimensions()

    m.loadMenu()
end

function m.update(dt)
end

function m.keypressed(key, scancode, isRepeat)
    if key == "up" and m.cursor > 1 then
        m.cursor = m.cursor - 1
    end

    if key == "down" and m.cursor < #m.widgets then
        m.cursor = m.cursor + 1
    end

    if key == "return" then
        m.widgets[m.cursor].onConfirm()
    end

    if key == "left" then
        m.widgets[m.cursor].onLeft()
    end

    if key == "right" then
        m.widgets[m.cursor].onRight()
    end
end

function m.draw()
    LG.draw(m.logo, WINDOW_W/2 - m.LOGO_W/2, WINDOW_H/2 - m.LOGO_H/2)

    for i=1, #m.widgets do
        local w=m.widgets[i]

        w.draw(60, 300 + i * 16)
    end

    LG.print(">", 50, 300 + m.cursor * 16)
end

return m