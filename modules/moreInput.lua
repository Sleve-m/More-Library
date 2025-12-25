local UserInputService = game:GetService("UserInputService")
local moreInput = {}

local function getKeyEnum(key)
    if typeof(key) == "Instance" then return key end
    if typeof(key) == "string" then
        if Enum.KeyCode[key] then return Enum.KeyCode[key] end
        if Enum.UserInputType[key] then return Enum.UserInputType[key] end
    end
    return key
end

local function isKeyDown(key)
    local keyEnum = getKeyEnum(key)
    return keyEnum and UserInputService:IsKeyDown(keyEnum)
end

local function isButtonDown(button)
    local btnEnum = getKeyEnum(button) or Enum.UserInputType.MouseButton1
    return UserInputService:IsMouseButtonPressed(btnEnum)
end

local function isCombo(key1, key2)
    return isKeyDown(key1) and isKeyDown(key2)
end

local function onPress(key, callback)
    local keyEnum = getKeyEnum(key)
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
    local keyEnum = getKeyEnum(key)
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

local function isWindowActive()
    return UserInputService.WindowFocused
end

function moreInput.load()
    getgenv().iskeydown = isKeyDown
    getgenv().isbuttondown = isButtonDown
    getgenv().iscombo = isCombo
    getgenv().onpress = onPress
    getgenv().ontoggle = onToggle
    getgenv().waitforkey = waitForKey
    getgenv().getmousepos = getMousePos
    getgenv().iswindowactive = isWindowActive
end

return moreInput