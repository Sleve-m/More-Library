--More Library v1.0.0a by Sleve

getgenv().MoreLibraryLoaded = false

loadstring(isfile("MoreLibrary/updater.lua") and readfile("MoreLibrary/updater.lua") or game:HttpGet("https://raw.githubusercontent.com/Sleve-m/More-Library/refs/heads/main/updater.lua"))():update()

local toLoad = {
    moreMath = true,
    moreColor = true,
    moreString = true,
    moreTable = true,
    moreUI = true,
    moreDrawing = true,
    moreFilesystem = true,
    moreInput = true,
    moreNetwork = true,
    moreDebug = true,
    moreObject = true
}

local folderPath = "MoreLibrary/modules/"

print("Initializing More Library...")

for moduleName, shouldLoad in pairs(toLoad) do
    if shouldLoad then
        local filePath = folderPath .. moduleName .. ".lua"
        if isfile(filePath) then
            local success, err = pcall(function()
                local library = loadstring(readfile(filePath))()
                if library and library.load then
                    library.load()
                    print("Loaded library: "..moduleName)
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

getgenv().MoreLibraryLoaded = true

print("More Library v1.0.0a Loaded")
