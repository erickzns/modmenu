-- 🔧 MOD MENU FLUTUANTE - NOVO | ROBLOX
-- ✅ God Mode | Speed | Fly | Noclip | F9 | Bolinha Interativa
-- 📦 Criado por você, aprimorado por mim

repeat wait() until game:IsLoaded() and game.Players.LocalPlayer.Character

local player = game.Players.LocalPlayer
local character = player.Character
local humanoid = character:FindFirstChild("Humanoid")

-- === CRIAR GUI (Segura e compatível) ===
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ModMenuFlutuante"
screenGui.ResetOnSpawn = false

-- Prioridade: StarterGui > CoreGui
pcall(function() screenGui.Parent = game:GetService("StarterGui") end)
if not screenGui.Parent then
    pcall(function() screenGui.Parent = game.CoreGui end)
end
if not screenGui.Parent then
    warn("❌ Falha ao criar GUI. Verifique o executor.")
    return
end

-- === BOLINHA FLUTUANTE (Canto esquerdo) ===
local ball = Instance.new("TextButton")
ball.Text = ""
ball.Size = UDim2.new(0, 60, 0, 60)
ball.Position = UDim2.new(0, 20, 0, 20)
ball.BackgroundColor3 = Color3.fromRGB(30, 136, 229) -- Azul moderno
ball.BorderSizePixel = 0
ball.ZIndex = 10
ball.Parent = screenGui

-- Deixa redonda
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(1, 0)
uiCorner.Parent = ball

-- Efeito de brilho
local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(255, 255, 255)
uiStroke.Thickness = 3
uiStroke.Transparency = 0.5
uiStroke.Parent = ball

-- Hover
ball.MouseEnter:Connect(function()
    ball.BackgroundColor3 = Color3.fromRGB(26, 115, 202)
    uiStroke.Thickness = 4
end)

ball.MouseLeave:Connect(function()
    ball.BackgroundColor3 = Color3.fromRGB(30, 136, 229)
    uiStroke.Thickness = 3
end)

-- === MENU PRINCIPAL (escondido no início) ===
local menu = Instance.new("Frame")
menu.Size = UDim2.new(0, 240, 0, 300)
menu.Position = UDim2.new(0, 90, 0, 20)
menu.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
menu.BorderSizePixel = 2
menu.BorderColor3 = Color3.fromRGB(80, 80, 80)
menu.Visible = false
menu.ZIndex = 10
menu.Parent = screenGui

-- Título
local title = Instance.new("TextLabel")
title.Text = "🔧 MOD MENU"
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = menu

-- Botão de fechar
local close = Instance.new("TextButton")
close.Text = "✖"
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -34, 0, 5)
close.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.Font = Enum.Font.GothamBold
close.Parent = menu

-- === FUNÇÃO PARA CRIAR BOTÕES ===
local function addBtn(text, y, onClick)
    local btn = Instance.new("TextButton")
    btn.Text = text
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Position = UDim2.new(0, 5, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.BorderSizePixel = 0
    btn.Parent = menu

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    end)

    btn.MouseButton1Click:Connect(onClick)
    return btn
end

-- === VARIÁVEIS DE CONTROLE ===
local godMode = false
local speed = humanoid and humanoid.WalkSpeed or 16
local flying = false
local noclip = false

-- === FUNÇÕES DO MENU ===

-- 🔹 God Mode
addBtn("God Mode: Off", 45, function()
    godMode = not godMode
    for _, btn in pairs(menu:GetChildren()) do
        if btn.Text:find("God Mode") then
            btn.Text = "God Mode: " .. (godMode and "On ✅" or "Off")
            break
        end
    end
end)

-- 🔹 Speed Boost
addBtn("Speed: " .. speed, 80, function()
    for _, btn in pairs(menu:GetChildren()) do
        if btn.Text:find("Speed:") then
            speed = (speed == 16) and 32 or 16
            btn.Text = "Speed: " .. speed
            if character and character:FindFirstChild("Humanoid") then
                character.Humanoid.WalkSpeed = speed
            end
            break
        end
    end
end)

-- 🔹 Fly (simples)
addBtn("Fly", 115, function()
    flying = not flying
    local root = character:FindFirstChild("HumanoidRootPart")
    if flying and root then
        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(4000, 4000, 4000)
        bv.Velocity = Vector3.new(0, 30, 0)
        bv.Parent = root
        spawn(function()
            wait(0.2)
            bv:Destroy()
        end)
    end
end)

-- 🔹 Noclip
addBtn("Noclip: Off", 150, function()
    noclip = not noclip
    for _, btn in pairs(menu:GetChildren()) do
        if btn.Text:find("Noclip") then
            btn.Text = "Noclip: " .. (noclip and "On ✅" or "Off")
            break
        end
    end
end)

-- 🔹 Fechar menu
close.MouseButton1Click:Connect(function()
    menu.Visible = false
end)

-- === ABRIR/FECHAR MENU ===
ball.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
end)

-- 🔘 Atalho F9
game:GetService("UserInputService").InputBegan:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.F9 then
        menu.Visible = not menu.Visible
    end
end)

-- === LOOP PRINCIPAL (funções ativas) ===
game:GetService("RunService").Stepped:Connect(function()
    -- God Mode: Mantém vida cheia
    if godMode and character and character:FindFirstChild("Humanoid") then
        character.Humanoid.Health = character.Humanoid.MaxHealth
    end

    -- Noclip: Desativa colisão
    if noclip and character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- === ATUALIZAR APÓS RESPAWN ===
player.CharacterAdded:Connect(function(char)
    character = char
    wait(0.5)
    if character:FindFirstChild("Humanoid") then
        character.Humanoid.WalkSpeed = speed
    end
end)

-- ✅ Feedback
print("🟢 Mod Menu Flutuante carregado!")
print("🔵 Clique na bolinha ou pressione F9 para abrir.")
