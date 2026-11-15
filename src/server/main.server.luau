local ServerScriptService = game:GetService("ServerScriptService")
local RepStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local PlayerProfile = require(ServerScriptService.PlayerProfile.ProfileService)
local HeroClass = require(RepStorage.Shared.Entity_Classes.HeroClass)
local cRemote = RepStorage.Shared.Events.CombatEvent

local Characters = {}

Players.PlayerAdded:Connect(function(player)
    local profile = PlayerProfile.LoadProfile(player)

    if not profile then
        player:Kick("Failed to load your progress. Please rejoin.")
        return
    end

    local plrCharacter = HeroClass.new(player, "Polvern")

    if player.Character then
        plrCharacter:BindCharacterAndComponent(player.Character)
    end

    Characters[player] = plrCharacter

end)

Players.PlayerRemoving:Connect(function(player)
    PlayerProfile.SaveProfile(player)
    PlayerProfile:ReleaseProfile(player)
    Characters[player] = nil
end)


cRemote.OnServerEvent:Connect(function(combatType)
    
end)
