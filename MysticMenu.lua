-- Mystic Menu GUI by DESCONHECIDO 🔮
repeat wait() until game:IsLoaded()
local player = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")

-- Credenciais
local loginUser = "MysticRoblox_loguin"
local loginPass = "3721983612983612387912639816t"

-- GUI principal
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "MysticMenu"
gui.ResetOnSpawn = false

-- Estilo padrão
local function round(obj)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = obj
end

-- Login Frame
local loginFrame = Instance.new("Frame", gui)
loginFrame.Size = UDim2.new(0, 420, 0, 320)
loginFrame.Position = UDim2.new(0.5, -210, 0.5, -160)
loginFrame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
loginFrame.BorderSizePixel = 0
loginFrame.Active = true
loginFrame.Draggable = true
round(loginFrame)

-- Logo
local logo = Instance.new("ImageLabel", loginFrame)
logo.Size = UDim2.new(0, 80, 0, 80)
logo.Position = UDim2.new(0.5, -40, 0, 10)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://100552916774977"

-- Título
local title = Instance.new("TextLabel", loginFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 90)
title.Text = "Mystic Menu"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextScaled = true

-- Campos de login
local nameBox = Instance.new("TextBox", loginFrame)
nameBox.Position = UDim2.new(0.5, -150, 0, 140)
nameBox.Size = UDim2.new(0, 300, 0, 30)
nameBox.PlaceholderText = "Usuário"
nameBox.Text = ""
nameBox.TextColor3 = Color3.new(1, 1, 1)
nameBox.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
nameBox.Font = Enum.Font.Gotham
nameBox.TextScaled = true
round(nameBox)

local passBox = Instance.new("TextBox", loginFrame)
passBox.Position = UDim2.new(0.5, -150, 0, 180)
passBox.Size = UDim2.new(0, 300, 0, 30)
passBox.PlaceholderText = "Senha"
passBox.Text = ""
passBox.TextColor3 = Color3.new(1, 1, 1)
passBox.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
passBox.Font = Enum.Font.Gotham
passBox.TextScaled = true
round(passBox)

local confirmBtn = Instance.new("TextButton", loginFrame)
confirmBtn.Position = UDim2.new(0.5, -75, 0, 230)
confirmBtn.Size = UDim2.new(0, 150, 0, 30)
confirmBtn.Text = "LOGIN"
confirmBtn.TextColor3 = Color3.new(1, 1, 1)
confirmBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
confirmBtn.Font = Enum.Font.GothamBold
confirmBtn.TextScaled = true
round(confirmBtn)

-- Painel principal
local mainPanel = Instance.new("Frame", gui)
mainPanel.Size = UDim2.new(0, 600, 0, 400)
mainPanel.Position = UDim2.new(0.5, -300, 0.5, -200)
mainPanel.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
mainPanel.Visible = false
mainPanel.Active = true
mainPanel.Draggable = true
round(mainPanel)

-- Logo no topo
local menuLogo = Instance.new("ImageLabel", mainPanel)
menuLogo.Size = UDim2.new(0, 60, 0, 60)
menuLogo.Position = UDim2.new(0.5, -30, 0, 10)
menuLogo.BackgroundTransparency = 1
menuLogo.Image = "rbxassetid://100552916774977"

-- Abas
local tabs = {
    {name = "Combat", image = "rbxassetid://77706911523028"},
    {name = "Visuals", image = "rbxassetid://84515563786739"},
    {name = "Veículos", image = "rbxassetid://86821982427670"},
    {name = "Player", image = "rbxassetid://84515563786739"}
}

local tabFrames = {}

for i, tabData in ipairs(tabs) do
    local btn = Instance.new("ImageButton", mainPanel)
    btn.Size = UDim2.new(0, 50, 0, 50)
    btn.Position = UDim2.new(0, 10, 0, 80 + (i - 1) * 60)
    btn.Image = tabData.image
    btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    round(btn)

    local tab = Instance.new("Frame", mainPanel)
    tab.Size = UDim2.new(0, 520, 0, 300)
    tab.Position = UDim2.new(0, 70, 0, 80)
    tab.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    tab.Visible = false
    round(tab)
    tabFrames[tabData.name] = tab

    btn.MouseButton1Click:Connect(function()
        for _, t in pairs(tabFrames) do t.Visible = false end
        tab.Visible = true
    end)

    -- Nome da aba
    local label = Instance.new("TextLabel", tab)
    label.Size = UDim2.new(1, 0, 0, 40)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.Text = tabData.name
    label.TextColor3 = Color3.new(1, 1, 1)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamBold
    label.TextScaled = true
end

-- Login funcional
confirmBtn.MouseButton1Click:Connect(function()
    if nameBox.Text == loginUser and passBox.Text == loginPass then
        loginFrame.Visible = false
        mainPanel.Visible = true
    else
        confirmBtn.Text = "❌ Erro"
        wait(1)
        confirmBtn.Text = "LOGIN"
    end
end)

-- Tecla M para abrir/fechar
local guiVisible = true
uis.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.M then
        guiVisible = not guiVisible
        mainPanel.Visible = guiVisible
    end
end)
