--More Library v1.0.0a by Sleve

local init = {}

print("Initializing More Library")

loadstring(isfile("MoreLibrary/updater.lua") and readfile("MoreLibrary/updater.lua") or game:HttpGet("https://raw.githubusercontent.com/Sleve-m/More-Library/refs/heads/main/updater.lua"))():update()

local toLoad = {
    "moreMath.lua",
    "moreColor.lua",
    "moreString.lua",
    "moreTable.lua",
    "moreUI.lua",
    "moreDrawing.lua",
    "moreIO.lua",
    "moreInput.lua",
    "moreHttp.lua",
    "moreDebug.lua",
    "moreInstance.lua",
    "moreLogic.lua"
}

local folderPath = "MoreLibrary/modules/"

function init.loadmodules()

    for _, moduleName in pairs(toLoad) do
        local filePath = folderPath .. moduleName
        if isfile(filePath) then
            local success, err = pcall(function()
                local library = loadstring(readfile(filePath))()
                if library and library.load then
                    library.load()
                elseif not library then
                    print("Failed to find library: ".. moduleName)
                elseif not library.load then
                    print("Library does not have a load function: "..moduleName)
                end
            end)
            
            if not success then
                warn("Failed to load: " .. moduleName .. ": " .. tostring(err))
            end
            
        else
            warn("Missing file: " .. filePath)
        end
    end
end

return init