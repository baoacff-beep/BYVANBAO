-- NVB HUB - Fixed Container Lag & Script Execution
local CoreGui = game:GetService("CoreGui")
if CoreGui:FindFirstChild("NVB_RedzHub_Template") then
    CoreGui.NVB_RedzHub_Template:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NVB_RedzHub_Template"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Nut tron NVB ngoai man hinh
local MiniButton = Instance.new("TextButton", ScreenGui)
MiniButton.Name = "MiniButton"
MiniButton.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
MiniButton.Position = UDim2.new(0.03, 0, 0.75, 0)
MiniButton.Size = UDim2.new(0, 48, 0, 48)
MiniButton.Font = Enum.Font.GothamBold
MiniButton.Text = "NVB"
MiniButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MiniButton.TextSize = 14
MiniButton.Visible = false
MiniButton.Active = true
MiniButton.Draggable = true

local MiniCorner = Instance.new("UICorner", MiniButton)
MiniCorner.CornerRadius = UDim.new(1, 0)
local MiniStroke = Instance.new("UIStroke", MiniButton)
MiniStroke.Color = Color3.fromRGB(50, 50, 60)
MiniStroke.Thickness = 1.5

-- Man hinh Loading
local LoadFrame = Instance.new("Frame", ScreenGui)
LoadFrame.Name = "LoadFrame"
LoadFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
LoadFrame.Position = UDim2.new(0.5, -140, 0.5, -45)
LoadFrame.Size = UDim2.new(0, 280, 0, 95)
LoadFrame.Active = true
LoadFrame.Draggable = true

local LoadCorner = Instance.new("UICorner", LoadFrame)
LoadCorner.CornerRadius = UDim.new(0, 8)
local LoadStroke = Instance.new("UIStroke", LoadFrame)
LoadStroke.Color = Color3.fromRGB(45, 45, 55)
LoadStroke.Thickness = 1.5

local TitleLabel = Instance.new("TextLabel", LoadFrame)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 0, 0.15, 0)
TitleLabel.Size = UDim2.new(1, 0, 0, 25)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "NVB HUB • FIXED"
TitleLabel.TextColor3 = Color3.fromRGB(220, 220, 225)
TitleLabel.TextSize = 13

local PercentLabel = Instance.new("TextLabel", LoadFrame)
PercentLabel.BackgroundTransparency = 1
PercentLabel.Position = UDim2.new(0, 0, 0.45, 0)
PercentLabel.Size = UDim2.new(1, 0, 0, 30)
PercentLabel.Font = Enum.Font.GothamBold
PercentLabel.Text = "0%"
PercentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PercentLabel.TextSize = 18

-- Main Menu
local MainMenu = Instance.new("Frame", ScreenGui)
MainMenu.Name = "MainMenu"
MainMenu.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
MainMenu.Position = UDim2.new(0.5, -325, 0.5, -190)
MainMenu.Size = UDim2.new(0, 650, 0, 380)
MainMenu.Visible = false
MainMenu.Active = true
MainMenu.Draggable = true

local MenuCorner = Instance.new("UICorner", MainMenu)
MenuCorner.CornerRadius = UDim.new(0, 8)
local MenuStroke = Instance.new("UIStroke", MainMenu)
MenuStroke.Color = Color3.fromRGB(45, 45, 55)
MenuStroke.Thickness = 1.5

-- Top Bar
local TopBar = Instance.new("Frame", MainMenu)
TopBar.BackgroundTransparency = 1
TopBar.Size = UDim2.new(1, 0, 0, 32)

local LogoText = Instance.new("TextLabel", TopBar)
LogoText.BackgroundTransparency = 1
LogoText.Position = UDim2.new(0.03, 0, 0, 0)
LogoText.Size = UDim2.new(0.4, 0, 1, 0)
LogoText.Font = Enum.Font.GothamBold
LogoText.Text = "NVB"
LogoText.TextColor3 = Color3.fromRGB(200, 200, 210)
LogoText.TextSize = 13
LogoText.TextXAlignment = Enum.TextXAlignment.Left

local MinimizeBtn = Instance.new("TextButton", TopBar)
MinimizeBtn.BackgroundTransparency = 1
MinimizeBtn.Position = UDim2.new(0.94, 0, 0, 0)
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
MinimizeBtn.TextSize = 16

