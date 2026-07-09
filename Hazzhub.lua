local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Створення основного GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HazzHubGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Кнопка відкриття меню
local openBtn = Instance.new("TextButton", screenGui)
openBtn.Size = UDim2.new(0, 100, 0, 40)
openBtn.Position = UDim2.new(0.5, -50, 0.05, 0)
openBtn.Text = "MENU"
openBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
openBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Головна панель меню
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 200, 0, 250)
frame.Position = UDim2.new(0.5, -100, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Visible = false -- Спочатку меню приховане

-- Логіка відкриття/закриття
openBtn.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)

-- Функція створення кнопки всередині меню
local function createMenuButton(text, pos, callback)
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0, 180, 0, 40)
    btn.Position = pos
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.MouseButton1Click:Connect(callback)
end

-- Функція: Телепорт до найближчого
createMenuButton("Teleport Closest", UDim2.new(0, 10, 0, 10), function()
    local closest, dist = nil, math.huge
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local d = (player.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude
            if d < dist then dist = d; closest = p end
        end
    end
    if closest then player.Character.HumanoidRootPart.CFrame = closest.Character.HumanoidRootPart.CFrame end
end)

-- Функція: Швидкість (Speed)
createMenuButton("Speed x2", UDim2.new(0, 10, 0, 60), function()
    player.Character.Humanoid.WalkSpeed = 32
end)

-- Функція: Скинути швидкість
createMenuButton("Reset Speed", UDim2.new(0, 10, 0, 110), function()
    player.Character.Humanoid.WalkSpeed = 16
end)
