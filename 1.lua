-- ==========================================
-- DEBUG MODE - ĐỘC LẬP HOÀN TOÀN
-- KHÔNG PHỤ THUỘC BIẾN NGOÀI
-- ==========================================

-- ==========================================
-- 1. KHỞI TẠO CÁC BIẾN CƠ BẢN
-- ==========================================

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local plr = Players.LocalPlayer

-- Chờ LocalPlayer
if not plr then
    Players.PlayerAdded:Wait()
    plr = Players.LocalPlayer
end

-- ==========================================
-- 2. ĐỊNH NGHĨA HÀM TÍNH KHOẢNG CÁCH
-- ==========================================

local function GetDistance(pos1, pos2)
    if not pos1 then return 0 end
    if not pos2 then
        local char = plr and plr.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            pos2 = char.HumanoidRootPart.Position
        else
            return 0
        end
    end
    
    local p1 = typeof(pos1) == "CFrame" and pos1.Position or pos1
    local p2 = typeof(pos2) == "CFrame" and pos2.Position or pos2
    
    return (p1 - p2).Magnitude
end

-- ==========================================
-- 3. TWEEN CONTROLLER (ĐỘC LẬP)
-- ==========================================

local MyTween = {
    CurrentTween = nil,
    IsMoving = false,
}

function MyTween:MoveTo(position, speed)
    if not position then return end
    if not plr or not plr.Character then return end
    
    local rootPart = plr.Character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    -- Hủy tween cũ
    if self.CurrentTween then
        pcall(function() self.CurrentTween:Cancel() end)
        self.CurrentTween = nil
    end
    
    local targetCF = typeof(position) == "Vector3" and CFrame.new(position) or position
    
    -- Tính thời gian di chuyển
    local dist = GetDistance(rootPart.Position, targetCF.Position)
    local duration = math.max(0.5, dist / 100)
    
    -- Tạo tween mới
    self.CurrentTween = TweenService:Create(
        rootPart,
        TweenInfo.new(duration, Enum.EasingStyle.Linear),
        { CFrame = targetCF }
    )
    
    self.IsMoving = true
    
    self.CurrentTween:Play()
    self.CurrentTween.Completed:Connect(function()
        self.IsMoving = false
        self.CurrentTween = nil
    end)
    
    return self.CurrentTween
end

function MyTween:Stop()
    if self.CurrentTween then
        pcall(function() self.CurrentTween:Cancel() end)
        self.CurrentTween = nil
        self.IsMoving = false
    end
end

-- ==========================================
-- 4. CẤU HÌNH DEBUG
-- ==========================================

local Config = {
    Enabled = true,
    FruitCount = 5,
    SpawnRadius = 5000,
    AutoRespawn = true,
    RespawnTime = 3,
    ShowLog = true,
    FruitNames = {
        "Flame Fruit", "Ice Fruit", "Light Fruit",
        "Dark Fruit", "Dragon Fruit", "Venom Fruit",
        "Kitsune Fruit", "Dough Fruit", "Leopard Fruit"
    }
}

-- ==========================================
-- 5. TẠO TRÁI CÂY GIẢ
-- ==========================================

local FakeFruits = {}

local function GetRandomPosition()
    if not plr or not plr.Character then
        return Vector3.new(
            math.random(-50, 50),
            10,
            math.random(-50, 50)
        )
    end
    
    local root = plr.Character:FindFirstChild("HumanoidRootPart")
    if not root then
        return Vector3.new(
            math.random(-50, 50),
            10,
            math.random(-50, 50)
        )
    end
    
    local angle = math.random() * 2 * math.pi
    local radius = math.random(10, Config.SpawnRadius)
    
    return Vector3.new(
        root.Position.X + math.cos(angle) * radius,
        root.Position.Y + math.random(5, 20),
        root.Position.Z + math.sin(angle) * radius
    )
end

