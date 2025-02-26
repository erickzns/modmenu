-- Criação da GUI do Mod Menu
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

-- Criar o Menu (Frame principal)
local modMenu = Instance.new("Frame")
modMenu.Size = UDim2.new(0, 500, 0, 350)  -- Menu com tamanho refinado
modMenu.Position = UDim2.new(0.5, -250, 0.5, -175)  -- Centralizando o menu
modMenu.BackgroundColor3 = Color3.fromRGB(24, 24, 24)  -- Cor de fundo mais neutra
modMenu.BackgroundTransparency = 0.8  -- Fundo semitransparente
modMenu.BorderSizePixel = 0  -- Sem borda
modMenu.Parent = screenGui
modMenu.ZIndex = 2  -- Menu acima de outros elementos

-- Adicionando bordas arredondadas
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = modMenu

-- Sidebar com as categorias
local categories = {
    { name = "Geral", iconUrl = "rbxassetid://123456789", submenus = {"Dinheiro Infinito", "XP Boost", "Auto Collect"} },
    { name = "Veículos", iconUrl = "rbxassetid://987654321", submenus = {"Velocidade Máxima", "No Collision", "Nitro Infinito"} },
    { name = "Concessionária", iconUrl = "rbxassetid://112233445", submenus = {"Construção Instantânea", "Upgrade Grátis", "Auto Sell"} },
    { name = "Eventos", iconUrl = "rbxassetid://556677889", submenus = {"Pular Corridas", "Auto Win", "Spawn Veículos Especiais"} },
}

-- Criação da sidebar (botões laterais)
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 70, 1, 0)  -- Sidebar mais compacta
sidebar.Position = UDim2.new(0, 0, 0, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
sidebar.BorderSizePixel = 0
sidebar.Parent = modMenu

-- Adicionando bordas arredondadas para a sidebar
local sidebarCorner = Instance.new("UICorner")
sidebarCorner.CornerRadius = UDim.new(0, 15)
sidebarCorner.Parent = sidebar

local buttons = {}
for i, cat in ipairs(categories) do
    local button = Instance.new("ImageButton")
    button.Size = UDim2.new(1, 0, 0, 60)  -- Botões com altura mais proporcional
    button.Position = UDim2.new(0, 0, 0, (i-1) * 70)
    button.BackgroundTransparency = 1
    button.Image = cat.iconUrl  -- Usando os ícones da URL
    button.Parent = sidebar
    button.ZIndex = 3
    button.Name = cat.name

    -- Efeito de hover nos botões da sidebar
    local buttonHover = Instance.new("UICorner")
    buttonHover.CornerRadius = UDim.new(0, 12)
    buttonHover.Parent = button

    -- Alterando a opacidade quando o mouse passa por cima
    button.MouseEnter:Connect(function()
        button.ImageTransparency = 0.5
    end)

    button.MouseLeave:Connect(function()
        button.ImageTransparency = 0
    end)

    buttons[cat.name] = button
end

-- Área para os submenus
local submenuFrame = Instance.new("Frame")
submenuFrame.Size = UDim2.new(1, -70, 1, 0)  -- Ajustando a largura para o submenu
submenuFrame.Position = UDim2.new(0, 70, 0, 0)
submenuFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
submenuFrame.BorderSizePixel = 0
submenuFrame.Parent = modMenu

-- Bordas arredondadas para o submenu
local submenuCorner = Instance.new("UICorner")
submenuCorner.CornerRadius = UDim.new(0, 15)
submenuCorner.Parent = submenuFrame

local submenuList = Instance.new("UIListLayout")
submenuList.Padding = UDim.new(0, 12)  -- Espaçamento entre os itens do submenu
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
        submenuButton.Size = UDim2.new(1, 0, 0, 50)  -- Ajuste da altura do submenu
        submenuButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        submenuButton.Text = submenu
        submenuButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        submenuButton.TextSize = 16
        submenuButton.Font = Enum.Font.Gotham
        submenuButton.BorderSizePixel = 0
        submenuButton.TextTransparency = 0.2
        submenuButton.Parent = submenuFrame

        -- Efeito de hover no submenu
        submenuButton.MouseEnter:Connect(function()
            submenuButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        end)

        submenuButton.MouseLeave:Connect(function()
            submenuButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end)
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
