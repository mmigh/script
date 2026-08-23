-- ==========================================
-- TỐI ƯU HÓA & SỬA LỖI TWEENCONTROLLER (FULL)
-- KẾT HỢP THU THẬP TRÁI CÂY
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

-- Hàm chuyển đổi linh hoạt CFrame và Vector3
local function ConvertTo(Type, Instance)
    if typeof(Instance) == "Vector3" then
        return Type.new(Instance.X, Instance.Y, Instance.Z)
    elseif typeof(Instance) == "CFrame" then
        return Type == Vector3 and Instance.Position or Instance
    end
    return Instance
end

-- Hàm tính khoảng cách linh hoạt (Sửa lỗi crash)
function CaculateDistance(Origin, Destination)
    if not Origin then return 0 end
    
    -- Nếu chỉ truyền 1 tham số, mặc định Origin là vị trí nhân vật
    if not Destination then
        Destination = Origin
        local char = game.Players.LocalPlayer.Character
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

-- Khai báo Controller
TweenController = {}

-- Cập nhật vị trí nhân vật (Anti-desync / Fix kẹt)
function TweenController.Update()
    local char = game.Players.LocalPlayer.Character
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

-- Hàm gọi cổng dịch chuyển nhanh
function GetPortal(Position)
    if not Portals or #Portals == 0 then return end
    local Nearest, Current = 9e9, nil
    local PlayerPos = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart.Position

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

-- Hàm gọi điểm Set Home Point
function GetEntries(Position)
    local Nearest, Current = 9e9, nil
    local PlayerPos = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.HumanoidRootPart.Position

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

-- Tween phụ
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

