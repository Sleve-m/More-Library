local HttpService = game:GetService("HttpService")
local moreNetwork = {}

local httpRequest = getgenv().request or getgenv().http_request or (getgenv().syn and getgenv().syn.request)

local function simpleGet(url)
    local success, response = pcall(function()
        return game:HttpGet(url)
    end)
    if success then return response else return nil end
end

local function simpleRequest(url, method, headers, body)
    local response = httpRequest({
        Url = url,
        Method = method or "GET",
        Headers = headers or {},
        Body = body or ""
    })
    return response
end

local function jsonRequest(url, method, data)
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local encodedData = ""
    if data then
        local s, e = pcall(function() return HttpService:JSONEncode(data) end)
        if s then encodedData = e else warn("moreNetwork: Failed to encode JSON") return nil end
    end
    local response = httpRequest({
        Url = url,
        Method = method or "POST",
        Headers = headers,
        Body = encodedData
    })
    if response and response.Body then
        local s, decoded = pcall(function() return HttpService:JSONDecode(response.Body) end)
        if s then return decoded end
    end
    
    return response
end

local function sendWebhook(url, contentOrTable)
    local payload = {}
    if type(contentOrTable) == "string" then
        payload = { content = contentOrTable }
    elseif type(contentOrTable) == "table" then
        payload = contentOrTable
    end
    local headers = { ["Content-Type"] = "application/json" }
    local encoded = HttpService:JSONEncode(payload)
    httpRequest({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = encoded
    })
end

function moreNetwork.load()
    getgenv().simpleget = simpleGet
    getgenv().simplerequest = simpleRequest
    getgenv().jsonrequest = jsonRequest
    getgenv().sendwebhook = sendWebhook
end

return moreNetwork