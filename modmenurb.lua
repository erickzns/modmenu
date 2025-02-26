local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

-- Menu principal
local modMenu = Instance.new("Frame")
modMenu.Size = UDim2.new(0, 800, 0, 500)
modMenu.Position = UDim2.new(0.5, -400, 0.5, -250)
modMenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  -- Fundo escuro
modMenu.BackgroundTransparency = 0.8
modMenu.BorderSizePixel = 0
modMenu.Parent = screenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = modMenu

-- Menu lateral
local sideMenu = Instance.new("Frame")
sideMenu.Size = UDim2.new(0, 200, 1, 0)
sideMenu.Position = UDim2.new(0, 0, 0, 0)
sideMenu.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
sideMenu.BorderSizePixel = 0
sideMenu.Parent = modMenu

local UICornerSideMenu = Instance.new("UICorner")
UICornerSideMenu.CornerRadius = UDim.new(0, 10)
UICornerSideMenu.Parent = sideMenu

local sideMenuLayout = Instance.new("UIListLayout")
sideMenuLayout.FillDirection = Enum.FillDirection.Vertical
sideMenuLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
sideMenuLayout.VerticalAlignment = Enum.VerticalAlignment.Top
sideMenuLayout.Parent = sideMenu

local categories = {
    { name = "Armas" },
    { name = "Veículos" },
    { name = "Config" },
}

local function createCategoryButton(name)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 50)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Text = name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 16
    button.Parent = sideMenu

    -- Hover effect
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    end)

    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)

    return button
end

for _, category in pairs(categories) do
    local categoryButton = createCategoryButton(category.name)
    -- Quando clicar na categoria, mostrar o conteúdo relacionado
    categoryButton.MouseButton1Click:Connect(function()
        showCategoryContent(category.name)
    end)
end

-- Área de conteúdo (à direita)
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -200, 1, 0)  -- A largura é reduzida para o espaço do menu lateral
contentFrame.Position = UDim2.new(0, 200, 0, 0)
contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = modMenu

local UICornerContent = Instance.new("UICorner")
UICornerContent.CornerRadius = UDim.new(0, 10)
UICornerContent.Parent = contentFrame

local function showCategoryContent(categoryName)
    -- Limpar conteúdo anterior
    for _, child in pairs(contentFrame:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end

    -- Criar conteúdo da categoria
    local content = Instance.new("Frame")
    content.Size = UDim2.new(1, 0, 1, 0)
    content.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    content.Parent = contentFrame

    local UICornerContent = Instance.new("UICorner")
    UICornerContent.CornerRadius = UDim.new(0, 10)
    UICornerContent.Parent = content

    local contentTitle = Instance.new("TextLabel")
    contentTitle.Size = UDim2.new(1, 0, 0, 40)
    contentTitle.Text = "Opções de " .. categoryName
    contentTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    contentTitle.Font = Enum.Font.GothamBold
    contentTitle.TextSize = 20
    contentTitle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    contentTitle.Parent = content

    local contentLayout = Instance.new("UIListLayout")
    contentLayout.FillDirection = Enum.FillDirection.Vertical
    contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    contentLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    contentLayout.Padding = UDim.new(0, 10)
    contentLayout.Parent = content

    -- Adicionar opções específicas à categoria
    if categoryName == "Armas" then
        local option1 = Instance.new("TextButton")
        option1.Size = UDim2.new(1, 0, 0, 40)
        option1.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        option1.Text = "Spawn de Arma"
        option1.TextColor3 = Color3.fromRGB(255, 255, 255)
        option1.Font = Enum.Font.Gotham
        option1.TextSize = 16
        option1.Parent = content
    elseif categoryName == "Veículos" then
        local option1 = Instance.new("TextButton")
        option1.Size = UDim2.new(1, 0, 0, 40)
        option1.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        option1.Text = "Spawn de Veículo"
        option1.TextColor3 = Color3.fromRGB(255, 255, 255)
        option1.Font = Enum.Font.Gotham
        option1.TextSize = 16
        option1.Parent = content
    elseif categoryName == "Config" then
        local option1 = Instance.new("TextButton")
        option1.Size = UDim2.new(1, 0, 0, 40)
        option1.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        option1.Text = "Configurações"
        option1.TextColor3 = Color3.fromRGB(255, 255, 255)
        option1.Font = Enum.Font.Gotham
        option1.TextSize = 16
        option1.Parent = content
    end
end

-- Inicializar com a primeira categoria visível
showCategoryContent("Armas")
