-- Exemplo de como criar uma interface com Lua (usando CefLua para GTA V/FiveM)
local categories = {
    {name = "Geral", icon = "menu", submenus = {"Dinheiro Infinito", "XP Boost", "Auto Collect"}},
    {name = "Veículos", icon = "car", submenus = {"Velocidade Máxima", "No Collision", "Nitro Infinito"}},
    {name = "Concessionária", icon = "users", submenus = {"Construção Instantânea", "Upgrade Grátis", "Auto Sell"}},
    {name = "Eventos", icon = "zap", submenus = {"Pular Corridas", "Auto Win", "Spawn Veículos Especiais"}}
}

-- Variáveis para armazenar as opções de submenus
local checkedOptions = {}

-- Função para alternar o estado do checkbox
function toggleCheckbox(submenu)
    if checkedOptions[submenu] then
        checkedOptions[submenu] = false
    else
        checkedOptions[submenu] = true
    end
end

-- Exemplo de função para desenhar o menu usando CefLua
function drawMenu()
    -- Criando a interface do menu em Lua, em HTML via CefLua
    local htmlContent = "<div style='background-color: black; color: white; padding: 20px;'>"
    
    -- Sidebar com as categorias
    htmlContent = htmlContent .. "<div style='float: left; width: 100px;'>"
    for _, category in ipairs(categories) do
        htmlContent = htmlContent .. string.format("<button style='width: 80px;'>%s</button><br>", category.icon)
    end
    htmlContent = htmlContent .. "</div>"

    -- Conteúdo da categoria selecionada
    htmlContent = htmlContent .. "<div style='margin-left: 120px;'>"
    local selectedCategory = categories[1] -- Categoria selecionada
    htmlContent = htmlContent .. string.format("<h2>%s</h2>", selectedCategory.name)
    for _, submenu in ipairs(selectedCategory.submenus) do
        local checked = checkedOptions[submenu] and "checked" or ""
        htmlContent = htmlContent .. string.format("<div><label><input type='checkbox' %s onchange='toggleCheckbox(\"%s\")'> %s</label></div>", checked, submenu, submenu)
    end
    htmlContent = htmlContent .. "</div>"

    htmlContent = htmlContent .. "</div>"
    
    -- Renderizando o HTML no navegador ou painel de CefLua
    -- Exemplo fictício, o CefLua é configurado para renderizar HTML.
    -- O código real depende do seu ambiente e do framework de GUI utilizado.
    CefRender(htmlContent)
end

-- Chamar a função para desenhar o menu
drawMenu()
