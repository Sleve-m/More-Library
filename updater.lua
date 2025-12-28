local HttpService = game:GetService("HttpService")

local updater = {}

local function download_repo(owner, repo, branch, target_folder)
    local branch = branch or "main"
    local target_folder = target_folder or repo
    print("Fetching repo structure...")
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
    print("Downloading " .. #data.tree .. " items...")
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
                print("Downloaded: " .. item.path)
            end)
        end
    end
    print("Download complete!")
end

function updater:update()
    local currentupdate = game:HttpGet("https://raw.githubusercontent.com/Sleve-m/More-Library/refs/heads/main/version.txt")
    print(currentupdate)
    local currentversion = isfile("MoreLibrary/version.txt") and readfile("MoreLibrary/version.txt") or nil
    print(currentversion)
    if currentupdate ~= currentversion then
        local http_request = request or http_request or (syn and syn.request) or (fluxus and fluxus.request)
        download_repo("Sleve-m", "More-Library", "main", "MoreLibrary")
    end
end

return updater