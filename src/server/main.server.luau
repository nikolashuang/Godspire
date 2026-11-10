local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local PlayerProfile = require(ServerScriptService.PlayerProfile.ProfileService)
local CharacterClass = require(ReplicatedStorage.Shared.Character.CharacterClass)

local Characters = {}

Players.PlayerAdded:Connect(function(player)
    local profile = PlayerProfile.LoadProfile(player)

    if not profile then
        player:Kick("Failed to load your progress. Please rejoin.")
        return
    end
end)

Players.PlayerRemoving:Connect(function(player)
    PlayerProfile.SaveProfile(player)
    PlayerProfile:ReleaseProfile(player)
    Characters[player] = nil
end)