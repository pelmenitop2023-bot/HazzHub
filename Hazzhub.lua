local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Функція для автоматичного телепорту до найближчого гравця
local function teleportToClosest()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, otherPlayer in pairs(Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (player.Character.HumanoidRootPart.Position - otherPlayer.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                closestPlayer = otherPlayer
            end
        end
    end

    if closestPlayer then
        player.Character.HumanoidRootPart.CFrame = closestPlayer.Character.HumanoidRootPart.CFrame
    end
end

-- Виклик функції
teleportToClosest()
