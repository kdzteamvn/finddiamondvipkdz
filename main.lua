local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local AcceptPlayAgain = ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("AcceptPlayAgain")

local timespam = 0.5

local function resetCharacter()
    local plr = Players.LocalPlayer
    if not plr.Character then plr.CharacterAdded:Wait() end
    local char = plr.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.Health = 0
    else
        if char then char:BreakJoints() end
    end
end

function findserver()
    task.spawn(function()
        task.wait(80)
        pcall(resetCharacter)
        task.wait(3)
        while true do
            pcall(function()
                AcceptPlayAgain:FireServer()
            end)
            task.wait(timespam)
        end
    end)
end

findserver()
print("Hi")
