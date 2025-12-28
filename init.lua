--More Library v1.0.0a by Sleve

getgenv().MoreLibraryLoaded = false

loadstring(isfile("MoreLibrary/updater.lua") and readfile("MoreLibrary/updater.lua") or game:HttpGet("https://raw.githubusercontent.com/Sleve-m/More-Library/refs/heads/main/updater.lua"))():update()

local toLoad = {
    "moreMath.lua",
    "moreColor.lua",
    "moreString.lua",
    "moreTable.lua",
    "moreUI.lua",
    "moreDrawing.lua",
    "moreFilesystem.lua",
    "moreInput.lua",
    "moreHttp.lua",
    "moreDebug.lua",
    "moreInstance.lua",
    "moreService.lua",
    "moreLogic.lua"
}

local folderPath = "MoreLibrary/modules/"

print("Initializing More Library...")

for _, moduleName in pairs(toLoad) do
    local filePath = folderPath .. moduleName
    if isfile(filePath) then
        local success, err = pcall(function()
            local library = loadstring(readfile(filePath))()
            if library and library.load then
                library.load()
                print("Loaded library: "..moduleName)
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

getgenv().MoreLibraryLoaded = true

print("More Library test1 Loaded")