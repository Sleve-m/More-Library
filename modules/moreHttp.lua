--More Http v1.0.0a

local HttpService = game:GetService("HttpService")
local moreHttp = {}

local function simpleGet(url)
    local success, response = pcall(function()
        return game:HttpGet(url)
    end)
    if success then return response else return nil end
end

local function simpleRequest(url, method, headers, body)
    local response = request({
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
        if s then encodedData = e else warn("morehttp.jsonrequest: failed to encode JSON") return nil end
    end
    local response = request({
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
    request({
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
    local headers = {
        ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36",
        ["Accept"] = "application/json"
    }
    local response = http_request({
        Url = tree_url,
        Method = "GET",
        Headers = headers
    })
    if not response then
        return warn("morehttp.downloadrepo: Request failed because response was nil")
    end
    if response.StatusCode ~= 200 then
        warn("morehttp.downloadrepo: GitHub API Failed")
        warn("    Status: " .. tostring(response.StatusCode))
        warn("    Body: " .. tostring(response.Body))
        return
    end
    local data = HttpService:JSONDecode(response.Body)
    if not data.tree then 
        return warn("http.downloadrepo: No file tree found in response.") 
    end
    if not isfolder(target_folder) then 
        makefolder(target_folder) 
    end
    local file_count = 0
    for _, item in pairs(data.tree) do
        local path = target_folder .. "/" .. item.path
        if item.type == "tree" then
            if not isfolder(path) then
                makefolder(path)
            end
        elseif item.type == "blob" then
            local raw_url = "https://raw.githubusercontent.com/"..owner.."/"..repo.."/"..branch.."/"..item.path
            task.spawn(function()
                local success, content = pcall(function() 
                    return game:HttpGet(raw_url) 
                end)
                if success then
                    writefile(path, content)
                    file_count = file_count + 1
                else
                    warn("http.downloadrepo: Failed to download file: " .. item.path)
                end
            end)
        end
    end
end

function moreHttp.load()
    httpGlobal = {}
    httpGlobal.simpleget = simpleGet
    httpGlobal.simplerequest = simpleRequest
    httpGlobal.jsonrequest = jsonRequest
    httpGlobal.sendwebhook = sendWebhook
    httpGlobal.downloadrepo = download_repo
    gettenv(coroutine.running()).morehttp = httpGlobal
    setreadonly(gettenv(coroutine.running()).morehttp, true)
end

return moreHttp