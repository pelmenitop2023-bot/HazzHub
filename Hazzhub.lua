local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local Window = Fluent:CreateWindow({
    Title = "HazzHub | The Strongest Battlegrounds",
    SubTitle = "by Nz",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Combat = Window:AddTab({ Title = "Combat", Icon = "" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "" })
}

-- [MAIN] Функції
Tabs.Main:AddButton({Title = "Teleport To Closest", Callback = function()
    local closest, dist = nil, math.huge
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local d = (player.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude
            if d < dist then dist = d; closest = p end
        end
    end
    if closest then player.Character.HumanoidRootPart.CFrame = closest.Character.HumanoidRootPart.CFrame end
end})

-- [COMBAT] Лок та Орбіта
local target = nil
Tabs.Combat:AddToggle("LockOn", {Title = "Lock On Player", Default = false}):OnChanged(function(Value)
    _G.LockOn = Value
end)

RunService.RenderStepped:Connect(function()
    if _G.LockOn and target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, target.Character.HumanoidRootPart.Position)
    end
end)

Tabs.Combat:AddToggle("Orbit", {Title = "Orbit Player", Default = false}):OnChanged(function(Value)
    _G.Orbit = Value
end)

-- [MISC] Fling (потрібно бути обережним)
local targetName = ""
Tabs.Misc:AddInput("FlingInput", {Title = "Fling Target Name", Default = "", Placeholder = "Введи нік...", Callback = function(v) targetName = v end})

Tabs.Misc:AddButton({Title = "Fling By Name", Callback = function()
    local victim = Players:FindFirstChild(targetName)
    if victim and victim.Character and victim.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = player.Character.HumanoidRootPart
        local oldPos = hrp.CFrame
        hrp.CFrame = victim.Character.HumanoidRootPart.CFrame
        task.wait(0.1)
        hrp.CFrame = oldPos
    end
end})

Tabs.Misc:AddToggle("TouchFling", {Title = "Touch Fling", Default = false}):OnChanged(function(Value)
    _G.TouchFling = Value
    while _G.TouchFling do
        task.wait()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local d = (player.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude
                if d < 5 then
                    p.Character.HumanoidRootPart.Velocity = Vector3.new(9e9, 9e9, 9e9)
                end
            end
        end
    end
end)