local function CreateFakeFruit(name, position)
    if not position then
        position = GetRandomPosition()
    end
    
    local fruit = Instance.new("Model")
    fruit.Name = name or Config.FruitNames[math.random(#Config.FruitNames)]
    fruit:SetAttribute("IsFake", true)
    
    -- Handle
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(2, 2, 2)
    handle.Shape = Enum.PartType.Ball
    handle.Position = position
    handle.Anchored = true
    handle.CanCollide = false
    handle.Transparency = 0.1
    handle.Material = Enum.Material.Neon
    
    local color = Color3.fromHSV(math.random(), 0.8, 0.9)
    handle.Color = color
    handle.BrickColor = BrickColor.new(color)
    
    -- Light
    local light = Instance.new("PointLight")
    light.Parent = handle
    light.Color = color
    light.Range = 15
    light.Brightness = 2
    
    -- Particles
    local particles = Instance.new("ParticleEmitter")
    particles.Parent = handle
    particles.Texture = "rbxasset://textures/particles/particle_square_glow.png"
    particles.Rate = 20
    particles.Lifetime = NumberRange.new(1, 2)
    particles.SpreadAngle = Vector2.new(360, 360)
    particles.Speed = NumberRange.new(1, 3)
    particles.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.8),
        NumberSequenceKeypoint.new(1, 1)
    })
    particles.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(1, 0.1)
    })
    particles.Color = ColorSequence.new(color)
    
    local attachment = Instance.new("Attachment")
    attachment.Parent = handle
    
    -- Billboard
    local billboard = Instance.new("BillboardGui")
    billboard.Parent = handle
    billboard.Size = UDim2.new(0, 200, 0, 30)
    billboard.Adornee = handle
    billboard.AlwaysOnTop = true
    
    local label = Instance.new("TextLabel")
    label.Parent = billboard
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "🔴 FAKE: " .. fruit.Name
    label.TextColor3 = Color3.fromRGB(255, 100, 100)
    label.TextSize = 14
    label.Font = Enum.Font.Bold
    
    handle.Parent = fruit
    fruit.Parent = Workspace
    
    if Config.ShowLog then
        print("🍎 Created:", fruit.Name)
    end
    
    table.insert(FakeFruits, fruit)
    return fruit
end

