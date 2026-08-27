pcall(function()
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end

    local Players           = game:GetService("Players")
    local Player            = Players.LocalPlayer or Players.PlayerAdded:Wait()
    local LocalPlayer       = Player
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local TweenService      = game:GetService("TweenService")
    local Workspace         = game:GetService("Workspace")
    local RunService        = game:GetService("RunService")
    local HttpService       = game:GetService("HttpService")
    local CollectionService = game:GetService("CollectionService")

    repeat task.wait() until Player

    local Remotes = ReplicatedStorage:WaitForChild("Remotes", 10)
    local CommF   = Remotes and Remotes:WaitForChild("CommF_", 10)

    -- ============================================================
    -- [0] TỰ ĐỘNG BẬT HAKI VŨ TRANG (AUTO BUSO)
    -- ============================================================
    local function AutoBuso()
        local char = Player.Character
        if char and not char:FindFirstChild("HasBuso") then
            pcall(function()
                if CommF then
                    CommF:InvokeServer("Buso")
                end
            end)
        end
    end

    -- ============================================================
    -- [1] TỰ ĐỘNG CHỌN ĐỘI, FPS BOOSTER, CAMERA SHAKER
    -- ============================================================
    local function ChooseTeam(selectedTeam)
        if Player.Team ~= nil then return end
        if not CommF then return end
        
        local attempts = 0
        local maxAttempts = 20

        repeat
            attempts = attempts + 1
            pcall(function()
                CommF:InvokeServer("SetTeam", selectedTeam)
            end)
            task.wait(0.5)
        until Player.Team ~= nil or attempts >= maxAttempts

        pcall(function()
            local mainGui = Player:WaitForChild("PlayerGui", 5):FindFirstChild("Main")
            if mainGui and mainGui:FindFirstChild("ChooseTeam") then
                mainGui.ChooseTeam.Visible = false
            end
        end)
    end

    ChooseTeam("Marines")

    task.spawn(function()
        task.wait(2)
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/mmigh/module_script/main/fps.lua"))()
        end)
    end)

    pcall(function()
        local kkii = require(ReplicatedStorage.Util.CameraShaker)
        kkii:Stop()
    end)

    local function DieWait()
        local character = Player.Character
        if not character then return end

        local humanoid = character:FindFirstChild("Humanoid")
        if (humanoid and humanoid.Health == 0) or not character:FindFirstChild("Head") then
            repeat 
                task.wait(0.5) 
            until Player.Character 
              and Player.Character:FindFirstChild("Humanoid") 
              and Player.Character.Humanoid.Health > 0
            
            task.wait(1)
            AutoBuso()
        end
    end

    local function SetupDieWait(character)
        local humanoid = character:WaitForChild("Humanoid", 5)
        if humanoid then
            humanoid.Died:Connect(DieWait)
        end
    end

    if Player.Character then SetupDieWait(Player.Character) end
    Player.CharacterAdded:Connect(SetupDieWait)

    print("╔══════════════════════════════════════════════════════╗")
    print("║       BLOX FRUITS UNIFIED SYSTEM — LOADING...       ║")
    print("╚══════════════════════════════════════════════════════╝")

    -- ============================================================
    -- [2] FLAT CONFIG
    -- ============================================================
    local Config = {
        FastAttack   = true,
        AttackRange  = 60,
        AttackSpeed  = 100,
        Combo        = 10,
        ScaleFactor  = 3,

        ESPIsland    = true,
        ESPFruit     = true,
        AutoCollect  = true,

        AutoRaid     = true,
        BringMob     = true,
        SelectWeapon = "Melee",
        SelectRaid   = "Ice",
    }

    _G.CurrentChipType = Config.SelectRaid
    local PosMon = nil
    local StartMagnet = true

    -- ============================================================
    -- [3] CONFIG PERSISTENCE
    -- ============================================================
    local ConfigFile = "bloxfruits_unified.config"
    local SavedData  = {}

    pcall(function()
        if isfile and isfile(ConfigFile) then
            SavedData = HttpService:JSONDecode(readfile(ConfigFile))
        end
    end)

    local function SaveConfig()
        pcall(function()
            if writefile then
                writefile(ConfigFile, HttpService:JSONEncode(SavedData))
            end
        end)
    end

    local function GetSaved(key, default)
        if SavedData[key] ~= nil then return SavedData[key] end
        return default
    end

    -- ============================================================
    -- [4] UTILS & NETWORK
    -- ============================================================
    local Utils = {}

    local function toPos(v)
        if typeof(v) == "CFrame"  then return v.Position end
        if typeof(v) == "Vector3" then return v end
        return nil
    end

    function Utils.Distance(a, b)
        local p1 = toPos(a)
        if not p1 then return 9e9 end
        if b then
            local p2 = toPos(b)
            return p2 and (p1 - p2).Magnitude or 9e9
        end
        local char = LocalPlayer.Character
        local hrp  = char and char:FindFirstChild("HumanoidRootPart")
        return hrp and (hrp.Position - p1).Magnitude or 9e9
    end

    function Utils.ToCFrame(v)
        if typeof(v) == "CFrame"  then return v end
        if typeof(v) == "Vector3" then return CFrame.new(v) end
        return CFrame.new()
    end

    function Utils.IsValidTarget(model)
        local hum  = model:FindFirstChildOfClass("Humanoid")
        local root = model:FindFirstChild("HumanoidRootPart")
        return hum and root and hum.Health > 0
    end

    function InMyNetWork(object)
        if isnetworkowner then
            return isnetworkowner(object)
        else
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp and object then
                return (object.Position - hrp.Position).Magnitude <= 200
            end
            return false
        end
    end

    pcall(function()
        if sethiddenproperty then
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
        end
    end)

    -- ============================================================
    -- [5] BRING MOB (MAGNET SYSTEM & SPAWN POINT TRACKER)
    -- ============================================================
    local AllMobCFrame = {}
    local TableSwapMob = {}
    local SwapMobNoLoop = false

    local function tableFoundForYou(tbl, cf)
        for _, item in ipairs(tbl) do
            if item.CFrame == cf then return true end
        end
        return false
    end

    local function updateAllMobCFrame()
        while task.wait(0.5) do
            pcall(function()
                local enemySpawns = Workspace:FindFirstChild("_WorldOrigin") and Workspace._WorldOrigin:FindFirstChild("EnemySpawns")
                if enemySpawns then
                    for _, v in pairs(enemySpawns:GetChildren()) do
                        if not tableFoundForYou(AllMobCFrame, v.CFrame) then
                            table.insert(AllMobCFrame, {Name = v.Name, CFrame = v.CFrame})
                        end
                    end
                end
            end)
        end
    end
    task.spawn(updateAllMobCFrame)

    local function checkEnemySpawn(name)
        local tableCFrame = {}
        
        for _, v in pairs(AllMobCFrame) do
            if name == v.Name or name:match("^" .. v.Name) then
                local newCFrame = v.CFrame * CFrame.new(2, 50, 0)
                table.insert(tableCFrame, newCFrame)
            end
        end
        
        for _, v in pairs(tableCFrame) do
            if not table.find(TableSwapMob, v) then
                if not SwapMobNoLoop then
                    SwapMobNoLoop = true
                    task.delay(0.8, function()
                        table.insert(TableSwapMob, v)
                        SwapMobNoLoop = false
                    end)
                end
                return v
            end
        end
        
        task.delay(0.01, function() TableSwapMob = {} end)
        if #TableSwapMob > 0 then
            return TableSwapMob[1]
        end
        
        local function findEnemy(searchName)
            for _, obj in pairs(CollectionService:GetTagged("ActiveRig")) do
                if obj.Name == searchName and obj:FindFirstChild("Humanoid") and 
                   obj:FindFirstChild("HumanoidRootPart") and obj.Humanoid.Health > 0 then
                    return obj.HumanoidRootPart.CFrame * CFrame.new(2, 50, 0)
                end
            end
        end
        return findEnemy(name)
    end

    task.spawn(function()
        RunService.RenderStepped:Connect(function()
            pcall(function()
                if Config.BringMob and StartMagnet and PosMon then
                    local enemies = Workspace:FindFirstChild("Enemies")
                    if not enemies then return end
                    local char = LocalPlayer.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if not hrp then return end

                    for _, v in pairs(enemies:GetChildren()) do
                        if not string.find(v.Name, "Boss") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                            if (v.HumanoidRootPart.Position - hrp.Position).Magnitude <= 500 then
                                if InMyNetWork(v.HumanoidRootPart) then
                                    v.HumanoidRootPart.CFrame = PosMon
                                    
                                    v.Humanoid.JumpPower = 0
                                    v.Humanoid.WalkSpeed = 0
                                    v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v.HumanoidRootPart.CanCollide = false
                                    
                                    if v:FindFirstChild("Head") then
                                        v.Head.CanCollide = false
                                    end
                                    
                                    if v.Humanoid:FindFirstChild("Animator") then
                                        v.Humanoid.Animator:Destroy()
                                    end
                                    
                                    v.Humanoid:ChangeState(14)
                                    v.Humanoid:ChangeState(11)
                                end
                            end
                        end
                    end
                end
            end)
        end)
    end)

    -- ============================================================
    -- [6] SEA DETECTION
    -- ============================================================
    local placeId  = game.PlaceId
    local SeaIndex = 1

    if     placeId == 2753915549 or placeId == 4442272183 or placeId == 85211729168715 then
        SeaIndex = 1
    elseif placeId == 7449423635 or placeId == 79091703265657 then
        SeaIndex = 2
    elseif placeId == 12155812399 or placeId == 100117331123089 then
        SeaIndex = 3
    end

    -- ============================================================
    -- [7] TWEEN CONTROLLER
    -- ============================================================
    local TweenCtrl = {}
    local ActiveTween = nil
    local NoclipConn  = nil
    local TWEEN_SPEED = 280

    local Portals = ({
        {
            Vector3.new(-7894.620,  5545.491,  -380.246),
            Vector3.new(-4607.822,   872.542, -1667.556),
            Vector3.new(61163.851,    11.759,  1819.784),
            Vector3.new( 3876.280,    35.106, -1939.320),
        },
        {
            Vector3.new( -288.462,  306.130,   597.998),
            Vector3.new( 2284.912,   15.152,   905.482),
            Vector3.new(  923.212,  126.976, 32852.832),
            Vector3.new(-6508.558,   89.034,  -132.839),
        },
        {}
    })[SeaIndex] or {}

    local function PhysicsFreeze(enable)
        local char = LocalPlayer.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")

        if enable then
            if hum then
                hum.PlatformStand = true
                hum:ChangeState(Enum.HumanoidStateType.Physics)
            end
            if not NoclipConn then
                NoclipConn = RunService.Stepped:Connect(function()
                    if not char then return end
                    for _, p in ipairs(char:GetDescendants()) do
                        if p:IsA("BasePart") then
                            p.CanCollide              = false
                            p.AssemblyLinearVelocity  = Vector3.zero
                            p.AssemblyAngularVelocity = Vector3.zero
                        end
                    end
                end)
            end
        else
            if NoclipConn then NoclipConn:Disconnect(); NoclipConn = nil end
            if hum then
                hum.PlatformStand = false
                hum:ChangeState(Enum.HumanoidStateType.GettingUp)
            end
        end
    end

    local function UsePortal(Position)
        if not Position then return end
        local TargetPos = toPos(Position)
        local Nearest, Best = 9e9, nil

        for _, portal in pairs(Portals) do
            local d1 = Utils.Distance(portal, TargetPos)
            local d2 = Utils.Distance(TargetPos)
            if d1 < (d2 - 300) and d1 < Nearest then
                Nearest = d1; Best = portal
            end
        end

        if Best and CommF then
            pcall(function() CommF:InvokeServer("requestEntrance", Best) end)
            task.wait()
        end
    end

    function TweenCtrl:Create(Position)
        if not Position then return end
        Position = Utils.ToCFrame(Position)
        if not Position then return end

        if ActiveTween then pcall(function() ActiveTween:Cancel() end) end

        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end

        PhysicsFreeze(true)

        local head = char:WaitForChild("Head", 5)
        if head and not head:FindFirstChild("eltrul") then
            local bv    = Instance.new("BodyVelocity")
            bv.Name     = "eltrul"
            bv.MaxForce = Vector3.new(0, math.huge, 0)
            bv.Velocity = Vector3.zero
            bv.Parent   = head
        end

        if Utils.Distance(Position) > 500 and SeaIndex ~= 3 then
            UsePortal(Position)
        end

        Position = CFrame.new(Position.Position)
        local HRP    = char.HumanoidRootPart
        local dist   = Utils.Distance(HRP.CFrame, Position)
        local pCF    = HRP.CFrame

        HRP.CFrame   = CFrame.new(pCF.X, Position.Y, pCF.Z)

        local t = dist / (dist < 18 and 25 or TWEEN_SPEED)
        ActiveTween = TweenService:Create(HRP, TweenInfo.new(t, Enum.EasingStyle.Linear), { CFrame = Position })
        ActiveTween:Play()
        ActiveTween.Completed:Connect(function() PhysicsFreeze(false) end)
        return ActiveTween
    end

    function TweenCtrl:CreateAndWait(Position)
        local tw = self:Create(Position)
        if tw then tw.Completed:Wait(); PhysicsFreeze(false) end
    end

    -- ============================================================
    -- [8] FAST ATTACK & COMBAT CONTROLLER (REWRITTEN)
    -- ============================================================
    local Services = {
        ReplicatedStorage = game:GetService("ReplicatedStorage"),
        Workspace         = game:GetService("Workspace"),
        Players           = game:GetService("Players")
    }

    local W = {}
    local netModule = Services.ReplicatedStorage:WaitForChild('Modules'):WaitForChild("Net")
    local regAtkRemote = netModule:WaitForChild('RE/RegisterAttack')
    local regHitRemote = netModule:WaitForChild('RE/RegisterHit')

    local h = {}
    function GetAllBladeHits()
        local bladehits = {}
        if workspace:FindFirstChild("Enemies") then
            for _, X in pairs(workspace.Enemies:GetChildren()) do
                if X:FindFirstChild('Humanoid') and X:FindFirstChild('HumanoidRootPart') and X.Humanoid.Health > 0 and (X.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 65 then
                    table.insert(bladehits, X)
                end
            end
        end
        return bladehits
    end

    function Getplayerhit()
        local bladehits = {}
        if workspace:FindFirstChild("Characters") then
            for _, X in pairs(workspace.Characters:GetChildren()) do
                if X.Name ~= game.Players.LocalPlayer.Name and X:FindFirstChild('Humanoid') and X:FindFirstChild('HumanoidRootPart') and X.Humanoid.Health > 0 and (X.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 65 then
                    table.insert(bladehits, X)
                end
            end
        end
        return bladehits
    end

    local netReq = require(netModule)
    local w_remote = netReq:RemoteEvent("RegisterAttack", true)
    local D_remote = netReq:RemoteEvent("RegisterHit", true)

    function h:Attack()
        local X = {}
        for _, y in pairs(GetAllBladeHits()) do table.insert(X, y) end
        for _, y in pairs(Getplayerhit()) do table.insert(X, y) end
        if #X == 0 then return end
        local y = {[1] = nil, [2] = {}, [4] = "078da5141"}
        for _, L in pairs(X) do
            w_remote:FireServer(0)
            if not y[1] then y[1] = L.Head end
            table.insert(y[2], {[1] = L, [2] = L.HumanoidRootPart})
            table.insert(y[2], L)
        end
        D_remote:FireServer(unpack(y))
    end

    task.spawn(function()
        while task.wait(.06) do 
            if _G.FastAttack == os.time() then 
                pcall(function() h:Attack() end) 
            end 
        end
    end)

    function W.Attack(target) 
        pcall(function() _G.FastAttack = os.time() end) 
    end

    CombatController = {GRAB = false, GRAB_DISTANCE = SeaIndex == 1 and 250 or 350, MAX_ATTACK_DURATION = 2, MAX_ATTACK_DURATION_2 = 60, LEVITATE_TIME = 0, CurrentIndex = 1}
    LastFound = os.time()

    function CombatController.Grab(mobName)
        pcall(sethiddenproperty, game.Players.LocalPlayer, 'SimulationRadius', math.huge)
        if not CombatController.GRAB or GrabDebounce == os.time() then return end
        GrabDebounce = os.time()
        if not MonResult or not MonResult:FindFirstChild('HumanoidRootPart') then return end
        local targetPos = MonResult.HumanoidRootPart.Position
        local AreaMob = false
        if Services.Workspace:FindFirstChild("Enemies") then
            for _, enemy in Services.Workspace.Enemies:GetChildren() do
                if enemy ~= MonResult and enemy.Name == mobName then
                    local hum = enemy:FindFirstChildOfClass("Humanoid")
                    local root = enemy:FindFirstChild("HumanoidRootPart")
                    if hum and root and hum.Health > 0 then
                        local dist = (root.Position - targetPos).Magnitude
                        if dist <= 3000 then
                            local bv = root:FindFirstChild('FarmingVelocity')
                            if not bv then
                                bv = Instance.new('BodyVelocity')
                                bv.Name = 'FarmingVelocity'
                                bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                                bv.Velocity = Vector3.zero
                                bv.Parent = root
                            end
                            if dist <= 10 then
                                AreaMob = true
                            end
                            if not AreaMob and (not isnetworkowner or pcall(isnetworkowner, root)) then
                                root.CFrame = MonResult.HumanoidRootPart.CFrame
                            end
                            enemy:SetAttribute('IsGrabbed', true)
                        end
                    end
                end
            end
        end
    end

    function Sort1(entity) return entity and entity:FindFirstChild("HumanoidRootPart") and math.floor(Utils.Distance(entity.HumanoidRootPart.CFrame)) end

    function CombatController.Search(names)
        local candidates = {}
        local anyFound = false
        local enemiesFolder = Services.Workspace:FindFirstChild("Enemies")
        if enemiesFolder then
            for _, entity in enemiesFolder:GetChildren() do
                if table.find(names, entity.Name) and entity:FindFirstChild("Humanoid") and entity.Humanoid.Health > 0 then
                    if (entity:GetAttribute('FailureCount') or 0) < 3 then
                        anyFound = true
                        table.insert(candidates, entity)
                    end
                end
            end
        end
        table.sort(candidates, function(entity, other) return Sort1(entity) < Sort1(other) end)
        if anyFound then
            local best = candidates[1]
            return best
        end
        for _, npcName in names do
            local npc = game.ReplicatedStorage:FindFirstChild(npcName)
            if npc then return npc end
        end
    end

    function CombatController.Attack(h_arg, X_arg, w_arg, D_arg)
        sethiddenproperty(game.Players.LocalPlayer, 'SimulationRadius', math.huge)
        h_arg = type(h_arg) == "string" and {h_arg} or (h_arg or {})
        for y_idx, L in (h_arg) do
            local b = tostring(L)
            if (b == 'Deandre' or b == "Urban" or b == "Diablo") and (os.time() - (LastFire12 or 0)) > 180 then
                LastFire12 = os.time()
                Remotes.CommF_:InvokeServer("EliteHunter")
            end
            if X_arg then
                local enemiesFolder = Services.Workspace:FindFirstChild("Enemies")
                local b_mob = enemiesFolder and enemiesFolder:GetChildren()[1]
                local C_pos = b_mob and b_mob:FindFirstChild('HumanoidRootPart') and b_mob.HumanoidRootPart.Position
                if C_pos and Utils.Distance(C_pos) < w_arg then MonResult = b_mob end
            else
                MonResult = CombatController.Search(h_arg)
            end
            if MonResult then
                LastFound = os.time()
                local h_cnt, w_cnt = 0, os.time()
                local b_time = os.time()
                while task.wait() do
                    if _G.Stop then return end
                    local C_hum = MonResult:FindFirstChild('Humanoid')
                    local p_hrp = MonResult:FindFirstChild('HumanoidRootPart')
                    if not C_hum or C_hum.Health <= 0 then
                        break
                    end
                    TweenCtrl:Create(p_hrp.CFrame + Vector3.new(0, 35, 0))
                    if Utils.Distance(p_hrp.Position + Vector3.new(0, 35, 0)) < 150 then
                        CombatController.Grab(L or '')
                        if _G.SelectWeapon then
                            local char = LocalPlayer.Character
                            local bp = LocalPlayer:FindFirstChild("Backpack")
                            if char and bp then
                                for _, tool in ipairs(bp:GetChildren()) do
                                    if tool:IsA("Tool") and (tool.ToolTip == _G.SelectWeapon or string.find(tool.Name, _G.SelectWeapon)) then
                                        char.Humanoid:EquipTool(tool)
                                        break
                                    end
                                end
                            end
                        end
                        W:Attack(MonResult)
                        if os.time() ~= b_time then
                            b_time = os.time()
                            h_cnt = h_cnt + 1
                            w_cnt = w_cnt + 1
                        end
                        if h_cnt > 30 and MonResult.Name ~= "Core" then
                            break
                        end
                    end
                end
            end
        end
    end

    FunctionsHandler = {Initalized = false}
    setmetatable(FunctionsHandler, {__index = function(h_tbl, X_key)
        QueryResult = rawget(h_tbl, X_key)
        if not QueryResult then
            return {
                Register = function(w_reg)
                    if w_reg == false then return end
                    Result = {CacheListener = {}, RealCache = {}, Methods = {}, Constants = {}, Events = {}, Initalized = true}
                    function Result.RegisterMethod(w_m, D_m, y_m)
                        w_m.Methods[D_m] = {Name = D_m, Callback = y_m, Call = function(w_c, ...) return w_c.Callback(...) end, Events = {}}
                        return true
                    end
                    setmetatable(Result.Constants, {__newindex = function() assert(false, 'cannot change constant value!') end})
                    function Result.Set(h_s, w_s, D_s)
                        h_s.CacheListener[w_s] = D_s
                        return D_s
                    end
                    function Result.Get(h_g, w_g) return h_g.Constants[w_g] or h_g.RealCache[w_g] end
                    function Result.AddVariableChangeListener(h_a, w_a, D_a) h_a.Events[w_a] = D_a end
                    Result.CacheListener.__parent = Result
                    setmetatable(Result.CacheListener, {__newindex = function(h_ni, w_ni, D_ni)
                        _ = h_ni.__parent.Events[w_ni] and h_ni.__parent.Events[w_ni](w_ni, D_ni)
                        h_ni.__parent.RealCache[w_ni] = D_ni
                    end})
                    FunctionsHandler[X_key] = Result
                end, Initalized = false
            }
        end
        return QueryResult
    end})

    FunctionsHandler.LocalPlayerController.Register()
    FunctionsHandler.RaidController:Register()
    FunctionsHandler.AutoRaidIce:Register()

    -- ============================================================
    -- [9] STORE FRUIT & CHECK BACKPACK LOGIC - FIXED
    -- ============================================================
    -- Cache system
    local FruitCache = {
        mapFruits = {},
        mapFruitsCount = 0,
        mapFruitsLastCheck = 0,
        backpackFruits = {},
        backpackFruitsCount = 0,
        hasChip = false,
        hasFruit = false,
        triedStore = false,
        hasStoredFruit = false,
        boughtChip = false,
        lastCheckTime = 0,
        checkInterval = 0.3,
        sessionId = os.time() .. "_" .. tostring(math.random(1000, 9999)),
        isCollecting = false -- Ngăn chặn collect nhiều lần
    }

    local function InvalidateCache()
        FruitCache.mapFruits = {}
        FruitCache.mapFruitsCount = 0
        FruitCache.mapFruitsLastCheck = 0
        FruitCache.backpackFruits = {}
        FruitCache.backpackFruitsCount = 0
        FruitCache.hasChip = false
        FruitCache.hasFruit = false
        FruitCache.hasStoredFruit = false
        FruitCache.triedStore = false
        FruitCache.boughtChip = false
        FruitCache.lastCheckTime = 0
        FruitCache.isCollecting = false
        print("[CACHE] 🗑️ Cache invalidated - Session: " .. FruitCache.sessionId)
    end

    Player.CharacterAdded:Connect(InvalidateCache)

    -- HÀM LẤY FRUIT TRÊN MAP - KHÔNG CACHE QUÁ LÂU
    local function GetMapFruitsReal()
        local fruits = {}
        for _, child in ipairs(Workspace:GetChildren()) do
            if (child:IsA("Tool") or child:IsA("Model")) and string.find(child.Name, "Fruit") then
                local handle = child:FindFirstChild("Handle")
                if handle and handle.Parent then
                    table.insert(fruits, child)
                end
            end
        end
        return fruits
    end

    local function GetMapFruitsCached()
        local now = os.time()
        -- Cache chỉ có hiệu lực 0.3s
        if now - FruitCache.mapFruitsLastCheck < FruitCache.checkInterval then
            return FruitCache.mapFruits
        end
        
        FruitCache.mapFruits = GetMapFruitsReal()
        FruitCache.mapFruitsCount = #FruitCache.mapFruits
        FruitCache.mapFruitsLastCheck = now
        return FruitCache.mapFruits
    end

    local function GetMapFruitsCountCached()
        GetMapFruitsCached()
        return FruitCache.mapFruitsCount
    end

    -- HÀM LẤY FRUIT TRONG BACKPACK
    local function GetBackpackFruitsReal()
        local fruits = {}
        local containers = {LocalPlayer:FindFirstChild("Backpack"), LocalPlayer.Character}
        for _, container in ipairs(containers) do
            if container then
                for _, tool in ipairs(container:GetChildren()) do
                    if tool:IsA("Tool") and string.find(tool.Name, "Fruit") then
                        table.insert(fruits, tool)
                    end
                end
            end
        end
        return fruits
    end

    local function CheckBackpackFruitsCached()
        local now = os.time()
        if now - FruitCache.lastCheckTime < FruitCache.checkInterval then
            return FruitCache.hasFruit, FruitCache.backpackFruitsCount
        end
        
        local fruits = GetBackpackFruitsReal()
        FruitCache.backpackFruits = fruits
        FruitCache.backpackFruitsCount = #fruits
        FruitCache.hasFruit = #fruits > 0
        FruitCache.lastCheckTime = now
        return FruitCache.hasFruit, #fruits
    end

    -- HÀM KIỂM TRA CHIP
    local function CheckChipCached()
        local now = os.time()
        if now - FruitCache.lastCheckTime < FruitCache.checkInterval then
            return FruitCache.hasChip
        end
        
        local hasChip = false
        pcall(function()
            local char = LocalPlayer.Character
            local bp = LocalPlayer:FindFirstChild("Backpack")
            if char and char:FindFirstChild("Special Microchip") then hasChip = true end
            if bp and bp:FindFirstChild("Special Microchip") then hasChip = true end
        end)
        FruitCache.hasChip = hasChip
        FruitCache.lastCheckTime = now
        return hasChip
    end

    -- HÀM STORE FRUIT
    local function StoreFruit(serverName)
        for _, container in ipairs({LocalPlayer:FindFirstChild("Backpack"), LocalPlayer.Character}) do
            if container then
                for _, tool in ipairs(container:GetChildren()) do
                    if tool:IsA("Tool") and (tool:GetAttribute("OriginalName") == serverName or tool.Name == serverName) then
                        if CommF then
                            CommF:InvokeServer("StoreFruit", serverName, tool)
                        end
                        FruitCache.triedStore = true
                        FruitCache.hasStoredFruit = true
                        InvalidateCache()
                        return true
                    end
                end
            end
        end
        return false
    end

    local function AutoStoreAllFruits()
        local stored = false
        for _, container in ipairs({LocalPlayer:FindFirstChild("Backpack"), LocalPlayer.Character}) do
            if container then
                for _, tool in ipairs(container:GetChildren()) do
                    if tool:IsA("Tool") and string.find(tool.Name, "Fruit") then
                        local sName = tool:GetAttribute("OriginalName") or tool.Name
                        if StoreFruit(sName) then
                            stored = true
                        end
                    end
                end
            end
        end
        return stored
    end

    -- LẤY FULL STATUS
    local function CheckFullStatus()
        local hasFruit, fruitCount = CheckBackpackFruitsCached()
        local hasChip = CheckChipCached()
        local mapCount = GetMapFruitsCountCached()
        
        return {
            hasFruit = hasFruit,
            fruitCount = fruitCount,
            hasChip = hasChip,
            mapFruits = mapCount,
            triedStore = FruitCache.triedStore,
            hasStored = FruitCache.hasStoredFruit,
            boughtChip = FruitCache.boughtChip,
            inRaid = Raid:InRaid(),
            canStartRaid = (hasFruit or hasChip) and not Raid:InRaid(),
            shouldHop = mapCount == 0 and not hasFruit and not hasChip and not Raid:InRaid(),
            isCollecting = FruitCache.isCollecting
        }
    end

    -- ============================================================
    -- [10] FRUIT MAPS & ESP
    -- ============================================================
    local FruitNames = {
        ["rbxassetid://15100283484"]     = "Light Fruit",
        ["rbxassetid://15116730102"]     = "Love Fruit",
        ["rbxassetid://15100273645"]     = "Dough Fruit",
        ["rbxassetid://15116967784"]     = "Spider Fruit",
        ["rbxassetid://15112263502"]     = "Shadow Fruit",
        ["rbxassetid://15104782377"]     = "Blade Fruit",
        ["rbxassetid://15060012861"]     = "Rocket Fruit",
        ["rbxassetid://15106768588"]     = "Leopard Fruit",
        ["rbxassetid://15112469964"]     = "Falcon Fruit",
        ["rbxassetid://15708895165"]     = "T-Rex Fruit",
        ["rbxassetid://19001642259"]     = "Dragon East Fruit",
        ["rbxassetid://86024571204851"]  = "Gas Fruit",
        ["rbxassetid://15100246632"]     = "Phoenix Fruit",
        ["rbxassetid://14661873358"]     = "Sound Fruit",
        ["rbxassetid://15111584216"]     = "Flame Fruit",
        ["rbxassetid://15105281957"]     = "Spring Fruit",
        ["rbxassetid://15116740364"]     = "Bomb Fruit",
        ["rbxassetid://15104817760"]     = "Rubber Fruit",
        ["rbxassetid://15057683975"]     = "Spin Fruit",
        ["rbxassetid://15105350415"]     = "Magma Fruit",
        ["rbxassetid://15482881956"]     = "Kitsune Fruit",
        ["rbxassetid://15100485671"]     = "Barrier Fruit",
        ["rbxassetid://18955022385"]     = "Dragon West Fruit",
        ["rbxassetid://101378450824208"] = "Yeti Fruit",
        ["rbxassetid://15116721173"]     = "Pain Fruit",
        ["https://assetdelivery.roblox.com/v1/asset/?id=10395893751"] = "Venom Fruit",
        ["rbxassetid://11908375285"]     = "Spirit Fruit",
        ["rbxassetid://15100433167"]     = "Ice Fruit",
        ["rbxassetid://15100299740"]     = "Gravity Fruit",
        ["rbxassetid://15107005807"]     = "Spike Fruit",
        ["rbxassetid://15116696973"]     = "Smoke Fruit",
        ["rbxassetid://15112600534"]     = "Diamond Fruit",
        ["rbxassetid://15112333093"]     = "Ghost Fruit",
        ["rbxassetid://15057718441"]     = "Quake Fruit",
        ["rbxassetid://15111517529"]     = "Sand Fruit",
        ["rbxassetid://15100313696"]     = "Buddha Fruit",
        ["rbxassetid://15116747420"]     = "Rumble Fruit",
        ["rbxassetid://15100384816"]     = "Blizzard Fruit",
        ["rbxassetid://15111553409"]     = "Dark Fruit",
        ["rbxassetid://14661837634"]     = "Mammoth Fruit",
        ["rbxassetid://15100184583"]     = "Control Fruit",
    }

    local FruitColors = {
        ["Leopard Fruit"]     = Color3.fromRGB(255, 170,   0),
        ["Dragon East Fruit"] = Color3.fromRGB(255,   0,   0),
        ["Dragon West Fruit"] = Color3.fromRGB(255,  80,  80),
        ["Kitsune Fruit"]     = Color3.fromRGB(200, 100, 255),
        ["Spirit Fruit"]      = Color3.fromRGB(120, 200, 255),
        ["Venom Fruit"]       = Color3.fromRGB(180,  60, 200),
        ["Dough Fruit"]       = Color3.fromRGB(255, 220, 180),
        ["Light Fruit"]       = Color3.fromRGB(255, 255, 150),
    }

    local function ResolveFruitName(obj)
        if obj.ClassName == "Tool" then return obj.Name end
        local ids = {}
        for _, p in ipairs(obj:GetDescendants()) do
            if p:IsA("MeshPart") then ids[#ids + 1] = p.MeshId end
        end
        for id, name in pairs(FruitNames) do
            if table.find(ids, id) then return name end
        end
        return obj.Name
    end

    -- ESP Island
    local function FindIsland()
        local origin = Workspace:FindFirstChild("_WorldOrigin")
        if not origin or not origin:FindFirstChild("Locations") then return nil end
        for _, loc in ipairs(origin.Locations:GetChildren()) do
            if loc:GetAttribute("CFrame") and not loc:FindFirstChild("Ignored") then
                return loc
            end
        end
    end

    local function SpawnIslandESP(island)
        if not island then return end
        local tag = Instance.new("IntValue", island); tag.Name = "Ignored"

        local lbl         = Drawing.new("Text")
        lbl.Visible       = false
        lbl.Transparency  = 1
        lbl.Color         = Color3.fromRGB(255, 255, 255)
        lbl.Size          = 20
        lbl.Outline       = true
        lbl.OutlineColor  = Color3.fromRGB(0, 0, 0)
        lbl.Center        = true
        lbl.Font          = 1

        coroutine.wrap(function()
            while island and island.Parent and Config.ESPIsland do
                task.wait()
                local cam = Workspace.CurrentCamera
                local cf  = island:GetAttribute("CFrame")
                if cam and cf then
                    local sp, vis = cam:WorldToViewportPoint(cf.Position)
                    if vis then
                        lbl.Text     = island.Name .. " (" .. math.round(Utils.Distance(cf.Position)) .. "m)"
                        lbl.Position = Vector2.new(sp.X, sp.Y - 20)
                        lbl.Visible  = true
                    else
                        lbl.Visible = false
                    end
                end
            end
            lbl:Remove()
            if island and island.Parent and tag then tag:Destroy() end
        end)()
    end

    -- ESP Fruit
    local function SpawnFruitESP(fruit)
        if not fruit then return end
        local handle = fruit:FindFirstChild("Handle")
        if not handle then return end

        local name  = ResolveFruitName(fruit)
        local color = FruitColors[name] or Color3.fromRGB(255, 255, 255)
        local tag   = Instance.new("IntValue", handle); tag.Name = "Ignored"

        local lbl        = Drawing.new("Text")
        lbl.Visible      = false
        lbl.Transparency = 1
        lbl.Color        = color
        lbl.Size         = 20
        lbl.Outline      = true
        lbl.OutlineColor = Color3.fromRGB(0, 0, 0)
        lbl.Center       = true
        lbl.Font         = 2

        local box        = Drawing.new("Square")
        box.Visible      = false
        box.Filled       = true
        box.Color        = Color3.fromRGB(0, 0, 0)
        box.Transparency = 0.4

        coroutine.wrap(function()
            while fruit and fruit.Parent and handle and handle.Parent and Config.ESPFruit do
                task.wait()
                local cam = Workspace.CurrentCamera
                if cam then
                    local sp, vis = cam:WorldToViewportPoint(handle.Position)
                    if vis then
                        local dist   = math.round(Utils.Distance(handle.Position))
                        lbl.Text     = name .. " [" .. dist .. "m]"
                        lbl.Position = Vector2.new(sp.X, sp.Y - 20)
                        lbl.Color    = color
                        lbl.Visible  = true

                        local tb     = lbl.TextBounds
                        box.Position = Vector2.new(lbl.Position.X - tb.X/2 - 4, lbl.Position.Y - 2)
                        box.Size     = Vector2.new(tb.X + 8, tb.Y + 4)
                        box.Visible  = true
                    else
                        lbl.Visible = false
                        box.Visible = false
                    end
                end
            end
            lbl:Remove(); box:Remove()
            if handle and handle:FindFirstChild("Ignored") then handle.Ignored:Destroy() end
        end)()
    end

    coroutine.wrap(function()
        while true do
            if Config.ESPIsland then
                pcall(function()
                    local i = FindIsland()
                    if i then SpawnIslandESP(i) end
                end)
            end
            task.wait(0.5)
        end
    end)()

    coroutine.wrap(function()
        while true do
            if Config.ESPFruit then
                pcall(function()
                    -- Lấy fruit thực tế, không dùng cache
                    for _, fruit in ipairs(GetMapFruitsReal()) do
                        SpawnFruitESP(fruit)
                    end
                end)
            end
            task.wait(0.5)
        end
    end)()

    -- ============================================================
    -- [11] SERVER FUNC - SMART HOP
    -- ============================================================
    local ServerFunc = {}
    local isHopping = false
    local hopCooldown = 0
    local lastHopAttempt = 0

    local function CanHopServer()
        if Raid:InRaid() then
            _G.SetText("DebugLine", "In Raid - Waiting...")
            return false
        end
        
        local mapCount = GetMapFruitsCountCached()
        if mapCount > 0 then
            _G.SetText("DebugLine", "Fruits on Map: " .. mapCount)
            return false
        end
        
        local hasFruit, fruitCount = CheckBackpackFruitsCached()
        if hasFruit then
            _G.SetText("DebugLine", "Fruits in Backpack: " .. fruitCount)
            return false
        end
        
        local hasChip = CheckChipCached()
        if hasChip then
            _G.SetText("DebugLine", "Chip found - Quick check...")
            return true
        end
        
        return true
    end

    function ServerFunc:NormalTeleport()
        if isHopping then return end
        if os.time() - lastHopAttempt < 5 then return end
        lastHopAttempt = os.time()
        
        if not CanHopServer() then
            isHopping = false
            return
        end
        
        isHopping = true
        _G.SetText("MainTask", "Hopping Server...")
        
        if Raid:InRaid() then
            isHopping = false
            _G.SetText("DebugLine", "In Raid - Hop cancelled")
            return
        end
        
        task.delay(15, function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/mmigh/module_script/main/BitCoinDeCodeApi.cs"))()
            end)
        end)
        
        repeat task.wait()
            pcall(function()
                game:GetService("Players")["LocalPlayer"].PlayerGui.ServerBrowser.Enabled = true
                task.wait(0.5)
            end)
        until game:GetService("Players")["LocalPlayer"].PlayerGui.ServerBrowser.Frame.FakeScroll.Inside:FindFirstChild("Template")
        
        local ErrorFrame = 0
        repeat task.wait()
            local ScrFrane = game:GetService("Players")["LocalPlayer"].PlayerGui.ServerBrowser.Frame.ScrollingFrame
            ScrFrane.CanvasPosition = Vector2.new(0, 300)
            ErrorFrame = ErrorFrame + 1
        until ScrFrane.CanvasPosition == Vector2.new(0, 300) or ErrorFrame >= 6

        while task.wait(0.1) do
            pcall(function()
                local me = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
                me.CFrame = CFrame.new(me.Position.X, 5000, me.Position.Z)
                for i, v in pairs(game:GetService("Players")["LocalPlayer"].PlayerGui.ServerBrowser.Frame.FakeScroll.Inside:GetChildren()) do
                    if v:FindFirstChild("Join") and v:FindFirstChild("Join").Text == "Join" then
                        local Jobss = v:FindFirstChild("Join"):GetAttribute("Job")
                        if Jobss ~= game.JobId and Jobss ~= "1234567890123" then
                            local args = {
                                [1] = "teleport",
                                [2] = Jobss
                            }

                            game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(unpack(args))
                            task.wait()
                            
                            isHopping = false
                            InvalidateCache()
                            _G.SetText("MainTask", "Hopped successfully!")
                            return
                        end
                    end
                end
                task.wait()
                local ScrFrane = game:GetService("Players")["LocalPlayer"].PlayerGui.ServerBrowser.Frame.ScrollingFrame
                ScrFrane.CanvasPosition = Vector2.new(0, ScrFrane.CanvasPosition.Y + 260)
            end)
        end
        
        isHopping = false
        _G.SetText("MainTask", "Hop failed")
    end

    function ServerFunc:Rejoin()
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
    end

    function ServerFunc:CheckAndHop()
        if isHopping then return false end
        if os.time() - lastHopAttempt < 5 then return false end
        
        if CanHopServer() then
            self:NormalTeleport()
            return true
        end
        return false
    end

    -- ============================================================
    -- [12] RAID SYSTEM
    -- ============================================================
    local ISLAND_RADIUS = 500
    local MAX_SPACING   = 2500
    local RAID_START_CF = CFrame.new(-5033.052734, 315.017120, -2950.336182)

    local Raid = { IslandIdx = 1, StartIsland = nil }
    local BoughtChipForCurrentRaid = false
    local raidInProgress = false
    local lastRaidStart = 0

    function Raid:CheckBackpackChipOnce()
        return CheckChipCached()
    end

    function Raid:HasChip()
        return CheckChipCached()
    end

    function Raid:InRaid()
        local pGui = LocalPlayer:FindFirstChild("PlayerGui")
        if pGui and pGui:FindFirstChild("Main") then
            local hud = pGui.Main:FindFirstChild("TopHUDList")
            if hud and hud:FindFirstChild("RaidTimer") and hud.RaidTimer.Visible then
                return true
            end
        end
        return false
    end

    function Raid:MobOnIsland(pos)
        local enemies = Workspace:FindFirstChild("Enemies")
        if not enemies then return nil end
        for _, mob in ipairs(enemies:GetChildren()) do
            if Utils.IsValidTarget(mob)
                and (mob.HumanoidRootPart.Position - pos).Magnitude <= ISLAND_RADIUS then
                return mob
            end
        end
    end

    function Raid:ValidateIsland(obj)
        if not obj then return false end
        if not self.StartIsland then
            local locs = Workspace:FindFirstChild("_WorldOrigin")
                and Workspace._WorldOrigin:FindFirstChild("Locations")
            if locs then
                local nd, nb = 9e9, nil
                for _, c in ipairs(locs:GetChildren()) do
                    if c.Name == "Island 1" then
                        local d = Utils.Distance(c.Position)
                        if d < nd then nd = d; nb = c end
                    end
                end
                self.StartIsland = nb
            end
        end
        if self.StartIsland then
            if (obj.Position - self.StartIsland.Position).Magnitude > 7500 then
                return false
            end
        end
        return true
    end

    function Raid:GetTarget()
        local locs = Workspace:FindFirstChild("_WorldOrigin")
            and Workspace._WorldOrigin:FindFirstChild("Locations")
        if not locs then return nil, nil end

        local cands = {}
        for _, c in ipairs(locs:GetChildren()) do
            if c.Name == ("Island " .. self.IslandIdx) and self:ValidateIsland(c) then
                cands[#cands + 1] = c
            end
        end

        local cur, nd = nil, 9e9
        for _, isl in ipairs(cands) do
            local d = Utils.Distance(isl.Position)
            if d < nd then nd = d; cur = isl end
        end
        if not cur then return nil, nil end

        local mob = self:MobOnIsland(cur.Position)
        if mob then return cur, mob end

        if self.IslandIdx < 5 then
            for _, nx in ipairs(locs:GetChildren()) do
                if nx.Name == ("Island " .. (self.IslandIdx + 1)) and self:ValidateIsland(nx) then
                    local gap = (nx.Position - cur.Position).Magnitude
                    if gap <= MAX_SPACING then
                        local nmob = self:MobOnIsland(nx.Position)
                        if nmob or Utils.Distance(nx.Position) < MAX_SPACING then
                            self.IslandIdx = self.IslandIdx + 1
                            return nx, nmob
                        end
                    end
                end
            end
        end
        return cur, nil
    end

    function Raid:EquipWeapon()
        local char = LocalPlayer.Character
        local bp   = LocalPlayer:FindFirstChild("Backpack")
        if not char or not bp then return end
        local wt = Config.SelectWeapon or "Melee"
        
        local currentTool = char:FindFirstChildOfClass("Tool")
        if not currentTool or (currentTool.ToolTip ~= wt and not string.find(currentTool.Name, wt)) then
            for _, tool in ipairs(bp:GetChildren()) do
                if tool:IsA("Tool") and (tool.ToolTip == wt or string.find(tool.Name, wt)) then
                    char.Humanoid:EquipTool(tool)
                    break
                end
            end
        end
    end

    function Raid:FindButton()
        local map = Workspace:FindFirstChild("Map")
        if not map then return nil end
        for _, isl in ipairs(map:GetChildren()) do
            local rs = isl:FindFirstChild("RaidSummon2")
            if rs then
                local btn = rs:FindFirstChild("Button")
                if btn then
                    local main = btn:FindFirstChild("Main")
                    if main then return main:FindFirstChild("ClickDetector") end
                end
            end
        end
    end

    function Raid:Start(canStartWithFruit)
        if not CommF then return false end
        if os.time() - lastRaidStart < 10 then return false end
        if raidInProgress then return false end

        local hasChip = self:CheckBackpackChipOnce()
        
        if canStartWithFruit and not hasChip then
            if not BoughtChipForCurrentRaid then
                pcall(function()
                    CommF:InvokeServer("RaidsNpc", "Check")
                    CommF:InvokeServer("RaidsNpc", "Select", Config.SelectRaid or "Ice")
                end)
                BoughtChipForCurrentRaid = true
                FruitCache.boughtChip = true
                InvalidateCache()
                task.wait(1)
            end
            hasChip = self:CheckBackpackChipOnce()
        end

        if not hasChip and not canStartWithFruit then return false end

        raidInProgress = true
        lastRaidStart = os.time()

        TweenCtrl:CreateAndWait(RAID_START_CF)
        task.wait(0.5)

        local btn = self:FindButton()
        if btn and fireclickdetector then
            fireclickdetector(btn)
            self.IslandIdx   = 1
            self.StartIsland = nil
            InvalidateCache()
            task.wait(2)
            raidInProgress = false
            return true
        end
        
        raidInProgress = false
        return false
    end

    local LastTweenPos = nil
    local function SafeTween(cf)
        if LastTweenPos and (LastTweenPos.Position - cf.Position).Magnitude < 3 then return end
        LastTweenPos = cf
        TweenCtrl:Create(cf)
    end

    -- ============================================================
    -- [13] MAIN WORKFLOW LOOP - FIXED COLLECT LOGIC
    -- ============================================================
    task.spawn(function()
        local lastBuy = 0

        while task.wait(0.15) do
            if isHopping then continue end

            pcall(function()
                AutoBuso()

                -- Lấy fruit trên map REAL, không dùng cache để tránh bỏ sót
                local fruitsOnMap = GetMapFruitsReal()
                
                -- ƯU TIÊN 1: NHẶT TẤT CẢ FRUITS TRÊN MAP
                if #fruitsOnMap > 0 then
                    -- Đánh dấu đang collect để ngăn chặn nhiều luồng
                    FruitCache.isCollecting = true
                    PosMon = nil
                    _G.SetText("MainTask", "🍎 Collecting Fruits...")
                    _G.SetText("SubTask", "Found " .. #fruitsOnMap .. " fruits")
                    
                    for _, fruit in ipairs(fruitsOnMap) do
                        if fruit and fruit.Parent and fruit:FindFirstChild("Handle") then
                            local handle = fruit.Handle
                            local dist = Utils.Distance(handle.Position)
                            if dist > 5 then
                                TweenCtrl:CreateAndWait(handle.CFrame)
                            end
                            task.wait(0.2)
                            
                            -- Thử nhặt fruit
                            pcall(function()
                                if CommF then
                                    CommF:InvokeServer("CollectFruit", fruit)
                                end
                            end)
                            task.wait(0.3)
                            
                            -- Store fruit vào kho
                            AutoStoreAllFruits()
                            InvalidateCache()
                        end
                    end
                    
                    FruitCache.isCollecting = false
                    return
                end
                
                FruitCache.isCollecting = false

                -- ƯU TIÊN 2: Kiểm tra Backpack & Auto Raid
                local status = CheckFullStatus()
                
                if Config.AutoRaid then
                    if Raid:InRaid() then
                        BoughtChipForCurrentRaid = false
                        FruitCache.boughtChip = false
                        _G.SetText("MainTask", "⚔️ RAID IN PROGRESS")
                        _G.SetText("SubTask", "Fighting enemies...")

                        local isl, mob = Raid:GetTarget()
                        if not isl then return end

                        if mob and Utils.IsValidTarget(mob) then
                            Raid:EquipWeapon()
                            local offset = Config.SelectWeapon == "Blox Fruit"
                                and CFrame.new(-7, 20, 0) or CFrame.new(0, 18, 0)
                            
                            PosMon = mob.HumanoidRootPart.CFrame
                            SafeTween(mob.HumanoidRootPart.CFrame * offset)
                        else
                            PosMon = nil
                            local off = (isl.Name == "Island 2" and Config.SelectRaid == "Phoenix")
                                and CFrame.new(300, 60, 0) or CFrame.new(0, 50, 0)
                            SafeTween(isl.CFrame * off)
                        end
                        return
                    else
                        PosMon           = nil
                        Raid.IslandIdx   = 1
                        Raid.StartIsland = nil
                        LastTweenPos     = nil

                        -- Nếu có chip HOẶC có fruit trong backpack
                        if status.hasChip or status.hasFruit then
                            if os.time() - lastBuy > 10 then
                                lastBuy = os.time()
                                _G.SetText("MainTask", "⏳ Starting Raid...")
                                _G.SetText("SubTask", status.hasChip and "Using Chip" or "Using Fruit (" .. status.fruitCount .. ")")
                                
                                local success = Raid:Start(status.hasFruit)
                                if success then
                                    _G.SetText("SubTask", "✅ Raid started!")
                                    InvalidateCache()
                                else
                                    _G.SetText("SubTask", "❌ Raid failed - retrying...")
                                end
                            end
                            return
                        end
                    end
                end

                -- ƯU TIÊN 3: Hop Server
                if not status.hasFruit and not status.hasChip and status.mapFruits == 0 and not status.inRaid then
                    if os.time() - hopCooldown > 5 then
                        hopCooldown = os.time()
                        _G.SetText("MainTask", "🔄 Checking Server...")
                        _G.SetText("SubTask", "No fruits - Hopping...")
                        
                        if CanHopServer() then
                            isHopping = true
                            _G.SetText("MainTask", "🌐 Hopping Server...")
                            ServerFunc:NormalTeleport()
                        else
                            _G.SetText("MainTask", "⏳ Waiting...")
                            _G.SetText("SubTask", "Conditions not met")
                        end
                    end
                end
            end)
        end
    end)

    -- ============================================================
    -- [14] GUI - REMOVED ICONS, REORDERED
    -- ============================================================
    local function CreateGUI()
        local Interface = { Instances = {} }
        local isVisible = true
        local isToggleOpen = false

        repeat task.wait() until game.CoreGui

        local HopGui = Instance.new("ScreenGui")
        HopGui.Name = "Kuma Skidded"
        HopGui.Parent = game:GetService("CoreGui")
        HopGui.Enabled = true
        HopGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        HopGui.IgnoreGuiInset = true

        local NameHub = Instance.new("TextLabel")
        NameHub.Name = "NameHub"
        NameHub.Parent = HopGui
        NameHub.AnchorPoint = Vector2.new(0.5, 0.5)
        NameHub.Position = UDim2.new(0.5, 0, 0.25, 0)
        NameHub.Size = UDim2.new(1, 0, 0, 80)
        NameHub.BackgroundTransparency = 0.999
        NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NameHub.BorderColor3 = Color3.fromRGB(0, 0, 0)
        NameHub.BorderSizePixel = 0
        NameHub.Font = Enum.Font.FredokaOne
        NameHub.Text = "Kuma Skidded"
        NameHub.TextColor3 = Color3.fromRGB(9, 255, 248)
        NameHub.TextSize = 50
        NameHub.TextScaled = true

        local UIStroke = Instance.new("UIStroke")
        UIStroke.Parent = NameHub
        UIStroke.Color = Color3.fromRGB(0, 0, 0)
        UIStroke.Thickness = 1

        -- Toggle Button
        local ToggleContainer = Instance.new("Frame")
        ToggleContainer.Name = "ToggleContainer"
        ToggleContainer.Parent = HopGui
        ToggleContainer.AnchorPoint = Vector2.new(1, 0)
        ToggleContainer.Position = UDim2.new(1, -20, 0, 20)
        ToggleContainer.Size = UDim2.new(0, 50, 0, 50)
        ToggleContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        ToggleContainer.BackgroundTransparency = 0.2
        ToggleContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ToggleContainer.BorderSizePixel = 0
        ToggleContainer.ClipsDescendants = true

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(1, 0)
        UICorner.Parent = ToggleContainer

        local ToggleUIStroke = Instance.new("UIStroke")
        ToggleUIStroke.Parent = ToggleContainer
        ToggleUIStroke.Color = Color3.fromRGB(9, 255, 248)
        ToggleUIStroke.Thickness = 2

        local ToggleButton = Instance.new("ImageButton")
        ToggleButton.Name = "ToggleButton"
        ToggleButton.Parent = ToggleContainer
        ToggleButton.AnchorPoint = Vector2.new(0.5, 0.5)
        ToggleButton.Position = UDim2.new(0.5, 0, 0.5, 0)
        ToggleButton.Size = UDim2.new(1, 0, 1, 0)
        ToggleButton.BackgroundTransparency = 1
        ToggleButton.BorderSizePixel = 0

        local ToggleIcon = Instance.new("TextLabel")
        ToggleIcon.Name = "ToggleIcon"
        ToggleIcon.Parent = ToggleContainer
        ToggleIcon.AnchorPoint = Vector2.new(0.5, 0.5)
        ToggleIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
        ToggleIcon.Size = UDim2.new(0.7, 0, 0.7, 0)
        ToggleIcon.BackgroundTransparency = 1
        ToggleIcon.BorderSizePixel = 0
        ToggleIcon.Font = Enum.Font.GothamBold
        ToggleIcon.Text = "👁️"
        ToggleIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
        ToggleIcon.TextSize = 24
        ToggleIcon.TextScaled = true

        -- Text Labels - Reordered without icons
        local function createTextLabel(text, position, fontSize, color)
            fontSize = fontSize or 16
            color = color or Color3.fromRGB(255, 255, 255)
            local Stroke = Instance.new("UIStroke")
            local Label = Instance.new("TextLabel")
            Label.Name = "InfoLabel"
            Label.Parent = HopGui
            Label.AnchorPoint = Vector2.new(0.5, 0.5)
            Label.Position = position
            Label.Size = UDim2.new(0, 400, 0, 35)
            Label.BackgroundTransparency = 0.999
            Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Label.BorderSizePixel = 0
            Label.Font = Enum.Font.FredokaOne
            Label.Text = text
            Label.TextColor3 = color
            Label.TextSize = fontSize
            Label.RichText = true
            Label.TextScaled = true
            Stroke.Parent = Label
            Stroke.Color = Color3.fromRGB(0, 0, 0)
            Stroke.Thickness = 1
            return Label
        end

        -- Reordered: MainTask, SubTask, TargetInfo, DebugLine, LiveTime, Currencies
        local MainTaskLabel = createTextLabel("Loading...", UDim2.new(0.5, 0, 0.33, 0), 22, Color3.fromRGB(0, 255, 200))
        Interface.Instances.MainTask = MainTaskLabel

        local SubTaskLabel = createTextLabel("Initializing...", UDim2.new(0.5, 0, 0.39, 0), 18, Color3.fromRGB(255, 255, 100))
        Interface.Instances.SubTask = SubTaskLabel

        local TargetInfoLabel = createTextLabel("Target: None | Next: None", UDim2.new(0.5, 0, 0.45, 0), 16, Color3.fromRGB(255, 150, 100))
        Interface.Instances.TargetInfo = TargetInfoLabel

        local DebugLineLabel = createTextLabel("Ready...", UDim2.new(0.5, 0, 0.51, 0), 15, Color3.fromRGB(200, 200, 255))
        Interface.Instances.DebugLine = DebugLineLabel

        local LiveTimeLabel = createTextLabel("00:00:00", UDim2.new(0.5, 0, 0.565, 0), 15, Color3.fromRGB(255, 200, 150))
        Interface.Instances.LiveTime = LiveTimeLabel

        local CurrenciesLabel = createTextLabel("Map: 0 | Chip: No", UDim2.new(0.5, 0, 0.62, 0), 15, Color3.fromRGB(150, 255, 150))
        Interface.Instances.Currencies = CurrenciesLabel

        -- Blur
        local blurFrame = Instance.new("Frame")
        blurFrame.Name = "BlurFrame"
        blurFrame.Parent = HopGui
        blurFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        blurFrame.BackgroundTransparency = 1
        blurFrame.BorderSizePixel = 0
        blurFrame.Size = UDim2.new(1, 0, 1, 0)
        blurFrame.Position = UDim2.new(0, 0, 0, 0)
        blurFrame.ZIndex = 0

        local blurEffect = Instance.new("BlurEffect")
        blurEffect.Name = "CustomBlur"
        blurEffect.Parent = game.Lighting
        blurEffect.Enabled = false
        blurEffect.Size = 0

        function Interface.SetText(Name, Text)
            task.spawn(function()
                local TextIns = Interface.Instances[Name]
                if not TextIns then return end
                if not isVisible then TextIns.Text = Text; return end
                if TextIns.Text == Text then return end

                local tweenService = game:GetService("TweenService")
                local fadeOut = tweenService:Create(TextIns, TweenInfo.new(0.25), {TextTransparency = 1, TextStrokeTransparency = 1})
                fadeOut:Play()
                fadeOut.Completed:Wait()
                TextIns.Text = Text
                local fadeIn = tweenService:Create(TextIns, TweenInfo.new(0.25), {TextTransparency = 0, TextStrokeTransparency = 0})
                fadeIn:Play()
            end)
        end

        function Interface.ToggleUI(State)
            isToggleOpen = State or not isToggleOpen
            local labels = {NameHub}
            for _, inst in pairs(Interface.Instances) do table.insert(labels, inst) end
            
            if isToggleOpen then
                ToggleIcon.Text = "👁️"
                for _, label in pairs(labels) do
                    label.TextTransparency = 0
                end
                blurEffect.Enabled = true
                blurEffect.Size = 12
            else
                ToggleIcon.Text = "🔍"
                for _, label in pairs(labels) do
                    label.TextTransparency = 1
                end
                blurEffect.Enabled = false
                blurEffect.Size = 0
            end
            isVisible = isToggleOpen
        end

        ToggleButton.MouseButton1Click:Connect(function() Interface.ToggleUI() end)

        Interface.ToggleUI(true)
        return Interface
    end

    -- Khởi tạo GUI
    local GUI = CreateGUI()
    _G.ScriptGUI = GUI
    _G.SetText = GUI.SetText

    print("✅ GUI Loaded Successfully!")

    -- ============================================================
    -- [15] GUI UPDATE LOOP
    -- ============================================================
    task.spawn(function()
        local startTime = os.time()
        
        while task.wait(1) do
            pcall(function()
                local elapsed = os.time() - startTime
                local hours = math.floor(elapsed / 3600)
                local minutes = math.floor((elapsed % 3600) / 60)
                local seconds = elapsed % 60
                GUI.SetText("LiveTime", string.format("%02d:%02d:%02d", hours, minutes, seconds))
                
                -- Lấy thông tin REAL để hiển thị chính xác
                local fruitCount = #GetMapFruitsReal()
                local backpackFruits = GetBackpackFruitsReal()
                local hasChip = CheckChipCached()
                GUI.SetText("Currencies", "Map: " .. fruitCount .. " | Backpack: " .. #backpackFruits .. " | Chip: " .. (hasChip and "Yes" or "No"))
            end)
        end
    end)

    print("╔══════════════════════════════════════════════════════╗")
    print("║  ✅  UNIFIED SYSTEM WITH GUI — COMPLETE              ║")
    print("║  Auto Buso · Fast Attack · Smart Hop · Auto Raid     ║")
    print("║  ✅ FIXED: Fruit Collection & Cache Logic            ║")
    print("║  ✅ Session: " .. FruitCache.sessionId .. "          ║")
    print("╚══════════════════════════════════════════════════════╝")
end)
