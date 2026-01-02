--More UI v1.0.0a
local UserInputService = game:GetService("UserInputService")
local moreUI = {}

local function makedraggable(handle, target)
    if not target then target = handle end

end

local function smoothscroll(frame, options)

end

function moreUI.load()
    local UIGlobal = {}
    UIGlobal.createtext = createtext
    UIGlobal.createimage = createimage
    gettenv(coroutine.running()).UI = UIGlobal
    setreadonly(gettenv(coroutine.running()).UI, true)
end

return moreUI