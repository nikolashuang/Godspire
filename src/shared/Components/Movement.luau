local Movement = {}
Movement.__index = Movement

function Movement.new(character)
    local self = setmetatable({}, Movement)

    self.Character = character
    self.Humanoid = character:WaitForChild("Humanoid")
    self.RootPart = character:WaitForChild("HumanoidRootPart")

    return self
end


function Movement:Dodge(direction)

end

return Movement