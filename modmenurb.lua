-- Mod Menu Flutuante - Roblox
-- By [SeuNome] - Aprendizado

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- GUI Elements
local screenGui = script.Parent
local mainFrame = screenGui:WaitForChild("MainFrame")

-- Visibilidade
mainFrame.Visible = false

-- Botões
local noClipBtn = mainFrame:WaitForChild("NoClipBtn")
local flyBtn = mainFrame:WaitForChild("FlyBtn")
local speedBtn = mainFrame:WaitForChild("SpeedBtn")
local infJumpBtn = mainFrame:WaitForChild("InfiniteJumpBtn")
local closeBtn = mainFrame:WaitForChild("CloseBtn")

-- Estados
local noClipEnabled = false
local flyEnabled = false
local speedEnabled = false
local infJumpEnabled = false
local speedValue = 16

-- Função: Toggle Menu
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F3 then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

-- Botão: Fechar
closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- NoClip
noClipBtn.MouseButton1Click:Connect(function()
    noClipEnabled = not noClipEnabled
    noClipBtn.Text = "NoClip: " .. (noClipEnabled and "ON" or "OFF")
    
    if noClipEnabled then
        RunService.Stepped:Connect(function()
            if noClipEnabled and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character:FindFirstChild("Humanoid").PlatformStand = true
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character:FindFirstChild("Humanoid").PlatformStand = false
        end
    end
end)

-- Fly (exemplo simples com BodyVelocity)
flyBtn.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    flyBtn.Text = "Fly: " .. (flyEnabled and "ON" or "OFF")
    
    if flyEnabled then
        spawn(function()
            while flyEnabled do
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local root = player.Character.HumanoidRootPart
                    local bv = Instance.new("BodyVelocity")
                    bv.MaxForce = Vector3.new(4000, 4000, 4000)
                    bv.Velocity = root.CFrame.LookVector * 50
                    bv.Parent = root
                    
                    wait(0.1)
                    bv:Destroy()
                end
                wait()
            end
        end)
    else
        -- Parar o voo
    end
end)

-- Speed
speedBtn.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    speedBtn.Text = "Speed: " .. (speedEnabled and "ON" or "OFF")
    
    if speedEnabled then
        spawn(function()
            while speedEnabled do
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.WalkSpeed = speedValue
                end
                wait(0.1)
            end
        end)
    else
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = 16
        end
    end
end)

-- Infinite Jump
infJumpBtn.MouseButton1Click:Connect(function()
    infJumpEnabled = not infJumpEnabled
    infJumpBtn.Text = "InfJump: " .. (infJumpEnabled and "ON" or "OFF")
    
    if infJumpEnabled then
        UserInputService.JumpRequest:Connect(function()
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character:FindFirstChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
end)

-- Inicializar texto dos botões
noClipBtn.Text = "NoClip: OFF"
flyBtn.Text = "Fly: OFF"
speedBtn.Text = "Speed: OFF"
infJumpBtn.Text = "InfJump: OFF"
closeBtn.Text = "Fechar [X]"
