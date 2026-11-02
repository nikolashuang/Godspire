local AnimationController = {}

local AnimationStorage = {
    PolvernAnimations = {},
    SoverAnimations = {}
}



local LoadedTracks = {}

local humanoid = nil
local animator = nil

local AnimationController = {}

function AnimationController.BindCharacter(character)
    humanoid = character:FindFirstChild("Humanoid")
    animator = humanoid:FindFirstChild("Animator")
end

function AnimationController.LoadAllTracks()
    for storageName, storage in pairs(AnimationStorage) do
        LoadedTracks[storageName] = {}

        for animName, animation in pairs(storage) do
            LoadedTracks[storageName][animName] = animator:LoadAnimation(animation)
        end
    end

end

--HELPER ANIMATION FUNCTIONS--

function AnimationController.PlayAnimation(storage, anim)
    if not storage or not anim then return end

    local storageTable = LoadedTracks[storage]
    if not storageTable then return end

    local animationTrack = storageTable[anim]
    if not animationTrack then return end

    animationTrack:Play()
end

function AnimationController.StopAnimation(storage, anim)
    if not storage or not anim then return end

    local storageTable = LoadedTracks[storage]
    if not storageTable then return end

    local animationTrack = storageTable[anim]
    if not animationTrack then return end

    animationTrack:Stop()
end

return AnimationController