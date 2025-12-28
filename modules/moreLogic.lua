-- More Logic v1.0.0a

local moreLogic = {}

function xor(con1, con2)
    return con1 ~= con2
end

function nor(con1, con2)
    return (not con1) and (not con2)
end

function nand(con1, con2)
    return not (con1 and con2)
end

function xnor(con1, con2)
    return not xor(con1, con2)
end

function moreLogic.load()
    getgenv().xor = xor
    getgenv().nor = nor
    getgenv().nand = nand
    getgenv().xnor = xnor
end

return moreLogic