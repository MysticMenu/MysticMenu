-- Mystic Menu GUI by DESCONHECIDO 🔮
local player = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")

-- Credenciais
local loginUser = "MysticRoblox_loguin"
local loginPass = "3721983612983612387912639816t"

-- GUI principal
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "MysticMenu"
gui.ResetOnSpawn = false

-- Login Frame
local loginFrame = Instance.new("Frame", gui)
loginFrame.Size = UDim2.new(0, 420, 0, 320)
loginFrame.Position = UDim2.new(0.5, -210, 0.5, -160)
loginFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
loginFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
loginFrame.BorderSizePixel = 2
loginFrame.Active = true
loginFrame.Draggable = true

-- Logo do mago
local logo = Instance.new("ImageLabel", loginFrame)
logo.Size = UDim2.new(0, 80, 0, 80)
logo.Position = UDim2.new(0.5, -40, 0, 10)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://COLOCA_ID_DO_MAGO_AQUI"

-- Título
local title = Instance.new("TextLabel", loginFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 90)
title.Text = "Mystic Menu"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextScaled = true

-- Campo de login
local nameLabel = Instance.new("TextLabel", loginFrame)
nameLabel.Position = UDim2.new(0.5, -100, 0, 140)
nameLabel.Size = UDim2.new(0, 200, 0, 30)
nameLabel.Text = "Seu login"
nameLabel.TextColor3 = Color3.new(1, 1, 1)
nameLabel.BackgroundTransparency = 1
nameLabel.Font = Enum.Font.Gotham
nameLabel.TextScaled = true

local nameBox = Instance.new("TextBox", loginFrame)
nameBox.Position = UDim2.new(0.5, -150, 0, 180)
nameBox.Size = UDim2.new(0, 300, 0, 30)
nameBox.PlaceholderText = "MysticRoblox_loguin"
nameBox.Text = ""
nameBox.TextColor3 = Color3.new(1, 1, 1)
nameBox.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
nameBox.Font = Enum.Font.Gotham
nameBox.TextScaled = true

local passBox = Instance.new("TextBox", loginFrame)
passBox.Position = UDim2.new(0.5, -150, 0, 220)
passBox.Size = UDim2.new(0, 300, 0, 30)
passBox.PlaceholderText = "Senha"
passBox.Text = ""
passBox.TextColor3 = Color3.new(1, 1, 1)
passBox.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
passBox.Font = Enum.Font.Gotham
passBox.TextScaled = true

local confirmBtn = Instance.new("TextButton", loginFrame)
confirmBtn.Position = UDim2.new(0.5, -75, 0, 260)
confirmBtn.Size = UDim2.new(0, 150, 0, 30)
confirmBtn.Text = "Entrar"
confirmBtn.TextColor3 = Color3.new(1, 1, 1)
confirmBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
confirmBtn.Font = Enum.Font.GothamBold
confirmBtn.TextScaled = true

local version = Instance.new("TextLabel", loginFrame)
version.Position = UDim2.new(0, 10, 1, -20)
version.Size = UDim2.new(0, 200, 0, 20)
version.Text = "Versão: roblox"
version.TextColor3 = Color3.new(1, 1, 1)
version.BackgroundTransparency = 1
version.Font = Enum.Font.Gotham
version.TextScaled = true

-- Painel principal
local mainPanel = Instance.new("Frame", gui)
mainPanel.Size = UDim2.new(0, 500, 0, 400)
mainPanel.Position = UDim2.new(0.5, -250, 0.5, -200)
mainPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainPanel.BorderColor3 = Color3.fromRGB(255, 0, 0)
mainPanel.BorderSizePixel = 2
mainPanel.Visible = false
mainPanel.Active = true
mainPanel.Draggable = true

-- Abas
local tabs = {"Combat", "Visuals", "Veículos"}
local tabFrames = {}

for i, name in ipairs(tabs) do
    local btn = Instance.new("TextButton", mainPanel)
    btn.Size = UDim2.new(0, 120, 0, 30)
    btn.Position = UDim2.new(0, 10 + (i - 1) * 130, 0, 10)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true

    local tab = Instance.new("Frame", mainPanel)
    tab.Size = UDim2.new(0, 480, 0, 340)
    tab.Position = UDim2.new(0, 10, 0, 50)
    tab.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
    tab.Visible = false
    tabFrames[name] = tab

    btn.MouseButton1Click:Connect(function()
        for _, t in pairs(tabFrames) do t.Visible = false end
        tab.Visible = true
    end)
end

-- Login funcional
confirmBtn.MouseButton1Click:Connect(function()
    if nameBox.Text == loginUser and passBox.Text == loginPass then
        loginFrame.Visible = false
        mainPanel.Visible = true
    else
        confirmBtn.Text = "❌ Erro"
        wait(1)
        confirmBtn.Text = "Entrar"
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
