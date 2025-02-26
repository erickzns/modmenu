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

-- Função para limpar o frame principal
local function clearFrame(frame)
    for _, child in ipairs(frame:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("Frame") then
            child:Destroy()
        end
    end
end

-- Função para criar o menu principal
local function createMainMenu()
    clearFrame(mainFrame)
    
    local button1 = createButton("Botão 1", mainFrame, function()
        print("Botão 1 pressionado")
    end)

    local button2 = createButton("Botão 2", mainFrame, function()
        createSubMenu2()
    end)
    button2.Position = UDim2.new(0, 10, 0, 70)

    local button3 = createButton("Botão 3", mainFrame, function()
        createSubMenu3()
    end)
    button3.Position = UDim2.new(0, 10, 0, 130)
end

-- Função para criar o submenu 2
local function createSubMenu2()
    clearFrame(mainFrame)
    
    local submenuButton1 = createButton("Submenu 2 Item 1", mainFrame, function()
        print("Submenu 2 Item 1 pressionado")
        -- Adicione aqui a função desejada para o jogo
    end)

    local submenuButton2 = createButton("Submenu 2 Item 2", mainFrame, function()
        print("Submenu 2 Item 2 pressionado")
        -- Adicione aqui a função desejada para o jogo
    end)
    submenuButton2.Position = UDim2.new(0, 10, 0, 70)

    local backButton = createButton("Voltar", mainFrame, function()
        createMainMenu()
    end)
    backButton.Position = UDim2.new(0, 10, 0, 130)
end

-- Função para criar o submenu 3
local function createSubMenu3()
    clearFrame(mainFrame)
    
    local submenuButton1 = createButton("Submenu 3 Item 1", mainFrame, function()
        print("Submenu 3 Item 1 pressionado")
        -- Adicione aqui a função desejada para o jogo
    end)

    local submenuButton2 = createButton("Submenu 3 Item 2", mainFrame, function()
        print("Submenu 3 Item 2 pressionado")
        -- Adicione aqui a função desejada para o jogo
    end)
    submenuButton2.Position = UDim2.new(0, 10, 0, 70)

    local backButton = createButton("Voltar", mainFrame, function()
        createMainMenu()
    end)
    backButton.Position = UDim2.new(0, 10, 0, 130)
end

-- Inicializa o menu principal
createMainMenu()
