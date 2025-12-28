--More Table v1.0.0a

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
    for _ in pairs(t) do c += 1 end
    return c
end

local function deepcount(t)
    local c = 0
    for _, v in pairs(t) do 
        c += (typeof(v)=="table" and count(v) or 1)
    end
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
        newTable[i] = func(i, v, t)
    end
    return newTable
end

local function filter(t, func)
    local newTable = {}
    for i, v in ipairs(t) do
        if func(i, v, t) then
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
            for _, v in pairs(val) do
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
        if predicate(i, v, t) then
            return true
        end
    end
    return false
end

local function every(t, predicate)
    for i, v in ipairs(t) do
        if not predicate(i, v, t) then
            return false
        end
    end
    return true
end

local function tabledo(t, predicate)
    for i, v in ipairs(t) do
        predicate(i, v, t)
    end
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
        return tostring(a) < tostring(b)
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

local function replace(t, a, b)
    for key, value in pairs(t) do
        t[key] = value==a and b or value
    end
    return t
end

local function deepreplace(t, a, b)
    for key, value in pairs(t) do
        if typeof(value)=="table" then deepreplace(value, a, b) else t[key] = (value==a and b or value) end
    end
    return t
end

local function flatstring(t, keys)
    local keylist = keys or ""
    local result = ""
    for key, value in pairs(t) do
        local keyStr = keylist .. (typeof(key) == "string" and '["'..key..'"]' or "["..key.."]")
        if typeof(value) == "table" then
            result = result .. flatstring(value, keyStr).."\n"
        else
            local valStr = tostring(value)
            result = result .. keyStr .. " = " .. valStr .. (next(t, key) and ",\n" or "")
        end
    end
    return result
end

local function deepstring(t, stack)
    local st = stack or 0
    local outer_tab = string.rep("\t", st)
    local inner_tab = string.rep("\t", st + 1)
    local result = "{\n"
    for key, value in pairs(t) do
        local keyStr = typeof(key) == "string" and '["'..key..'"]' or "["..key.."]"
        local valStr
        if typeof(value) == "table" then
            valStr = deepstring(value, st + 1)
        else
            valStr = tostring(value)
        end
        local hasNext = next(t, key) ~= nil
        local comma = hasNext and "," or ""
        result = result .. inner_tab .. keyStr .. " = " .. valStr .. comma .. "\n"
    end
    return result .. outer_tab .. "}"
end

local function concat(t, sep)
    local result = ""
    local char = sep or ""
    for key, value in pairs(t) do
        result = result..tostring(value)..(next(t, key) and char or "")
    end
    return result
end

local function deepconcat(t, sep, newline)
    local result = ""
    local char = sep or ""
    local nl = newline or true
    for key, value in pairs(t) do
        local chunk
        local is_table = typeof(value) == "table"
        if is_table then
            chunk = deepconcat(value, char, nl)
        else
            chunk = tostring(value)
        end
        result = result .. chunk
        local nextKey, nextValue = next(t, key)
        if nextKey then
            if nl then
                local nextIsTable = typeof(nextValue) == "table"
                if is_table or nextIsTable then
                    result = result .. "\n"
                else
                    result = result .. char
                end
            else
                result = result .. char
            end
        end
    end
    return result
end

function moreTable.load()
    local globalTable = getgenv().table
    setreadonly(globalTable, false)
    globalTable.keys = keys
    globalTable.values = values
    globalTable.count = count
    globalTable.deepcount = deepcount
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
    globalTable.fordo = tabledo
    globalTable.sortby = sortBy
    globalTable.sortdesc = sortDesc
    globalTable.sortnatural = sortNatural
    globalTable.sortalphabetical = sortAlphabetical
    globalTable.sortnumerical = sortNumerical
    globalTable.replace = replace
    globalTable.deepreplace = deepreplace
    globalTable.flatstring = flatstring
    globalTable.deepstring = deepstring
    globalTable.concat = concat
    globalTable.deepconcat = deepconcat
    setreadonly(globalTable, true)
end

return moreTable