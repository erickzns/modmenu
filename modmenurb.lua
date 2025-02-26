-- Certifique-se de ter a biblioteca ImGui instalada e configurada
local imgui = require('imgui')

-- Função principal para desenhar o menu
local function drawMenu()
    -- Inicia uma nova janela
    imgui.Begin("Mod Menu")

    -- Botão lateral 1
    if imgui.Button("Botão 1") then
        -- Ação do Botão 1
        print("Botão 1 pressionado")
    end

    -- Botão lateral 2 com submenu
    if imgui.Button("Botão 2") then
        -- Ação do Botão 2
        print("Botão 2 pressionado")
    end

    -- Submenu para o Botão 2
    if imgui.BeginMenu("Submenu do Botão 2") then
        if imgui.MenuItem("Submenu Item 1") then
            -- Ação do Submenu Item 1
            print("Submenu Item 1 pressionado")
        end
        if imgui.MenuItem("Submenu Item 2") then
            -- Ação do Submenu Item 2
            print("Submenu Item 2 pressionado")
        end
        imgui.EndMenu()
    end

    -- Botão lateral 3
    if imgui.Button("Botão 3") then
        -- Ação do Botão 3
        print("Botão 3 pressionado")
    end

    -- Finaliza a janela
    imgui.End()
end

-- Função principal do script
local function main()
    -- Loop principal para desenhar o menu
    while true do
        imgui.NewFrame()
        drawMenu()
        imgui.Render()
    end
end

-- Executa a função principal
main()
