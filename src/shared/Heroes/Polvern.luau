local Debris = game:GetService("Debris")
local RepStorage = game:GetService("ReplicatedStorage")

local HitboxConfig = require(RepStorage.Shared.Combat.Hitboxes)

local PolvernData = {}
PolvernData.__index = PolvernData

function PolvernData.new(character, charConfig, charStats)
    local self = setmetatable({}, PolvernData)

    self.Character = character
    self.Humanoid = self.Character:WaitForChild("Humanoid")
    self.RootPart = self.Character:WaitForChild("HumanoidRootPart")

    self.Stats = charStats
    
    self.MaxGrit = charConfig.MaxHP / 2
    self.Grit = charConfig.Grit
    self.ComboCounter = 0
    self.DamageMultiplier = 0.2
    self.notAttacking = 0
    self.M1Damage = self.Stats.Strength
    self.isAttacking = false
    self.inAbility = false
    self.M1Debounce = 1.5
    self.M1Cooldown = 0


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

    if self.notAttacking >= 3 then
        self.ComboCounter = 0
    end

end



--[[----------------------------------------------------------------------------------------

COMBAT MECHANICS

]]------------------------------------------------------------------------------------------

local m1Hands = {
    "leftHand",
    "rightHand",
    "rightHand"
}

function PolvernData:M1s(timing, indexCount)
    if self.inAbility then return end
    if self.M1Cooldown <= self.M1Debounce then return end
    
    local handHitbox = HitboxConfig.AttachDamageBox(m1Hands[indexCount], Vector3.new(1.25, 0.75, 1.25))
    
end

function PolvernData:M1Landed(landed)
    if not landed then return end

    self.isAttacking = true
    self.notAttacking = 0
    self.ComboCounter += 1

end

return PolvernData