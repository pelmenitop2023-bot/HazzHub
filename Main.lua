local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Створюємо вікно
local Window = Fluent:CreateWindow({
    Title = "HazzHub | Premium TSB",
    SubTitle = "v5.0",
    TabWidth = 160,
    Size = UDim2.fromOffset(550, 400),
    Acrylic = true,
    Theme = "Darker",
})

-- Створюємо вкладки
local Tabs = {
    Combat = Window:AddTab({ Title = "Combat", Icon = "swords" }),
    Move = Window:AddTab({ Title = "Movement", Icon = "move" }),
    Visual = Window:AddTab({ Title = "Visual", Icon = "eye" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "settings" })
}

-- Кнопка GUI, що не зникає
local UI_Toggle = Instance.new("ScreenGui", game.CoreGui)
local Btn = Instance.new("TextButton", UI_Toggle)
Btn.Size = UDim2.new(0, 60, 0, 60); Btn.Position = UDim2.new(0, 20, 0.5, -30)
Btn.Text = "MENU"; Btn.BackgroundColor3 = Color3.fromRGB(30,30,30); Btn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Btn); Btn.MouseButton1Click:Connect(function() Window:Toggle() end)

-- Передаємо дані в Logic.lua
getgenv().Fluent = Fluent
getgenv().Window = Window
getgenv().Tabs = Tabs

-- Завантажуємо Logic (заміни посилання на своє)
loadstring(game:HttpGet("ТВОЄ_ПОСИЛАННЯ_НА_LOGIC_LUA"))()
