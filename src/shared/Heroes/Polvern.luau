local PolvernData = {}
PolvernData.__index = PolvernData

function PolvernData.new(character, charConfig)
    local self = setmetatable({}, PolvernData)

    self.Character = character
    
    self.MaxGrit = charConfig.MaxHP / 2
    self.Grit = charConfig.Grit

    return self
end



return PolvernData