-- ==========================================
-- TỐI ƯU HÓA & SỬA LỖI TWEENCONTROLLER (FULL)
-- KẾT HỢP THU THẬP TRÁI CÂY + ESP
-- ==========================================

-- Biến toàn cục & Dịch vụ
local Services = setmetatable({}, {
    __index = function(_, Index)
        return game:GetService(Index)
    end
})

local Remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
local ScriptStorage = { Backpack = {} }
local SeaIndex = game.PlaceId == 7449423635 and 3 or (game.PlaceId == 4442272183 and 2 or 1)
local plr = game.Players.LocalPlayer

-- ==========================================
-- CẤU HÌNH ESP
-- ==========================================
local ESP_CONFIG = {
    Enabled = true,           -- Bật/Tắt ESP
    Color = Color3.fromRGB(255, 200, 0), -- Màu chữ (Vàng)
    DistanceColor = Color3.fromRGB(255, 255, 255), -- Màu khoảng cách
    ShowDistance = true,      -- Hiển thị khoảng cách
    TextSize = 14,            -- Kích thước chữ
    Font = Enum.Font.Code,    -- Font chữ
    UpdateInterval = 0.5,     -- Thời gian cập nhật (giây)
}

local DevilFruitESP = ESP_CONFIG.Enabled
local Number = tostring(math.random(1000, 9999)) -- ID duy nhất cho ESP

-- ==========================================
-- HÀM TIỆN ÍCH
-- ==========================================

-- Hàm làm tròn số
local function G5(Number)
    return math.round(Number * 10) / 10
end

-- Hàm chuyển đổi linh hoạt CFrame và Vector3
local function ConvertTo(Type, Instance)
    if typeof(Instance) == "Vector3" then
        return Type.new(Instance.X, Instance.Y, Instance.Z)
    elseif typeof(Instance) == "CFrame" then
        return Type == Vector3 and Instance.Position or Instance
    end
    return Instance
end

-- Hàm tính khoảng cách linh hoạt
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

    local PosA = typeof(Origin) == "CFrame" and Origin.Position or Origin
    local PosB = typeof(Destination) == "CFrame" and Destination.Position or Destination

    return (PosA - PosB).Magnitude
end

-- ==========================================
-- TWEEN CONTROLLER (Tối ưu + Fix lỗi)
-- ==========================================

local TweenInstance = nil
local TweenInstance2 = nil
local TweenDebounce = false
local TweenTargetPosition = nil
local LastestTeleportToHomePoint = 0

local Entries = {}
local Portals = {} 

-- Khởi tạo vị trí Home Point
if game.ReplicatedStorage:FindFirstChild("NPCs") then
    for _, NPC in ipairs(game.ReplicatedStorage.NPCs:GetChildren()) do
        if NPC.Name == "Set Home Point" and NPC:IsA("Model") then
            table.insert(Entries, NPC:GetPivot())
        end
    end
end

TweenController = {}

function TweenController.Update()
    local char = plr.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    local HumanoidRootPart = char.HumanoidRootPart

    if TweenInstance and CaculateDistance(HumanoidRootPart.Position) > 250 then
        pcall(function()
            TweenInstance:Cancel()
        end)
        TweenDebounce = true
        task.wait(0.1)
        TweenDebounce = false
    end
end

function GetPortal(Position)
    if not Portals or #Portals == 0 then return end
    local Nearest, Current = 9e9, nil
    local PlayerPos = plr.Character and plr.Character.HumanoidRootPart.Position

    for _, Portal in ipairs(Portals) do
        local Dist1 = CaculateDistance(Portal, Position)
        if PlayerPos and Dist1 < (CaculateDistance(PlayerPos, Position) - 300) and Dist1 < Nearest then
            Nearest = Dist1
            Current = Portal
        end
    end

    if Current and Remotes and Remotes:FindFirstChild("CommF_") then
        Remotes.CommF_:InvokeServer("requestEntrance", Current)
        return task.wait(0.5)
    end
end

function GetEntries(Position)
    local Nearest, Current = 9e9, nil
    local PlayerPos = plr.Character and plr.Character.HumanoidRootPart.Position

    for _, Entry in ipairs(Entries) do
        local Dist1 = CaculateDistance(Entry, Position)
        if PlayerPos and Dist1 < (CaculateDistance(PlayerPos, Position) - 700) and Dist1 < Nearest then
            Nearest = Dist1
            Current = Entry
        end
    end

    if Current then
        if os.time() - LastestTeleportToHomePoint > 30 then
            LastestTeleportToHomePoint = os.time()
            if Remotes and Remotes:FindFirstChild("CommF_") then
                Remotes.CommF_:InvokeServer("GoHome")
            end
            task.wait(1)
        end
    end
