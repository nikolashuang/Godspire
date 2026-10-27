local RepStorage = game:GetService("ReplicatedStorage")

local MovementComponent = require(RepStorage.Shared.Components.Movement)
local HeroConfig = require(RepStorage.Shared.Entities.HeroConfig)

local HeroComponentFinder = RepStorage.Shared.Heroes


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
        warn("No Hero found for ", self.HeroName)
        return nil
    end

    local Config = HeroConfig[self.HeroName]

    if not Config then
        warn("No Config found for ", self.HeroName)
        return nil
    end

    self.MaxHP = Config.MaxHP
    self.HealthPoints = Config.HealthPoints

    local HeroComponentRequest = require(heroModule)
    self.HeroComponent = HeroComponentRequest.new(self.Character, Config)

end


return HeroClass