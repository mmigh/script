-- ==========================================
-- DEBUG MODE - TEST TWEEN & ESP
-- TẠO TRÁI CÂY GIẢ ĐỂ TEST NHANH
-- ==========================================

local DebugMode = {
    Enabled = true,           -- Bật/Tắt Debug Mode
    SpawnRadius = 5000,          -- Bán kính spawn trái cây xung quanh player
    FruitCount = 1,            -- Số lượng trái cây giả tạo ra
    AutoSpawn = true,          -- Tự động spawn lại khi thu thập hết
    SpawnInterval = 3,         -- Thời gian giữa các lần spawn (giây)
    ShowDebugLogs = true,      -- Hiển thị log debug
    FruitNames = {             -- Danh sách tên trái cây giả
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
-- TẠO TRÁI CÂY GIẢ
-- ==========================================

local function getRandomPosition()
    local char = game.Players.LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return Vector3.new(0, 10, 0) end
    
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
    
    -- Tạo model trái cây
    local fruit = Instance.new("Model")
    fruit.Name = name or DebugMode.FruitNames[math.random(#DebugMode.FruitNames)]
    
    -- Tạo Handle (phần chính của trái cây)
    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(2, 2, 2)
    handle.Shape = Enum.PartType.Ball
    handle.Position = position
    handle.Anchored = true
    handle.CanCollide = false
    handle.Transparency = 0.1
    handle.Material = Enum.Material.Neon
    
    -- Tạo màu ngẫu nhiên
    local color = Color3.fromHSV(math.random(), 0.8, 0.9)
    handle.Color = color
    handle.BrickColor = BrickColor.new(color)
    
    -- Thêm hiệu ứng glow
    local glow = Instance.new("PointLight")
    glow.Parent = handle
    glow.Color = color
    glow.Range = 15
    glow.Brightness = 2
    
    -- Thêm ParticleEmitter để trông sống động hơn
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
    
    -- Tạo Attachment cho particles
    local attachment = Instance.new("Attachment")
    attachment.Parent = handle
    
    -- Thêm hiệu ứng xoay (dùng BodyGyro)
    local gyro = Instance.new("BodyGyro")
    gyro.Parent = handle
    gyro.MaxTorque = Vector3.new(4000, 4000, 4000)
    gyro.CFrame = CFrame.new(position) * CFrame.Angles(0, math.rad(45), 0)
    
    handle.Parent = fruit
    
    -- Thêm BillboardGui để hiển thị tên (cho debug)
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
    
    -- Lưu vị trí để kiểm tra khoảng cách
    fruit:SetAttribute("SpawnPosition", position)
    fruit:SetAttribute("IsFake", true)
    
    fruit.Parent = workspace
    
    if DebugMode.ShowDebugLogs then
        print("🍎 Đã tạo trái cây giả:", fruit.Name, "tại", position)
    end
    
    return fruit
end

-- Tạo nhiều trái cây giả cùng lúc
local function spawnFakeFruits(count)
    local fruits = {}
    count = count or DebugMode.FruitCount
    
    for i = 1, count do
        local name = DebugMode.FruitNames[math.random(#DebugMode.FruitNames)]
        local fruit = createFakeFruit(name .. " " .. i)
        table.insert(fruits, fruit)
        task.wait(0.1) -- Tránh spawn quá nhanh
    end
    
    if DebugMode.ShowDebugLogs then
        print("✅ Đã tạo", count, "trái cây giả")
    end
    
    return fruits
end

-- Xóa tất cả trái cây giả
local function clearFakeFruits()
    local count = 0
    for _, item in ipairs(workspace:GetChildren()) do
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
= TEST TWEEN CONTROLLER
-- ==========================================

-- Test di chuyển đến trái cây
local function testTweenToFruit(fruit)
    if not fruit or not fruit:FindFirstChild("Handle") then
        print("❌ Không tìm thấy trái cây để test")
        return
    end
    
    local position = fruit.Handle.Position
    print("🚀 Đang bay đến trái cây:", fruit.Name, "tại", position)
    
    -- Sử dụng TweenController để bay đến
    TweenController.Create(position + Vector3.new(0, 5, 0))
    
    -- Theo dõi quá trình di chuyển
    spawn(function()
        local startTime = tick()
        local char = game.Players.LocalPlayer.Character
        if not char then return end
        
        while char and char:FindFirstChild("HumanoidRootPart") do
            local currentPos = char.HumanoidRootPart.Position
            local distance = CaculateDistance(currentPos, position)
            
            if distance < 10 then
                print("✅ Đã đến gần trái cây! Khoảng cách:", distance)
                break
            end
            
            if tick() - startTime > 30 then
                print("⚠️ Timeout! Không thể đến gần trái cây")
                break
            end
            
            task.wait(0.5)
        end
    end)
end

-- ==========================================
-- DEBUG MODE - TỰ ĐỘNG TEST
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
    
    -- Xóa trái cây cũ nếu có
    clearFakeFruits()
    
    -- Spawn trái cây giả
    debugFruits = spawnFakeFruits(DebugMode.FruitCount)
    
    -- Test TweenController đến trái cây đầu tiên
    task.wait(1)
    if #debugFruits > 0 then
        testTweenToFruit(debugFruits[1])
    end
    
    -- Tự động spawn lại khi thu thập hết
    if DebugMode.AutoSpawn then
        spawn(function()
            while isDebugRunning and DebugMode.Enabled do
                task.wait(DebugMode.SpawnInterval)
                
                -- Kiểm tra số lượng trái cây còn lại
                local remaining = 0
                for _, fruit in ipairs(debugFruits) do
                    if fruit and fruit.Parent then
                        remaining = remaining + 1
                    end
                end
                
                -- Nếu hết hoặc ít hơn 1, spawn lại
                if remaining < 1 then
                    if DebugMode.ShowDebugLogs then
                        print("🔄 Spawn lại trái cây giả...")
                    end
                    clearFakeFruits()
                    debugFruits = spawnFakeFruits(DebugMode.FruitCount)
                    
                    -- Test Tween đến trái cây mới
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
    print("    - DebugMode.Enabled = false (Tắt)")
    print("    - spawnFakeFruits(10) (Tạo 10 trái)")
    print("    - clearFakeFruits() (Xóa hết)")
    print("    - testTweenToFruit(fruit) (Test Tween)")
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
-- DEBUG COMMANDS (Sử dụng trong console)
-- ==========================================

-- Tạo trái cây giả ở vị trí ngẫu nhiên
_G.SpawnFakeFruit = function(name)
    local fruit = createFakeFruit(name or "Test Fruit")
    print("✅ Đã tạo trái cây giả:", fruit.Name)
    return fruit
end

-- Tạo nhiều trái cây giả
_G.SpawnFakeFruits = function(count)
    return spawnFakeFruits(count or 5)
end

-- Xóa tất cả trái cây giả
_G.ClearFakeFruits = function()
    return clearFakeFruits()
end

-- Test Tween đến trái cây
_G.TestTween = function(fruit)
    if not fruit then
        -- Tìm trái cây gần nhất
        local nearest = nil
        local minDist = math.huge
        for _, item in ipairs(workspace:GetChildren()) do
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

-- Test ESP bằng cách tạo trái cây và xem ESP
_G.TestESP = function()
    print("🎯 Testing ESP...")
    
    -- Xóa trái cây cũ
    clearFakeFruits()
    
    -- Tạo 3 trái cây ở các vị trí khác nhau
    local positions = {
        Vector3.new(0, 10, 30),
        Vector3.new(-20, 10, -20),
        Vector3.new(30, 10, 0),
    }
    
    for i, pos in ipairs(positions) do
        local fruit = createFakeFruit("Test Fruit " .. i, pos + game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
        print("✅ Tạo trái cây test tại:", pos)
    end
    
    print("📌 Kiểm tra ESP trong 5 giây...")
    task.wait(5)
    print("✅ ESP Test hoàn tất!")
end

-- Debug Mode: Tự động chạy test
_G.StartDebug = function()
    startDebugMode()
end

_G.StopDebug = function()
    stopDebugMode()
end

-- ==========================================
-- AUTO START DEBUG (Tùy chọn)
-- ==========================================

-- Tự động chạy Debug Mode khi script load
-- Bỏ comment dòng dưới để tự động chạy
-- startDebugMode()

-- ==========================================
-- KHỞI TẠO VÀ TEST NHANH
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

-- Nếu muốn tự động test ngay khi load
if DebugMode.AutoSpawn then
    task.wait(2)
    _G.StartDebug()
end
