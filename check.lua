-- ===================== SAFE LOAD =====================
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

repeat task.wait() until Player

-- CONFIG --
local GUI_REFRESH_RATE = 5
local DISCORD_REFRESH_RATE = 120
local Team = "Marines" -- "Pirates" | "Marines"

-- Track_item --
local TRACK_ITEMS = {}
local WEBHOOK = "https://discord.com/api/webhooks/1494968337728536577/eQ2m1vUPNVokTzrU_s_cUjAaY0sk-BhEQkohdC4Z5MvrhWnpojUYdvQRR5IGRQrfc2pl"

-- SERVICES
local RS = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")

-- REFERENCES
local CommF = RS:WaitForChild("Remotes"):WaitForChild("CommF_")
local http = request or http_request or (syn and syn.request) or (http and http.request)
local StartTime = os.time()

-- Fruits Displayname --
local w = {
    ["Rocket-Rocket"] = "Rocket Fruits",
    ["Spin-Spin"] = "Spin Fruits",
    ["Blade-Blade"] = "Blade Fruits",
    ["Spring-Spring"] = "Spring Fruits",
    ["Bomb-Bomb"] = "Bomb Fruits",
    ["Smoke-Smoke"] = "Smoke Fruits",
    ["Spike-Spike"] = "Spike Fruits",
    ["Flame-Flame"] = "Flame Fruits",
    ["Ice-Ice"] = "Ice Fruits",
    ["Sand-Sand"] = "Sand Fruits",
    ["Dark-Dark"] = "Dark Fruits",
    ["Eagle-Eagle"] = "Eagle Fruits",
    ["Diamond-Diamond"] = "Diamond Fruits",
    ["Light-Light"] = "Light Fruits",
    ["Rubber-Rubber"] = "Rubber Fruits",
    ["Ghost-Ghost"] = "Ghost Fruits",
    ["Magma-Magma"] = "Magma Fruits",
    ["Quake-Quake"] = "Quake Fruits",
    ["Buddha-Buddha"] = "Buddha Fruits",
    ["Love-Love"] = "Love Fruits",
    ["Creation-Creation"] = "Creation Fruits",
    ["Spider-Spider"] = "Spider Fruits",
    ["Sound-Sound"] = "Sound Fruits",
    ["Phoenix-Phoenix"] = "Phoenix Fruits",
    ["Portal-Portal"] = "Portal Fruits",
    ["Lightning-Lightning"] = "Lightning Fruits",
    ["Pain-Pain"] = "Pain Fruits",
    ["Blizzard-Blizzard"] = "Blizzard Fruits",
    ["Gravity-Gravity"] = "Gravity Fruits",
    ["Mammoth-Mammoth"] = "Mammoth Fruits",
    ["T-Rex-T-Rex"] = "T-Rex Fruits",
    ["Dough-Dough"] = "Dough Fruits",
    ["Shadow-Shadow"] = "Shadow Fruits",
    ["Venom-Venom"] = "Venom Fruits",
    ["Gas-Gas"] = "Gas Fruits",
    ["Spirit-Spirit"] = "Spirit Fruits",
    ["Tiger-Tiger"] = "Tiger Fruits",
    ["Yeti-Yeti"] = "Yeti Fruits",
    ["Kitsune-Kitsune"] = "Kitsune Fruits",
    ["Control-Control"] = "Control Fruits",
    ["Dragon-Dragon"] = "Dragon Fruits"
}

local function GetFruitDisplayName(raw)
    return w[raw] or raw
end

-- ===================== SYSTEM ENGINE FUNCTIONS =====================

