--More IO v1.0.0a
local HttpService = game:GetService("HttpService")

local moreIO = {}

local function safeWriteFile(path, content)
    local folders = string.split(path, "/")
    local currentPath = ""
    for i = 1, #folders - 1 do
        currentPath = currentPath .. folders[i]
        if not isfolder(currentPath) then
            makefolder(currentPath)
        end
        currentPath = currentPath .. "/"
    end
    
    writefile(path, content)
end

local function writeTableToFile(filePath, dataTable)
    local folder = filePath:match("^(.*)/")
    if folder and not isfolder(folder) then
        makefolder(folder)
    end
    local success, json = pcall(function()
        return HttpService:JSONEncode(dataTable)
    end)
    if not success then
        warn("io.writetotable failed to encode JSON for path: " .. filePath)
        return false
    end
    safeWriteFile(filePath, json)
    return true
end

local function loadTableFromFile(filePath)
    if not isfile(filePath) then
        return nil
    end
    local content = readfile(filePath)
    local success, result = pcall(function()
        return HttpService:JSONDecode(content)
    end)
    if not success then
        warn("io.loadtablefromfile failed to decode JSON from path: " .. filePath)
        return nil
    end
    return result
end

local function requireFile(path)
    if not isfile(path) then
        warn("io.requirefile: file does not exist: " .. path)
        return nil
    end
    local content = readfile(path)
    local func, syntaxErr = loadstring(content)
    if not func then
        warn("io.requirefile: SYNTAX ERROR in " .. path .. ": " .. tostring(syntaxErr))
        return nil
    end
    local success, result = pcall(func)
    if not success then
        warn("io.requirefile: RUNTIME ERROR inside " .. path .. ": " .. tostring(result))
        return nil
    end
    return result
end

local function getFilesRecursive(folderPath)
    local function getName(path)
        return string.match(path, "[^/\\]+$")
    end
    local function scan(path)
        local dirStructure = {}
        if not isfolder(path) then return dirStructure end
        local items = listfiles(path)
        for _, item in ipairs(items) do
            if isfolder(item) then
                local folderName = getName(item)
                dirStructure[folderName] = scan(item)
            elseif isfile(item) then
                table.insert(dirStructure, item)
            end
        end
        return dirStructure
    end
    return scan(folderPath)
end

local function wipeFolder(path)
    if not isfolder(path) then return end
    local items = listfiles(path)
    for _, item in ipairs(items) do
        if isfile(item) then
            delfile(item)
        elseif isfolder(item) then
            wipeFolder(item)
        end
    end
end

local function copyFile(sourcePath, destPath)
    if not isfile(sourcePath) then return false end
    local content = readfile(sourcePath)
    local destFolder = destPath:match("^(.*)/")
    if destFolder and not isfolder(destFolder) then
        makefolder(destFolder)
    end
    safeWriteFile(destPath, content)
    return true
end

local function moveFile(sourcePath, destPath)
    if copyFile(sourcePath, destPath) then
        delfile(sourcePath)
        return true
    end
    return false
end

local function downloadFile(path, url)
    local success, content = pcall(function()
        return game:HttpGet(url)
    end)
    if success then
        safeWriteFile(path, content)
        return true
    end
    return false
end

local function appendFileWithLog(path, text)
    local timestamp = os.date("[%Y-%m-%d %H:%M:%S] ")
    appendfile(path, timestamp .. tostring(text) .. "\n")
end

local function requireFileOrGet(path, url)
    local result = isfile(path) and requireFile(path) or loadstring(game:HttpGet(url))
    return result
end

function moreIO.load()
    local ioGlobal = {}
    ioGlobal.writetabletofile = writeTableToFile
    ioGlobal.loadtablefromfile = loadTableFromFile
    ioGlobal.requirefile = requireFile
    ioGlobal.requirefileorget = requireFileOrGet
    ioGlobal.safewritefile = safeWriteFile
    ioGlobal.getfilesrecursive = getFilesRecursive
    ioGlobal.wipefolder = wipeFolder
    ioGlobal.copyfile = copyFile
    ioGlobal.movefile = moveFile
    ioGlobal.downloadfile = downloadFile
    ioGlobal.appendfilewithlog = appendFileWithLog
    getgenv().io = ioGlobal
    setreadonly(getgenv().io, true)
end

return moreIO