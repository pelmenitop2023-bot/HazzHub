local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Створення меню (ScreenGui)
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local button = Instance.new("TextButton", screenGui)

button.Size = UDim2.new(0, 150, 0, 50)
button.Position = UDim2.new(0.1, 0, 0.1, 0)
button.Text = "Teleport To Closest"
button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
button.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Функція телепорту
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

-- Прив'язка функції до кнопки
button.MouseButton1Click:Connect(teleportToClosest)