local function GetinfoRaceV4()
    local stats = Player:FindFirstChild("Data")
    local backpack = Player:FindFirstChild("Backpack")
    if not stats or not backpack then return "V1" end
    
    local baseRace = stats:FindFirstChild("Race") and stats.Race.Value or "Unknown"
    
    if backpack:FindFirstChild("Awakening") then 
        local tierStr = ""
        local raceFolder = stats:FindFirstChild("Race")
        if raceFolder and raceFolder:FindFirstChild("C") then
            tierStr = " Tier " .. tostring(raceFolder.C.Value)
        end
        return baseRace .. " (V4" .. tierStr .. ")"
    end
    
    local raceSkills = {
        ["Angel"]  = "Heavenly Blood",
        ["Rabbit"] = "Agility",
        ["Shark"]  = "Water Body",
        ["Human"]  = "Last Resort",
        ["Ghoul"]  = "Heightened Senses",
        ["Cyborg"] = "Energy Core",
        ["Draco"]  = "Primordial Reign"
    }
    local requiredSkill = raceSkills[baseRace]
    if requiredSkill and backpack:FindFirstChild(requiredSkill) then
        return baseRace .. " (V3)"
    end
    
    local raceFolder = stats:FindFirstChild("Race")
    if raceFolder and raceFolder:FindFirstChild("Evolved") and raceFolder.Evolved.Value then
        return baseRace .. " (V2)"
    end
    
    return baseRace .. " (V1)"
end

local function GetPlayerInfo()
    local stats = Player:WaitForChild("Data")
    return {
        Username   = Player.Name,
        UserId     = Player.UserId,
        Level      = stats.Level.Value,
        Beli       = stats.Beli.Value,
        Fragments  = stats.Fragments.Value,
        Race       = GetinfoRaceV4(),
        DevilFruit = GetFruitDisplayName(stats.DevilFruit.Value),
        JobId      = game.JobId,
        WantedBeli = Player.leaderstats["Bounty/Honor"].Value,
        PlaceId    = game.PlaceId
    }
end

local function AutoBuso()
    local char = Player.Character
    if char and not char:FindFirstChild("HasBuso") then
        CommF:InvokeServer("Buso")
    end
end

local function ChooseTeam(selectedTeam)
    if Player.Team ~= nil then return end

    local RS = game:GetService("ReplicatedStorage")
    local Remotes = RS:WaitForChild("Remotes", 5)
    if not Remotes then return end
    
    local CommF = Remotes:WaitForChild("CommF_", 5)
    if not CommF then return end
    
    repeat
        pcall(function()
            CommF:InvokeServer("SetTeam", selectedTeam)
        end)
        task.wait(0.5)
    until Player.Team ~= nil

    pcall(function()
        local mainGui = Player:WaitForChild("PlayerGui"):FindFirstChild("Main")
        if mainGui and mainGui:FindFirstChild("ChooseTeam") then
            mainGui.ChooseTeam.Visible = false
        end
    end)
end

local function GetWantedBeli()
    local team = Player.Team
    if not team then return 0 end
    local ls = Player:FindFirstChild("leaderstats")
    local stat = ls and ls:FindFirstChild("Bounty/Honor")
    if not stat then return 0 end
    return stat.Value
end

-- ===================== INVENTORY =====================
local ItemConfig = require(RS:WaitForChild("ItemConfig"))

-- Hàm quét InventoryData qua Garbage Collector Upvalues
local function GetInventoryDataModule()
    if getgc then
        for _, fn in ipairs(getgc(true)) do
            if type(fn) == "function" and islclosure(fn) and not isexecutorclosure(fn) then
                local success, upvalues = pcall(debug.getupvalues, fn)
                if success and type(upvalues) == "table" then
                    for _, upv in pairs(upvalues) do
                        if type(upv) == "table" and rawget(upv, "KEYS") and rawget(upv, "GetItems") then
                            return upv
                        end
                    end
                end
            elseif type(fn) == "table" and rawget(fn, "KEYS") and rawget(fn, "GetItems") then
                return fn
            end
        end
    end
    return nil
end