-- Sidebar ben trai
local Sidebar = Instance.new("ScrollingFrame", MainMenu)
Sidebar.BackgroundTransparency = 1
Sidebar.Position = UDim2.new(0.015, 0, 0.1, 0)
Sidebar.Size = UDim2.new(0, 160, 0.88, 0)
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 200)
Sidebar.ScrollBarThickness = 0

local SidebarLayout = Instance.new("UIListLayout", Sidebar)
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 5)

-- Content Frame ben phai
local ContentFrame = Instance.new("Frame", MainMenu)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0.26, 0, 0.1, 0)
ContentFrame.Size = UDim2.new(0.72, 0, 0.88, 0)

-- Ham tao Container
local function createContainer(titleText, canvasHeight)
    local cont = Instance.new("ScrollingFrame", ContentFrame)
    cont.BackgroundTransparency = 1
    cont.Size = UDim2.new(1, 0, 1, 0)
    cont.CanvasSize = UDim2.new(0, 0, 0, canvasHeight)
    cont.ScrollBarThickness = 2
    cont.Visible = false
    
    local layout = Instance.new("UIListLayout", cont)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 6)
    
    local header = Instance.new("TextLabel", cont)
    header.BackgroundTransparency = 1
    header.Size = UDim2.new(1, 0, 0, 28)
    header.Font = Enum.Font.GothamBold
    header.Text = titleText
    header.TextColor3 = Color3.fromRGB(220, 220, 230)
    header.TextSize = 13
    header.TextXAlignment = Enum.TextXAlignment.Left
    
    return cont
end

local HubsContainer = createContainer("Farm", 410)
HubsContainer.Visible = true
local FixLagContainer = createContainer("Fix Lag", 120)

-- Ham tao hang script da fix loi xung dot luong xu ly (Thread safety)
local function CreateScriptRow(parentContainer, name, desc, callback)
    local row = Instance.new("Frame", parentContainer)
    row.BackgroundColor3 = Color3.fromRGB(24, 24, 30)
    row.Size = UDim2.new(1, 0, 0, 42)
    
    local rowCorner = Instance.new("UICorner", row)
    rowCorner.CornerRadius = UDim.new(0, 6)
    
    local label = Instance.new("TextLabel", row)
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0.04, 0, 0.1, 0)
    label.Size = UDim2.new(0.7, 0, 0.4, 0)
    label.Font = Enum.Font.GothamBold
    label.Text = name
    label.TextColor3 = Color3.fromRGB(230, 230, 235)
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local subLabel = Instance.new("TextLabel", row)
    subLabel.BackgroundTransparency = 1
    subLabel.Position = UDim2.new(0.04, 0, 0.5, 0)
    subLabel.Size = UDim2.new(0.7, 0, 0.4, 0)
    subLabel.Font = Enum.Font.Gotham
    subLabel.Text = desc
    subLabel.TextColor3 = Color3.fromRGB(130, 130, 140)
    subLabel.TextSize = 10
    subLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local launchBtn = Instance.new("TextButton", row)
    launchBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    launchBtn.Position = UDim2.new(0.78, 0, 0.22, 0)
    launchBtn.Size = UDim2.new(0, 70, 0, 24)
    launchBtn.Font = Enum.Font.GothamBold
    launchBtn.Text = "Launch"
    launchBtn.TextColor3 = Color3.fromRGB(200, 200, 210)
    launchBtn.TextSize = 11
    
    local btnCorner = Instance.new("UICorner", launchBtn)
    btnCorner.CornerRadius = UDim.new(0, 4)
    local btnStroke = Instance.new("UIStroke", launchBtn)
    btnStroke.Color = Color3.fromRGB(50, 50, 65)
    btnStroke.Thickness = 1
    
    launchBtn.MouseButton1Click:Connect(function()
        if launchBtn.Text == "Active" then return end
        launchBtn.Text = "Loading..."
        
        -- Tach han tien trinh tai script ra khoi luong chinh de tranh dung hinh man hinh
        task.defer(function()
            local success, err = pcall(callback)
            if success then
                launchBtn.Text = "Active"
                launchBtn.BackgroundColor3 = Color3.fromRGB(35, 100, 50)
                launchBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            else
                launchBtn.Text = "Error"
                launchBtn.BackgroundColor3 = Color3.fromRGB(100, 35, 35)
                warn("NVB Hub Error: " .. tostring(err))
            end
        end)
    end)
