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
    
    self.MaxGrit = self.Hero.MaxHP / 2
    self.Grit = 0
    self.GritDecay = 0.25
    self.GritOn = 0
    self.ComboCounter = 0
    self.DamageMultiplier = 0.2
    self.notAttacking = 0
    self.M1Damage = self.Stats.Strength
    self.inAbility = false
    self.M1Debounce = 1.5
    self.M1Cooldown = 0
    self.m1Index = 1
    self.isM1 = 0


    return self
end

--[[----------------------------------------------------------------------------------------

PASSIVE MECHANICS

]]------------------------------------------------------------------------------------------

function PolvernData:BornInThePit(deltaTime, damageTaken)
    self.M1Damage = self.Stats.Strength + (self.DamageMultiplier * self.ComboCounter)
    self.Grit = math.min(self.Grit + damageTaken, self.MaxGrit)
    
    if damageTaken > 0 then
        self.GritOn = 0
    end
end

function PolvernData:CheckUpdates(deltaTime)
    self.MaxGrit = self:CalculateMaxGrit()
    self.Grit = math.min(self.Grit, self.MaxGrit)
    self.notAttacking += deltaTime
    self.GritOn += deltaTime
    self.isM1 += deltaTime

    if self.notAttacking >= 2 then
        self.ComboCounter = 0
    end

    if self.isM1 >= 4 then
        self.m1Index = 1
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

    self.isM1 = 0

    local handName = m1Hands[self.m1Index]
    if not handName then return end

    local currentHand = self.Character:FindFirstChild(handName)
    if not currentHand then return end

    local handHitbox = HitboxConfig.AttachDamageBox(currentHand, Vector3.new(1.25, 0.75, 1.25))

    Debris:AddItem(handHitbox, timing)

    self.m1Index += 1
    if self.m1Index > 3 then
        self.M1Cooldown = time()
        self.m1Index = 1
    end

end

function PolvernData:M1Landed()
    self.ComboCounter += 1
    self.notAttacking = 0

end

return PolvernData