local function ScanInventory()
    local data = {
        Fruits = {},
        Swords = {},
        Guns = {},
        Accessories = {},
        Materials = {},
        Melee = {},
        Race = {},
        Misc = {}
    }

    local InventoryData = GetInventoryDataModule()
    if not InventoryData then return data end

    local KEYS = InventoryData.KEYS
    local items = InventoryData:GetItems(KEYS.QUANTITY) or {}

    for _, itemData in ipairs(items) do
        if itemData.Value and itemData.Value > 0 then
            local success, itemTemplate = pcall(function()
                return ItemConfig.match(itemData.ItemId):unwrap()
            end)

            if success and itemTemplate and itemTemplate.Display then
                local category = itemTemplate.Display.Category or ""
                if category ~= "Title" then
                    local storageKey = itemTemplate.Index and itemTemplate.Index.StorageKey
                    local displayName
                    
                    if category == "Blox Fruit" then
                        local rawName = storageKey or itemTemplate.Display.Name or itemData.ItemId
                        displayName = GetFruitDisplayName(rawName)
                    else
                        displayName = itemTemplate.Display.Name or storageKey or ("ItemId_" .. tostring(itemData.ItemId))
                    end

                    local mastery = InventoryData:ReadItem(KEYS.MASTERY, itemData.ItemId, itemData.NetworkedUID) or 0
                    local t = string.lower(category)

                    -- Phân loại dữ liệu đúng chuẩn
                    if t == "fruits" or t == "blox fruit" then
                        table.insert(data.Fruits, displayName)
                    elseif t == "sword" or t == "swords" then
                        table.insert(data.Swords, displayName .. (mastery > 0 and (" [Mas: " .. mastery .. "]") or ""))
                    elseif t == "gun" or t == "guns" then
                        table.insert(data.Guns, displayName .. (mastery > 0 and (" [Mas: " .. mastery .. "]") or ""))
                    elseif t == "material" or t == "materials" then
                        table.insert(data.Materials, displayName .. " x" .. itemData.Value)
                    elseif t == "accessory" or t == "wearable" or t == "wear" then
                        table.insert(data.Accessories, displayName)
                    elseif t == "melee" or t == "fighting style" or t == "style" then
                        table.insert(data.Melee, displayName .. (mastery > 0 and (" [Mas: " .. mastery .. "]") or ""))
                    elseif t == "race" or t == "races" then
                        table.insert(data.Race, displayName)
                    else
                        table.insert(data.Misc, displayName .. " x" .. itemData.Value)
                    end
                end
            end
        end
    end

    return data
end

local function FormatNumber(n)
    n = tonumber(n) or 0
    local s
    if n >= 1e9 then s = string.format("%.2fB", n / 1e9)
    elseif n >= 1e6 then s = string.format("%.2fM", n / 1e6)
    elseif n >= 1e3 then s = string.format("%.2fK", n / 1e3)
    else return tostring(n) end
    return s:gsub("%.00", "")
end

local Statusmoon = {
    ["http://www.roblox.com/asset/?id=9709149431"] = "100%",
    ["http://www.roblox.com/asset/?id=9709149052"] = "75%",
    ["http://www.roblox.com/asset/?id=9709143733"] = "50%",
    ["http://www.roblox.com/asset/?id=9709150401"] = "25%",
    ["http://www.roblox.com/asset/?id=9709149680"] = "15%"
}

local function GetStatusMoon()
    local sky = Lighting:FindFirstChild("Sky")
    if not sky then return "0%" end
    return Statusmoon[sky.MoonTextureId] or "0%"
end

local function Normalize(str) return string.lower((str or ""):gsub("%s+", "")) end

local function BuildTracking(trackingList, inventory)
    local owned = {}
    local function index(list)
        if list then
            for _, v in ipairs(list) do owned[Normalize(v)] = true end 
        end
    end
    index(inventory.Accessories) index(inventory.Swords) index(inventory.Guns) index(inventory.Fruits) index(inventory.Melee)

    local result = {}
    for _, name in ipairs(trackingList) do
        table.insert(result, { Name = name, Status = owned[Normalize(name)] and "Done" or "Working" })
    end
    return result
end

local function GetUpTime()
    local diff = os.time() - StartTime
    local hours = math.floor(diff / 3600)
    local minutes = math.floor((diff % 3600) / 60)
    local seconds = diff % 60
    return string.format("%02d Hours %02d Mins %02d Secs", hours, minutes, seconds)
end

