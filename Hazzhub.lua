local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Створюємо ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MyTestGui"
screenGui.ResetOnSpawn = false -- Це важливо, щоб інтерфейс не зникав після смерті
screenGui.Parent = playerGui

-- Створюємо кнопку
local button = Instance.new("TextButton")
button.Name = "TeleportButton"
button.Parent = screenGui
button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.5, 0) -- По центру екрану
button.Text = "Teleport To Closest"
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

button.MouseButton1Click:Connect(teleportToClosest)
print("Меню має з'явитися!")
