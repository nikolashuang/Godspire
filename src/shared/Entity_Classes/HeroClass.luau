local RepStorage = game:GetService("ReplicatedStorage")

local HeroComponentFinder = RepStorage.Shared.Heroes
local MovementComponent = require(RepStorage.Shared.Components.Movement)

local HeroClass = {}

HeroClass.__index = HeroClass

function HeroClass.new(player, heroName)
    local self = setmetatable({}, HeroClass)

    self.Player = player
    self.HeroName = heroName

    self.Abilities = {}
    self.Relics = {}


    return self
end


function HeroClass:BindCharacterAndComponent(character)
    self.Character = character
    self.Humanoid = character:WaitForChild("Humanoid")
    self.RootPart = character:WaitForChild("HumanoidRootPart")

    local heroModule = HeroComponentFinder:WaitForChild(self.HeroName)

    if not heroModule or not heroModule:IsA("ModuleScript") then
        warn("No hero found")
        return nil
    end

    local HeroComponentRequest = require(heroModule)
    self.HeroComponent = HeroComponentRequest.new(self.Character)
end


return HeroClass