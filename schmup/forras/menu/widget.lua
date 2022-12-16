
---@class createWidgetOptions
---@field label string
---@field getValue fun(): any
---@field onConfirm fun()
---@field onLeft fun()
---@field onRight fun()

local m = {}

---@param opts createWidgetOptions
function m.createWidget(opts)
    local w = {}

    w.label = opts.label
    w.getValue = opts.getValue

    w.onConfirm = opts.onConfirm or function() end
    w.onLeft = opts.onLeft or function() end
    w.onRight = opts.onRight or function() end

    function w.draw(x, y)
        local str = w.label

        if w.getValue ~= nil then
            str = str .. ": "..tostring(w.getValue())
        end

        LG.print(str, x, y)
    end

    return w
end

return m