local RepStorage = game:GetService("ReplicatedStorage")

local MovementComponent = require(RepStorage.Shared.Components.Movement)

local HeroClass = {}

HeroClass.__index = HeroClass

function HeroClass.new(player, character)
    local self = setmetatable({}, HeroClass)

    self.Player = player
    self.Character = character

    self.MovementComponent = MovementComponent.new(self)

    self.Abilities = {}
    self.Relics = {}

end


return HeroClass