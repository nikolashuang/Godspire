local PolvernData = {}
PolvernData.__index = PolvernData

function PolvernData.new()
    local self = setmetatable({}, PolvernData)

    return self
end


return PolvernData