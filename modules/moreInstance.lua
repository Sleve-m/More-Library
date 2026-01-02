local moreInstance = {}

local function modify(inst, props)
    for i, v in pairs(props) do
        inst[i] = v
    end
end

local function destroychildren(inst)
    for i, v in pairs(inst:GetChildren()) do
        v:Destroy()
    end
end

function moreInstance.load()
    local RealInstance = Instance
    local FakeInstance = {}
    FakeInstance.new = function(...) return RealInstance.new(...) end
    FakeInstance.fromExisting = function(...) return RealInstance.fromExisting(...) end
    FakeInstance.modify = modify
    FakeInstance.DestroyChildren = destroychildren
    gettenv(coroutine.running()).Instance = FakeInstance
    setreadonly(gettenv(coroutine.running()).Instance, true)
end

return moreInstance