local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "HazzHub | The Strongest Battlegrounds",
   LoadingTitle = "HazzHub v1.0",
   LoadingSubtitle = "by You",
   ConfigurationSaving = { Enabled = true, FolderName = "HazzHub" }
})

-- Створюємо вкладку
local Tab = Window:CreateTab("Main", nil)

-- Кнопка телепорту (з дизайном)
Tab:CreateButton({
   Name = "Teleport To Closest",
   Callback = function()
      local Players = game:GetService("Players")
      local player = Players.LocalPlayer
      local closest, dist = nil, math.huge
      for _, p in pairs(Players:GetPlayers()) do
         if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local d = (player.Character.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude
            if d < dist then dist = d; closest = p end
         end
      end
      if closest then player.Character.HumanoidRootPart.CFrame = closest.Character.HumanoidRootPart.CFrame end
   end,
})

-- Слайдер для швидкості (як у великих хабах)
Tab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 100},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

-- Перемикач
Tab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Callback = function(Value)
      _G.InfiniteJump = Value
      game:GetService("UserInputService").JumpRequest:Connect(function()
         if _G.InfiniteJump then
            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid"):ChangeState("Jumping")
         end
      end)
   end,
})
