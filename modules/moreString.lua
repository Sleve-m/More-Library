--More String v1.0.0a

local moreString = {}

local function appendString(str, app)
    return str..app
end

local function startsWith(str, start)
    return string.sub(str, 1, #start) == start
end

local function endsWith(str, ending)
    return ending == "" or string.sub(str, -#ending) == ending
end

local function random(length)
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local randomString = ""
    for i = 1, length do
        local randIndex = math.random(#chars)
        randomString = randomString .. string.sub(chars, randIndex, randIndex)
    end
    return randomString
end

local function capitalize(str)
    return string.upper(string.sub(str, 1,1)) .. string.lower(string.sub(str, 2))
end

local function prettyNumber(str)
    local formatted = tostring(str)
    while true do  
        local k
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break end
    end
    return formatted
end

local function shortenNumber(n, customsuffixes)
    local suffixes = customsuffixes or {"k", "M", "B", "T", "q", "Q", "s", "S", "O", "N", "D"}
    local i = #suffixes
    for j = i, 1, -1 do
        local v = 1000 ^ j
        if n >= v then
            return string.format("%.1f%s", n / v, suffixes[j])
        end
    end
    return tostring(n)
end

local function pad(str, len, char)
    str = tostring(str)
    if #str >= len then return str end
    char = char or " "
    return string.rep(char, len - #str) .. str
end

local function contains(str, sub)
    return string.find(str, sub, 1, true) ~= nil
end

local function escape(str)
    return string.gsub("([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1")
end

local function stripTags(str)
    return string.gsub("%b<>", "")
end

local function toTable(str)
    local t = {}
    for i = 1, #str do
        table.insert(t, string.sub(str, i, i))
    end
    return t
end

local function shuffle(str)
    local t = toTable(str)
    for i = #t, 2, -1 do
        local j = math.random(i)
        t[i], t[j] = t[j], t[i]
    end
    return table.concat(t)
end

local function title(str)
    return string.gsub("(%a)(%w*)", function(first, rest)
        return string.upper(first) .. string.lower(rest)
    end)
end

local function tag(str, tagName, attributes)
    local attrStr = ""
    if attributes then
        for k, v in pairs(attributes) do
            attrStr = attrStr .. ' ' .. k .. '="' .. tostring(v) .. '"'
        end
    end
    return string.format("<%s%s>%s</%s>", tagName, attrStr, str, tagName)
end

local function color(str, color)
    local hex = Color3.tohex(color)
    return string.format('<font color="%s">%s</font>', hex, str)
end

local function size(str, num)
    return string.format('<font size="%s">%s</font>', tostring(num), str)
end

local function bold(str)
    return "<b>" .. str .. "</b>"
end

local function italic(str)
    return "<i>" .. str .. "</i>"
end

local function underline(str)
    return "<u>" .. str .. "</u>"
end

local function strike(str)
    return "<s>" .. str .. "</s>"
end

function moreString.load()
    local globalString = getgenv().string
    setreadonly(globalString, false)
    globalString.startswith = startsWith
    globalString.endswith = endsWith
    globalString.random = random
    globalString.capitalize = capitalize
    globalString.prettynumber = prettyNumber
    globalString.shortennumber = shortenNumber
    globalString.pad = pad
    globalString.contains = contains
    globalString.escape = escape
    globalString.striptags = stripTags
    globalString.totable = toTable
    globalString.shuffle = shuffle
    globalString.title = title
    globalString.tag = tag
    globalString.color = color
    globalString.size = size
    globalString.bold = bold
    globalString.italic = italic
    globalString.underline = underline
    globalString.strike = strike
    globalString.append = appendString
    setreadonly(globalString, true)
end

return moreString