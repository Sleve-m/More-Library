local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local moreDebug = {}

local function benchmark(name, func, iterations)
    iterations = iterations or 1
    local start = os.clock()
    
    for i = 1, iterations do
        func()
    end
    
    local totalTime = os.clock() - start
    local avgTime = totalTime / iterations
    
    local msg = string.format("[Benchmark] %s | Total: %.4fs | Avg: %.6fs", name, totalTime, avgTime)
    
    print(msg)
end

local function getFPS()
    return math.floor(1 / RunService.RenderStepped:Wait())
end

local function getPing()
    return math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
end

local function getMemory()
    return math.floor(gcinfo() / 1024)
end

local function inspect(tbl, indent)
    if type(tbl) ~= "table" then return tostring(tbl) end
    indent = indent or 0
    local format = string.rep("  ", indent)
    local str = "{\n"
    
    for k, v in pairs(tbl) do
        local key = type(k) == "string" and '["'..k..'"]' or "["..tostring(k).."]"
        local val
        if type(v) == "table" then
            val = inspect(v, indent + 1)
        else
            val = tostring(v)
        end
        str = str .. format .. "  " .. key .. " = " .. val .. ",\n"
    end
    
    str = str .. format .. "}"
    return str
end

function moreDebug.load()
    local globalDebug = getgenv().debug
    setreadonly(globalDebug, false)
    globalDebug.benchmark = benchmark
    globalDebug.getfps = getFPS
    globalDebug.getping = getPing
    globalDebug.getmemory = getMemory
    globalDebug.inspect = inspect
    setreadonly(globalDebug, true)
end

return moreDebug