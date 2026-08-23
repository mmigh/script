-- ==========================================
-- DEBUG MODE - TEST TWEEN & ESP
-- TẠO TRÁI CÂY GIẢ ĐỂ TEST NHANH
-- FIX: attempt to call a nil value
-- ==========================================

-- Kiểm tra và khởi tạo các biến cần thiết
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local plr = Players.LocalPlayer
if not plr then
    warn("⚠️ LocalPlayer chưa sẵn sàng, đang chờ...")
    Players.PlayerAdded:Wait()
    plr = Players.LocalPlayer
end

-- ==========================================
-- KIỂM TRA VÀ KHỞI TẠO TWEENCONTROLLER
-- ==========================================

-- Kiểm tra xem TweenController đã tồn tại chưa
if not TweenController then
    TweenController = {}
end

-- Kiểm tra và khởi tạo các hàm cần thiết
if not TweenController.Create then
    function TweenController.Create(Position)
        if not Position then return end
        
        local char = plr.Character
        if not char then return end
        
        local rootPart = char:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end
        
        local targetCFrame = typeof(Position) == "Vector3" and CFrame.new(Position) or Position
        
        -- Tạo tween
        local tweenInfo = TweenInfo.new(
            1,
            Enum.EasingStyle.Linear,
            Enum.EasingDirection.Out
        )
        
        local tween = TweenService:Create(
            rootPart,
            tweenInfo,
            { CFrame = targetCFrame }
        )
        tween:Play()
        
        return tween
    end
end

-- Kiểm tra và khởi tạo hàm CaculateDistance
if not CaculateDistance then
    function CaculateDistance(Origin, Destination)
        if not Origin then return 0 end
        
        if not Destination then
            Destination = Origin
            local char = plr.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                Origin = char.HumanoidRootPart.Position
            else
                return 0
            end
        end
        
        local pos1 = typeof(Origin) == "CFrame" and Origin.Position or Origin
        local pos2 = typeof(Destination) == "CFrame" and Destination.Position or Destination
        
        return (pos1 - pos2).Magnitude
    end
end

-- ==========================================
-- CẤU HÌNH DEBUG MODE
-- ==========================================

local DebugMode = {
    Enabled = true,
    SpawnRadius = 5000,
    FruitCount = 1,
    AutoSpawn = true,
    SpawnInterval = 3,
    ShowDebugLogs = true,
    FruitNames = {
        "Flame Fruit",
        "Ice Fruit", 
        "Light Fruit",
        "Dark Fruit",
        "Dragon Fruit",
        "Venom Fruit",
        "Kitsune Fruit",
        "Dough Fruit",
        "Leopard Fruit",
        "Shadow Fruit",
    }
}

-- ==========================================
-- HÀM TẠO TRÁI CÂY GIẢ (FIX LỖI)
-- ==========================================

local function getRandomPosition()
    local char = plr.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then 
        return Vector3.new(math.random(-50, 50), 10, math.random(-50, 50))
    end
    
    local rootPos = char.HumanoidRootPart.Position
    local angle = math.random() * 2 * math.pi
    local radius = math.random(10, DebugMode.SpawnRadius)
    
    return Vector3.new(
        rootPos.X + math.cos(angle) * radius,
        rootPos.Y + math.random(5, 20),
        rootPos.Z + math.sin(angle) * radius
    )
end

