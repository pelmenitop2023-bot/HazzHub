-- HazzHub v1.0 Loader
-- Цей файл викликає UI та Core
loadstring(game:HttpGet("https://raw.githubusercontent.com/ТВІЙ_НІК/HazzHub/main/Library.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ТВІЙ_НІК/HazzHub/main/Core.lua"))()

-- Функція для просування (як у Vexon)
task.wait(2)
game:GetService("GroupService"):PromptJoinAsync(32859350)
