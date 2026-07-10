-- HazzHub v1.0 | Professional Loader
getgenv().HazzHub = {
    Settings = {
        Language = "EN", -- Можна змінити на UA або RU
        Theme = "Darker"
    }
}

-- Дизайн (Fluent UI)
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
getgenv().Fluent = Fluent

-- Завантаження логіки
loadstring(game:HttpGet("https://raw.githubusercontent.com/ТВІЙ_НІК/HazzHub/refs/heads/main/Logic.lua"))()
