--More Library v1.0.0a by Sleve

local toLoad = {
    moreMath = true,
    moreString = true,
    moreTable = true,
    moreColor = true,
    moreDrawing = true,
    moreFilesystem = true,
    moreInput = true,
    moreNetwork = true,
    moreDebug = true
}

local folderPath = "More/modules/"

print("Initializing More Library...")

for moduleName, shouldLoad in pairs(toLoad) do
    if shouldLoad then
        local filePath = folderPath .. moduleName .. ".lua"
        if isfile(filePath) then
            local success, err = pcall(function()
                local library = loadstring(readfile(filePath))()
                if library and library.load then
                    library.load()
                end
            end)
            
            if not success then
                warn("Failed to load " .. moduleName .. ": " .. tostring(err))
            end
            
        else
            warn("Missing file: " .. filePath)
        end
    end
end

print("More Library v1.0 Loaded.")
