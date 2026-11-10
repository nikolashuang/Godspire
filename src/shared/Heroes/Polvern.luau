local Debris = game:GetService("Debris")
local RepStorage = game:GetService("ReplicatedStorage")

local HitboxConfig = require(RepStorage.Shared.Combat.Hitboxes)

local PolvernData = {}
PolvernData.__index = PolvernData

function PolvernData.new(hero, charStats)
    local self = setmetatable({}, PolvernData)

    self.Hero = hero

    self.Character = hero.Character
    self.Humanoid = self.Character:WaitForChild("Humanoid")
    self.RootPart = self.Character:WaitForChild("HumanoidRootPart")

    self.Stats = charStats
    
    self.MaxGrit = self.Hero.MaxHP
    self.Grit = 0
    self.GritDecay = 0.25
    self.ComboCounter = 0
    self.DamageMultiplier = 0.2
    self.notAttacking = 0
    self.M1Damage = self.Stats.Strength
    self.inAbility = false
    self.M1Debounce = 1.5
    self.M1Cooldown = 0
    self.m1Index = 1


    return self
end

--[[----------------------------------------------------------------------------------------

PASSIVE MECHANICS

]]------------------------------------------------------------------------------------------

function PolvernData:BornInThePit(deltaTime, damageTaken)
    self.M1Damage = self.Stats.Strength + (self.DamageMultiplier * self.ComboCounter)
    self.Grit = math.min(self.Grit + damageTaken, self.MaxGrit)
    self.GritOn = 0
end

function PolvernData:CheckUpdates(deltaTime)
    self.MaxGrit = self:CalculateMaxGrit()
    self.notAttacking += deltaTime
    self.GritOn += deltaTime

    if self.notAttacking >= 2 then
        self.ComboCounter = 0
        if self.m1Index > 1 then self.m1Index = 1 end
    end

    if self.GritOn >= 4 then
        self.Grit = math.max(0, self.Grit - (self.MaxGrit * self.GritDecay * deltaTime))
    end
end

function PolvernData:CalculateMaxGrit()
    return self.Hero.MaxHP / 2
end



--[[----------------------------------------------------------------------------------------

COMBAT MECHANICS

]]------------------------------------------------------------------------------------------

local m1Hands = {
    "LeftHand",
    "RightHand",
    "RightHand"
}

function PolvernData:M1s(timing)
    if self.inAbility then return end
    if self.m1Index == 1 and time() - self.M1Cooldown < self.M1Debounce then return end
    if self.m1Index > 3 then
        self.M1Cooldown = time()
        self.m1Index = 1
    end

    local handName = m1Hands[self.m1Index]
    self.m1Index += 1
    if not handName then return end

    local currentHand = self.Character:FindFirstChild(handName)
    if not currentHand then return end

    local handHitbox = HitboxConfig.AttachDamageBox(currentHand, Vector3.new(1.25, 0.75, 1.25))

    Debris:AddItem(handHitbox, timing)

end

function PolvernData:M1Landed()
    self.ComboCounter += 1
    self.notAttacking = 0

end

return PolvernData