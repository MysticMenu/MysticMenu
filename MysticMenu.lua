repeat wait() until game:IsLoaded()
local player = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")

local loginUser = "MysticRoblox_loguin"
local loginPass = "3721983612983612387912639816t"

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "MysticMenu"
gui.ResetOnSpawn = false

local function round(obj)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = obj
end

local loginFrame = Instance.new("Frame", gui)
loginFrame.Size = UDim2.new(0, 420, 0, 320)
loginFrame.Position = UDim2.new(0.5, -210, 0.5, -160)
loginFrame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
loginFrame.BorderSizePixel = 0
loginFrame.Active = true
loginFrame.Draggable = true
round(loginFrame)

local title = Instance.new("TextLabel", loginFrame)
title.Size = UDim2.new(1, 0, 0, 60)
title.Position = UDim2.new(0, 0, 0, 20)
title.Text = "Mystic"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextScaled = true

local nameBox = Instance.new("TextBox", loginFrame)
nameBox.Position = UDim2.new(0.5, -150, 0, 100)
nameBox.Size = UDim2.new(0, 300, 0, 30)
nameBox.PlaceholderText = "Usuário"
nameBox.Text = ""
nameBox.TextColor3 = Color3.new(1, 1, 1)
nameBox.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
nameBox.Font = Enum.Font.Gotham
nameBox.TextScaled = true
round(nameBox)

local passBox = Instance.new("TextBox", loginFrame)
passBox.Position = UDim2.new(0.5, -150, 0, 140)
passBox.Size = UDim2.new(0, 300, 0, 30)
passBox.PlaceholderText = "Senha"
passBox.Text = ""
passBox.TextColor3 = Color3.new(1, 1, 1)
passBox.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
passBox.Font = Enum.Font.Gotham
passBox.TextScaled = true
round(passBox)

local confirmBtn = Instance.new("TextButton", loginFrame)
confirmBtn.Position = UDim2.new(0.5, -75, 0, 190)
confirmBtn.Size = UDim2.new(0, 150, 0, 30)
confirmBtn.Text = "LOGIN"
confirmBtn.TextColor3 = Color3.new(1, 1, 1)
confirmBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
confirmBtn.Font = Enum.Font.GothamBold
confirmBtn.TextScaled = true
round(confirmBtn)

local mainPanel = Instance.new("Frame", gui)
mainPanel.Size = UDim2.new(0, 600, 0, 400)
mainPanel.Position = UDim2.new(0.5, -300, 0.5, -200)
mainPanel.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
mainPanel.Visible = false
mainPanel.Active = true
mainPanel.Draggable = true
round(mainPanel)

local menuTitle = Instance.new("TextLabel", mainPanel)
menuTitle.Size = UDim2.new(1, 0, 0, 40)
menuTitle.Position = UDim2.new(0, 0, 0, 10)
menuTitle.Text = "Mystic"
menuTitle.TextColor3 = Color3.new(1, 1, 1)
menuTitle.BackgroundTransparency = 1
menuTitle.Font = Enum.Font.GothamBold
menuTitle.TextScaled = true

local tabs = {
    {name = "Combat", emoji = "🎯"},
    {name = "Visuals", emoji = "👁️"},
    {name = "Veículos", emoji = "🚗"},
    {name = "Player", emoji = "🧍"}
}

local tabFrames = {}

for i, tabData in ipairs(tabs) do
    local btn = Instance.new("TextButton", mainPanel)
    btn.Size = UDim2.new(0, 50, 0, 50)
    btn.Position = UDim2.new(0, 10, 0, 60 + (i - 1) * 60)
    btn.Text = tabData.emoji
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
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

    local label = Instance.new("TextLabel", tab)
    label.Size = UDim2.new(1, 0, 0, 40)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.Text = tabData.name
    label.TextColor3 = Color3.new(1, 1, 1)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamBold
    label.TextScaled = true
end

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

uis.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.M then
        mainPanel.Visible = not mainPanel.Visible
    end
end)

-- Funções internas por aba
local function createButton(tab, name, yPos, callback)
    local btn = Instance.new("TextButton", tab)
    btn.Size = UDim2.new(0, 200, 0, 30)
    btn.Position = UDim2.new(0, 20, 0, yPos)
    btn.Text = name
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
    round(btn)
    btn.MouseButton1Click:Connect(callback)
end

-- Combat
createButton(tabFrames["Combat"], "Mira Chiclete", 60, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Averiias/Universal-SilentAim/main/main.lua"))()
end)

createButton(tabFrames["Combat"], "Hitbox Extender", 100, function()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            p.Character.HumanoidRootPart.Size = Vector3.new(10,10,10)
            p.Character.HumanoidRootPart.Transparency = 0.5
        end
    end
end)

createButton(tabFrames["Combat"], "Triggerbot", 140, function()
    print("Triggerbot ativado") -- placeholder
end)

-- Visuals
createButton(tabFrames["Visuals"], "ESP", 60, function()
    print("ESP ativado") -- placeholder
end)

createButton(tabFrames["Visuals"], "Caixa 3D", 100, function()
    print("Caixa 3D ativada") -- placeholder
end)

-- Veículos
createButton(tabFrames["Veículos"], "Boost", 60, function()
    print("Boost ativado") -- placeholder
end)

createButton(tabFrames["Veículos"], "Controle Aéreo", 100, function()
    print("Controle aéreo ativado") -- placeholder
end)

-- Player
createButton(tabFrames["Player"], "Velocidade", 60, function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

createButton(tabFrames["Player"], "Fly", 100, function()
    print("Fly ativado") -- placeholder
end)
