local moreInstance = {}

local function setProperties(inst, props)
    for i, v in pairs(props) do
        inst[i] = v
    end
end

function moreInstance.load()
    local RealInstance = Instance
    local FakeInstance = {}
    FakeInstance.new = function(...) return RealInstance.new(...) end
    FakeInstance.fromExisting = function(...) return RealInstance.fromExisting(...) end
    FakeInstance.setproperties = setProperties
    getgenv().Instance = FakeInstance
    setreadonly(getgenv().Instance, true)
end

return moreInstance