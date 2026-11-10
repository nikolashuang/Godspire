local Hitboxes = {}

function Hitboxes.AttachDamageBox(instance, size, offset)
    if not instance then return end

    local DamagePartBox = Instance.new("Part")
    DamagePartBox.Size = size
    DamagePartBox.Transparency = 0.5
    DamagePartBox.CanCollide = false
    DamagePartBox.CanTouch = false
    DamagePartBox.Massless = true

    DamagePartBox.CFrame = instance.CFrame * (offset or CFrame.new())
    DamagePartBox.Parent = instance

    local weld = Instance.new("WeldConstraint")
    weld.Part0 = instance
    weld.Part1 = DamagePartBox
    weld.Parent = DamagePartBox

    return DamagePartBox
end


return Hitboxes