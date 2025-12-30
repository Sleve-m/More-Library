local moreInstance = {}

local function modify(inst, props)
    for i, v in pairs(props) do
        inst[i] = v
    end
end

function moreInstance.load()
    local RealInstance = Instance
    local FakeInstance = {}
    FakeInstance.new = function(...) return RealInstance.new(...) end
    FakeInstance.fromExisting = function(...) return RealInstance.fromExisting(...) end
    FakeInstance.modify = modify
    getgenv().Instance = FakeInstance
    setreadonly(getgenv().Instance, true)
end

return moreInstance