-- Tạo 1 trái cây giả
local function createFakeFruit(name, position)
    if not position then
        position = getRandomPosition()
    end
    
    -- Tạo model
    local fruit = Instance.new("Model")
    fruit.Name = name or DebugMode.FruitNames[math.random(#DebugMode.FruitNames)]
    
    -- Tạo Handle
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(2, 2, 2)
    handle.Shape = Enum.PartType.Ball
    handle.Position = position
    handle.Anchored = true
    handle.CanCollide = false
    handle.Transparency = 0.1
    handle.Material = Enum.Material.Neon
    
    -- Màu ngẫu nhiên
    local color = Color3.fromHSV(math.random(), 0.8, 0.9)
    handle.Color = color
    handle.BrickColor = BrickColor.new(color)
    
    -- PointLight
    local glow = Instance.new("PointLight")
    glow.Parent = handle
    glow.Color = color
    glow.Range = 15
    glow.Brightness = 2
    
    -- ParticleEmitter
    local particles = Instance.new("ParticleEmitter")
    particles.Parent = handle
    particles.Texture = "rbxasset://textures/particles/particle_square_glow.png"
    particles.Rate = 20
    particles.Lifetime = NumberRange.new(1, 2)
    particles.SpreadAngle = Vector2.new(360, 360)
    particles.VelocityInheritance = 0
    particles.Speed = NumberRange.new(1, 3)
    particles.Rotation = NumberRange.new(0, 360)
    particles.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.8),
        NumberSequenceKeypoint.new(1, 1)
    })
    particles.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(1, 0.1)
    })
    particles.Color = ColorSequence.new(color)
    
    -- Attachment cho particles
    local attachment = Instance.new("Attachment")
    attachment.Parent = handle
    
    -- BodyGyro xoay
    local gyro = Instance.new("BodyGyro")
    gyro.Parent = handle
    gyro.MaxTorque = Vector3.new(4000, 4000, 4000)
    gyro.CFrame = CFrame.new(position) * CFrame.Angles(0, math.rad(45), 0)
    
    handle.Parent = fruit
    
    -- BillboardGui (debug)
    local billboard = Instance.new("BillboardGui")
    billboard.Parent = handle
    billboard.Size = UDim2.new(0, 200, 0, 30)
    billboard.Adornee = handle
    billboard.AlwaysOnTop = true
    
    local label = Instance.new("TextLabel")
    label.Parent = billboard
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "FAKE: " .. fruit.Name
    label.TextColor3 = Color3.fromRGB(255, 0, 0)
    label.TextSize = 14
    label.Font = Enum.Font.Bold
    label.TextStrokeTransparency = 0.3
    
    fruit:SetAttribute("SpawnPosition", position)
    fruit:SetAttribute("IsFake", true)
    
    fruit.Parent = Workspace
    
    if DebugMode.ShowDebugLogs then
        print("🍎 Đã tạo trái cây giả:", fruit.Name)
    end
    
    return fruit
end

