-- Certifique-se de que este script está em um LocalScript dentro do StarterGui

-- Definir categorias e submenus
local categories = {
    { name = "Geral", submenus = {"Dinheiro Infinito", "XP Boost", "Auto Collect"} },
    { name = "Veículos", submenus = {"Velocidade Máxima", "No Collision", "Nitro Infinito"} },
    { name = "Concessionária", submenus = {"Construção Instantânea", "Upgrade Grátis", "Auto Sell"} },
    { name = "Eventos", submenus = {"Pular Corridas", "Auto Win", "Spawn Veículos Especiais"} },
}

-- Função para criar o menu
local function createModMenu()
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local Sidebar = Instance.new("Frame")
    local ContentFrame = Instance.new("Frame")
    local CategoryTitle = Instance.new("TextLabel")
    local SubmenuList = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")

    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.Name = "ModMenu"

    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MainFrame.BackgroundTransparency = 0.9
    MainFrame.Position = UDim2.new(0.02, 0, 0.1, 0)
    MainFrame.Size = UDim2.new(0, 650, 0, 400)
    MainFrame.ClipsDescendants = true

    Sidebar.Parent = MainFrame
    Sidebar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Sidebar.Size = UDim2.new(0, 100, 1, 0)

    ContentFrame.Parent = MainFrame
    ContentFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    ContentFrame.Position = UDim2.new(0, 100, 0, 0)
    ContentFrame.Size = UDim2.new(1, -100, 1, 0)

    CategoryTitle.Parent = ContentFrame
    CategoryTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    CategoryTitle.Size = UDim2.new(1, 0, 0, 50)
    CategoryTitle.Font = Enum.Font.SourceSansBold
    CategoryTitle.Text = "Geral"
    CategoryTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    CategoryTitle.TextSize = 24

    SubmenuList.Parent = ContentFrame
    SubmenuList.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    SubmenuList.Position = UDim2.new(0, 0, 0, 50)
    SubmenuList.Size = UDim2.new(1, 0, 1, -50)

    UIListLayout.Parent = SubmenuList
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local function updateSubmenuList(category)
        CategoryTitle.Text = category.name
        for _, child in ipairs(SubmenuList:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end
        for _, submenu in ipairs(category.submenus) do
            local SubmenuItem = Instance.new("Frame")
            local SubmenuText = Instance.new("TextLabel")
            local SubmenuCheckbox = Instance.new("TextButton")

            SubmenuItem.Parent = SubmenuList
            SubmenuItem.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            SubmenuItem.Size = UDim2.new(1, 0, 0, 50)
            SubmenuItem.LayoutOrder = #SubmenuList:GetChildren()

            SubmenuText.Parent = SubmenuItem
            SubmenuText.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            SubmenuText.Size = UDim2.new(0.8, 0, 1, 0)
            SubmenuText.Font = Enum.Font.SourceSans
            SubmenuText.Text = submenu
            SubmenuText.TextColor3 = Color3.fromRGB(255, 255, 255)
            SubmenuText.TextSize = 18

            SubmenuCheckbox.Parent = SubmenuItem
            SubmenuCheckbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            SubmenuCheckbox.Position = UDim2.new(0.8, 0, 0, 0)
            SubmenuCheckbox.Size = UDim2.new(0.2, 0, 1, 0)
            SubmenuCheckbox.Font = Enum.Font.SourceSans
            SubmenuCheckbox.Text = "Off"
            SubmenuCheckbox.TextColor3 = Color3.fromRGB(255, 0, 0)
            SubmenuCheckbox.TextSize = 18

            SubmenuCheckbox.MouseButton1Click:Connect(function()
                if SubmenuCheckbox.Text == "Off" then
                    SubmenuCheckbox.Text = "On"
                    SubmenuCheckbox.TextColor3 = Color3.fromRGB(0, 255, 0)
                else
                    SubmenuCheckbox.Text = "Off"
                    SubmenuCheckbox.TextColor3 = Color3.fromRGB(255, 0, 0)
                end
            end)
        end
    end

    for _, category in ipairs(categories) do
        local CategoryButton = Instance.new("TextButton")
        CategoryButton.Parent = Sidebar
        CategoryButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        CategoryButton.Size = UDim2.new(1, 0, 0, 50)
        CategoryButton.Font = Enum.Font.SourceSans
        CategoryButton.Text = category.name
        CategoryButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        CategoryButton.TextSize = 18

        CategoryButton.MouseButton1Click:Connect(function()
            updateSubmenuList(category)
        end)
    end

    updateSubmenuList(categories[1])
end

createModMenu()
