--More Math v1.0.0a

local moreMath = {}

local function odd(x)
    return x % 2 ~= 0
end

local function even(x)
    return x % 2 == 0
end

local function approx(a, b, epsilon)
    return math.abs(a - b) < (epsilon or 1e-5)
end

local function roundTo(n, decimalPlaces)
    local mult = 10 ^ (decimalPlaces or 0)
    return math.floor(n * mult + 0.5) / mult
end

local function map(x, in_min, in_max, out_min, out_max)
    if in_min == in_max then return out_min end
    return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min
end

local function inverseLerp(a, b, value)
    if a == b then return 0 end
    return math.clamp((value - a) / (b - a), 0, 1)
end

local function smoothstep(a, b, t)
    t = math.clamp((t - a) / (b - a), 0, 1)
    return t * t * (3 - 2 * t)
end

local function chance(percent)
    return math.random() * 100 <= percent
end

local function randomfloat(min, max)
    return min + math.random() * (max - min)
end

local function lerpAngle(a, b, t)
    local diff = (b - a + 180) % 360 - 180
    return a + diff * t
end

local function wrap(value, min, max)
    return min + (value - min) % (max - min)
end

local function pingpong(t, length)
    t = t % (length * 2)
    return length - math.abs(t - length)
end

local function snap(x, step)
    return math.floor(x / step + 0.5) * step
end

local function deltaAngle(current, target)
    return (target - current + 180) % 360 - 180
end

local function quadraticBezier(t, p0, p1, p2)
    return (1 - t)^2 * p0 + 2 * (1 - t) * t * p1 + t^2 * p2
end

function moreMath.load()
    local globalMath = gettenv(coroutine.running()).math
    setreadonly(globalMath, false)
    globalMath.odd = odd
    globalMath.even = even
    globalMath.approx = approx
    globalMath.roundto = roundTo
    globalMath.map = map
    globalMath.inverseLerp = inverseLerp
    globalMath.smoothstep = smoothstep
    globalMath.chance = chance
    globalMath.randomfloat = randomfloat
    globalMath.lerpangle = lerpAngle
    globalMath.wrap = wrap
    globalMath.pingpong = pingpong
    globalMath.snap = snap
    globalMath.deltaangle = deltaAngle
    globalMath.quadraticbezier = quadraticBezier
    setreadonly(globalMath, true)
end

return moreMath