end

function TweenController.Tween2(ePart, Position)
    if not ePart then return end
    local TargetCFrame = typeof(Position) == "Vector3" and CFrame.new(Position) or Position
    
    TweenInstance2 = Services.TweenService:Create(
        ePart,
        TweenInfo.new(CaculateDistance(ePart.Position, TargetCFrame.Position) / 50, Enum.EasingStyle.Linear),
        { CFrame = TargetCFrame }
    )
    TweenInstance2:Play()
end

function TweenController.Create(Position)
    if not Position or TweenDebounce then return end
    
    local Character = plr.Character
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then return end
    local RootPart = Character.HumanoidRootPart

    local TargetCFrame = typeof(Position) == "Vector3" and CFrame.new(Position) or Position

    if TweenTargetPosition and (TargetCFrame.Position - TweenTargetPosition).Magnitude < 10 then 
        return 
    end
    TweenTargetPosition = TargetCFrame.Position

    if TweenInstance then
        pcall(function()
            TweenInstance:Cancel()
        end)
    end

    for _, part in ipairs(Character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end

    local Head = Character:WaitForChild("Head", 2)
    if Head and not Head:FindFirstChild("eltrul") then
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Name = "eltrul"
        bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
        bodyVelocity.Velocity = Vector3.zero
        bodyVelocity.Parent = Head
    end

    local Dist = CaculateDistance(RootPart.Position, TargetCFrame.Position)
    if Dist > 500 then
        if SeaIndex ~= 3 then
            GetPortal(TargetCFrame)
        end
    end

    Dist = CaculateDistance(RootPart.Position, TargetCFrame.Position)
    local Speed = Dist < 18 and 25 or 350
    local TweenTime = Dist / Speed

    TweenInstance = Services.TweenService:Create(
        RootPart,
        TweenInfo.new(TweenTime, Enum.EasingStyle.Linear),
        { CFrame = TargetCFrame }
    )
    TweenInstance:Play()
end

-- ==========================================
-- ESP TRÁI CÂY (Devil Fruit ESP)
-- ==========================================

-- Hàm ESP chính (đã tối ưu)
DevEsp = function()
    -- Nếu ESP bị tắt, xóa tất cả ESP cũ
    if not ESP_CONFIG.Enabled then
        for I, e in next, workspace:GetChildren() do
            pcall(function()
                if string.find(e.Name, 'Fruit') and e:FindFirstChild("Handle") then
                    if e.Handle:FindFirstChild('NameEsp' .. Number) then
                        e.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
                    end
                end
            end)
        end
        return
    end

    -- Cập nhật ESP cho từng trái cây
    for I, e in next, workspace:GetChildren() do
        pcall(function()
            if string.find(e.Name, 'Fruit') and e:FindFirstChild("Handle") then
                local handle = e.Handle
                
                -- Nếu chưa có ESP, tạo mới
                if not handle:FindFirstChild('NameEsp' .. Number) then
                    local billboard = Instance.new('BillboardGui', handle)
                    billboard.Name = 'NameEsp' .. Number
                    billboard.ExtentsOffset = Vector3.new(0, 1.5, 0)
                    billboard.Size = UDim2.new(1, 200, 1, 40)
                    billboard.Adornee = handle
                    billboard.AlwaysOnTop = true
                    billboard.StudsOffset = Vector3.new(0, 3, 0)
                    
                    -- Background (tùy chọn)
                    local background = Instance.new('Frame', billboard)
                    background.Size = UDim2.new(1, 0, 1, 0)
                    background.BackgroundTransparency = 0.5
                    background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    background.BorderSizePixel = 0
                    
                    local corner = Instance.new('UICorner', background)
                    corner.CornerRadius = UDim.new(0, 5)
                    
                    -- TextLabel chính
                    local textLabel = Instance.new('TextLabel', billboard)
                    textLabel.Name = "TextLabel"
                    textLabel.Font = ESP_CONFIG.Font
                    textLabel.TextSize = ESP_CONFIG.TextSize
                    textLabel.TextWrapped = true
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.TextYAlignment = 'Top'
                    textLabel.BackgroundTransparency = 1
                    textLabel.TextStrokeTransparency = 0.5
                    textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                    textLabel.TextColor3 = ESP_CONFIG.Color
                    
                    -- Cập nhật text
                    local distance = G5(CaculateDistance(plr.Character.Head.Position, handle.Position) / 3)
                    local fruitName = string.gsub(e.Name, "Fruit", "")
                    textLabel.Text = string.format(
                        '[%s] %s\n%s%s',
                        fruitName:upper(),
                        ESP_CONFIG.ShowDistance and ('\n' .. distance .. ' M') or '',
                        ESP_CONFIG.ShowDistance and '📍 ' or '',
                        ESP_CONFIG.ShowDistance and '' or ''
                    )
                else
                    -- Cập nhật ESP cũ
                    local billboard = handle['NameEsp' .. Number]
                    local textLabel = billboard:FindFirstChild("TextLabel")
                    if textLabel then
                        local distance = G5(CaculateDistance(plr.Character.Head.Position, handle.Position) / 3)
                        local fruitName = string.gsub(e.Name, "Fruit", "")
                        
                        -- Cập nhật màu sắc dựa trên khoảng cách
                        local color = ESP_CONFIG.Color
                        if distance < 50 then
                            color = Color3.fromRGB(0, 255, 0) -- Xanh lá (gần)
                        elseif distance < 150 then
                            color = Color3.fromRGB(255, 255, 0) -- Vàng (trung bình)
                        else
                            color = Color3.fromRGB(255, 100, 0) -- Cam (xa)
                        end
                        
                        textLabel.TextColor3 = color
                        textLabel.Text = string.format(
                            '[%s] %s\n%s%s',
                            fruitName:upper(),
                            ESP_CONFIG.ShowDistance and ('\n' .. distance .. ' M') or '',
                            ESP_CONFIG.ShowDistance and '📍 ' or '',
                            ESP_CONFIG.ShowDistance and '' or ''
                        )
                    end
                end
            end
        end)
    end
end

-- Hàm chạy ESP liên tục
local function startDevilFruitESP()
    spawn(function()
        while task.wait(ESP_CONFIG.UpdateInterval) do
            if plr and plr.Character and plr.Character:FindFirstChild("Head") then
                DevEsp()
            end
        end
    end)
end

-- Khởi động ESP
startDevilFruitESP()

-- ==========================================
-- CHỨC NĂNG THU THẬP TRÁI CÂY (Tích hợp ESP)
-- ==========================================

-- Hàm thu thập trái cây (có hiển thị ESP)
local function collectFruits(enable)
    if not enable then return end
    
    local character = plr.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    
    local rootCFrame = character.HumanoidRootPart.CFrame

    for _, item in ipairs(workspace:GetChildren()) do
        if string.find(item.Name, "Fruit") and item:FindFirstChild("Handle") then
            pcall(function()
                local fruitPosition = item.Handle.Position
                
                -- Hiển thị thông báo đang thu thập
                if ESP_CONFIG.Enabled and item.Handle:FindFirstChild('NameEsp' .. Number) then
                    local billboard = item.Handle['NameEsp' .. Number]
                    local textLabel = billboard:FindFirstChild("TextLabel")
                    if textLabel then
                        textLabel.TextColor3 = Color3.fromRGB(0, 255, 255) -- Màu xanh dương báo hiệu đang thu thập
                        textLabel.Text = string.format('[COLLECTING]\n%s', item.Name)
                    end
                end
                
                -- Bay đến trái cây
                if CaculateDistance(rootCFrame.Position, fruitPosition) > 20 then
                    print("Đang bay đến trái cây:", item.Name)
                    TweenController.Create(fruitPosition + Vector3.new(0, 5, 0))
                    
                    repeat
                        task.wait(0.1)
                        local currentPos = character.HumanoidRootPart.Position
                        if CaculateDistance(currentPos, fruitPosition) < 15 then
                            break
                        end
                    until false
                end
                
                -- Thu thập
                item.Handle.CFrame = rootCFrame
                print("Đã thu thập:", item.Name)
                
                -- Xóa ESP sau khi thu thập
                if item.Handle:FindFirstChild('NameEsp' .. Number) then
                    item.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
                end
            end)
        end
    end
end

-- Hàm thu thập trái cây gần nhất
local function collectNearestFruit(enable)
    if not enable then return end
    
    local character = plr.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    
    local rootPosition = character.HumanoidRootPart.Position
    local nearestFruit = nil
    local nearestDistance = math.huge
    
    for _, item in ipairs(workspace:GetChildren()) do
        if string.find(item.Name, "Fruit") and item:FindFirstChild("Handle") then
            local distance = CaculateDistance(rootPosition, item.Handle.Position)
            if distance < nearestDistance then
                nearestDistance = distance
                nearestFruit = item
            end
        end
    end
    
    if nearestFruit then
        pcall(function()
            local fruitPosition = nearestFruit.Handle.Position
            
            -- Đánh dấu trái cây đang được thu thập trên ESP
            if ESP_CONFIG.Enabled and nearestFruit.Handle:FindFirstChild('NameEsp' .. Number) then
                local billboard = nearestFruit.Handle['NameEsp' .. Number]
                local textLabel = billboard:FindFirstChild("TextLabel")
                if textLabel then
                    textLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
                    textLabel.Text = '[COLLECTING]\n' .. nearestFruit.Name
                end
            end
            
            if nearestDistance > 20 then
                print("Đang bay đến trái cây gần nhất:", nearestFruit.Name, "Khoảng cách:", nearestDistance)
                TweenController.Create(fruitPosition + Vector3.new(0, 5, 0))
                
                repeat
                    task.wait(0.1)
                    local currentPos = character.HumanoidRootPart.Position
                    if CaculateDistance(currentPos, fruitPosition) < 15 then
                        break
                    end
                until false
            end
            
            nearestFruit.Handle.CFrame = character.HumanoidRootPart.CFrame
            print("Đã thu thập trái cây gần nhất:", nearestFruit.Name)
            
            -- Xóa ESP
            if nearestFruit.Handle:FindFirstChild('NameEsp' .. Number) then
                nearestFruit.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
            end
        end)
    end
end

-- Hàm tự động thu thập (chạy nền)
local function autoCollectFruits()
    spawn(function()
        while task.wait(1) do
            if not plr.Character or not plr.Character:FindFirstChild("Humanoid") or plr.Character.Humanoid.Health <= 0 then
                continue
            end
            
            local collected = false
            for _, item in ipairs(workspace:GetChildren()) do
                if string.find(item.Name, "Fruit") and item:FindFirstChild("Handle") then
                    if not item:IsDescendantOf(plr.Character) and not item:IsDescendantOf(plr.Backpack) then
                        collectNearestFruit(true)
                        collected = true
                        break
                    end
                end
            end
            
            if not collected then
                task.wait(2)
            end
        end
    end)
end

-- ==========================================
-- KHỞI TẠO VÀ CHẠY
-- ==========================================

-- Khởi động auto collect
autoCollectFruits()

-- ==========================================
-- LỆNH ĐIỀU KHIỂN (Dùng trong console)
-- ==========================================

-- Bật/Tắt ESP
_G.ToggleESP = function(state)
    ESP_CONFIG.Enabled = state
    DevilFruitESP = state
    print("ESP đã " .. (state and "bật" or "tắt"))
end

-- Bật/Tắt Auto Collect
_G.ToggleAutoCollect = function(state)
    if state then
        autoCollectFruits()
        print("Auto Collect đã bật")
    else
        print("Auto Collect đã tắt (không thể tắt hoàn toàn, vui lòng restart script)")
    end
end

-- Thu thập ngay lập tức
_G.CollectNow = function()
    collectNearestFruit(true)
end

-- Xóa tất cả ESP
_G.ClearESP = function()
    for I, e in next, workspace:GetChildren() do
        pcall(function()
            if string.find(e.Name, 'Fruit') and e:FindFirstChild("Handle") then
                if e.Handle:FindFirstChild('NameEsp' .. Number) then
                    e.Handle:FindFirstChild('NameEsp' .. Number):Destroy()
                end
            end
        end)
    end
    print("Đã xóa tất cả ESP")
end

print("═══════════════════════════════════════")
print("  🍎 DEVIL FRUIT COLLECTOR + ESP 🍎  ")
print("═══════════════════════════════════════")
print("  ✅ Auto Collect: Đang chạy")
print("  ✅ ESP: " .. (ESP_CONFIG.Enabled and "Đang bật" or "Đã tắt"))
print("  📋 Lệnh điều khiển:")
print("    - _G.ToggleESP(true/false)")
print("    - _G.CollectNow()")
print("    - _G.ClearESP()")
print("═══════════════════════════════════════")