local function SpawnFakeFruits(count)
    count = count or Config.FruitCount
    
    for i = 1, count do
        local name = Config.FruitNames[math.random(#Config.FruitNames)]
        CreateFakeFruit(name .. " #" .. i)
        task.wait(0.1)
    end
    
    if Config.ShowLog then
        print("✅ Spawned", count, "fake fruits")
    end
end

local function ClearFakeFruits()
    local count = 0
    for i = #FakeFruits, 1, -1 do
        local fruit = FakeFruits[i]
        if fruit and fruit.Parent then
            fruit:Destroy()
            count = count + 1
        end
        table.remove(FakeFruits, i)
    end
    
    -- Xóa các fruit còn sót
    for _, item in ipairs(Workspace:GetChildren()) do
        if item:IsA("Model") and item:GetAttribute("IsFake") then
            item:Destroy()
            count = count + 1
        end
    end
    
    if Config.ShowLog then
        print("🗑️ Removed", count, "fake fruits")
    end
    
    return count
end

-- ==========================================
-- 6. TEST FUNCTIONS
-- ==========================================

local function GetNearestFruit()
    if not plr or not plr.Character then return nil end
    
    local root = plr.Character:FindFirstChild("HumanoidRootPart")
    if not root then return nil end
    
    local nearest = nil
    local minDist = math.huge
    
    for _, fruit in ipairs(FakeFruits) do
        if fruit and fruit.Parent and fruit:FindFirstChild("Handle") then
            local dist = GetDistance(root.Position, fruit.Handle.Position)
            if dist < minDist then
                minDist = dist
                nearest = fruit
            end
        end
    end
    
    return nearest
end

local function TestTween()
    local fruit = GetNearestFruit()
    if not fruit then
        print("❌ No fake fruit found!")
        return
    end
    
    local pos = fruit.Handle.Position
    print("🚀 Flying to:", fruit.Name, "at", pos)
    
    MyTween:MoveTo(pos + Vector3.new(0, 5, 0))
end

local function TestESP()
    print("🎯 Testing ESP...")
    ClearFakeFruits()
    SpawnFakeFruits(3)
    print("✅ ESP Test - Check screen for labels")
end

-- ==========================================
-- 7. DEBUG MODE MAIN LOOP
-- ==========================================

local DebugRunning = false

local function StartDebug()
    if DebugRunning then
        print("⚠️ Debug already running!")
        return
    end
    
    DebugRunning = true
    Config.Enabled = true
    
    print("═══════════════════════════════════════")
    print("  🐞 DEBUG MODE STARTED 🐞")
    print("═══════════════════════════════════════")
    
    ClearFakeFruits()
    SpawnFakeFruits(Config.FruitCount)
    
    task.wait(1)
    TestTween()
    
    -- Auto respawn
    if Config.AutoRespawn then
        spawn(function()
            while DebugRunning do
                task.wait(Config.RespawnTime)
                
                -- Đếm fruit còn lại
                local remaining = 0
                for _, fruit in ipairs(FakeFruits) do
                    if fruit and fruit.Parent then
                        remaining = remaining + 1
                    end
                end
                
                if remaining < 1 then
                    if Config.ShowLog then
                        print("🔄 Respawning fruits...")
                    end
                    ClearFakeFruits()
                    SpawnFakeFruits(Config.FruitCount)
                    task.wait(1)
                    TestTween()
                end
            end
        end)
    end
    
    print("═══════════════════════════════════════")
    print("  📋 Commands:")
    print("    - _G.StartDebug()")
    print("    - _G.StopDebug()")
    print("    - _G.SpawnFruits(10)")
    print("    - _G.ClearFruits()")
    print("    - _G.TestTween()")
    print("    - _G.TestESP()")
    print("═══════════════════════════════════════")
end

local function StopDebug()
    DebugRunning = false
    Config.Enabled = false
    ClearFakeFruits()
    MyTween:Stop()
    print("🐞 Debug stopped")
end

-- ==========================================
-- 8. GLOBAL COMMANDS
-- ==========================================

_G.StartDebug = StartDebug
_G.StopDebug = StopDebug
_G.SpawnFruits = SpawnFakeFruits
_G.ClearFruits = ClearFakeFruits
_G.TestTween = TestTween
_G.TestESP = TestESP
_G.GetNearestFruit = GetNearestFruit

-- ==========================================
-- 9. AUTO START (Tùy chọn)
-- ==========================================

-- Bỏ comment dòng dưới để tự động chạy
-- task.wait(1)
-- StartDebug()

-- ==========================================
-- 10. UI HIỂN THỊ (Tùy chọn)
-- ==========================================

-- Tạo ScreenGui để hiển thị trạng thái
local function CreateDebugUI()
    local gui = Instance.new("ScreenGui")
    gui.Name = "DebugUI"
    gui.Parent = plr:WaitForChild("PlayerGui")
    gui.Enabled = true
    
    local frame = Instance.new("Frame")
    frame.Parent = gui
    frame.Size = UDim2.new(0, 200, 0, 80)
    frame.Position = UDim2.new(0, 10, 0, 10)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = 0.5
    frame.BorderSizePixel = 0
    
    local corner = Instance.new("UICorner")
    corner.Parent = frame
    corner.CornerRadius = UDim.new(0, 8)
    
    local title = Instance.new("TextLabel")
    title.Parent = frame
    title.Size = UDim2.new(1, 0, 0, 25)
    title.Position = UDim2.new(0, 0, 0, 5)
    title.BackgroundTransparency = 1
    title.Text = "🐞 DEBUG MODE"
    title.TextColor3 = Color3.fromRGB(255, 200, 0)
    title.TextSize = 16
    title.Font = Enum.Font.Bold
    
    local status = Instance.new("TextLabel")
    status.Name = "Status"
    status.Parent = frame
    status.Size = UDim2.new(1, 0, 0, 25)
    status.Position = UDim2.new(0, 0, 0, 35)
    status.BackgroundTransparency = 1
    status.Text = "Status: Stopped"
    status.TextColor3 = Color3.fromRGB(255, 255, 255)
    status.TextSize = 12
    status.Font = Enum.Font.Regular
    
    local fruitCount = Instance.new("TextLabel")
    fruitCount.Name = "FruitCount"
    fruitCount.Parent = frame
    fruitCount.Size = UDim2.new(1, 0, 0, 25)
    fruitCount.Position = UDim2.new(0, 0, 0, 55)
    fruitCount.BackgroundTransparency = 1
    fruitCount.Text = "Fruits: 0"
    fruitCount.TextColor3 = Color3.fromRGB(255, 255, 255)
    fruitCount.TextSize = 12
    fruitCount.Font = Enum.Font.Regular
    
    -- Update UI
    spawn(function()
        while gui and gui.Parent do
            task.wait(0.5)
            local statusLabel = frame:FindFirstChild("Status")
            if statusLabel then
                statusLabel.Text = DebugRunning and "✅ Running" or "⏹️ Stopped"
                statusLabel.TextColor3 = DebugRunning and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 100, 100)
            end
            
            local countLabel = frame:FindFirstChild("FruitCount")
            if countLabel then
                local count = 0
                for _, fruit in ipairs(FakeFruits) do
                    if fruit and fruit.Parent then
                        count = count + 1
                    end
                end
                countLabel.Text = "🍎 Fruits: " .. count
            end
        end
    end)
    
    return gui
end

-- Tạo UI
task.wait(1)
pcall(CreateDebugUI)

print("═══════════════════════════════════════")
print("  ✅ DEBUG MODE LOADED!")
print("  📋 Type _G.StartDebug() to begin")
print("═══════════════════════════════════════")