-- ===================== DISCORD WEBHOOK MOTOR (FIXED LUAU) =====================
local function addSection(desc, title, list)
    if list and #list > 0 then
        desc = desc .. "**" .. title .. " (" .. tostring(#list) .. ")**\n```\n"
        for _, v in ipairs(list) do 
            desc = desc .. v .. "\n" 
        end
        desc = desc .. "```\n\n"
    end
    return desc
end

local function SendDiscord(player, inv, tracking)
    if not http then return end
    
    local desc = ""
    desc = desc .. "**PLAYER INFO**\n```\n"
    desc = desc .. "Username : " .. player.Username .. "\n"
    desc = desc .. "UserId : " .. player.UserId .. "\n"
    desc = desc .. "Level : " .. player.Level .. "\n"
    desc = desc .. "Beli : " .. FormatNumber(player.Beli) .. "\n"
    desc = desc .. "Fragment : " .. FormatNumber(player.Fragments) .. "\n"
    desc = desc .. "Race : " .. player.Race .. "\n"
    desc = desc .. "Devil : " .. player.DevilFruit .. "\n"
    desc = desc .. "Moon : " .. GetStatusMoon() .. "\n"
    local team = Player.Team and Player.Team.Name
    desc = desc .. ((team == "Pirates") and "Bounty" or "Honor") .. " : " .. FormatNumber(GetWantedBeli()) .. "\n"
    desc = desc .. "```\n\n"
    
    -- Thêm các phần mới (MELEE, RACE, MISC) theo chuẩn addSection phong cách cũ
    desc = addSection(desc, "FRUITS", inv.Fruits)
    desc = addSection(desc, "MELEE", inv.Melee)
    desc = addSection(desc, "SWORDS", inv.Swords)
    desc = addSection(desc, "GUNS", inv.Guns)
    desc = addSection(desc, "ACCESSORIES", inv.Accessories)
    desc = addSection(desc, "RACE", inv.Race)
    desc = addSection(desc, "MATERIALS", inv.Materials)
    desc = addSection(desc, "MISC", inv.Misc)
    
    if tracking and #tracking > 0 then
        desc = desc .. "**PROGRESS TRACKING**\n```\n"
        for _, t in ipairs(tracking) do 
            desc = desc .. t.Name .. " : " .. t.Status .. "\n" 
        end
        desc = desc .. "```\n"
    end

    pcall(function()
        http({
            Url = WEBHOOK,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = HttpService:JSONEncode({
                username = "Window XP True V2",
                embeds = {{
                    title = "JobId: " .. player.JobId .. "\n" .. "PlaceId: " .. player.PlaceId,
                    description = desc,
                    color = math.random(0, 16777215),
                    footer = { text = "HoangLamx • " .. os.date("%H:%M %d/%m/%y") }
                }}
            })
        })
    end)
end

-- ===================== MODERN AUTOMATIC GUI BLUEPRINT =====================
local PlayerGui = Player:WaitForChild("PlayerGui")
if PlayerGui:FindFirstChild("TrueV2_NewHub") then PlayerGui.TrueV2_NewHub:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TrueV2_NewHub"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

local BlurBackground = Instance.new("Frame")
BlurBackground.Size = UDim2.new(1, 0, 1, 0)
BlurBackground.BackgroundColor3 = Color3.fromRGB(5, 10, 15)
BlurBackground.BackgroundTransparency = 0.45
BlurBackground.ZIndex = 1
BlurBackground.Parent = ScreenGui

local ClientBlur = Lighting:FindFirstChild("TrueV2_BlurEffect")
if not ClientBlur then
    ClientBlur = Instance.new("BlurEffect")
    ClientBlur.Name = "TrueV2_BlurEffect"
    ClientBlur.Size = 24
    ClientBlur.Parent = Lighting
end

local function SetBlurState(active)
    ClientBlur.Enabled = active
    BlurBackground.Visible = active
end

local MiniIcon = Instance.new("TextButton")
MiniIcon.Size = UDim2.new(0, 35, 0, 35)
MiniIcon.Position = UDim2.new(0, 15, 0, 70)
MiniIcon.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
MiniIcon.Text = "XP"
MiniIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
MiniIcon.Font = Enum.Font.GothamBold
MiniIcon.TextSize = 13
MiniIcon.Visible = false
MiniIcon.ZIndex = 999
MiniIcon.Parent = ScreenGui
Instance.new("UICorner", MiniIcon).CornerRadius = UDim.new(1, 0)

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 420, 0, 480)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -240)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 23, 30)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ZIndex = 2
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

