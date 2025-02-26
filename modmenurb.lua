local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

-- Criação do Menu
local modMenu = Instance.new("Frame")
modMenu.Size = UDim2.new(0, 600, 0, 400)
modMenu.Position = UDim2.new(0.5, -300, 0.5, -200)
modMenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  -- Fundo escuro
modMenu.BackgroundTransparency = 0.9
modMenu.BorderSizePixel = 0
modMenu.Parent = screenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = modMenu

-- Barra de Títulos (Abas)
local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1, 0, 0, 40)
tabBar.Position = UDim2.new(0, 0, 0, 0)
tabBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tabBar.BorderSizePixel = 0
tabBar.Parent = modMenu

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
tabLayout.VerticalAlignment = Enum.VerticalAlignment.Center
tabLayout.Parent = tabBar

local categories = {
    { name = "Main", icon = "rbxassetid://123456789" },
    { name = "Settings", icon = "rbxassetid://987654321" },
    { name = "Misc", icon = "rbxassetid://112233445" },
}

local function createTabButton(name)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 100, 1, 0)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Text = name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 18
    button.Parent = tabBar
    return button
end

for _, category in pairs(categories) do
    local tabButton = createTabButton(category.name)
    -- Ao clicar nas abas, vamos alterar o conteúdo
    tabButton.MouseButton1Click:Connect(function()
        -- Lógica para trocar o conteúdo exibido
        print("Abrir conteúdo para " .. category.name)
    end)
end

-- Conteúdo principal (submenus)
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 1, -40)  -- Fica abaixo da barra de abas
contentFrame.Position = UDim2.new(0, 0, 0, 40)
contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = modMenu

local UICornerContent = Instance.new("UICorner")
UICornerContent.CornerRadius = UDim.new(0, 10)
UICornerContent.Parent = contentFrame

local function createToggleOption(label, isChecked)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    frame.Parent = contentFrame

    local UICornerToggle = Instance.new("UICorner")
    UICornerToggle.CornerRadius = UDim.new(0, 10)
    UICornerToggle.Parent = frame

    local optionLabel = Instance.new("TextLabel")
    optionLabel.Size = UDim2.new(0.7, 0, 1, 0)
    optionLabel.Text = label
    optionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    optionLabel.Font = Enum.Font.Gotham
    optionLabel.TextSize = 16
    optionLabel.BackgroundTransparency = 1
    optionLabel.Parent = frame

    local toggleSwitch = Instance.new("TextButton")
    toggleSwitch.Size = UDim2.new(0, 60, 0, 25)
    toggleSwitch.Position = UDim2.new(0.8, 0, 0.5, -12)
    toggleSwitch.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    toggleSwitch.Text = isChecked and "ON" or "OFF"
    toggleSwitch.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleSwitch.Font = Enum.Font.GothamBold
    toggleSwitch.TextSize = 14
    toggleSwitch.Parent = frame

    toggleSwitch.MouseButton1Click:Connect(function()
        isChecked = not isChecked
        toggleSwitch.Text = isChecked and "ON" or "OFF"
        toggleSwitch.BackgroundColor3 = isChecked and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(100, 100, 100)
    end)
end

-- Exemplo de opções de menu
createToggleOption("Auto Cast", false)
createToggleOption("Auto Shake", true)
createToggleOption("Instant Bobber", false)
createToggleOption("Freeze Character", true)