-- Tạo nhiều trái cây giả
local function spawnFakeFruits(count)
    local fruits = {}
    count = count or DebugMode.FruitCount
    
    for i = 1, count do
        local name = DebugMode.FruitNames[math.random(#DebugMode.FruitNames)]
        local fruit = createFakeFruit(name .. " " .. i)
        table.insert(fruits, fruit)
        task.wait(0.1)
    end
    
    if DebugMode.ShowDebugLogs then
        print("✅ Đã tạo", count, "trái cây giả")
    end
    
    return fruits
end

-- Xóa trái cây giả
local function clearFakeFruits()
    local count = 0
    for _, item in ipairs(Workspace:GetChildren()) do
        if item:IsA("Model") and item:GetAttribute("IsFake") then
            item:Destroy()
            count = count + 1
        end
    end
    
    if DebugMode.ShowDebugLogs then
        print("🗑️ Đã xóa", count, "trái cây giả")
    end
    
    return count
end

-- ==========================================
-- TEST TWEEN CONTROLLER
-- ==========================================

local function testTweenToFruit(fruit)
    if not fruit or not fruit:FindFirstChild("Handle") then
        print("❌ Không tìm thấy trái cây để test")
        return
    end
    
    local position = fruit.Handle.Position
    print("🚀 Đang bay đến trái cây:", fruit.Name)
    
    if TweenController and TweenController.Create then
        TweenController.Create(position + Vector3.new(0, 5, 0))
    else
        print("⚠️ TweenController.Create không tồn tại, sử dụng TweenService trực tiếp...")
        local char = plr.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local rootPart = char.HumanoidRootPart
            local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear)
            local tween = TweenService:Create(
                rootPart,
                tweenInfo,
                { CFrame = CFrame.new(position + Vector3.new(0, 5, 0)) }
            )
            tween:Play()
        end
    end
end

-- ==========================================
-- DEBUG MODE
-- ==========================================

local debugFruits = {}
local isDebugRunning = false

-- Hàm chạy Debug Mode
local function startDebugMode()
    if isDebugRunning then
        print("⚠️ Debug Mode đã đang chạy!")
        return
    end
    
    isDebugRunning = true
    DebugMode.Enabled = true
    
    print("═══════════════════════════════════════")
    print("  🐞 DEBUG MODE - TEST TWEEN & ESP 🐞")
    print("═══════════════════════════════════════")
    
    clearFakeFruits()
    debugFruits = spawnFakeFruits(DebugMode.FruitCount)
    
    task.wait(1)
    if #debugFruits > 0 then
        testTweenToFruit(debugFruits[1])
    end
    
    -- Tự động spawn lại
    if DebugMode.AutoSpawn then
        spawn(function()
            while isDebugRunning and DebugMode.Enabled do
                task.wait(DebugMode.SpawnInterval)
                
                local remaining = 0
                for _, fruit in ipairs(debugFruits) do
                    if fruit and fruit.Parent then
                        remaining = remaining + 1
                    end
                end
                
                if remaining < 1 then
                    if DebugMode.ShowDebugLogs then
                        print("🔄 Spawn lại trái cây giả...")
                    end
                    clearFakeFruits()
                    debugFruits = spawnFakeFruits(DebugMode.FruitCount)
                    
                    task.wait(1)
                    if #debugFruits > 0 then
                        testTweenToFruit(debugFruits[1])
                    end
                end
            end
        end)
    end
    
    print("═══════════════════════════════════════")
    print("  📋 Lệnh Debug:")
    print("    - _G.StartDebug() - Chạy Debug Mode")
    print("    - _G.StopDebug() - Dừng Debug Mode")
    print("    - _G.SpawnFakeFruit('Tên') - Tạo 1 trái")
    print("    - _G.SpawnFakeFruits(10) - Tạo nhiều trái")
    print("    - _G.ClearFakeFruits() - Xóa tất cả")
    print("    - _G.TestTween() - Test Tween")
    print("═══════════════════════════════════════")
end

-- Hàm dừng Debug Mode
local function stopDebugMode()
    isDebugRunning = false
    DebugMode.Enabled = false
    clearFakeFruits()
    print("🐞 Debug Mode đã dừng")
end

-- ==========================================
-- DEBUG COMMANDS (Global)
-- ==========================================

_G.SpawnFakeFruit = function(name)
    return createFakeFruit(name or "Test Fruit")
end

_G.SpawnFakeFruits = function(count)
    return spawnFakeFruits(count or 5)
end

_G.ClearFakeFruits = function()
    return clearFakeFruits()
end

_G.TestTween = function(fruit)
    if not fruit then
        local nearest = nil
        local minDist = math.huge
        for _, item in ipairs(Workspace:GetChildren()) do
            if item:IsA("Model") and item:FindFirstChild("Handle") then
                if string.find(item.Name, "Fruit") then
                    local dist = CaculateDistance(item.Handle.Position)
                    if dist < minDist then
                        minDist = dist
                        nearest = item
                    end
                end
            end
        end
        fruit = nearest
    end
    
    if fruit then
        testTweenToFruit(fruit)
    else
        print("❌ Không tìm thấy trái cây nào!")
    end
end

_G.TestESP = function()
    print("🎯 Testing ESP...")
    clearFakeFruits()
    
    local char = plr.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then
        print("⚠️ Nhân vật chưa sẵn sàng")
        return
    end
    
    local rootPos = char.HumanoidRootPart.Position
    local positions = {
        Vector3.new(0, 10, 30),
        Vector3.new(-20, 10, -20),
        Vector3.new(30, 10, 0),
    }
    
    for i, offset in ipairs(positions) do
        local pos = rootPos + offset
        local fruit = createFakeFruit("Test Fruit " .. i, pos)
        print("✅ Tạo trái cây test tại:", pos)
    end
    
    print("📌 Kiểm tra ESP trong 5 giây...")
    task.wait(5)
    print("✅ ESP Test hoàn tất!")
end

_G.StartDebug = startDebugMode
_G.StopDebug = stopDebugMode

-- ==========================================
-- KHỞI TẠO
-- ==========================================

print("═══════════════════════════════════════")
print("  🐞 DEBUG MODE LOADED SUCCESSFULLY 🐞")
print("═══════════════════════════════════════")
print("  📋 Các lệnh có sẵn:")
print("    - _G.StartDebug() - Chạy Debug Mode")
print("    - _G.StopDebug() - Dừng Debug Mode")
print("    - _G.SpawnFakeFruit('Tên') - Tạo 1 trái")
print("    - _G.SpawnFakeFruits(10) - Tạo nhiều trái")
print("    - _G.ClearFakeFruits() - Xóa tất cả")
print("    - _G.TestTween() - Test Tween đến trái gần nhất")
print("    - _G.TestESP() - Test ESP")
print("═══════════════════════════════════════")

-- Tự động chạy test
if DebugMode.AutoSpawn then
    task.wait(2)
    _G.StartDebug()
end
