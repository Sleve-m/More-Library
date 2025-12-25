--More Table v1.0

local moreTable = {}

local function keys(t)
    local result = {}
    for k, v in pairs(t) do
        table.insert(result, k)
    end
    return result
end

local function values(t)
    local result = {}
    for k, v in pairs(t) do
        table.insert(result, v)
    end
    return result
end

local function count(t)
    local c = 0
    for _ in pairs(t) do c = c + 1 end
    return c
end

local function merge(target, source)
    for k, v in pairs(source) do
        target[k] = v
    end
    return target
end

local function deepCopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepCopy(orig_key)] = deepCopy(orig_value)
        end
        setmetatable(copy, deepCopy(getmetatable(orig)))
    else
        copy = orig
    end
    return copy
end

local function reverse(t)
    local n = #t
    local i = 1
    while i < n do
        t[i], t[n] = t[n], t[i]
        i = i + 1
        n = n - 1
    end
    return t
end

local function shuffle(t)
    local n = #t
    for i = n, 2, -1 do
        local j = math.random(i)
        t[i], t[j] = t[j], t[i]
    end
    return t
end

local function random(t)
    if #t > 0 then
        return t[math.random(1, #t)]
    end
    return nil
end

local function map(t, func)
    local newTable = {}
    for i, v in ipairs(t) do
        newTable[i] = func(v, i)
    end
    return newTable
end

local function filter(t, func)
    local newTable = {}
    for i, v in ipairs(t) do
        if func(v, i) then
            table.insert(newTable, v)
        end
    end
    return newTable
end

local function unique(t)
    local seen = {}
    local result = {}
    for _, v in ipairs(t) do
        if not seen[v] then
            seen[v] = true
            table.insert(result, v)
        end
    end
    return result
end

local function slice(t, first, last, step)
    local sliced = {}
    for i = first or 1, last or #t, step or 1 do
        sliced[#sliced+1] = t[i]
    end
    return sliced
end

local function flatten(t)
    local flat = {}
    local function recursive(val)
        if type(val) == "table" then
            for _, v in ipairs(val) do
                recursive(v)
            end
        else
            table.insert(flat, val)
        end
    end
    recursive(t)
    return flat
end

local function some(t, predicate)
    for i, v in ipairs(t) do
        if predicate(v, i) then
            return true
        end
    end
    return false
end

local function every(t, predicate)
    for i, v in ipairs(t) do
        if not predicate(v, i) then
            return false
        end
    end
    return true
end

local function sortBy(t, property)
    table.sort(t, function(a, b)
        if not a[property] then return false end
        if not b[property] then return true end
        return a[property] < b[property]
    end)
    return t
end

local function sortDesc(t)
    table.sort(t, function(a, b)
        return a > b
    end)
    return t
end

local function sortNatural(t)
    local function pad(s)
        return string.format("%05d", s)
    end
    
    table.sort(t, function(a, b)
        local aa = tostring(a):gsub("%d+", pad)
        local bb = tostring(b):gsub("%d+", pad)
        return aa < bb
    end)
    return t
end

local function sortAlphabetical(t)
    table.sort(t, function(a, b)
        return tostring(a):lower() < tostring(b):lower()
    end)
    return t
end

local function sortNumerical(t)
    table.sort(t, function(a, b)
        local numA = tonumber(a) or 0
        local numB = tonumber(b) or 0
        return numA < numB
    end)
    return t
end

function moreTable.load()
    local globalTable = getgenv().table
    setreadonly(globalTable, false)
    globalTable.keys = keys
    globalTable.values = values
    globalTable.count = count
    globalTable.merge = merge
    globalTable.deepCopy = deepCopy
    globalTable.reverse = reverse
    globalTable.shuffle = shuffle
    globalTable.random = random
    globalTable.map = map
    globalTable.filter = filter
    globalTable.unique = unique
    globalTable.slice = slice
    globalTable.flatten = flatten
    globalTable.some = some
    globalTable.every = every
    globalTable.sortBy = sortBy
    globalTable.sortDesc = sortDesc
    globalTable.sortNatural = sortNatural
    globalTable.sortAlphabetical = sortAlphabetical
    globalTable.sortNumerical = sortNumerical
    setreadonly(globalTable, true)
end

return moreTable