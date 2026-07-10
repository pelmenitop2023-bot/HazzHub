local Fluent = getgenv().Fluent
local Tabs = getgenv().Tabs
local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

-- [COMBAT]
Tabs.Combat:AddToggle("Lock", {Title = "Lock On", Default = false}):OnChanged(function(v) _G.Lock = v end)
Tabs.Combat:AddToggle("Orbit", {Title = "Orbit (Radius 6)", Default = false}):OnChanged(function(v) _G.Orbit = v end)

-- [MOVEMENT]
Tabs.Move:AddSlider("Speed", {Title = "WalkSpeed", Min = 16, Max = 100, Default = 16}):OnChanged(function(v) player.Character.Humanoid.WalkSpeed = v end)
Tabs.Move:AddToggle("Fly", {Title = "Fly Mode", Default = false}):OnChanged(function(v) 
    _G.Fly = v 
    if v then 
        local bv = Instance.new("BodyVelocity", player.Character.HumanoidRootPart); bv.Name = "FlyVel"
        bv.MaxForce = Vector3.new(9e9,9e9,9e9); bv.Velocity = Vector3.new(0,0,0)
    else if player.Character.HumanoidRootPart:FindFirstChild("FlyVel") then player.Character.HumanoidRootPart.FlyVel:Destroy() end end
end)

-- [VISUAL]
local esp = false
Tabs.Visual:AddToggle("ESP", {Title = "Enable ESP", Default = false}):OnChanged(function(v) esp = v end)
RunService.RenderStepped:Connect(function()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and esp then
            if not p.Character:FindFirstChild("Highlight") then local h = Instance.new("Highlight", p.Character); h.FillColor = Color3.new(1,0,0) end
        elseif p.Character and p.Character:FindFirstChild("Highlight") then p.Character.Highlight:Destroy() end
    end
end)

-- [MISC]
Tabs.Misc:AddButton({Title = "Instant Respawn", Callback = function() player.Character:BreakJoints() end})
Tabs.Misc:AddToggle("AutoHeal", {Title = "Auto Regen", Default = false}):OnChanged(function(v) 
    _G.AutoHeal = v
    spawn(function() while _G.AutoHeal and task.wait(1) do player.Character.Humanoid.Health += 10 end end)
end)
