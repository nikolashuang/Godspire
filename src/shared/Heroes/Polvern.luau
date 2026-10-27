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
    self.notAttacking = 0
    self.M1Damage = self.Stats.Strength
    self.isAttacking = false


    return self
end

--[[----------------------------------------------------------------------------------------

PASSIVE MECHANICS

]]------------------------------------------------------------------------------------------

function PolvernData:BornInThePit(deltaTime)

    if self.isAttacking then 
        self.M1Damage = self.Stats.Strength + (self.DamageMultiplier * self.ComboCounter)
    else
        self.notAttacking += deltaTime
    end

    if self.notAttacking == 3 then
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