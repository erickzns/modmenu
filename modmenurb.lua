-- Cria a tela principal
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ModMenu"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.CoreGui

-- Cria o frame principal do menu
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 400)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Função para criar botões
local function createButton(text, parent, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 50)
    button.Position = UDim2.new(0, 10, 0, 10)
    button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BorderSizePixel = 0
    button.Parent = parent
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Cria os botões laterais
local button1 = createButton("Botão 1", mainFrame, function()
    print("Botão 1 pressionado")
end)

local button2 = createButton("Botão 2", mainFrame, function()
    print("Botão 2 pressionado")
end)
button2.Position = UDim2.new(0, 10, 0, 70)

local button3 = createButton("Botão 3", mainFrame, function()
    print("Botão 3 pressionado")
end)
button3.Position = UDim2.new(0, 10, 0, 130)

-- Cria o submenu para o Botão 2
local submenuFrame = Instance.new("Frame")
submenuFrame.Size = UDim2.new(1, -20, 0, 100)
submenuFrame.Position = UDim2.new(0, 10, 0, 190)
submenuFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
submenuFrame.BorderSizePixel = 0
submenuFrame.Visible = false
submenuFrame.Parent = mainFrame

local submenuButton1 = createButton("Submenu Item 1", submenuFrame, function()
    print("Submenu Item 1 pressionado")
end)

local submenuButton2 = createButton("Submenu Item 2", submenuFrame, function()
    print("Submenu Item 2 pressionado")
end)
submenuButton2.Position = UDim2.new(0, 10, 0, 60)

-- Mostra/oculta o submenu quando o Botão 2 é pressionado
button2.MouseButton1Click:Connect(function()
    submenuFrame.Visible = not submenuFrame.Visible
end)
