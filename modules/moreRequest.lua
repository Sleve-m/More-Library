--More Network v1.0.0a

local HttpService = game:GetService("HttpService")
local moreNetwork = {}

local httpRequest = getgenv().request or getgenv().http_request

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

local function download_repo(owner, repo, branch, target_folder)
    local branch = branch or "main"
    local target_folder = target_folder or repo
    local tree_url = "https://api.github.com/repos/"..owner.."/"..repo.."/git/trees/"..branch.."?recursive=1"
    local execname = identifyexecutor()
    local response = http_request({
        Url = tree_url,
        Method = "GET",
        Headers = { ["User-Agent"] = execname }
    })
    if not response or response.StatusCode ~= 200 then
        return warn("Failed to fetch repo. Check owner/repo name or rate limits.")
    end
    local data = HttpService:JSONDecode(response.Body)
    if not data.tree then return warn("No file tree found.") end
    if not isfolder(target_folder) then 
        makefolder(target_folder) 
    end
    for _, item in pairs(data.tree) do
        local path = target_folder .. "/" .. item.path
        
        if item.type == "tree" then
            if not isfolder(path) then
                makefolder(path)
            end
        elseif item.type == "blob" then
            local raw_url = "https://raw.githubusercontent.com/"..owner.."/"..repo.."/"..branch.."/"..item.path
            task.spawn(function()
                local content = game:HttpGet(raw_url)
                writefile(path, content)
            end)
        end
    end
end

function moreNetwork.load()
    setreadonly(httpRequest, false)
    httpRequest.simpleget = simpleGet
    httpRequest.simplerequest = simpleRequest
    httpRequest.jsonrequest = jsonRequest
    httpRequest.sendwebhook = sendWebhook
    httpRequest.downloadrepo = download_repo
    setreadonly(httpRequest, true)
end

return moreNetwork