-- Hàm Tween chính (Di chuyển xuyên vật thể + Không rơi)
function TweenController.Create(Position)
    if not Position or TweenDebounce then return end
    
    local Character = game.Players.LocalPlayer.Character
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then return end
    local RootPart = Character.HumanoidRootPart

    local TargetCFrame = typeof(Position) == "Vector3" and CFrame.new(Position) or Position

    -- Nếu khoảng cách tới mục tiêu mới quá nhỏ so với mục tiêu cũ (< 10 studs), bỏ qua
    if TweenTargetPosition and (TargetCFrame.Position - TweenTargetPosition).Magnitude < 10 then 
        return 
    end
    TweenTargetPosition = TargetCFrame.Position

    -- Hủy Tween cũ nếu đang chạy
    if TweenInstance then
        pcall(function()
            TweenInstance:Cancel()
        end)
    end

    -- Tắt va chạm để xuyên tường/địa hình
    for _, part in ipairs(Character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = false
        end
    end

    -- Tạo BodyVelocity giữ nhân vật trên không (chống rơi tự do)
    local Head = Character:WaitForChild("Head", 2)
    if Head and not Head:FindFirstChild("eltrul") then
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Name = "eltrul"
        bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
        bodyVelocity.Velocity = Vector3.zero
        bodyVelocity.Parent = Head
    end

    -- Nếu khoảng cách quá xa (> 500 studs), sử dụng Portal để đi nhanh
    local Dist = CaculateDistance(RootPart.Position, TargetCFrame.Position)
    if Dist > 500 then
        if SeaIndex ~= 3 then
            GetPortal(TargetCFrame)
        end
    end

    -- Cập nhật lại khoảng cách sau khi dùng Portal (nếu có)
    Dist = CaculateDistance(RootPart.Position, TargetCFrame.Position)

    -- Tính toán tốc độ Tween (350 studs/s, hoặc 25 studs/s nếu cực gần)
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
-- CHỨC NĂNG THU THẬP TRÁI CÂY
-- ==========================================

local plr = game.Players.LocalPlayer

-- Hàm thu thập trái cây (có sử dụng TweenController để bay đến)
local function collectFruits(enable)
    if not enable then return end
    
    local character = plr.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    
    local rootCFrame = character.HumanoidRootPart.CFrame

    for _, item in ipairs(workspace:GetChildren()) do
        -- Kiểm tra tên item chứa chữ "Fruit" và bảo đảm có Handle
        if string.find(item.Name, "Fruit") and item:FindFirstChild("Handle") then
            pcall(function()
                -- Sử dụng TweenController để bay đến vị trí trái cây
                local fruitPosition = item.Handle.Position
                
                -- Nếu trái cây ở xa (> 20 studs), sử dụng TweenController để bay đến
                if CaculateDistance(rootCFrame.Position, fruitPosition) > 20 then
                    print("Đang bay đến trái cây:", item.Name)
                    TweenController.Create(fruitPosition + Vector3.new(0, 5, 0)) -- Bay đến vị trí trên trái cây 5 studs
                    
                    -- Chờ đến khi đến gần trái cây
                    repeat
                        task.wait(0.1)
                        local currentPos = character.HumanoidRootPart.Position
                        if CaculateDistance(currentPos, fruitPosition) < 15 then
                            break
                        end
                    until false
                end
                
                -- Di chuyển trái cây đến vị trí nhân vật
                item.Handle.CFrame = rootCFrame
                print("Đã thu thập:", item.Name)
            end)
        end
    end
end

-- ==========================================
-- VÍ DỤ SỬ DỤNG
-- ==========================================

-- Cách 1: Thu thập tất cả trái cây trong server một lần
-- collectFruits(true)

-- Cách 2: Chạy liên tục để thu thập trái cây mới xuất hiện
-- spawn(function()
--     while task.wait(2) do
--         collectFruits(true)
--     end
-- end)

-- Cách 3: Kết hợp với auto farm (gọi khi có trái cây xuất hiện)
-- Hàm này sẽ được gọi khi có trái cây mới trong workspace
-- workspace.ChildAdded:Connect(function(child)
--     if string.find(child.Name, "Fruit") and child:FindFirstChild("Handle") then
--         task.wait(0.5) -- Chờ trái cây ổn định
--         collectFruits(true)
--     end
-- end)

-- ==========================================
-- TỐI ƯU: Thu thập trái cây gần nhất trước
-- ==========================================

-- Hàm thu thập trái cây gần nhất (ưu tiên trái gần)
local function collectNearestFruit(enable)
    if not enable then return end
    
    local character = plr.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    
    local rootPosition = character.HumanoidRootPart.Position
    local nearestFruit = nil
    local nearestDistance = math.huge
    
    -- Tìm trái cây gần nhất
    for _, item in ipairs(workspace:GetChildren()) do
        if string.find(item.Name, "Fruit") and item:FindFirstChild("Handle") then
            local distance = CaculateDistance(rootPosition, item.Handle.Position)
            if distance < nearestDistance then
                nearestDistance = distance
                nearestFruit = item
            end
        end
    end
    
    -- Thu thập trái cây gần nhất
    if nearestFruit then
        pcall(function()
            local fruitPosition = nearestFruit.Handle.Position
            
            -- Nếu trái cây ở xa, bay đến
            if nearestDistance > 20 then
                print("Đang bay đến trái cây gần nhất:", nearestFruit.Name, "Khoảng cách:", nearestDistance)
                TweenController.Create(fruitPosition + Vector3.new(0, 5, 0))
                
                -- Chờ đến gần
                repeat
                    task.wait(0.1)
                    local currentPos = character.HumanoidRootPart.Position
                    if CaculateDistance(currentPos, fruitPosition) < 15 then
                        break
                    end
                until false
            end
            
            -- Thu thập
            nearestFruit.Handle.CFrame = character.HumanoidRootPart.CFrame
            print("Đã thu thập trái cây gần nhất:", nearestFruit.Name)
        end)
    end
end

-- ==========================================
-- CHỨC NĂNG TỰ ĐỘNG THU THẬP (FULL AUTO)
-- ==========================================

-- Hàm chạy nền: Tự động thu thập trái cây khi có trong server
local function autoCollectFruits()
    spawn(function()
        while task.wait(1) do
            -- Kiểm tra nhân vật còn sống không
            if not plr.Character or not plr.Character:FindFirstChild("Humanoid") or plr.Character.Humanoid.Health <= 0 then
                continue
            end
            
            -- Tìm và thu thập trái cây
            local collected = false
            for _, item in ipairs(workspace:GetChildren()) do
                if string.find(item.Name, "Fruit") and item:FindFirstChild("Handle") then
                    -- Nếu trái cây không ai sở hữu (không nằm trong tay ai)
                    if not item:IsDescendantOf(plr.Character) and not item:IsDescendantOf(plr.Backpack) then
                        collectNearestFruit(true)
                        collected = true
                        break -- Thu thập từng trái một
                    end
                end
            end
            
            -- Nếu không có trái cây nào, tạm dừng lâu hơn để tiết kiệm tài nguyên
            if not collected then
                task.wait(2)
            end
        end
    end)
end

-- Kích hoạt tự động thu thập trái cây
autoCollectFruits()

print("Hệ thống thu thập trái cây đã được kích hoạt!")
