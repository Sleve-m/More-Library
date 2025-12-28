-- More Service v1.0.0a

local moreService = {}

function moreService.load()
    getgenv().UserInputService = game:GetService("UserInputService")
    getgenv().RunService = game:GetService("RunService")
    getgenv().HttpService = game:GetService("HttpService")
    --getgenv().HttpGet = game:HttpGet
end

return moreService