-- HEADER UI ELEMENTS
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 260, 0, 25)
Title.Position = UDim2.new(0, 15, 0, 12)
Title.BackgroundTransparency = 1
Title.Text = "HoangLamx"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextColor3 = Color3.fromRGB(240, 240, 240)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 3
Title.Parent = MainFrame

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(0, 260, 0, 15)
Subtitle.Position = UDim2.new(0, 15, 0, 32)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "CONCHOHAI"
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextSize = 11
Subtitle.TextColor3 = Color3.fromRGB(0, 180, 160)
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.ZIndex = 3
Subtitle.Parent = MainFrame

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 28, 0, 28)
MinimizeBtn.Position = UDim2.new(1, -75, 0, 15)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(30, 40, 45)
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(0, 200, 180)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 16
MinimizeBtn.ZIndex = 3
MinimizeBtn.Parent = MainFrame
Instance.new("UICorner", MinimizeBtn).CornerRadius = UDim.new(0, 6)

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -40, 0, 15)
CloseBtn.BackgroundColor3 = Color3.fromRGB(45, 30, 35)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 12
CloseBtn.ZIndex = 3
CloseBtn.Parent = MainFrame
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

MinimizeBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    SetBlurState(false)
    MiniIcon.Visible = true
end)

MiniIcon.MouseButton1Click:Connect(function()
    MiniIcon.Visible = false
    MainFrame.Visible = true
    SetBlurState(true)
end)

CloseBtn.MouseButton1Click:Connect(function()
    SetBlurState(false)
    if ClientBlur then ClientBlur:Destroy() end
    ScreenGui:Destroy()
end)

-- SCROLLING ENGINE CONTAINER
local ContentScroll = Instance.new("ScrollingFrame")
ContentScroll.Size = UDim2.new(1, -20, 1, -80)
ContentScroll.Position = UDim2.new(0, 10, 0, 65)
ContentScroll.BackgroundTransparency = 1
ContentScroll.BorderSizePixel = 0
ContentScroll.ScrollBarThickness = 2
ContentScroll.ScrollBarImageColor3 = Color3.fromRGB(30, 45, 55)
ContentScroll.ZIndex = 3
ContentScroll.Parent = MainFrame

local MainLayout = Instance.new("UIListLayout")
MainLayout.SortOrder = Enum.SortOrder.LayoutOrder
MainLayout.Padding = UDim.new(0, 15)
MainLayout.Parent = ContentScroll

MainLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ContentScroll.CanvasSize = UDim2.new(0, 0, 0, MainLayout.AbsoluteContentSize.Y + 20)
end)

local function createSectionHeader(titleText, order)
    local header = Instance.new("TextLabel")
    header.Size = UDim2.new(1, 0, 0, 20)
    header.BackgroundTransparency = 1
    header.Text = titleText
    header.Font = Enum.Font.GothamBold
    header.TextSize = 11
    header.TextColor3 = Color3.fromRGB(0, 180, 160)
    header.TextXAlignment = Enum.TextXAlignment.Left
    header.LayoutOrder = order
    header.ZIndex = 3
    header.Parent = ContentScroll
    return header
end

-- SECTION 1: LIVE OVERVIEW
createSectionHeader("LIVE OVERVIEW", 1)

local GridOverview = Instance.new("Frame")
GridOverview.Size = UDim2.new(1, 0, 0, 130) -- Tăng kích thước chiều cao của khung để chứa thêm Track Item
GridOverview.BackgroundTransparency = 1
GridOverview.LayoutOrder = 2
GridOverview.ZIndex = 3
GridOverview.Parent = ContentScroll

local GridLayout = Instance.new("UIGridLayout")
GridLayout.CellSize = UDim2.new(0.31, 0, 0, 38)
GridLayout.CellPadding = UDim2.new(0.02, 0, 0, 8)
GridLayout.SortOrder = Enum.SortOrder.LayoutOrder
GridLayout.Parent = GridOverview

local function createLiveBox(labelName, order)
    local box = Instance.new("Frame")
    box.BackgroundTransparency = 1
    box.LayoutOrder = order
    box.ZIndex = 3
    box.Parent = GridOverview

    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1, 0, 0, 12)
    t.BackgroundTransparency = 1
    t.Text = string.upper(labelName)
    t.Font = Enum.Font.GothamBold
    t.TextSize = 9
    t.TextColor3 = Color3.fromRGB(110, 125, 135)
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.ZIndex = 4
    t.Parent = box

    local v = Instance.new("TextLabel")
    v.Size = UDim2.new(1, 0, 1, -12)
    v.Position = UDim2.new(0, 0, 0, 12)
    v.BackgroundTransparency = 1
    v.Text = "Loading..."
    v.Font = Enum.Font.GothamBold
    v.TextSize = 13
    v.TextColor3 = Color3.fromRGB(255, 255, 255)
    v.TextXAlignment = Enum.TextXAlignment.Left
    v.ZIndex = 4
    v.Parent = box
    return v
