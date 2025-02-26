-- Carregar o script usando loadstring e game:HttpGet
local function loadScript(url)
    local response = game:HttpGet(url)
    local scriptFunction = loadstring(response)
    scriptFunction()
end

-- URL do script que você quer carregar
local scriptUrl = "https://rawscripts.net/raw/SEASON-13!-Car-Dealership-Tycoon-CDT-Dearlship-20154"
loadScript(scriptUrl)

-- Criar o mod menu flutuante
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ToggleButton = Instance.new("TextButton")

-- Configurações do ScreenGui
ScreenGui.Parent = game.CoreGui

-- Configurações do Frame
Frame.Size = UDim2.new(0, 300, 0, 400)
Frame.Position = UDim2.new(0.5, -150, 0.5, -200)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Visible = true
Frame.Parent = ScreenGui

-- Configurações do botão de alternância
ToggleButton.Size = UDim2.new(0, 100, 0, 50)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.Text = "Toggle Menu"
ToggleButton.Parent = ScreenGui

-- Função para alternar a visibilidade do menu
local function toggleMenu()
    Frame.Visible = not Frame.Visible
end

-- Conectar a função ao clique do botão
ToggleButton.MouseButton1Click:Connect(toggleMenu)

-- Função para criar botões
local function createButton(text, position, parent)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 280, 0, 50)
    button.Position = position
    button.Text = text
    button.Parent = parent
    return button
end

-- Botões laterais
local buttons = {"Opção 1", "Opção 2", "Opção 3", "Configurações", "Sair"}
for i, buttonText in ipairs(buttons) do
    local button = createButton(buttonText, UDim2.new(0, 10, 0, 10 + (i - 1) * 60), Frame)
    
    -- Adicionar funcionalidade aos botões
    button.MouseButton1Click:Connect(function()
        if buttonText == "Sair" then
            Frame.Visible = false
        elseif buttonText == "Configurações" then
            -- Exibir submenu de configurações
            print("Abrir Configurações")
        else
            -- Exibir submenu da opção
            print("Abrir " .. buttonText)
        end
    end)
end

-- Submenu de configurações (exemplo)
local configFrame = Instance.new("Frame")
configFrame.Size = UDim2.new(0, 200, 0, 300)
configFrame.Position = UDim2.new(1, 10, 0, 0)
configFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
configFrame.Visible = false
configFrame.Parent = Frame

local closeButton = createButton("Fechar", UDim2.new(0, 10, 0, 250), configFrame)
closeButton.MouseButton1Click:Connect(function()
    configFrame.Visible = false
end)

-- Exemplo de configuração
local configLabel = Instance.new("TextLabel")
configLabel.Size = UDim2.new(0, 180, 0, 50)
configLabel.Position = UDim2.new(0, 10, 0, 10)
configLabel.Text = "Configuração 1"
configLabel.Parent = configFrame

-- Mostrar submenu de configurações ao clicar no botão de configurações
Frame:FindFirstChild("Configurações").MouseButton1Click:Connect(function()
    configFrame.Visible = true
end)