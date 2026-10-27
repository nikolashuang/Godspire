local Debris = game:GetService("Debris")

local PolvernData = {}
PolvernData.__index = PolvernData

function PolvernData.new(character, charConfig, charStats)
    local self = setmetatable({}, PolvernData)

    self.Character = character

    self.Stats = charStats
    
    self.MaxGrit = charConfig.MaxHP / 2
    self.Grit = charConfig.Grit
    self.ComboCounter = 0
    self.DamageMultiplier = 0.2
    self.TimeStationary = 0
    self.M1Damage = self.Stats.Strength
    self.inCombat = false


    return self
end

--[[----------------------------------------------------------------------------------------

PASSIVE MECHANICS

]]------------------------------------------------------------------------------------------

function PolvernData:BornInThePit(deltaTime)

    if self.inCombat then 
        self.M1Damage = self.Stats.Strength + (self.DamageMultiplier * self.ComboCounter)
    else
        self.TimeStationary += deltaTime
    end

    if self.TimeStationary == 3 then
        self.ComboCounter = 0
    end

end



--[[----------------------------------------------------------------------------------------

COMBAT MECHANICS

]]------------------------------------------------------------------------------------------


function PolvernData:M1s()

end

function PolvernData:M1Landed(landed)
    if not landed then return end

    self.ComboCounter += 1

end

return PolvernData