end

local GuiBeli      = createLiveBox("Beli", 1)
local GuiFragments = createLiveBox("Fragments", 2)
local GuiBounty    = createLiveBox("Bounty / Honor", 3)
local GuiLevel     = createLiveBox("Level", 4)
local GuiRace      = createLiveBox("Race Status", 5)
local GuiMoon      = createLiveBox("Moon Texture", 6)
local GuiTrackItem = createLiveBox("Track Item", 7) -- Hiển thị phụ kiện cần theo dõi tại đây

local div1 = Instance.new("Frame")
div1.Size = UDim2.new(1, 0, 0, 1)
div1.BackgroundColor3 = Color3.fromRGB(30, 42, 50)
div1.BorderSizePixel = 0
div1.LayoutOrder = 3
div1.ZIndex = 3
div1.Parent = ContentScroll

-- SECTION 2: AUTOMATION MATRIX
createSectionHeader("AUTOMATION MATRIX", 4)

local GridMatrix = Instance.new("Frame")
GridMatrix.Size = UDim2.new(1, 0, 0, 45)
GridMatrix.BackgroundTransparency = 1
GridMatrix.LayoutOrder = 5
GridMatrix.ZIndex = 3
GridMatrix.Parent = ContentScroll

local MatrixLayout = Instance.new("UIGridLayout")
MatrixLayout.CellSize = UDim2.new(0.48, 0, 0, 20)
MatrixLayout.CellPadding = UDim2.new(0.02, 0, 0, 5)
MatrixLayout.SortOrder = Enum.SortOrder.LayoutOrder
MatrixLayout.Parent = GridMatrix

local function createMatrixDot(dotName, order)
    local dot = Instance.new("TextLabel")
    dot.BackgroundTransparency = 1
    dot.Text = "○  " .. dotName .. " [WAIT]"
    dot.Font = Enum.Font.GothamBold
    dot.TextSize = 12
    dot.TextColor3 = Color3.fromRGB(120, 130, 140)
    dot.TextXAlignment = Enum.TextXAlignment.Left
    dot.LayoutOrder = order
    dot.ZIndex = 4
    dot.Parent = GridMatrix
    return dot
end

local MatrixBuso = createMatrixDot("AUTO BUSO", 1)
local MatrixTeam = createMatrixDot("TEAM: CHECKING", 2) -- Đã sửa đổi hiển thị theo Team
local MatrixAFK  = createMatrixDot("ANTI-AFK ACTIVE", 3)

local div2 = Instance.new("Frame")
div2.Size = UDim2.new(1, 0, 0, 1)
div2.BackgroundColor3 = Color3.fromRGB(30, 42, 50)
div2.BorderSizePixel = 0
div2.LayoutOrder = 6
div2.ZIndex = 3
div2.Parent = ContentScroll

-- SECTION 3: SESSION TELEMETRY
createSectionHeader("SESSION TELEMETRY", 7)

local function createTelemetryLine(order)
    local line = Instance.new("TextLabel")
    line.Size = UDim2.new(1, 0, 0, 20)
    line.BackgroundTransparency = 1
    line.Font = Enum.Font.Code
    line.TextSize = 13
    line.TextColor3 = Color3.fromRGB(200, 210, 220)
    line.TextXAlignment = Enum.TextXAlignment.Left
    line.LayoutOrder = order
    line.ZIndex = 4
    line.Parent = ContentScroll
    return line
end

local TelemetryUpTime = createTelemetryLine(8)
local TelemetryFruit  = createTelemetryLine(9)

local Footer = Instance.new("TextLabel")
Footer.Size = UDim2.new(1, 0, 0, 20)
Footer.BackgroundTransparency = 1
Footer.Text = "True V2 UI System Engine • Stable Run"
Footer.Font = Enum.Font.Gotham
Footer.TextSize = 10
Footer.TextColor3 = Color3.fromRGB(60, 75, 85)
Footer.TextXAlignment = Enum.TextXAlignment.Center
Footer.LayoutOrder = 10
Footer.ZIndex = 3
Footer.Parent = ContentScroll

