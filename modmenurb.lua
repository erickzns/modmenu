-- Criação da GUI do Mod Menu
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

-- Criar o Menu (Frame principal)
local modMenu = Instance.new("Frame")
modMenu.Size = UDim2.new(0, 650, 0, 400)
modMenu.Position = UDim2.new(0, 50, 0, 50)
modMenu.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
modMenu.BackgroundTransparency = 0.9
modMenu.Parent = screenGui

-- Sidebar com as categorias
local categories = {
    { name = "Geral", submenus = {"Dinheiro Infinito", "XP Boost", "Auto Collect"} },
    { name = "Veículos", submenus = {"Velocidade Máxima", "No Collision", "Nitro Infinito"} },
    { name = "Concessionária", submenus = {"Construção Instantânea", "Upgrade Grátis", "Auto Sell"} },
    { name = "Eventos", submenus = {"Pular Corridas", "Auto Win", "Spawn Veículos Especiais"} },
}

-- Criação da sidebar (botões)
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 60, 1, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
sidebar.Parent = modMenu

local buttons = {}
for i, cat in ipairs(categories) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 40)
    button.Position = UDim2.new(0, 0, 0, (i-1) * 45)
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.Text = cat.name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = sidebar
    buttons[cat.name] = button
end

-- Área para os submenus
local submenuFrame = Instance.new("Frame")
submenuFrame.Size = UDim2.new(1, -60, 1, 0)
submenuFrame.Position = UDim2.new(0, 60, 0, 0)
submenuFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
submenuFrame.Parent = modMenu

local submenuList = Instance.new("UIListLayout")
submenuList.Parent = submenuFrame

-- Função para mostrar os submenus
local function showSubmenu(category)
    -- Limpar os itens antigos
    for _, child in ipairs(submenuFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    -- Criar os novos submenus
    for _, submenu in ipairs(category.submenus) do
        local submenuButton = Instance.new("TextButton")
        submenuButton.Size = UDim2.new(1, 0, 0, 40)
        submenuButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        submenuButton.Text = submenu
        submenuButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        submenuButton.Parent = submenuFrame
    end
end

-- Exibir os submenus ao clicar nas categorias
for catName, button in pairs(buttons) do
    local category = nil
    for _, cat in ipairs(categories) do
        if cat.name == catName then
            category = cat
            break
        end
    end
    
    button.MouseButton1Click:Connect(function()
        showSubmenu(category)
    end)
end
