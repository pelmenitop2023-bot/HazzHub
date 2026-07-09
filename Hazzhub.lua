local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Створення GUI, яке має пріоритет відображення
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HazzHubGui"
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 999 -- Ставимо найвищий пріоритет
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Кнопка
local button = Instance.new("TextButton")
button.Name = "TeleportButton"
button.Parent = screenGui
button.Size = UDim2.new(0, 200, 0, 60)
button.Position = UDim2.new(0.5, -100, 0.2, 0) -- Трохи вище центру
button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Яскраво-червоний, щоб точно помітити
button.Text = "TELEPORT NOW"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextScaled = true

-- Функція телепорту
local function teleportToClosest()
    local closestPlayer = nil
    local shortestDistance = 1000 -- Ліміт дистанції
    
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
        print("Телепорт до: " .. closestPlayer.Name)
    else
        print("Нікого поруч немає")
    end
end

button.MouseButton1Click:Connect(teleportToClosest)

print("Кнопка створена!")
