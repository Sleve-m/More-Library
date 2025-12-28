local moreObject = {}

local function setProperties(inst, props)
    for i, v in pairs(props) do
        inst[i] = v
    end
end

function moreObject.load()
    local ObjectLib = {
        modify = setProperties
    }
    getgenv().Object = ObjectLib
    setreadonly(getgenv().Object, true)
end

return moreObject