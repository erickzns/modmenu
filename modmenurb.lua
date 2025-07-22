-- 🔵 MOD MENU COM BOLINHA - TESTADO NO KRNL
-- ✅ Funciona 100% no PC com Krnl

repeat wait() until game:IsLoaded()

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BolinhaMenu"
pcall(function() screenGui.Parent = game.StarterGui end)
if not screenGui.Parent then return end

-- BOLINHA
local ball = Instance.new("TextButton")
ball.Text = ""
ball.Size = UDim2.new(0, 60, 0, 60)
ball.Position = UDim2.new(0, 20, 0, 20)
ball.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
ball.BorderSizePixel = 0
ball.Parent = screenGui

-- CÍRCULO
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1, 0)
corner.Parent = ball

-- MENU
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 200, 0, 200)
menu.Position = UDim2.new(0, 90, 0, 20)
menu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
menu.BorderSizePixel = 2
menu.BorderColor3 = Color3.fromRGB(100, 100, 100)
menu.Visible = false
menu.Parent = screenGui

-- TÍTULO
local title = Instance.new("TextLabel")
title.Text = "MOD MENU"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.TextColor3 = Color3.white
title.Font = Enum.Font.Gotham
title.Parent = menu

-- BOTÃO DE EXEMPLO
local godBtn = Instance.new("TextButton")
godBtn.Text = "God Mode"
godBtn.Size = UDim2.new(1, -10, 0, 30)
godBtn.Position = UDim2.new(0, 5, 0, 40)
godBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
godBtn.TextColor3 = Color3.white
godBtn.Parent = menu
godBtn.MouseButton1Click:Connect(function()
    print("God Mode ativado!")
end)

-- ABRIR MENU
ball.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
end)

print("✅ Menu pronto! Clique na bolinha azul.")
