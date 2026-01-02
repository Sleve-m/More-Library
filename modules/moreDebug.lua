--More Debug v1.0.0

local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local moreDebug = {}

local function benchmark(func, iterations)
    iterations = iterations or 1
    local start = os.clock()
    for i = 1, iterations do
        func()
    end
    local totalTime = os.clock() - start
    local avgTime = totalTime / iterations
    return totalTime, avgTime
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

function moreDebug.load()
    local globalDebug = gettenv(coroutine.running()).debug
    setreadonly(globalDebug, false)
    globalDebug.benchmark = benchmark
    globalDebug.getfps = getFPS
    globalDebug.getping = getPing
    globalDebug.getmemory = getMemory
    setreadonly(globalDebug, true)
end

return moreDebug