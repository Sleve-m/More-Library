--More Drawing v1.0.0

local Camera = workspace.CurrentCamera
local moreDrawing = {}

local function worldToScreen(position)
    local screenPos, onScreen = Camera:WorldToViewportPoint(position)
    return Vector2.new(screenPos.X, screenPos.Y), onScreen, screenPos.Z
end

local function createLine(from, to, color, thickness)
    local line = Drawing.new("Line")
    line.From = from or Vector2.new(0,0)
    line.To = to or Vector2.new(0,0)
    line.Color = color or Color3.new(1,1,1)
    line.Thickness = thickness or 1
    line.Visible = true
    return line
end

local function createCircle(position, radius, color, filled)
    local circle = Drawing.new("Circle")
    circle.Position = position or Vector2.new(0,0)
    circle.Radius = radius or 10
    circle.Color = color or Color3.new(1,1,1)
    circle.Filled = filled or false
    circle.Visible = true
    return circle
end

local function createText(position, content, color, size, center)
    local text = Drawing.new("Text")
    text.Position = position or Vector2.new(0,0)
    text.Text = content or ""
    text.Color = color or Color3.new(1,1,1)
    text.Size = size or 18
    text.Center = center or false
    text.Outline = true
    text.Visible = true
    return text
end

local function createSquare(position, size, color, filled)
    local square = Drawing.new("Square")
    square.Position = position or Vector2.new(0,0)
    square.Size = size or Vector2.new(10,10)
    square.Color = color or Color3.new(1,1,1)
    square.Filled = filled or false
    square.Visible = true
    return square
end

local function createTriangle(p1, p2, p3, color, filled)
    local tri = Drawing.new("Triangle")
    tri.PointA = p1 or Vector2.new(0,0)
    tri.PointB = p2 or Vector2.new(0,0)
    tri.PointC = p3 or Vector2.new(0,0)
    tri.Color = color or Color3.new(1,1,1)
    tri.Filled = filled or false
    tri.Visible = true
    return tri
end

local function createQuad(p1, p2, p3, p4, color, filled)
    local quad = Drawing.new("Quad")
    quad.PointA = p1 or Vector2.new(0,0)
    quad.PointB = p2 or Vector2.new(0,0)
    quad.PointC = p3 or Vector2.new(0,0)
    quad.PointD = p4 or Vector2.new(0,0)
    quad.Color = color or Color3.new(1,1,1)
    quad.Filled = filled or false
    quad.Visible = true
    return quad
end

local function createImage(position, data, size)
    local img = Drawing.new("Image")
    img.Position = position or Vector2.new(0,0)
    img.Size = size or Vector2.new(50,50)
    if data then img.Data = data end 
    img.Visible = true
    return img
end

local function getCenter()
    return Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
end

function moreDrawing.load()
    drawingGlobal = gettenv(coroutine.running()).Drawing
    setreadonly(drawingGlobal, false)
    drawingGlobal.wts = worldToScreen
    drawingGlobal.getscreencenter = getCenter
    drawingGlobal.drawline = createLine
    drawingGlobal.drawcircle = createCircle
    drawingGlobal.drawtext = createText
    drawingGlobal.drawsquare = createSquare
    drawingGlobal.drawtriangle = createTriangle
    drawingGlobal.drawquad = createQuad
    drawingGlobal.drawimage = createImage
    setreadonly(drawingGlobal, true)
end

return moreDrawing