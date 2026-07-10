-- HazzHub Core.lua
-- Це файл, який з'єднує інтерфейс з функціями

-- 1. Підключаємо інтерфейс Dr.Ray, який ми завантажили в Library.lua
local UI = getgenv().DRR 

-- 2. Вказуємо шлях до твоїх модулів на GitHub
-- Заміни "ТВІЙ_НІК" на свій реальний нік на GitHub
local ModulePath = "https://raw.githubusercontent.com/Hazz/HazzHub/main/Features/"

-- 3. Завантажуємо модулі з папки Features
-- Тепер, коли ти будеш додавати новий код у файл "Combat.lua" на GitHub, 
-- він автоматично підтягнеться сюди при запуску хабу.
loadstring(game:HttpGet(ModulePath .. "Combat.lua"))()
loadstring(game:HttpGet(ModulePath .. "Visuals.lua"))()
loadstring(game:HttpGet(ModulePath .. "Movement.lua"))()

print("HazzHub Core loaded successfully!")
