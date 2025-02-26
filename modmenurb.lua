-- Cria a tela principal
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ModMenu"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.CoreGui

-- Cria o frame principal do menu
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 650, 0, 400)
mainFrame.Position = UDim2.new(0, 20, 0, 100)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Cria a barra lateral
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 80, 1, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
sidebar.BorderSizePixel = 0
sidebar.Parent = mainFrame

-- Função para criar botões da barra lateral
local function createSidebarButton(icon, parent, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 50)
    button.Position = UDim2.new(0, 5, 0, 10)
    button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    button.Text = icon
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BorderSizePixel = 0
    button.TextScaled = true
    button.Parent = parent
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Função para criar botões de submenu
local function createSubmenuButton(text, parent, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 50)
    button.Position = UDim2.new(0, 10, 0, 10)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BorderSizePixel = 0
    button.TextScaled = true
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
    
    local button1 = createSubmenuButton("Dinheiro Infinito", mainFrame, function()
        print("Dinheiro Infinito ativado")
    end)
    button1.Position = UDim2.new(0, 90, 0, 60)

    local button2 = createSubmenuButton("XP Boost", mainFrame, function()
        print("XP Boost ativado")
    end)
    button2.Position = UDim2.new(0, 90, 0, 120)

    local button3 = createSubmenuButton("Auto Collect", mainFrame, function()
        print("Auto Collect ativado")
    end)
    button3.Position = UDim2.new(0, 90, 0, 180)
end

-- Função para criar o submenu de veículos
local function createVehicleMenu()
    clearFrame(mainFrame)
    
    local submenuButton1 = createSubmenuButton("Velocidade Máxima", mainFrame, function()
        print("Velocidade Máxima ativada")
    end)
    submenuButton1.Position = UDim2.new(0, 90, 0, 60)

    local submenuButton2 = createSubmenuButton("No Collision", mainFrame, function()
        print("No Collision ativado")
    end)
    submenuButton2.Position = UDim2.new(0, 90, 0, 120)

    local submenuButton3 = createSubmenuButton("Nitro Infinito", mainFrame, function()
        print("Nitro Infinito ativado")
    end)
    submenuButton3.Position = UDim2.new(0, 90, 0, 180)

    local backButton = createSubmenuButton("Voltar", mainFrame, function()
        createMainMenu()
    end)
    backButton.Position = UDim2.new(0, 90, 0, 240)
end

-- Função para criar o submenu de concessionária
local function createDealershipMenu()
    clearFrame(mainFrame)
    
    local submenuButton1 = createSubmenuButton("Construção Instantânea", mainFrame, function()
        print("Construção Instantânea ativada")
    end)
    submenuButton1.Position = UDim2.new(0, 90, 0, 60)

    local submenuButton2 = createSubmenuButton("Upgrade Grátis", mainFrame, function()
        print("Upgrade Grátis ativado")
    end)
    submenuButton2.Position = UDim2.new(0, 90, 0, 120)

    local submenuButton3 = createSubmenuButton("Auto Sell", mainFrame, function()
        print("Auto Sell ativado")
    end)
    submenuButton3.Position = UDim2.new(0, 90, 0, 180)

    local backButton = createSubmenuButton("Voltar", mainFrame, function()
        createMainMenu()
    end)
    backButton.Position = UDim2.new(0, 90, 0, 240)
end

-- Função para criar o submenu de eventos
local function createEventMenu()
    clearFrame(mainFrame)
    
    local submenuButton1 = createSubmenuButton("Pular Corridas", mainFrame, function()
        print("Pular Corridas ativado")
    end)
    submenuButton1.Position = UDim2.new(0, 90, 0, 60)

    local submenuButton2 = createSubmenuButton("Auto Win", mainFrame, function()
        print("Auto Win ativado")
    end)
    submenuButton2.Position = UDim2.new(0, 90, 0, 120)

    local submenuButton3 = createSubmenuButton("Spawn Veículos Especiais", mainFrame, function()
        print("Spawn Veículos Especiais ativado")
    end)
    submenuButton3.Position = UDim2.new(0, 90, 0, 180)

    local backButton = createSubmenuButton("Voltar", mainFrame, function()
        createMainMenu()
    end)
    backButton.Position = UDim2.new(0, 90, 0, 240)
end

-- Cria os botões da barra lateral
local sidebarButton1 = createSidebarButton("G", sidebar, function()
    createMainMenu()
end)
sidebarButton1.Position = UDim2.new(0, 5, 0, 10)

local sidebarButton2 = createSidebarButton("V", sidebar, function()
    createVehicleMenu()
end)
sidebarButton2.Position = UDim2.new(0, 5, 0, 70)

local sidebarButton3 = createSidebarButton("C", sidebar, function()
    createDealershipMenu()
end)
sidebarButton3.Position = UDim2.new(0, 5, 0, 130)

local sidebarButton4 = createSidebarButton("E", sidebar, function()
    createEventMenu()
end)
sidebarButton4.Position = UDim2.new(0, 5, 0, 190)

-- Inicializa o menu principal
createMainMenu()