end

-- Danh sach script
CreateScriptRow(HubsContainer, "longhihi", "Devs LongHiHi V4.5.1 Script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/longhihilonghihi-hub/Devs-LongHiHiV4.5.1/refs/heads/main/Main.TxT.Luau"))()
end)

CreateScriptRow(HubsContainer, "Rezd", "Redz Hub Official Source No-Key", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/bloxfruitsnokey/Redz-Hub/refs/heads/main/Redz/script.luau"))()
end)

CreateScriptRow(HubsContainer, "Banana Hub", "New Banana Hub Update By Obbi", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/napun87/Blox-Fruits-/refs/heads/main/bananabyobbi.lua"))()
end)

CreateScriptRow(HubsContainer, "QuantumOnyx", "Updated Quantum Script Version", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua"))()
end)

CreateScriptRow(HubsContainer, "Gravity Hub", "Fast Attack • Fruit Sniper", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-GravityHub/BloxFruit/refs/heads/main/Main.lua"))()
end)

CreateScriptRow(HubsContainer, "real kid", "cần key", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/realkidhub/realkid/refs/heads/main/main.lua"))()
end)

CreateScriptRow(FixLagContainer, "fix lag all", "VanBao Fix Lag Tool / Optimize FPS", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/baoacff-beep/VANBAOFIXLAG/refs/heads/main/FIXLAG.lua"))()
end)

-- Sidebar Tabs
local tabs = {}
local function CreateTab(name, isSelected, targetContainer)
    local tabBtn = Instance.new("TextButton", Sidebar)
    tabBtn.BackgroundColor3 = isSelected and Color3.fromRGB(26, 26, 33) or Color3.fromRGB(18, 18, 22)
    tabBtn.Size = UDim2.new(1, 0, 0, 32)
    tabBtn.Font = Enum.Font.GothamMedium
    tabBtn.Text = "    " .. name
    tabBtn.TextColor3 = isSelected and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(130, 130, 140)
    tabBtn.TextSize = 12
    tabBtn.TextXAlignment = Enum.TextXAlignment.Left
    
    local tCorner = Instance.new("UICorner", tabBtn)
    tCorner.CornerRadius = UDim.new(0, 6)
    
    local indicator = Instance.new("Frame", tabBtn)
    indicator.BackgroundColor3 = Color3.fromRGB(80, 140, 255)
    indicator.Position = UDim2.new(0, 2, 0.25, 0)
    indicator.Size = UDim2.new(0, 3, 0, 16)
    indicator.Visible = isSelected
    local iCorner = Instance.new("UICorner", indicator)
    iCorner.CornerRadius = UDim.new(1, 0)
    
    tabBtn.MouseButton1Click:Connect(function()
        for _, t in pairs(tabs) do
            t.Btn.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
            t.Btn.TextColor3 = Color3.fromRGB(130, 130, 140)
            t.Ind.Visible = false
            t.Container.Visible = false
        end
        tabBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 33)
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        indicator.Visible = true
        targetContainer.Visible = true
    end)
    
    table.insert(tabs, {Btn = tabBtn, Ind = indicator, Container = targetContainer})
end

CreateTab("Farm", true, HubsContainer)
CreateTab("Fix Lag", false, FixLagContainer)
CreateTab("Config", false, Instance.new("ScrollingFrame"))

-- Xu ly an hien menu
MinimizeBtn.MouseButton1Click:Connect(function()
    MainMenu.Visible = false
    MiniButton.Visible = true
end)

MiniButton.MouseButton1Click:Connect(function()
    MiniButton.Visible = false
    MainMenu.Visible = true
end)

-- Hieu ung Loading
task.spawn(function()
    for i = 1, 100 do
        PercentLabel.Text = i .. "%"
        task.wait(0.008)
    end
    LoadFrame.Visible = false
    MainMenu.Visible = true
end)
