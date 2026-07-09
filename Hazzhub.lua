local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local Window = Fluent:CreateWindow({
    Title = "HazzHub | Premium Design",
    SubTitle = "v1.2 - The Strongest Battlegrounds",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker", -- Найстильніша темна тема
})

local Tabs = {
    Main = Window:AddTab({ Title = "Основне", Icon = "home" }),
    Combat = Window:AddTab({ Title = "Битва", Icon = "swords" })
}

-- Кнопка-перемикач для мобільних пристроїв
local ToggleButton = Instance.new("TextButton", game.CoreGui)
ToggleButton.Size = UDim2.new(0, 100, 0, 40)
ToggleButton.Position = UDim2.new(0, 10, 0.5, 0)
ToggleButton.Text = "MENU"
ToggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.MouseButton1Click:Connect(function() Window:Toggle() end)

-- Дизайнерська секція
Tabs.Main:AddParagraph({Title = "Привіт, Nz!", Content = "Цей дизайн оптимізовано для кращого користувацького досвіду."})

Tabs.Main:AddButton({
    Title = "Телепорт до найближчого",
    Description = "Працює на гравців та манекени",
    Callback = function()
        local closest, dist = nil, math.huge
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Model") and (obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Torso")) and obj.Name ~= player.Name then
                local root = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Torso")
                local d = (player.Character.HumanoidRootPart.Position - root.Position).Magnitude
                if d < dist then dist = d; closest = obj end
            end
        end
        if closest then player.Character.HumanoidRootPart.CFrame = closest:FindFirstChildWhichIsA("BasePart").CFrame end
    end
})

Tabs.Combat:AddInput("TargetName", {Title = "Ім'я цілі (Fling)", Default = "", Callback = function(v) _G.Target = v end})

Tabs.Combat:AddButton({
    Title = "Fling ціль",
    Callback = function()
        local target = workspace:FindFirstChild(_G.Target, true)
        if target and target:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame
            task.wait(0.2)
            player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 1000, 0)
        end
    end
})

Tabs.Combat:AddToggle("TouchFling", {Title = "Touch Fling (Авто)", Default = false}):OnChanged(function(Value)
    _G.TouchFling = Value
    task.spawn(function()
        while _G.TouchFling do
            task.wait()
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("Model") and obj:FindFirstChild("HumanoidRootPart") and obj.Name ~= player.Name then
                    if (player.Character.HumanoidRootPart.Position - obj.HumanoidRootPart.Position).Magnitude < 6 then
                        obj.HumanoidRootPart.Velocity = Vector3.new(9e9, 9e9, 9e9)
                    end
                end
            end
        end
    end)
end)
