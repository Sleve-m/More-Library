local moreServices = {}

function moreServices.load()
    getgenv().UserInputService = game:GetService("UserInputService")
    getgenv().RunService = game:GetService("RunService")
    getgenv().HttpService = game:GetService("HttpService")
end

return moreServices