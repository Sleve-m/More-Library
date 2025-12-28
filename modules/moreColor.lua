--More Color v1.0.0a

moreColor = {}

local function toHex(color)
    local r = math.floor(color.R * 255)
    local g = math.floor(color.G * 255)
    local b = math.floor(color.B * 255)
    return string.format("#%02X%02X%02X", r, g, b)
end

local function shiftValue(color, amount)
    local h, s, v = color:ToHSV()
    v = math.clamp(v + amount, 0, 1)
    return Color3.fromHSV(h, s, v)
end

local function darken(color, amount)
    return shiftValue(color, -(amount or 0.1))
end

local function lighten(color, amount)
    return shiftValue(color, (amount or 0.1))
end

local function invert(color)
    return Color3.new(1 - color.R, 1 - color.G, 1 - color.B)
end

local function random()
    return Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
end

local function blend(c1, c2, alpha)
    return c1:Lerp(c2, alpha)
end

local function getLuminance(color)
    return (0.299 * color.R) + (0.587 * color.G) + (0.114 * color.B)
end

local function isBright(color)
    return getLuminance(color) > 0.5
end

local function contrast(color)
    if isBright(color) then
        return Color3.new(0, 0, 0)
    else
        return Color3.new(1, 1, 1)
    end
end

local function grayscale(color)
    local lum = getLuminance(color)
    return Color3.new(lum, lum, lum)
end

local function desaturate(color, amount)
    local h, s, v = color:ToHSV()
    s = math.clamp(s - (amount or 0.1), 0, 1)
    return Color3.fromHSV(h, s, v)
end

local function complementary(color)
    local h, s, v = color:ToHSV()
    h = (h + 0.5) % 1
    return Color3.fromHSV(h, s, v)
end

function moreColor.load()
    local globalColor = getgenv().Color3
    setreadonly(globalColor, false)
    globalColor.tohex = toHex
    globalColor.darken = darken
    globalColor.lighten = lighten
    globalColor.invert = invert
    globalColor.random = random
    globalColor.blend = blend
    globalColor.getluminance = getLuminance
    globalColor.isbright = isBright
    globalColor.contrast = contrast
    globalColor.grayscale = grayscale
    globalColor.desaturate = desaturate
    globalColor.complementary = complementary
    setreadonly(globalColor, true)
end

return moreColor