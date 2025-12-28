--More Input v1.0.0a

local UserInputService = game:GetService("UserInputService")
local moreInput = {}

local function getEnum(buttonName)
    if typeof(buttonName) == "EnumItem" then return buttonName end
    local key = nil
    local success = pcall(function() key = Enum.KeyCode[buttonName] end)
    if success and key then return key, "KeyCode" end
    local mouse = nil
    local success = pcall(function() mouse = Enum.UserInputType[buttonName] end)
    if success and mouse then return mouse, "UserInputType" end
    return nil, nil
end

local function isButtonDown(button)
    local btnEnum, etype = getEnum(button)
    if not btnEnum then return false end
    if etype == "KeyCode" then
        return UserInputService:IsKeyDown(btnEnum)
    elseif etype == "UserInputType" then
        return UserInputService:IsMouseButtonPressed(btnEnum)
    end
    return false
end

local function isKeyDown(key)
    local keyEnum, etype = getEnum(key)
    return keyEnum and UserInputService:IsKeyDown(keyEnum)
end

local function isCombo(key1, key2)
    return isButtonDown(key1) and isButtonDown(key2)
end

local function onPress(key, callback)
    local keyEnum, etype = getEnum(key)
    if not keyEnum then return nil end
    
    local conn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == keyEnum or input.UserInputType == keyEnum then
            callback()
        end
    end)
    return conn
end

local function onToggle(key, callback)
    local state = false
    return onPress(key, function()
        state = not state
        callback(state)
    end)
end

local function waitForKey(key)
    local keyEnum, etype = getEnum(key)
    if not keyEnum then return end
    
    while true do
        local input = UserInputService.InputBegan:Wait()
        if input.KeyCode == keyEnum or input.UserInputType == keyEnum then
            break
        end
    end
    return true
end

local function getMousePos()
    return UserInputService:GetMouseLocation()
end

local winisfocused = false

UserInputService.WindowFocused:Connect(function() winisfocused = true end)
UserInputService.WindowFocusReleased:Connect(function() winisfocused = false end)

local function isWindowActive()
    return winisfocused
end

function moreInput.load()
    local inputGlobal = moreInput
    setreadonly(inputGlobal, false)
    inputGlobal.getenum = getEnum
    inputGlobal.iskeydown = isKeyDown
    inputGlobal.isbuttondown = isButtonDown
    inputGlobal.iscombo = isCombo
    inputGlobal.onpress = onPress
    inputGlobal.ontoggle = onToggle
    inputGlobal.waitforkey = waitForKey
    inputGlobal.getmousepos = getMousePos
    inputGlobal.iswindowactive = isWindowActive
    getgenv().moreinput = inputGlobal
    setreadonly(getgenv().moreinput, true)
end

return moreInput