SetBlurState(true)

-- ===================== REAL-TIME DATA THREAD sincronization =====================

local function DynamicSynchronizeUI()
    local ok, p = pcall(GetPlayerInfo)
    if not ok then return end
    
    local m = GetStatusMoon()
    local inv = ScanInventory()
    local trackData = BuildTracking(TRACK_ITEMS, inv)
    
    -- Cập nhật dữ liệu Live Overview
    GuiBeli.Text      = "$" .. FormatNumber(p.Beli)
    GuiFragments.Text = FormatNumber(p.Fragments)
    GuiBounty.Text    = FormatNumber(GetWantedBeli())
    GuiLevel.Text     = tostring(p.Level) .. (p.Level >= 2800 and " (MAX)" or "")
    GuiRace.Text      = p.Race
    GuiMoon.Text      = m
    
    -- Đọc trạng thái Track Item đưa vào Live Preview
    if #trackData > 0 then
        local trackString = ""
        for i, t in ipairs(trackData) do
            trackString = trackString .. t.Name .. " (" .. t.Status .. ")"
            if i < #trackData then trackString = trackString .. ", " end
        end
        GuiTrackItem.Text = trackString
    else
        GuiTrackItem.Text = "None"
    end
    
    -- Cập nhật trạng thái tự động cày
    local char = Player.Character
    if char then
        if char:FindFirstChild("HasBuso") then
            MatrixBuso.Text = "●  AUTO BUSO [ON]"
            MatrixBuso.TextColor3 = Color3.fromRGB(0, 220, 150)
        else
            MatrixBuso.Text = "○  AUTO BUSO [OFF]"
            MatrixBuso.TextColor3 = Color3.fromRGB(120, 130, 140)
        end
    end
    
    -- Hiển thị Team hiện tại thay thế cho câu cũ
    if Player.Team ~= nil then
        MatrixTeam.Text = "●  TEAM: " .. string.upper(Player.Team.Name)
        MatrixTeam.TextColor3 = Color3.fromRGB(0, 220, 150)
    else
        MatrixTeam.Text = "○  TEAM: JOINING..."
        MatrixTeam.TextColor3 = Color3.fromRGB(240, 150, 40)
    end
    
    MatrixAFK.Text = "●  ANTI-AFK ACTIVE [ON]"
    MatrixAFK.TextColor3 = Color3.fromRGB(0, 220, 150)
    
    -- Cập nhật Telemetry
    TelemetryUpTime.Text = "UP TIME: " .. GetUpTime()
    TelemetryFruit.Text  = "CURRENT DEVIL FRUIT: " .. p.DevilFruit
end

-- ===================== LOOPS & SYSTEM CYCLES =====================
local lastGUI = 0
local lastDiscord = 0

RunService.Heartbeat:Connect(function()
    local now = os.time()
    TelemetryUpTime.Text = "UP TIME: " .. GetUpTime()

    if now - lastGUI >= GUI_REFRESH_RATE then
        lastGUI = now
        pcall(DynamicSynchronizeUI)
    end

    if now - lastDiscord >= DISCORD_REFRESH_RATE then
        if Player.Team ~= nil then
            lastDiscord = now
            task.spawn(function()
                local inv = ScanInventory()
                local player = GetPlayerInfo()
                SendDiscord(player, inv, BuildTracking(TRACK_ITEMS, inv))
            end)
        end
    end
end)

-- ===================== CHARACTER FLOW =====================
local function OnCharacterAdded(char)
    task.spawn(function()
        repeat task.wait(0.5) until Player.Team ~= nil
        task.wait(1)
        AutoBuso()
    end)
end

task.spawn(function()
    ChooseTeam(Team)
end)

if Player.Character then
    OnCharacterAdded(Player.Character)
end
Player.CharacterAdded:Connect(OnCharacterAdded)

-- ANTI AFK CORES
pcall(function()
    for _, v in pairs(getconnections(Player.Idled)) do
        v:Disable()
    end
end)
Player.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)