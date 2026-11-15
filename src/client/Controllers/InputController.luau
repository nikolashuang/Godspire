local UserInput = game:GetService("UserInputService")
local RepStorage = game:GetService("ReplicatedStorage")

local Remotes = RepStorage.Shared:FindFirstChild("Events")
local CombatEvent = Remotes:WaitForChild("CombatEvent")

local InputController = {}

local init = false
function InputController.Init()
    if init then return end
    init = true

    UserInput.InputBegan:Connect(function(input, processed)
        if processed then return end

        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            CombatEvent:FireServer("M1")
        end
    
    end)

end



return InputController