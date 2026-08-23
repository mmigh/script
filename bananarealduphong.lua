task.wait(1)
local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/zzzz.lua"
))()

--========================================
-- 2. CREATE MAIN
--========================================
local Main = Library.CreateMain({
    Desc = " - By Phuocdepzai"
})

--========================================
-- 3. SHOP TAB
--========================================
local ShopBuy = Main.CreatePage({Page_Name = "Shop", Page_Title = "Shop"})
local SecMiscShop = ShopBuy.CreateSection("Misc Shop")

SecMiscShop.CreateButton({
    Title = "Redeem Code",
    Callback = function()
        for i, v in pairs(code) do
            spawn(function()
                game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(v)
                wait(0.5)
            end)
        end
    end
})

SecMiscShop.CreateButton({
    Title = "Teleport Old World",
    Callback = function()
        CommF_Remote:InvokeServer("TravelMain")
    end
})

SecMiscShop.CreateButton({
    Title = "Teleport New World",
    Callback = function()
        CommF_Remote:InvokeServer("TravelDressrosa")
    end
})

SecMiscShop.CreateButton({
    Title = "Teleport Third Sea",
    Callback = function()
        CommF_Remote:InvokeServer("TravelZou")
    end
})

SecMiscShop.CreateButton({
    Title = "Buy Dual Flintlock",
    Callback = function()
        replicated.Remotes.CommF_:InvokeServer("BuyItem", "Dual Flintlock")
    end
})

SecMiscShop.CreateButton({
    Title = "Reroll Race",
    Callback = function()
        CommF_Remote:InvokeServer("BlackbeardReward", "Reroll", "1")
        CommF_Remote:InvokeServer("BlackbeardReward", "Reroll", "2")
    end
})

SecMiscShop.CreateButton({
    Title = "Reset Stats",
    Callback = function()
        CommF_Remote:InvokeServer("BlackbeardReward","Refund","1")
        CommF_Remote:InvokeServer("BlackbeardReward","Refund","2")
    end
})

SecMiscShop.CreateButton({
    Title = "Buy Ghoul Race",
    Callback = function()
        local args1 = {[1] = "Ectoplasm", [2] = "BuyCheck", [3] = 4}
        local args2 = {[1] = "Ectoplasm", [2] = "Change", [3] = 4}
        CommF_Remote:InvokeServer(unpack(args1))
        task.wait(0.5)
        CommF_Remote:InvokeServer(unpack(args2))
    end
})

SecMiscShop.CreateButton({
    Title = "Buy Cyborg Race",
    Callback = function()
        local args = {[1] = "CyborgTrainer", [2] = "Buy"}
        CommF_Remote:InvokeServer(unpack(args))
    end
})

local FightingShop = ShopBuy.CreateSection("Fighting Shop")

FightingShop.CreateToggle({
    Title = "Black Leg",
    Default = false,
    Callback = function(Value)
        if Value then CommF_Remote:InvokeServer("BuyBlackLeg") end
    end
})

FightingShop.CreateToggle({
    Title = "Fishman Karate",
    Default = false,
    Callback = function(Value)
        if Value then CommF_Remote:InvokeServer("BuyFishmanKarate") end
    end
})

FightingShop.CreateToggle({
    Title = "Electro",
    Default = false,
    Callback = function(Value)
        if Value then CommF_Remote:InvokeServer("BuyElectro") end
    end
})

FightingShop.CreateToggle({
    Title = "Dragon Breath",
    Default = false,
    Callback = function(Value)
        if Value then CommF_Remote:InvokeServer("BlackbeardReward","DragonClaw","2") end
    end
})

FightingShop.CreateToggle({
    Title = "SuperHuman",
    Default = false,
    Callback = function(Value)
        if Value then CommF_Remote:InvokeServer("BuySuperhuman") end
    end
})

FightingShop.CreateToggle({
    Title = "Death Step",
    Default = false,
    Callback = function(Value)
        if Value then CommF_Remote:InvokeServer("BuyDeathStep") end
    end
})

FightingShop.CreateToggle({
    Title = "Sharkman Karate",
    Default = false,
    Callback = function(Value)
        if Value then CommF_Remote:InvokeServer("BuySharkmanKarate") end
    end
})

FightingShop.CreateToggle({
    Title = "Electric Claw",
    Default = false,
    Callback = function(Value)
        if Value then CommF_Remote:InvokeServer("BuyElectricClaw") end
    end
})

FightingShop.CreateToggle({
    Title = "Dragon Talon",
    Default = false,
    Callback = function(Value)
        if Value then CommF_Remote:InvokeServer("BuyDragonTalon") end
    end
})

FightingShop.CreateToggle({
    Title = "God Human",
    Default = false,
    Callback = function(Value)
        if Value then CommF_Remote:InvokeServer("BuyGodhuman") end
    end
})

FightingShop.CreateToggle({
    Title = "Sanguine Art",
    Default = false,
    Callback = function(Value)
        if Value then CommF_Remote:InvokeServer("BuySanguineArt") end
    end
})

local SecAbility = ShopBuy.CreateSection("Ability Shop")

SecAbility.CreateButton({
    Title = "Skyjump [ $10,000 Beli ]",
    Callback = function()
        CommF_Remote:InvokeServer("BuyHaki","Geppo")
    end
})

SecAbility.CreateButton({
    Title = "Buso Haki [ $25,000 Beli ]",
    Callback = function()
        CommF_Remote:InvokeServer("BuyHaki","Buso")
    end
})

SecAbility.CreateButton({
    Title = "Observation Haki [ $750,000 Beli ]",
    Callback = function()
        CommF_Remote:InvokeServer("KenTalk","Buy")
    end
})

SecAbility.CreateButton({
    Title = "Soru [ $100,000 Beli ]",
    Callback = function()
        CommF_Remote:InvokeServer("BuyHaki","Soru")
    end
})

--========================================
-- 4. STATUS AND SERVER TAB
--========================================
local TabStatus = Main.CreatePage({Page_Name = "Status And Server", Page_Title = "Status And Server"})

local Status = TabStatus.CreateSection("Status")

local JoinTime = tick()
local RandomOffset = math.random(0, 810000)
local SpawnCycle = 14400


local Time = Status.CreateLabel({
    Title = "Timer: 0h 0m 0s"
})

local ServerTime = Status.CreateLabel({
    Title = "Server Timer: 0h 0m 0s"
})

local NextSpawn = Status.CreateLabel({
    Title = "Next Time Spawn Fist Of Darkness Or God's Chalice: 4h 0m 0s"
})

local EliteHunter = Status.CreateLabel({
    Title = "Elite Hunter: ❌"
})

local TyrantEyes = Status.CreateLabel({
    Title = "Tyrant Eyes: 0 Eyes"
})

local MobCakePrince = Status.CreateLabel({
    Title = "Cake Prince: 500 mobs"
})

local Leviathan = Status.CreateLabel({
    Title = "Leviathan: ❌"
})

local Miragecheck = Status.CreateLabel({
    Title = "Mirage Island: ❌"
})

local CPrehistoriccheck = Status.CreateLabel({
    Title = "Prehistoric Island: ❌"
})

local FrozenIsland = Status.CreateLabel({
    Title = "Frozen Dimension: ❌"
})

local FM = Status.CreateLabel({
    Title = "Moon: 0/5"
})

local AncientOne = Status.CreateLabel({
    Title = "Ancient One: You Are Done Your Race."
})


local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")


local function FormatTime(t)
    local h = math.floor(t / 3600)
    local m = math.floor((t % 3600) / 60)
    local s = math.floor(t % 60)

    return string.format("%dh %dm %ds",h,m,s)
end


local function SafeCall(func, fallback)
    local ok,res = pcall(func)

    if ok then
        return res
    end

    return fallback
end


task.spawn(function()

    while task.wait(1) do

        pcall(function()


            Time.SetText(
                "Timer: "..FormatTime(tick()-JoinTime)
            )

            local currentServerTime = Workspace.DistributedGameTime + RandomOffset
            ServerTime.SetText(
                "Server Timer: "..FormatTime(currentServerTime)
            )

            local TimeLeft = SpawnCycle - (math.floor(currentServerTime) % SpawnCycle)
            if TimeLeft < 0 then
                TimeLeft = 0
            end


            NextSpawn.SetText(
                "Next Time Spawn Fist Of Darkness Or God's Chalice: "
                ..FormatTime(TimeLeft)
            )


            -- Elite Hunter
            if World3 then
    local elite =
        ReplicatedStorage:FindFirstChild("Diablo")
        or ReplicatedStorage:FindFirstChild("Deandre")
        or ReplicatedStorage:FindFirstChild("Urban")
        or (
            Workspace:FindFirstChild("Enemies")
            and (
                Workspace.Enemies:FindFirstChild("Diablo")
                or Workspace.Enemies:FindFirstChild("Deandre")
                or Workspace.Enemies:FindFirstChild("Urban")
            )
        )

    EliteHunter.SetText(
        "Elite Hunter: "..(elite and "✅" or "❌")
    )
else
    EliteHunter.SetText("Elite Hunter: []")
end

            -- Cake Prince
            local cakeResult = SafeCall(function()

                return ReplicatedStorage.Remotes.CommF_:InvokeServer(
                    "CakePrinceSpawner"
                )

            end,"")


            cakeResult = tostring(cakeResult)


            local cakeNumber = tonumber(string.match(cakeResult,"%d+")) or 0

local cakeText

if cakeNumber == 0 then
    cakeText = "Cake Prince: ✅"
else
    cakeText = "Cake Prince: "..cakeNumber.." mobs"
end

MobCakePrince.SetText(cakeText)

            MobCakePrince.SetText(cakeText)



            -- Leviathan

            if World3 then

                local levi =
                    Workspace:FindFirstChild("Leviathan")
                    or (
                        Workspace:FindFirstChild("Enemies")
                        and Workspace.Enemies:FindFirstChild("Leviathan")
                    )


                Leviathan.SetText(
                    "Leviathan: "..(levi and "✅" or "❌")
                )

            else

                Leviathan.SetText(
                    "Leviathan: ..."
                )

            end



            -- Island

            if World3 then
    local locations =
        Workspace:FindFirstChild("_WorldOrigin")
        and Workspace._WorldOrigin:FindFirstChild("Locations")

    Miragecheck.SetText(
        "Mirage Island: "
        ..((locations and locations:FindFirstChild("Mirage Island")) and "✅" or "❌")
    )

    CPrehistoriccheck.SetText(
        "Prehistoric Island: "
        ..((locations and locations:FindFirstChild("Prehistoric Island")) and "✅" or "❌")
    )

    FrozenIsland.SetText(
        "Frozen Dimension: "
        ..((locations and locations:FindFirstChild("Frozen Dimension")) and "✅" or "❌")
    )
else
    Miragecheck.SetText("Mirage Island: []")
    CPrehistoriccheck.SetText("Prehistoric Island: []")
    FrozenIsland.SetText("Frozen Dimension: []")
end



            -- Moon

            local sky = Lighting:FindFirstChild("Sky")

            if sky then

                local moon = sky.MoonTextureId


                local moonList = {

                    ["http://www.roblox.com/asset/?id=9709149431"]="Moon: 5/5",

                    ["http://www.roblox.com/asset/?id=9709149052"]="Moon: 4/5",

                    ["http://www.roblox.com/asset/?id=9709143733"]="Moon: 3/5",

                    ["http://www.roblox.com/asset/?id=9709150401"]="Moon: 2/5",

                    ["http://www.roblox.com/asset/?id=9709149680"]="Moon: 1/5"

                }


                FM.SetText(
                    moonList[moon] or "Moon: 0/5"
                )

            end


        end)

    end

end)

local Server = TabStatus.CreateSection("Server")

Server.CreateBox({
    Title = "Input Your JobID Here",
    Placeholder = "Input Here",
    Callback = function(value)
        getgenv().Job = value
    end
})

Server.CreateToggle({
    Title = "Spam Join",
    Default = false,
    Callback = function(value)
        if value then
            task.spawn(function()
                local lastTeleportTime = 0
                while value and task.wait() do
                    if tick() - lastTeleportTime >= 1 and getgenv().Job then
                        lastTeleportTime = tick()
                        pcall(function()
                            TeleportService:TeleportToPlaceInstance(game.PlaceId, getgenv().Job, Player)
                        end)
                    end
                end
            end)
        end
    end
})

Server.CreateButton({
    Title = "Copy JobId",
    Callback = function()
        pcall(function()
            if setclipboard then
                setclipboard(tostring(game.JobId))
            end
        end)
    end
})

Server.CreateButton({
    Title = "Rejoin Server",
    Callback = function()
        pcall(function()
            TeleportService:Teleport(game.PlaceId, Player)
        end)
    end
})

Server.CreateButton({
    Title = "Hop Server",
    Callback = function()
        Hop()
    end
})

Server.CreateButton({
    Title = "Hop Server Less Player",
    Callback = function()
        local data = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
        local lowest = nil
        for _, v in pairs(data.data) do
            if not lowest or v.playing < lowest.playing then
                lowest = v
            end
        end
        if lowest then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, lowest.id, Player)
        end
    end
})
task.wait(1)
--========================================
-- 5. LOCAL PLAYER TAB
--========================================
local LocalPlayerTab = Main.CreatePage({Page_Name = "LocalPlayer", Page_Title = "LocalPlayer"})
local LocalPlayerSec = LocalPlayerTab.CreateSection("Local Player")

LocalPlayerSec.CreateButton({
    Title = "Open Devil Fruit Shop",
    Callback = function()
        playDlg("FruitShop")
    end
})

LocalPlayerSec.CreateButton({
    Title = "Open Devil Fruit Shop Mirage",
    Callback = function()
        playDlg("FruitShop2")
    end
})

LocalPlayerSec.CreateButton({
    Title = "Open Title",
    Callback = function()
        local args = {"getTitles"}
        local success, result = pcall(function()
            return CommF_Remote:InvokeServer(unpack(args))
        end)
        if success then
            MainGui.Titles.Visible = true
        end
    end
})

LocalPlayerSec.CreateButton({
    Title = "Boost FPS",
    Callback = function()
        LowCpu()
    end
})

LocalPlayerSec.CreateButton({
    Title = "Turn on Fast Mode",
    Callback = function()
        for _, v in pairs(Workspace:GetDescendants()) do
            if table.find({"Part", "SpawnLocation", "WedgePart", "Terrain", "MeshPart"}, v.ClassName) then
                v.Material = Enum.Material.Plastic
            end
        end
    end
})

local canChangeTeam = true
local teamDebounce = 2

LocalPlayerSec.CreateButton({
    Title = "Change Team To Pirates",
    Callback = function()
        if canChangeTeam then
            canChangeTeam = false
            pcall(function()
                CommF_Remote:InvokeServer("SetTeam", "Pirates")
            end)
            task.delay(teamDebounce, function() canChangeTeam = true end)
        end
    end
})

LocalPlayerSec.CreateButton({
    Title = "Change Team To Marines",
    Callback = function()
        if canChangeTeam then
            canChangeTeam = false
            pcall(function()
                CommF_Remote:InvokeServer("SetTeam", "Marines")
            end)
            task.delay(teamDebounce, function() canChangeTeam = true end)
        end
    end
})

LocalPlayerSec.CreateToggle({
    Title = "Auto Summon Cake Prince",
    Default = true,
    Callback = function(v)
        _G.AutoSpawnCP = v
    end
})

task.spawn(function()
    while task.wait() do
        if _G.AutoSpawnCP then
            pcall(function()
                CommF_Remote:InvokeServer("CakePrinceSpawner", true)
            end)
            task.wait(1)
        end
    end
end)

LocalPlayerSec.CreateToggle({
    Title = "No Clip",
    Default = false,
    Callback = function(Value)
        getgenv().NoClip = Value
    end
})

task.spawn(function()
    RunService.Stepped:Connect(function()
        if getgenv().NoClip then
            for _, v in pairs(Player.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end)
end)

LocalPlayerSec.CreateDropdown({
    Title = "Select Stats",
    List = {"Melee", "Sword", "Gun", "Devil Fruit", "Defense"},
    Default = nil,
    Callback = function(Value)
        _G.SelectedStat = Value
    end
})

LocalPlayerSec.CreateSlider({
    Title = "Point Stats",
    Min = 0,
    Max = 6736,
    Default = 1,
    Callback = function(Value)
        _G.pSats = Value
    end
})

LocalPlayerSec.CreateToggle({
    Title = "Auto Stats",
    Default = false,
    Callback = function(Value)
        _G.Auto_Stats = Value
    end
})

task.spawn(function()
    while task.wait(Sec) do
        if _G.Auto_Stats then
            pcall(function()
                if _G.SelectedStat == "Melee" then
                    statsSetings("Melee", _G.pSats)
                elseif _G.SelectedStat == "Sword" then
                    statsSetings("Sword", _G.pSats)
                elseif _G.SelectedStat == "Gun" then
                    statsSetings("Gun", _G.pSats)
                elseif _G.SelectedStat == "Devil Fruit" then
                    statsSetings("Devil", _G.pSats)
                elseif _G.SelectedStat == "Defense" then
                    statsSetings("Defense", _G.pSats)
                end
            end)
        end
    end
end)

Location = {}
for i, v in pairs(Workspace._WorldOrigin.Locations:GetChildren()) do  
    table.insert(Location, v.Name)
end

LocalPlayerSec.CreateDropdown({
    Title = "Select Island",
    Search = true,
    List = Location,
    Default = nil,
    Callback = function(Value)
        _G.Island = Value
    end
})

LocalPlayerSec.CreateToggle({
    Title = "Teleport to Island",
    Default = false,
    Callback = function(Value)
        _G.Teleport = Value
        if Value then
            for i, v in pairs(Workspace._WorldOrigin.Locations:GetChildren()) do
                if v.Name == _G.Island then
                    repeat task.wait()
                        _tp(v.CFrame * CFrame.new(0, 30, 0))
                    until not _G.Teleport or Root.CFrame == v.CFrame
                end
            end
        end
    end
})
task.wait(3)
--========================================
-- 6. SETTING FARM TAB
--========================================
local Settings = Main.CreatePage({Page_Name = "Setting Farm", Page_Title = "Setting Farm"})
local SetAutoFarm = Settings.CreateSection("Setting Farm")

_G.ChooseWP = "Melee"

SetAutoFarm.CreateDropdown({
    Title = "Select Weapon",
    Search = true,
    List = {"Melee","Sword","Blox Fruit"},
    Default = "Melee",
    Callback = function(Value)
        _G.ChooseWP = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.ChooseWP == "Melee" then
                for _, v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" and plr.Backpack:FindFirstChild(tostring(v.Name)) then
                        _G.SelectWeapon = v.Name
                    end
                end
            elseif _G.ChooseWP == "Sword" then
                for _, v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Sword" and plr.Backpack:FindFirstChild(tostring(v.Name)) then
                        _G.SelectWeapon = v.Name
                    end
                end
            elseif _G.ChooseWP == "Blox Fruit" then
                for _, v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Blox Fruit" and plr.Backpack:FindFirstChild(tostring(v.Name)) then
                        _G.SelectWeapon = v.Name
                    end
                end
            end
        end)
    end
end)
SetAutoFarm.CreateToggle({
    Title = "Attack No Animation",
    Default = true,
    Callback = function(Value)
        getgenv().AttackNoAnimation = Value
    end
})

SetAutoFarm.CreateToggle({
    Title = "Kill Aura Only Raid And Volcano",
    Default = false,
    Callback = function(Value)
        getgenv().KillAuraOnlyRaidAndVolcano = Value
    end
})

SetAutoFarm.CreateSlider({
    Title = "Time Delay Kill",
    Min = 0,
    Max = 5,
    Default = 5,
    Callback = function(Value)
        getgenv().TimeDelayKill = Value
    end
})

SetAutoFarm.CreateToggle({
    Title = "Auto Click",
    Default = false,
    Callback = function(v)
        _autoClickEnabled = v
        if not v and not getgenv().IsFarming then
            _stopFastAttack()
        end
    end
})

SetAutoFarm.CreateToggle({
    Title = "Kill Aura With Dragon Storm",
    Default = false,
    Callback = function(Value)
        getgenv().KillAuraWithDragonStorm = Value
    end
})

getgenv().AutoHakiBuso = true

SetAutoFarm.CreateToggle({
    Title = "Auto Turn On Buso",
    Default = true,
    Callback = function(Value)
        getgenv().AutoHakiBuso = Value
    end
})

task.spawn(function()
    while task.wait() do
        if getgenv().AutoHakiBuso then
            local char = game.Players.LocalPlayer.Character
            if char and not char:FindFirstChild("HasBuso") then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            end
        end
    end
end)

SetAutoFarm.CreateToggle({
    Title = "Auto Turn On Observation",
    Default = false,
    Callback = function(Value)
        getgenv().Observation = Value
    end
})

task.spawn(function()
    while task.wait() do
        if getgenv().Observation then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
            end)
        end
    end
end)

SetAutoFarm.CreateToggle({
    Title = "Auto Turn On Race V4",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTurnOnV4 = Value
    end
})

task.spawn(function()
    while task.wait() do
        if getgenv().AutoTurnOnV4 then
            local character = game.Players.LocalPlayer.Character
            if character 
                and character:FindFirstChild("RaceEnergy")
                and character.RaceEnergy.Value >= 1
                and character:FindFirstChild("RaceTransformed")
                and not character.RaceTransformed.Value
            then
                local be = game:GetService("VirtualInputManager")
                be:SendKeyEvent(true, "Y", false, game)
                task.wait()
                be:SendKeyEvent(false, "Y", false, game)
            end
        end
    end
end)

SetAutoFarm.CreateToggle({
    Title = "Auto Turn On Race V3",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTurnOnV3 = Value
    end
})

task.spawn(function()
    while task.wait() do
        if getgenv().AutoTurnOnV3 then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
            end)
        end
    end
end)

SetAutoFarm.CreateToggle({
    Title = "Auto Dodge Skill Mobs",
    Default = false,
    Callback = function(Value)
        getgenv().AutoDodgeSkillMobs = Value
    end
})

SetAutoFarm.CreateToggle({
    Title = "Teleport Y if low hearth",
    Default = false,
    Callback = function(Value)
        _G.Safemode = Value
    end
})

task.spawn(function()
    while task.wait() do
        pcall(function()
            if _G.Safemode then
                local PlayerGui = plr:WaitForChild("PlayerGui")
                local char = plr.Character
                local root = char and char:FindFirstChild("HumanoidRootPart")
                local hum = char and char:FindFirstChildOfClass("Humanoid")

                if root and hum then
                    local calcHealth = hum.Health / hum.MaxHealth * 100
                    if calcHealth < (Num_self or 30) then
                        shouldTween = true
                        _tp(root.CFrame * CFrame.new(0, 500, 0))
                    else
                        shouldTween = false
                    end
                end
            end
        end)
    end
end)

SetAutoFarm.CreateSlider({
    Title = "% Health Player",
    Min = 0,
    Max = 100,
    Default = 40,
    Callback = function(v) end
})

SetAutoFarm.CreateSlider({
    Title = "Distance Teleport Y",
    Min = 0,
    Max = 5000,
    Default = 800,
    Callback = function(v)
        getgenv().TeleportYDistance = v
    end
})

SetAutoFarm.CreateSlider({
    Title = "Bring Mob Count",
    Min = 2,
    Max = 6,
    Default = 2,
    Callback = function(v)
        _G.BringCount = v
    end
})

_B = true
SetAutoFarm.CreateToggle({
    Title = "Bring Mob",
    Default = true,
    Callback = function(Value)
        _B = Value
    end
})

SetAutoFarm.CreateSlider({
    Title = "Speed Tween",
    Min = 350,
    Max = 1000,
    Default = 350,
    Callback = function(v)
        _G.SpeedTween = v
        getgenv().SpeedTween = v
    end
})

_G.SpeedTween = 350
getgenv().SpeedTween = 350

--========================================
-- 7. HOLD AND SELECT SKILL TAB
--========================================
local SkillsHold = Main.CreatePage({Page_Name = "Hold And Select Skill", Page_Title = "Setting Hold And Select Skill"})
local Skills = SkillsHold.CreateSection("Select Skills")

Skills.CreateDropdown({
    Title = "Select Skill Melee",
    List = {"Z", "X", "C"},
    Default = nil,
    Selected = true,
    Callback = function(Value)
        _G.MeleeSkills = Value
    end
})

Skills.CreateDropdown({
    Title = "Select Skill Sword",
    List = {"Z", "X"},
    Default = nil,
    Selected = true,
    Callback = function(Value)
        _G.SwordSkills = Value
    end
})

Skills.CreateDropdown({
    Title = "Select Skill Gun",
    List = {"Z", "X"},
    Default = nil,
    Selected = true,
    Callback = function(Value)
        _G.GunSkills = Value
    end
})

Skills.CreateDropdown({
    Title = "Select Skill Blox Fruit",
    List = {"Z", "X", "C", "V", "F"},
    Default = nil,
    Selected = true,
    Callback = function(Value)
        _G.BfSkills = Value
    end
})

local HoldSkills = SkillsHold.CreateSection("Hold Skills")

HoldSkills.CreateSlider({
    Title = "Kill At % Health",
    Description = "Use skills when enemy health below this percentage",
    Min = 10,
    Max = 90,
    Default = 70,
    Rounding = 0,
    Callback = function(Value)
        getgenv().Kill_At = Value
    end
})

HoldSkills.CreateSlider({
    Title = "Hold Skill Z (seconds)",
    Description = "How long to hold Z key",
    Min = 0.1,
    Max = 2,
    Default = 0.1,
    Rounding = 1,
    Callback = function(Value)
        getgenv().HoldSkillZ = Value
    end
})

HoldSkills.CreateSlider({
    Title = "Hold Skill X (seconds)",
    Description = "How long to hold X key",
    Min = 0.1,
    Max = 2,
    Default = 0.1,
    Rounding = 1,
    Callback = function(Value)
        getgenv().HoldSkillX = Value
    end
})

HoldSkills.CreateSlider({
    Title = "Hold Skill C (seconds)",
    Description = "How long to hold C key",
    Min = 0.1,
    Max = 2,
    Default = 0.1,
    Rounding = 1,
    Callback = function(Value)
        getgenv().HoldSkillC = Value
    end
})
--========================================
-- 8. FARMING TAB
--========================================
local AutoModeFarm = Main.CreatePage({Page_Name = "Farming", Page_Title = "Farming"})
local SelectMethodFarm = AutoModeFarm.CreateSection("Setting Farm")

_G.MethodSelect = "Level Farm"

SelectMethodFarm.CreateDropdown({
    Title = "Select Method Farm",
    List = {"Level Farm", "Farm Bones", "Farm Katakuri", "Farm Tyrant of the Skies", "Aura Farm"},
    Default = "Level Farm",
    Callback = function(Value)
        _G.MethodSelect = Value
    end
})

SelectMethodFarm.CreateSlider({
    Title = "Distance Farm Aura",
    Min = 0,
    Max = 1000,
    Default = 300,
    Callback = function(Value)
        _G.Safemode = Value
    end
})

SelectMethodFarm.CreateToggle({
    Title = "Ignore Attack Katakuri",
    Default = false,
    Callback = function(Value)
        getgenv().IgnoreAttackKatakuri = Value
    end
})

SelectMethodFarm.CreateToggle({
    Title = "Hop Find Katakuri",
    Default = false,
    Callback = function(Value)
        _G.Auto_Cake_Prince = Value
    end
})

task.spawn(function()
    while wait() do
        if _G.Auto_Cake_Prince then
            pcall(function()
                local player = game.Players.LocalPlayer
                local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                local enemies = workspace.Enemies
                local bigMirror = workspace.Map.CakeLoaf.BigMirror
                
                if not root then return end
                
                local bossExists = bigMirror.Other.Transparency == 0 or enemies:FindFirstChild("Cake Prince")
                
                if bossExists then
                    local v = GetConnectionEnemies("Cake Prince")
                    if v then
                        repeat wait() 
                            Attack.Kill2(v, _G.Auto_Cake_Prince)
                        until not _G.Auto_Cake_Prince or not v.Parent or v.Humanoid.Health <= 0
                    else
                        if bigMirror.Other.Transparency == 0 and (CFrame.new(-1990.67, 4533, -14973.67).Position - root.Position).Magnitude >= 2000 then
                            _tp(CFrame.new(-2151.82, 149.32, -12404.91))
                        end
                    end
                else
                    Hop()
                    wait(5)
                end
            end)
        end
    end
end)

SelectMethodFarm.CreateToggle({
    Title = "Accept Quest [Katakuri/Bone/Tyrant]",
    Default = false,
    Callback = function(Value)
        _G.AcceptQuestC = Value
    end
})

SelectMethodFarm.CreateToggle({
    Title = "Start Farm",
    Default = false,
    Callback = function(Value)
        _G.StartFarm = Value
    end
})

--========================================
-- 9. LEVEL FARM LOOP
--========================================
task.spawn(function()
    while task.wait(1) do
        if _G.StartFarm and _G.MethodSelect == "Level Farm" then
            pcall(function()
                if not Root or not Root.Parent then
                    Root = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                    if not Root then return end
                end
                
                local lvl = plr.Data.Level.Value
                local questData = QuestNeta()
                if not questData then return end
                
                local QuestGui = plr.PlayerGui:FindFirstChild("Main") and plr.PlayerGui.Main:FindFirstChild("Quest")
                if not QuestGui then return end
                
                local QuestTitle = QuestGui.Container.QuestTitle.Title.Text
                
                if not string.find(QuestTitle, questData[5]) then
                    CommF_Remote:InvokeServer("AbandonQuest")
                end
                
                if not plr.PlayerGui.Main.Quest.Visible then
                    local questPos = questData[6]
                    local questName = questData[3]
                    local questID = questData[2]
                    
                    _tp(questPos)
                    task.wait(0.5)
                    pcall(function()
                        CommF_Remote:InvokeServer("StartQuest", questName, questID)
                    end)
                elseif plr.PlayerGui.Main.Quest.Visible then
                    local enemyName = questData[1]
                    if Workspace.Enemies:FindFirstChild(enemyName) then
                        for _, v in pairs(Workspace.Enemies:GetChildren()) do
                            if Attack.Alive(v) and v.Name == enemyName then
                                if string.find(QuestTitle, questData[5]) then
                                    repeat 
                                        task.wait() 
                                        Attack.Kill(v, _G.StartFarm) 
                                    until not _G.StartFarm or v.Humanoid.Health <= 0 or not v.Parent
                                else
                                    CommF_Remote:InvokeServer("AbandonQuest")
                                end
                            end
                        end
                    else
                        _tp(questData[4])
                    end
                end
            end)
        end
    end
end)
--========================================
-- 10. FARM BONES LOOP
--========================================
task.spawn(function()
    while task.wait(1) do
        if _G.StartFarm and _G.MethodSelect == "Farm Bones" then
            pcall(function()
                local root = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                if not root then return end
                
                local questUI = plr.PlayerGui:FindFirstChild("Main") and plr.PlayerGui.Main:FindFirstChild("Quest")
                local BonesTable = {"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"}
                
                if _G.AcceptQuestC and questUI and not questUI.Visible then
                    local questPos = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                    _tp(questPos)
                    
                    local randomQuest = math.random(1, 4)
                    local questData = {
                        [1] = {"StartQuest", "HauntedQuest2", 2},
                        [2] = {"StartQuest", "HauntedQuest2", 1},
                        [3] = {"StartQuest", "HauntedQuest1", 1},
                        [4] = {"StartQuest", "HauntedQuest1", 2}
                    }
                    pcall(function()
                        CommF_Remote:InvokeServer(unpack(questData[randomQuest]))
                    end)
                end
                
                while _G.StartFarm do
                    local targetBone = nil
                    for _, v in pairs(Workspace.Enemies:GetChildren()) do
                        if table.find(BonesTable, v.Name) and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            targetBone = v
                            break
                        end
                    end
                    if targetBone then
                        Attack.Kill(targetBone, _G.StartFarm)
                    end
                    task.wait()
                end
            end)
        end
    end
end)

--========================================
-- 11. FARM KATAKURI LOOP
--========================================
task.spawn(function()
    while task.wait(1) do
        if _G.StartFarm and _G.MethodSelect == "Farm Katakuri" then
            pcall(function()
                local root = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                if not root then return end
                
                local questUI = plr.PlayerGui:FindFirstChild("Main") and plr.PlayerGui.Main:FindFirstChild("Quest")
                local enemies = Workspace.Enemies
                
                local mapFolder = Workspace:FindFirstChild("Map")
                local cakeLoaf = mapFolder and mapFolder:FindFirstChild("CakeLoaf")
                local bigMirror = cakeLoaf and cakeLoaf:FindFirstChild("BigMirror")
                local mirrorOther = bigMirror and bigMirror:FindFirstChild("Other")
                
                if not mirrorOther then
                    _tp(CFrame.new(-2077, 252, -12373))
                    return
                end
                
                if mirrorOther.Transparency == 0 or enemies:FindFirstChild("Cake Prince") then
                    local v = GetConnectionEnemies("Cake Prince")
                    if v then
                        repeat
                            wait()
                            Attack.Kill2(v, _G.StartFarm)
                        until not _G.StartFarm or not v.Parent or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0
                    end
                else
                    local mobNames = {"Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker"}
                    
                    if _G.AcceptQuestC and questUI and not questUI.Visible then
                        local questPos = CFrame.new(-1927.92, 37.8, -12842.54)
                        _tp(questPos)
                        
                        local questData = {
                            {"StartQuest", "CakeQuest2", 2},
                            {"StartQuest", "CakeQuest2", 1},
                            {"StartQuest", "CakeQuest1", 1},
                            {"StartQuest", "CakeQuest1", 2},
                        }
                        pcall(function()
                            CommF_Remote:InvokeServer(unpack(questData[math.random(1, 4)]))
                        end)
                    end
                    
                    while _G.StartFarm do
                        local targetMob = nil
                        for _, v in pairs(enemies:GetChildren()) do
                            if table.find(mobNames, v.Name) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                targetMob = v
                                break
                            end
                        end
                        if targetMob then
                            Attack.Kill(targetMob, _G.StartFarm)
                        end
                        if mirrorOther.Transparency == 0 or enemies:FindFirstChild("Cake Prince") then
                            break
                        end
                        task.wait()
                    end
                end
            end)
        end
    end
end)

--========================================
-- 12. FARM TYRANT LOOP
--========================================
task.spawn(function()
    while task.wait(1) do
        if _G.StartFarm and _G.MethodSelect == "Farm Tyrant of the Skies" then
            pcall(function()
                local player = game.Players.LocalPlayer
                if not (player and player.Character) then return end
                local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                
                local enemiesFolder = Workspace:FindFirstChild("Enemies")
                local bossPos = Vector3.new(-16268.287, 152.616, 1390.773)
                
                if (hrp.Position - bossPos).Magnitude > 5 then
                    _tp(CFrame.new(bossPos))
                    local attempts = 0
                    repeat 
                        wait() 
                        attempts = attempts + 1
                    until not _G.StartFarm or 
                          (player.Character and player.Character:FindFirstChild("HumanoidRootPart") and 
                          (player.Character.HumanoidRootPart.Position - bossPos).Magnitude <= 5) or
                          attempts > 100
                end
                
                local boss = enemiesFolder and enemiesFolder:FindFirstChild("Tyrant of the Skies")
                if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                    repeat
                        if not _G.StartFarm then break end
                        if AutoHaki then pcall(AutoHaki) end
                        if SelectWeapon and EquipTool then pcall(EquipTool, SelectWeapon) end
                        if Attack and Attack.Kill then
                            pcall(function() Attack.Kill(boss, _G.StartFarm) end)
                        end
                        wait()
                    until not _G.StartFarm or not boss.Parent or not boss:FindFirstChild("Humanoid") or boss.Humanoid.Health <= 0
                    return
                end
                
                local mobList = {"Serpent Hunter","Skull Slayer","Isle Champion","Sun-kissed Warrior"}
                if enemiesFolder then
                    for _, mobName in ipairs(mobList) do
                        if not _G.StartFarm then break end
                        for _, mob in ipairs(enemiesFolder:GetChildren()) do
                            if not _G.StartFarm then break end
                            if mob and mob.Name == mobName and mob:FindFirstChild("HumanoidRootPart") and 
                               mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                               
                                hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                                if not hrp then break end
                                
                                if (hrp.Position - mob.HumanoidRootPart.Position).Magnitude > 5000 then
                                    _tp(mob.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                    local t0 = tick()
                                    repeat 
                                        wait() 
                                        hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart") 
                                    until not _G.StartFarm or not hrp or 
                                          (hrp.Position - mob.HumanoidRootPart.Position).Magnitude <= 6 or 
                                          tick() - t0 > 8
                                end
                                
                                repeat
                                    if not _G.StartFarm then break end
                                    if AutoHaki then pcall(AutoHaki) end
                                    if SelectWeapon and EquipTool then pcall(EquipTool, SelectWeapon) end
                                    if Attack and Attack.Kill then
                                        pcall(function() Attack.Kill(mob, _G.StartFarm) end)
                                    end
                                    wait()
                                until not _G.StartFarm or not mob.Parent or 
                                      not mob:FindFirstChild("Humanoid") or 
                                      mob.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end)
        end
    end
end)
--========================================
-- 13. AURA FARM LOOP
--========================================
task.spawn(function()
    while task.wait(1) do
        if _G.StartFarm and _G.MethodSelect == "Aura Farm" then
            pcall(function()
                for i, v in pairs(Workspace.Enemies:GetChildren()) do
                    if not _G.StartFarm then break end
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        if v.Humanoid.Health > 0 then
                            repeat 
                                wait() 
                                Attack.Kill(v, _G.StartFarm)
                            until not _G.StartFarm or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            end)
        end
    end
end)

--========================================
-- 14. MASTERY FARM
--========================================
local MeterialFarm = AutoModeFarm.CreateSection("Mastery Farm")

MeterialFarm.CreateDropdown({
    Title = "Select Method Farm Mastery",
    List = {"Blox Fruit", "Gun"},
    Default = nil,
    Callback = function(Value)
        _G.MasteryTypeSelect = Value
    end
})

MeterialFarm.CreateToggle({
    Title = "Farm Mastery",
    Default = false,
    Callback = function(Value)
        _G.MasteryFarmStart = Value
        if not _G.StartFarm then
            Library.CreateNoti({
                Title = "Banana Cat Hub",
                Desc = "Open Start Farm Plz!",
                ShowTime = 5
            })
        end
    end
})

task.spawn(function()
    while wait(0.1) do
        pcall(function()
            if not _G.MasteryFarmStart or not _G.StartFarm then return end
            
            local targetMobs = {"Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy"}
            
            local foundMob = nil
            for _, v in pairs(Workspace.Enemies:GetChildren()) do
                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    for _, name in ipairs(targetMobs) do
                        if v.Name == name then
                            foundMob = v
                            break
                        end
                    end
                end
                if foundMob then break end
            end
            
            if not foundMob then
                _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
                return
            end
            
            if not foundMob:FindFirstChild("Humanoid") or foundMob.Humanoid.Health <= 0 then return end
            
            HealthM = foundMob.Humanoid.MaxHealth * 70 / 100
            MousePos = foundMob.HumanoidRootPart.Position
            
            if _G.MasteryTypeSelect == "Blox Fruit" then
                if foundMob.Humanoid.Health <= HealthM then
                    _tp(foundMob.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                    Useskills("Blox Fruit", "Z")
                    Useskills("Blox Fruit", "X")
                    Useskills("Blox Fruit", "C")
                else
                    weaponSc("Melee")
                    _tp(foundMob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                end
            elseif _G.MasteryTypeSelect == "Gun" then
                local Net = replicated:FindFirstChild("Modules") and replicated.Modules:FindFirstChild("Net")
                local RE_ShootGunEvent = Net and Net:FindFirstChild("RE/ShootGunEvent")
                local character = plr.Character
                if not character then return end
                local tool = character:FindFirstChildOfClass("Tool")
                
                if foundMob.Humanoid.Health <= HealthM then
                    if not tool or tool.ToolTip ~= "Gun" then
                        weaponSc("Gun")
                        return
                    end
                    _tp(foundMob.HumanoidRootPart.CFrame * CFrame.new(0, 35, 8))
                    Useskills("Gun", "Z")
                    Useskills("Gun", "X")
                    if tool.Name == "Skull Guitar" then
                        SoulGuitar = true
                        if tool:FindFirstChild("RemoteEvent") then
                            tool.RemoteEvent:FireServer("TAP", MousePos)
                        end
                    else
                        SoulGuitar = false
                        if RE_ShootGunEvent then
                            RE_ShootGunEvent:FireServer(MousePos, {foundMob.HumanoidRootPart})
                        end
                    end
                    vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                    wait(0.05)
                    vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                else
                    weaponSc("Melee")
                    _tp(foundMob.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                end
            end
        end)
    end
end)

--========================================
-- 15. FARMING MATERIAL
--========================================
local MeterialFarm2 = AutoModeFarm.CreateSection("Farming Material")

if World1 then MaterialList = {"Leather + Scrap Metal", "Angel Wings", "Magma Ore", "Fish Tail"}
elseif World2 then MaterialList = {"Leather + Scrap Metal", "Radioactive Material", "Ectoplasm", "Mystic Droplet", "Magma Ore", "Vampire Fang"}
elseif World3 then MaterialList = {"Scrap Metal", "Demonic Wisp", "Conjured Cocoa", "Dragon Scale", "Gunpowder", "Fish Tail", "Mini Tusk"}
end

MeterialFarm2.CreateDropdown({
    Title = "Select Material",
    List = MaterialList,
    Default = nil,
    Callback = function(Value)
        _G.SelectMaterial = Value
        SelectMaterial = Value
    end
})

MeterialFarm2.CreateToggle({
    Title = "Farm Material",
    Default = false,
    Callback = function(Value)
        _G.AutoMaterial = Value
        if not _G.StartFarm then
            Library.CreateNoti({
                Title = "Banana Cat Hub",
                Desc = "Open Start Farm Plz!",
                Duration = 3
            })
        end
    end
})

task.spawn(function()
    while wait(0.5) do
        if not _G.AutoMaterial or not _G.StartFarm then continue end
        pcall(function()
            SelectMaterial = _G.SelectMaterial
            if not SelectMaterial then return end
            
            MaterialMon()
            if not MMon or not MPos then return end
            
            local foundMob = nil
            for _, EnemyName in ipairs(MMon) do
                for _, v in pairs(Workspace.Enemies:GetChildren()) do
                    if v.Name == EnemyName and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        foundMob = v
                        break
                    end
                end
                if foundMob then break end
            end
            
            if foundMob then
                Attack.Kill(foundMob, _G.AutoMaterial)
            else
                _tp(MPos)
            end
        end)
    end
end)

--========================================
-- 16. STACK FARMING TAB
--========================================
local Stack = Main.CreatePage({Page_Name = "Stack Farming", Page_Title = "Stack Farming"})
local WorldGet = Stack.CreateSection("Auto World")

WorldGet.CreateToggle({
    Title = "Auto New World",
    Default = false,
    Callback = function(Value)
        _G.TravelDres = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.TravelDres then
                if plr.Data.Level.Value >= 700 then
                    if Workspace.Map.Ice.Door.CanCollide == true and Workspace.Map.Ice.Door.Transparency == 0 then
                        CommF_Remote:InvokeServer("DressrosaQuestProgress","Detective")
                        EquipWeapon("Key")
                        repeat wait() _tp(CFrame.new(1347.7124, 37.3751602, -1325.6488)) until not _G.TravelDres or (Root.Position == CFrame.new(1347.7124, 37.3751602, -1325.6488).Position)
                    elseif Workspace.Map.Ice.Door.CanCollide == false and Workspace.Map.Ice.Door.Transparency == 1 then
                        if Enemies:FindFirstChild("Ice Admiral") then
                            for _,xz in pairs(Enemies:GetChildren()) do
                                if xz.Name == "Ice Admiral" and Attack.Alive(xz) then
                                    repeat task.wait() Attack.Kill(xz,_G.TravelDres) until _G.TravelDres == false or xz.Humanoid.Health <= 0
                                    CommF_Remote:InvokeServer("TravelDressrosa")
                                end
                            end
                        else
                            _tp(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                        end
                    else
                        CommF_Remote:InvokeServer("TravelDressrosa")
                    end
                end
            end
        end)
    end
end)

WorldGet.CreateToggle({
    Title = "Auto Third World",
    Default = false,
    Callback = function(Value)
        _G.AutoZou = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.AutoZou then
                if plr.Data.Level.Value >= 1500 then
                    if CommF_Remote:InvokeServer("BartiloQuestProgress","Bartilo") == 3 then
                        if CommF_Remote:InvokeServer("GetUnlockables").FlamingoAccess ~= nil then
                            CommF_Remote:InvokeServer("F_","TravelZou")
                            if CommF_Remote:InvokeServer("ZQuestProgress", "Check") == 0 then
                                local v = GetConnectionEnemies("rip_indra")
                                if v then
                                    repeat wait() Attack.Kill(v,_G.AutoZou) until not _G.AutoZou or not v.Parent or v.Humanoid.Health <= 0
                                    repeat wait() CommF_Remote:InvokeServer("F_","TravelZou") until Check == 1
                                else
                                    CommF_Remote:InvokeServer("F_","ZQuestProgress","Check") wait(.1)
                                    CommF_Remote:InvokeServer("F_","ZQuestProgress","Begin")
                                end
                            elseif CommF_Remote:InvokeServer("ZQuestProgress", "Check") == 1 then
                                CommF_Remote:InvokeServer("F_","TravelZou")
                            else
                                local v = GetConnectionEnemies("Don Swan")
                                if v then
                                    repeat wait() Attack.Kill(v,_G.AutoZou) until not _G.AutoZou or not v.Parent or v.Humanoid.Health<=0
                                else
                                    repeat wait() _tp(CFrame.new(2288.802, 15.1870775, 863.034607)) until not _G.AutoZou or (Root.Position == CFrame.new(2288.802, 15.1870775, 863.034607).Position)
                                    if (Root.CFrame == CFrame.new(2288.802, 15.1870775, 863.034607)) then notween(CFrame.new(2288.802, 15.1870775, 863.034607)) end
                                end
                            end
                        else
                            if CommF_Remote:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                                TabelDevilFruitStore = {}
                                TabelDevilFruitOpen = {}
                                for i,v in pairs(CommF_Remote:InvokeServer("getInventoryFruits")) do
                                    for i1,v1 in pairs(v) do
                                        if i1 == "Name" then table.insert(TabelDevilFruitStore,v1) end
                                    end
                                end
                                for i,v in next, CommF_Remote:InvokeServer("GetFruits") do
                                    if v.Price >= 1000000 then table.insert(TabelDevilFruitOpen,v.Name) end
                                end
                                for i,DevilFruitOpenDoor in pairs(TabelDevilFruitOpen) do
                                    for i1,DevilFruitStore in pairs(TabelDevilFruitStore) do
                                        if DevilFruitOpenDoor == DevilFruitStore and CommF_Remote:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                                            if not plr.Backpack:FindFirstChild(DevilFruitStore) then
                                                CommF_Remote:InvokeServer("F_","LoadFruit",DevilFruitStore)
                                            else
                                                CommF_Remote:InvokeServer("F_","TalkTrevor","1")
                                                CommF_Remote:InvokeServer("F_","TalkTrevor","2")
                                                CommF_Remote:InvokeServer("F_","TalkTrevor","3")
                                            end
                                        end
                                    end
                                end
                                CommF_Remote:InvokeServer("F_","TalkTrevor","1")
                                CommF_Remote:InvokeServer("F_","TalkTrevor","2")
                                CommF_Remote:InvokeServer("F_","TalkTrevor","3")
                            end
                        end
                    else
                        if CommF_Remote:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
                            if string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and plr.PlayerGui.Main.Quest.Visible == true then
                                local v = GetConnectionEnemies("Swan Pirate")
                                if v then
                                    pcall(function() repeat wait() Attack.Kill(v,_G.AutoZou) until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoZou == false or plr.PlayerGui.Main.Quest.Visible == false end)
                                else
                                    _tp(CFrame.new(1057.92761, 137.614319, 1242.08069))
                                end
                            else
                                _tp(CFrame.new(-456.28952, 73.0200958, 299.895966))
                            end
                        elseif CommF_Remote:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
                            local v = GetConnectionEnemies("Jeremy")
                            if v then
                                repeat wait() Attack.Kill(v,_G.AutoZou) until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoZou == false
                            else
                                _tp(CFrame.new(2099.88159, 448.931, 648.997375))
                            end
                        elseif CommF_Remote:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                            repeat wait() _tp(CFrame.new(-1836, 11, 1714)) until not _G.AutoZou or (Root.Position == CFrame.new(-1836, 11, 1714).Position)
                            notween(CFrame.new(-1850.49329, 13.1789551, 1750.89685))
                            wait(.1)
                            notween(CFrame.new(-1858.87305, 19.3777466, 1712.01807))
                            wait(.1)
                            notween(CFrame.new(-1803.94324, 16.5789185, 1750.89685))
                            wait(.1)
                            notween(CFrame.new(-1858.55835, 16.8604317, 1724.79541))
                            wait(.1)
                            notween(CFrame.new(-1869.54224, 15.987854, 1681.00659))
                            wait(.1)
                            notween(CFrame.new(-1800.0979, 16.4978027, 1684.52368))
                            wait(.1)
                            notween(CFrame.new(-1819.26343, 14.795166, 1717.90625))
                            wait(.1)
                            notween(CFrame.new(-1813.51843, 14.8604736, 1724.79541))
                        end
                    end
                end
            end
        end)
    end
end)
--========================================
-- 17. DEVIL FRUIT
--========================================
local DevilFarm = Stack.CreateSection("Devil Fruit")

DevilFarm.CreateToggle({
    Title = "Teleport to Fruit",
    Default = false,
    Callback = function(Value)
        _G.TwFruits = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        if _G.TwFruits then
            pcall(function()
                for _, x1 in pairs(Workspace:GetChildren()) do
                    if string.find(x1.Name, "Fruit") then
                        _tp(x1.Handle.CFrame)
                    end
                end
            end)
        end
    end
end)

DevilFarm.CreateToggle({
    Title = "Teleport to Fruit [Hop Server]",
    Default = false,
    Callback = function(Value)
        _G.HopFruitsFarm = Value
        if not _G.TwFruits then
            Library.CreateNoti({
                Title = "Banana Cat Hub",
                Desc = "Open Teleport to Fruit Plz!",
                Duration = 3
            })
        end
    end
})

task.spawn(function()
    while wait(Sec) do
        if _G.TwFruits and _G.HopFruitsFarm then
            pcall(function()
                local foundFruit = false
                for _, obj in pairs(Workspace:GetChildren()) do
                    if string.find(obj.Name, "Fruit") then
                        foundFruit = true
                        break
                    end
                end
                if not foundFruit then
                    Hop()
                end
            end)
        end
    end
end)
--========================================
-- 18. EVENT GAME
--========================================
local EventRaid = Stack.CreateSection("Event Game")

EventRaid.CreateToggle({
    Title = "Auto Factory",
    Default = false,
    Callback = function(Value)
        _G.AutoFactory = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.AutoFactory then
                local v = GetConnectionEnemies("Core")
                if v then
                    repeat wait()
                        EquipWeapon(_G.SelectWeapon)
                        _tp(CFrame.new(448.46756, 199.356781, -441.389252))
                    until v.Humanoid.Health <= 0 or _G.AutoFactory == false
                else
                    _tp(CFrame.new(448.46756, 199.356781, -441.389252))
                end
            end
        end)
    end
end)

EventRaid.CreateToggle({
    Title = "Auto Pirate Raid",
    Default = false,
    Callback = function(Value)
        _G.AutoRaidCastle = Value
    end
})

task.spawn(function()
    while wait(0.1) do
        if not _G.AutoRaidCastle then continue end
        pcall(function()
            local CFrameCastleRaid = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015e-09, 0.380223751, 3.5881019e-08, 1, -1.06665446e-07, -0.380223751, 1.12297109e-07, 0.924894512)
            local Castle_Mob = {
                "Galley Pirate","Galley Captain","Raider","Mercenary",
                "Vampire","Zombie","Snow Trooper","Winter Warrior",
                "Lab Subordinate","Horned Warrior","Magma Ninja","Lava Pirate",
                "Ship Deckhand","Ship Engineer","Ship Steward","Ship Officer",
                "Arctic Warrior","Snow Lurker","Sea Soldier","Water Fighter"
            }
            
            local foundMob = nil
            for _, v in pairs(Workspace.Enemies:GetChildren()) do
                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    for _, name in ipairs(Castle_Mob) do
                        if v.Name == name then
                            foundMob = v
                            break
                        end
                    end
                end
                if foundMob then break end
            end
            
            if foundMob then
                repeat
                    wait()
                    Attack.Kill(foundMob, _G.AutoRaidCastle)
                until not _G.AutoRaidCastle or not foundMob.Parent or not foundMob:FindFirstChild("Humanoid") or foundMob.Humanoid.Health <= 0
            else
                _tp(CFrameCastleRaid)
            end
        end)
    end
end)

--========================================
-- 19. RIP INDRA BOSS
--========================================
local RipIndraBoss = Stack.CreateSection("Boss Rip Indra")

RipIndraBoss.CreateToggle({
    Title = "Auto Elite Hunter",
    Default = false,
    Callback = function(Value)
        _G.FarmEliteHunt = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.FarmEliteHunt then
                local questGUI = plr.PlayerGui.Main.Quest
                
                if questGUI.Visible == true then
                    local questText = questGUI.Container.QuestTitle.Title.Text
                    local isEliteQuest = string.find(questText, "Diablo") or string.find(questText, "Urban") or string.find(questText, "Deandre")
                    
                    if isEliteQuest then
                        for _, npc in pairs(replicated:GetChildren()) do
                            local isEliteNPC = string.find(npc.Name, "Diablo") or string.find(npc.Name, "Urban") or string.find(npc.Name, "Deandre")
                            if isEliteNPC and npc:FindFirstChild("HumanoidRootPart") then
                                _tp(npc.HumanoidRootPart.CFrame)
                                break
                            end
                        end
                        
                        local Enemies = Workspace:FindFirstChild("Enemies") or Workspace
                        for _, enemy in pairs(Enemies:GetChildren()) do
                            if not enemy:FindFirstChild("Humanoid") then continue end
                            local isEliteEnemy = string.find(enemy.Name, "Diablo") or string.find(enemy.Name, "Urban") or string.find(enemy.Name, "Deandre")
                            if isEliteEnemy and enemy.Humanoid.Health > 0 then
                                if enemy:FindFirstChild("HumanoidRootPart") then
                                    _tp(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5))
                                end
                                repeat
                                    wait()
                                    Attack.Kill(enemy, _G.FarmEliteHunt)
                                until not _G.FarmEliteHunt or not questGUI.Visible or not enemy.Parent or enemy.Humanoid.Health <= 0
                                break
                            end
                        end
                    end
                else
                    CommF_Remote:InvokeServer("EliteHunter")
                end
            end
        end)
    end
end)

RipIndraBoss.CreateToggle({
    Title = "Hop Server Elite Hunter",
    Description = "Hop if u have God chalice and teleport in safezone",
    Default = false,
    Callback = function(Value)
        _G.EliteHop = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.FarmEliteHunt and _G.EliteHop then
                if GetBP("God's Chalice") or GetBP("Sweet Chalice") or GetBP("Fist of Darkness") then
                    return
                end
                
                local questGUI = plr.PlayerGui.Main.Quest
                if GetBP("God's Chalice") or GetBP("Sweet Chalice") or GetBP("Fist of Darkness") then
                    _G.FarmEliteHunt = false
                end
                
                if questGUI.Visible == true then
                    local questText = questGUI.Container.QuestTitle.Title.Text
                    local hasEliteQuest = string.find(questText, "Diablo") or string.find(questText, "Urban") or string.find(questText, "Deandre")
                    if not hasEliteQuest then
                        Hop()
                    end
                end
            end
        end)
    end
end)
RipIndraBoss.CreateToggle({
    Title = "Auto Touch Pad Haki",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTouchPadHaki = Value
    end
})

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if getgenv().AutoTouchPadHaki and World3 then
                CommF_Remote:InvokeServer("activateColor", "Winter Sky")
                task.wait(0.5)
                local target1 = CFrame.new(-5420.16602, 1084.9657, -2666.8208)
                repeat
                    topos(target1)
                    task.wait(0.2)
                until getgenv().StopTween == true or getgenv().AutoTouchPadHaki == false or (plr.Character.HumanoidRootPart.Position - target1.Position).Magnitude <= 10
                task.wait(0.5)
                CommF_Remote:InvokeServer("activateColor", "Pure Red")
                task.wait(0.5)
                local target2 = CFrame.new(-5414.41357, 309.865753, -2212.45776)
                repeat
                    topos(target2)
                    task.wait(0.2)
                until getgenv().StopTween == true or getgenv().AutoTouchPadHaki == false or (plr.Character.HumanoidRootPart.Position - target2.Position).Magnitude <= 10
                task.wait(0.5)
                CommF_Remote:InvokeServer("activateColor", "Snow White")
                task.wait(0.5)
                local target3 = CFrame.new(-4971.47559, 331.565765, -3720.02954)
                repeat
                    topos(target3)
                    task.wait(0.2)
                until getgenv().StopTween == true or getgenv().AutoTouchPadHaki == false or (plr.Character.HumanoidRootPart.Position - target3.Position).Magnitude <= 10
                task.wait(0.5)
                vim2:Button1Down(Vector2.new(1280, 600))
                task.wait(1)
                vim2:Button1Down(Vector2.new(1280, 600))
            end
        end)
    end
end)

RipIndraBoss.CreateToggle({
    Title = "Auto Rip Indra",
    Default = false,
    Callback = function(Value)
        _G.AutoRipIngay = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.AutoRipIngay then
                local v = GetConnectionEnemies("rip_indra")
                if not GetWP("Dark Dagger") or not GetIn("Valkyrie") and v then
                    repeat wait() Attack.Kill(v,_G.AutoRipIngay) until not _G.AutoRipIngay or not v.Parent or v.Humanoid.Health <= 0
                else
                    CommF_Remote:InvokeServer("requestEntrance",Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743e-08, 0.914313197, -1.90943332e-08, 1, 3.8755779e-08, -0.914313197, -1.76180437e-09, -0.405007899))
                    wait(.1)_tp(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781))
                end
            end
        end)
    end
end)
--========================================
-- 20. SOUL REAPER BOSS
--========================================
local SoulReaperBoss = Stack.CreateSection("Boss Soul Reaper")

SoulReaperBoss.CreateToggle({
    Title = "Auto Soul Reaper",
    Default = false,
    Callback = function(Value)
        _G.AutoHytHallow = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        if _G.AutoHytHallow then
            pcall(function()
                local v = GetConnectionEnemies("Soul Reaper")
                if v then
                    repeat 
                        task.wait() 
                        Attack.Kill(v, _G.AutoHytHallow) 
                    until v.Humanoid.Health <= 0 or _G.AutoHytHallow == false
                else
                    if not GetBP("Hallow Essence") then
                        repeat 
                            task.wait(.1)
                            CommF_Remote:InvokeServer("Bones", "Buy", 1, 1)
                        until _G.AutoHytHallow == false or GetBP("Hallow Essence")
                    else
                        repeat 
                            wait(.1) 
                            _tp(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
                        until _G.AutoHytHallow == false or (plr.Character.HumanoidRootPart.Position - Vector3.new(-8932.322265625, 146.83154296875, 6062.55078125)).Magnitude <= 10
                        EquipWeapon("Hallow Essence")
                    end
                end
            end)
        end
    end
end)

SoulReaperBoss.CreateToggle({
    Title = "Auto Soul Reaper [ Hop Server ]",
    Default = false,
    Callback = function(Value)
        _G.SoulHopR = Value
        if not _G.AutoHytHallow then
            Library.CreateNoti({
                Title = "Banana Cat Hub",
                Desc = "Open Auto Soul Reaper Plz!",
                Duration = 3
            })
        end
    end
})

task.spawn(function()
    while wait(Sec) do
        if _G.AutoHytHallow and _G.SoulHopR then
            pcall(function()
                if not GetConnectionEnemies("Soul Reaper") then
                    Hop()
                end
            end)
        end
    end
end)

--========================================
-- 21. DOUGH KING BOSS
--========================================
local DoughKingBoss = Stack.CreateSection("Boss Dough King")

DoughKingBoss.CreateToggle({
    Title = "Auto Dough King",
    Default = false,
    Callback = function(Value)
        _G.AutoMiror = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        if _G.AutoMiror then
            pcall(function()
                local v = GetConnectionEnemies("Dough King")
                if v then
                    repeat 
                        wait() 
                        Attack.Kill(v, _G.AutoMiror) 
                    until not _G.AutoMiror or not v.Parent or v.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375)) 
                end
            end)
        end
    end
end)

DoughKingBoss.CreateToggle({
    Title = "Auto Dough King [ Hop Server ]",
    Default = false,
    Callback = function(Value)
        _G.DoughKingHop = Value
        if not _G.AutoMiror then 
            Library.CreateNoti({
                Title = "Banana Cat Hub",
                Desc = "Open Auto Dough King Plz!",
                Duration = 3
            })
        end
    end
})

task.spawn(function()
    while wait(Sec) do
        if _G.AutoMiror and _G.DoughKingHop then
            pcall(function()
                if not GetConnectionEnemies("Dough King") then
                    Hop()
                end
            end)
        end
    end
end)

--========================================
-- 22. DARKBEARD BOSS
--========================================
local DarkbeardBoss = Stack.CreateSection("Boss Darkbeard")

DarkbeardBoss.CreateToggle({
    Title = "Auto Darkbeard",
    Default = false,
    Callback = function(Value)
        _G.Auto_Def_DarkCoat = Value
    end
})

task.spawn(function()
    while wait(.1) do
        if _G.Auto_Def_DarkCoat then
            pcall(function()
                if GetBP("Fist of Darkness") and not Workspace.Enemies:FindFirstChild("Darkbeard") then          
                    _tp(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
                else
                    local v = GetConnectionEnemies("Darkbeard")
                    if v then 
                        repeat 
                            wait()
                            Attack.Kill(v, _G.Auto_Def_DarkCoat)
                        until _G.Auto_Def_DarkCoat == false or not v.Parent or v.Humanoid.Health <= 0
                    end
                end
            end)
        end
    end
end)

DarkbeardBoss.CreateToggle({
    Title = "Auto Darkbeard [ Hop Server ]",
    Default = false,
    Callback = function(Value)
        _G.DarkbreadHop = Value
        if not _G.Auto_Def_DarkCoat then 
            Library.CreateNoti({
                Title = "Banana Cat Hub",
                Desc = "Open Auto Darkbeard Plz!",
                Duration = 3
            })
        end
    end
})

task.spawn(function()
    while wait(0.1) do
        if _G.Auto_Def_DarkCoat and _G.DarkbreadHop then
            pcall(function()
                if not Workspace.Enemies:FindFirstChild("Darkbeard") then
                    Hop()
                end
            end)
        end
    end
end)

--========================================
-- 23. FARMING OTHER TAB - FISHING
--========================================
local Other = Main.CreatePage({Page_Name = "Farming Other", Page_Title = "Farming Other"})
local Fishing = Other.CreateSection("Fishing")

Fishing.CreateDropdown({
    Title = "Select Rod",
    List = {"Fishing Rod", "Gold Rod", "Shark Rod", "Shell Rod", "Treasure Rod"},
    Default = nil,
    Callback = function(Value)
        SelectedRod = Value
    end
})

Fishing.CreateDropdown({
    Title = "Select Bait",
    List = {"Basic Bait", "Kelp Bait", "Good Bait", "Abyssal Bait", "Frozen Bait", "Epic Bait", "Carnivore Bait"},
    Default = nil,
    Callback = function(Value)
        SelectedBait = Value
    end
})

Fishing.CreateButton({
    Title = "Buy Bait",
    Callback = function()
        RFCraft:InvokeServer("Craft", SelectedBait, {})
    end
})

Fishing.CreateToggle({
    Title = "Auto Fishing",
    Default = false,
    Callback = function(Value)
        AutoFishing = Value
    end
})

task.spawn(function()
    local MaxLaunchDistance = (FishingConfig and FishingConfig.Rod and FishingConfig.Rod.MaxLaunchDistance) or 100
    while task.wait(0.5) do
        if AutoFishing then
            pcall(function()
                local Character = Player.Character or Player.CharacterAdded:Wait()
                local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                if not HumanoidRootPart then return end
                
                local Tool = Character:FindFirstChildOfClass("Tool")
                if SelectedRod and (not Tool or Tool.Name ~= SelectedRod) then
                    local RodInBackpack = Player.Backpack:FindFirstChild(SelectedRod)
                    if RodInBackpack then
                        Character.Humanoid:EquipTool(RodInBackpack)
                        Tool = RodInBackpack
                    end
                end
                
                if Tool then
                    local WaterHeight = GetWaterHeightAtLocation(HumanoidRootPart.Position)
                    local HitPart, HitPosition = Workspace:FindPartOnRayWithIgnoreList(
                        Ray.new(Character.Head.Position, HumanoidRootPart.CFrame.LookVector * MaxLaunchDistance),
                        {Character, Workspace.Characters, Workspace.Enemies}
                    )
                    
                    local TargetPosition = HitPosition and Vector3.new(
                        HitPosition.X, 
                        math.max(HitPosition.Y, WaterHeight), 
                        HitPosition.Z
                    )
                    
                    local ClientState = Tool:GetAttribute("State")
                    local ServerState = Tool:GetAttribute("ServerState")
                    
                    if TargetPosition and (ClientState == "ReeledIn" or ServerState == "ReeledIn") then
                        FishingRequest:InvokeServer("StartCasting")
                        task.wait()
                        FishingRequest:InvokeServer("CastLineAtLocation", TargetPosition, 100, true)
                    elseif ServerState == "Biting" then
                        FishingRequest:InvokeServer("Catching", true)
                        task.wait(0.1)
                        FishingRequest:InvokeServer("Catch", 1)
                    end
                end
            end)
        end
    end
end)

Fishing.CreateToggle({
    Title = "Auto Quest Fishing",
    Default = false,
    Callback = function(Value)
        AutoFishingQuest = Value
    end
})

local function HasQuest()
    local QuestGui = Player.PlayerGui:FindFirstChild("Quest") or Player.PlayerGui:FindFirstChild("QuestGui")
    if QuestGui and QuestGui:FindFirstChild("Container") and QuestGui.Container:FindFirstChild("QuestTitle") then
        return true
    end
    return false
end

task.spawn(function()
    while task.wait(1) do
        if AutoFishingQuest then
            pcall(function()
                if not HasQuest() then
                    JobsRemoteFunction:InvokeServer("FishingNPC", "Angler", "AskQuest")
                end
            end)
        end
    end
end)

Fishing.CreateToggle({
    Title = "Auto Done Quest Fishing",
    Default = false,
    Callback = function(Value)
        AutoQuestComplete = Value
        if Value then
            pcall(function()
                JobsRemoteFunction:InvokeServer("FishingNPC", "FinishQuest")
            end)
        end
    end
})

task.spawn(function()
    while task.wait(5) do
        if AutoQuestComplete then
            pcall(function()
                JobsRemoteFunction:InvokeServer("FishingNPC", "FinishQuest")
            end)
        end
    end
end)

Fishing.CreateToggle({
    Title = "Sell Fishing",
    Default = false,
    Callback = function(Value)
        AutoSellFish = Value
        if Value then
            pcall(function()
                JobsRemoteFunction:InvokeServer("FishingNPC", "SellFish")
            end)
        end
    end
})

task.spawn(function()
    while task.wait(5) do
        if AutoSellFish then
            pcall(function()
                JobsRemoteFunction:InvokeServer("FishingNPC", "SellFish")
            end)
        end
    end
end)

Fishing.CreateToggle({
    Title = "Spam Skill Z if Fishing",
    Default = false,
    Callback = function(Value)
        AutoSkillZ = Value
    end
})

task.spawn(function()
    while task.wait(0.5) do
        if AutoSkillZ then
            pcall(function()
                JobToolAbilities:InvokeServer("Z", true)
            end)
        end
    end
end)

--========================================
-- 24. DRAGON QUEST
--========================================
local DragonQuest = Other.CreateSection("Quest Dragon")

DragonQuest.CreateToggle({
    Title = "Auto Dojo Trainer",
    Default = false,
    Callback = function(Value)
        _G.Dojoo = Value
    end
})

function printBeltName(data) 
    if type(data) == "table" and data.Quest["BeltName"] then 
        return data.Quest["BeltName"] 
    end 
end

task.spawn(function()
    while wait(Sec) do
        if _G.Dojoo then
            pcall(function()
                local args = {[1] = {["NPC"] = "Dojo Trainer",["Command"] = "RequestQuest"}}        
                local progress = replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(args))
                local NameBelt = printBeltName(progress)
                
                if debug == false and not progress and not NameBelt then
                    _tp(CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875))
                    debug = true
                elseif debug == true and (CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                    if NameBelt == "White" then
                        local v = GetConnectionEnemies("Skull Slayer")
                        if v then 
                            repeat task.wait() Attack.Kill(v, _G.Dojoo) until not progress or not _G.Dojoo or not Attack.Alive(v)
                        else 
                            _tp(CFrame.new(-16759.58984375, 71.28376770019531, 1595.3399658203125))
                        end
                    elseif NameBelt == "Yellow" then
                        repeat task.wait()
                            _G.SeaBeast1 = true
                            _G.TerrorShark = true
                            _G.Shark = true
                            _G.Piranha = true
                            _G.MobCrew = true
                            _G.FishBoat = true
                            _G.SailBoats = true
                        until not _G.Dojoo or not progress
                        _G.SeaBeast1 = false
                        _G.TerrorShark = false
                        _G.Shark = false
                        _G.Piranha = false
                        _G.MobCrew = false
                        _G.FishBoat = false
                        _G.SailBoats = false
                    elseif NameBelt == "Green" then
                        repeat task.wait()
                            _G.SailBoats = true
                        until not _G.Dojoo or not progress
                        _G.SailBoats = false
                    elseif NameBelt == "Purple" then
                        repeat task.wait()
                            _G.FarmEliteHunt = true
                        until not _G.Dojoo or not progress
                        _G.FarmEliteHunt = false
                    elseif NameBelt == "Red" then
                        repeat task.wait()
                            _G.SailBoats = true
                            _G.FishBoat = true
                        until not _G.Dojoo or not progress
                        _G.SailBoats = false
                        _G.FishBoat = false
                    elseif NameBelt == "Black" then
                        repeat task.wait()
                            if Workspace.Map:FindFirstChild("PrehistoricIsland") or Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then    
                                _G.Prehis_Find = true
                                if Workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild("ProximityPrompt",true) then
                                    _G.Prehis_Skills = false
                                    _G.Prehis_Find = true
                                else
                                    _G.Prehis_Skills = true
                                    _G.Prehis_Find = false
                                end
                            else
                                _G.Prehis_Find = true
                                _G.Prehis_Skills = false
                            end
                        until not _G.Dojoo or not progress
                        _G.Prehis_Find = false
                        _G.Prehis_Skills = false
                    elseif NameBelt == "Orange" or NameBelt == "Blue" then
                        return nil
                    end
                end
                if not progress then
                    debug = false
                    local args = {[1] = {["NPC"] = "Dojo Trainer",["Command"] = "ClaimQuest"}}
                    replicated.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(args))
                end
            end)
        end
    end
end)
DragonQuest.CreateToggle({
    Title = "Auto Dragon Hunter",
    Default = false,
    Callback = function(Value)
        _G.FarmBlazeEM = Value
    end
})

checkQuesta = function()
    local a = {[1] = {["Context"] = "Check"}}
    local b = nil
    pcall(function()
        local c = {[1] = {["Context"] = "RequestQuest"}}
        replicated.Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack(c))
    end)
    local d, e = pcall(function()
        b = replicated.Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack(a))
    end)
    local f = false
    local g, h, i
    if b then 
        if b.Text then 
            f = true
            local j = b.Text
            if string.find(tostring(j), "Defeat") then
                i = 1
                g = string.sub(tostring(j), 8, 9)
                g = tonumber(g)
                local k = {"Hydra Enforcer", "Venomous Assailant"}
                for l, m in pairs(k) do
                    if string.find(j, m) then
                        h = m
                        break
                    end
                end
            elseif string.find(tostring(j), "Destroy") then
                g = 10
                i = 2
                h = nil
            end
        end
    end
    return f, h, g, i
end

BackTODoJo = function()
    for a, b in pairs(Player.PlayerGui.Notifications:GetChildren()) do
        if b.Name == "NotificationTemplate" then
            if string.find(b.Text, "Head back to the Dojo to complete more tasks") then
                return true
            end
        end
    end
    return false
end

DragonMobClear = function(a, b, c)
    if Workspace.Enemies:FindFirstChild(b) then
        for d, e in pairs(Workspace.Enemies:GetChildren()) do
            if e.Name == b and Attack.Alive(e) then
                if a then Attack.Kill(e, a) end
            end
        end
    else
        _tp(c)
    end
end

task.spawn(function()
    while wait() do 
        if _G.FarmBlazeEM then
            pcall(function()
                local a, v, h, x = checkQuesta()
                if a == true and not BackTODoJo() then
                    if x == 1 then
                        if v == "Hydra Enforcer" or v == "Venomous Assailant" then
                            repeat wait()
                                DragonMobClear(true, v, CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
                            until not _G.FarmBlazeEM or not a or BackTODoJo()
                        end
                    elseif x == 2 then
                        if Workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true) then
                            repeat wait()
                                spawn(function() _tp(Workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).CFrame * CFrame.new(4,0,0)) end)
                                if (Workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position - Root.Position).Magnitude <= 200 then
                                    MousePos = Workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position
                                    Useskills("Melee","Z")
                                    Useskills("Melee","X")
                                    Useskills("Melee","C")
                                    wait(.5)
                                    Useskills("Sword","Z")
                                    Useskills("Sword","X")
                                    wait(.5)
                                    Useskills("Blox Fruit","Z")
                                    Useskills("Blox Fruit","X")
                                    Useskills("Blox Fruit","C")
                                    wait(.5)
                                    Useskills("Gun","Z")
                                    Useskills("Gun","X")
                                end
                            until not _G.FarmBlazeEM or not a or BackTODoJo()
                        end
                    end
                else
                    _tp(CFrame.new(5813, 1208, 884))
                    DragonMobClear(false, nil, nil) 
                end
            end)
        end
    end
end)

task.spawn(function()
    while wait(.1) do 
        if _G.FarmBlazeEM then
            pcall(function()
                if Workspace.EmberTemplate:FindFirstChild("Part") then
                    plr.Character.HumanoidRootPart.CFrame = Workspace.EmberTemplate.Part.CFrame
                end
            end)
        end
    end
end)

--========================================
-- 25. ATTACK ALL MOBS
--========================================
local MobAttackAlls = Other.CreateSection("Attack All Mobs")

MobAttackAlls.CreateToggle({
    Title = "Auto Attack All Mobs and Boss",
    Default = false,
    Callback = function(Value)
        _G.AutoFarmNear = Value
    end
})

task.spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoFarmNear then
                for i, v in pairs(Workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") or v:FindFirstChild("HumanoidRootPart") then
                        if v.Humanoid.Health > 0 then
                            repeat wait() Attack.Kill(v, _G.AutoFarmNear) until not _G.AutoFarmNear or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            end
        end)
    end
end)

--========================================
-- 26. BERRY
--========================================
local BerryFarm = Other.CreateSection("Berry")

BerryFarm.CreateToggle({
    Title = "Auto Collect Berry",
    Default = false,
    Callback = function(Value)
        _G.AutoBerry = Value
    end
})

BerryFarm.CreateToggle({
    Title = "Hop Find Berry",
    Default = false,
    Callback = function(Value)
        _G.HopBerry = Value
        if not _G.AutoBerry then 
            Library.CreateNoti({
                Title = "Banana Cat Hub",
                Desc = "Open Auto Berry Plz!",
                Duration = 3
            })
        end
    end
})

local function HasBerryBush()
    local CollectionService = game:GetService("CollectionService")
    local berryBushes = CollectionService:GetTagged("BerryBush")
    return #berryBushes > 0
end

task.spawn(function()
    while wait(0.1) do
        if _G.AutoBerry and _G.HopBerry then
            if not HasBerryBush() then
                Hop()
            end
        end
    end
end)

task.spawn(function()
    while wait(0.1) do
        if _G.AutoBerry then
            pcall(function()
                local CollectionService = game:GetService("CollectionService")
                local BerryBush = CollectionService:GetTagged("BerryBush")
                
                if #BerryBush > 0 then
                    local nearestBush = nil
                    local nearestDistance = math.huge
                    local character = Player.Character
                    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                    
                    if rootPart then
                        for i = 1, #BerryBush do
                            local Bush = BerryBush[i]
                            if Bush and Bush.Parent then
                                local distance = (rootPart.Position - Bush.Parent:GetPivot().Position).Magnitude
                                if distance < nearestDistance then
                                    nearestDistance = distance
                                    nearestBush = Bush
                                end
                            end
                        end
                        
                        if nearestBush then
                            _tp(nearestBush.Parent:GetPivot())
                            for _, child in pairs(nearestBush.Parent:GetChildren()) do
                                if child:IsA("BasePart") and child:FindFirstChild("ProximityPrompt") then
                                    fireproximityprompt(child.ProximityPrompt, math.huge)
                                end
                            end
                        end
                    end
                else
                    if _G.HopBerry then
                        Hop()
                    end
                end
            end)
        end
    end
end)

--========================================
-- 27. CHEST
--========================================
local ChestFarm = Other.CreateSection("Farm Chest")

ChestFarm.CreateToggle({
    Title = "Auto Chest",
    Default = false,
    Callback = function(Value)
        _G.AutoFarmChest = Value
    end
})

ChestFarm.CreateToggle({
    Title = "Auto Chest Hop",
    Default = false,
    Callback = function(Value)
        _G.ChestHop = Value
        if not _G.AutoFarmChest then 
            Library.CreateNoti({
                Title = "Banana Cat Hub",
                Desc = "Open Auto Chest Plz!",
                Duration = 3
            })
        end
    end
})

local function HasChests()
    local CollectionService = game:GetService("CollectionService")
    local chests = CollectionService:GetTagged("_ChestTagged")
    return #chests > 0
end

task.spawn(function()
    while wait(0.1) do 
        if _G.AutoFarmChest and _G.ChestHop then
            if not HasChests() then
                Hop()
            end
        end
    end
end)

task.spawn(function()
    while wait(0.1) do
        if _G.AutoFarmChest then
            pcall(function()
                local CollectionService = game:GetService("CollectionService")
                local Character = Player.Character or Player.CharacterAdded:Wait()
                if not Character then return end
                
                local Position = Character:GetPivot().Position
                local Chests = CollectionService:GetTagged("_ChestTagged")
                local Distance, Nearest = math.huge, nil
                
                for i = 1, #Chests do
                    local Chest = Chests[i]
                    local Magnitude = (Chest:GetPivot().Position - Position).Magnitude
                    if not _G.SelectedIsland or Chest:IsDescendantOf(_G.SelectedIsland) then
                        if not Chest:GetAttribute("IsDisabled") and Magnitude < Distance then
                            Distance = Magnitude
                            Nearest = Chest
                        end
                    end
                end
                
                if Nearest then 
                    _tp(Nearest:GetPivot()) 
                end
            end)
        end
    end
end)

--========================================
-- 28. RAID LAW
--========================================
local FullRaidLaw = Other.CreateSection("Raid Law")

FullRaidLaw.CreateToggle({
    Title = "Auto Buy Chip and Attack Law",
    Default = false,
    Callback = function(Value)
        _G.AutoLawKak = Value
    end
})

task.spawn(function()
    while wait() do 
        if _G.AutoLawKak then
            pcall(function()
                CommF_Remote:InvokeServer("BlackbeardReward", "Microchip", "2")
                task.wait(1)
                fireclickdetector(Workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                task.wait(2)
                
                local v = GetConnectionEnemies("Order")
                if v and v.Parent and v:FindFirstChild("Humanoid") then
                    repeat 
                        task.wait()
                        Attack.Kill(v, _G.AutoLawKak)
                    until _G.AutoLawKak == false or not v.Parent or v.Humanoid.Health <= 0
                else
                    _tp(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
                end
            end)
        end
    end
end)

--========================================
-- 29. OBSERVATION FARM
--========================================
local ObservationFarm = Other.CreateSection("Farm Observation")

ObservationFarm.CreateToggle({
    Title = "Auto UP Observation V2",
    Default = false,
    Callback = function(Value)
        _G.AutoKenVTWO = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        if _G.AutoKenVTWO then
            pcall(function()
                local Kv2Pos1 = CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)
                local Kv2Pos3 = CFrame.new(-10920.125, 624.20275878906, -10266.995117188)
                local Kv2Pos4 = CFrame.new(-13277.568359375, 370.34185791016, -7821.1572265625)
                local Kv2Pos5 = CFrame.new(-13493.12890625, 318.89553833008, -8373.7919921875)
                
                if plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Defeat 50 Forest Pirates") then
                    local v = GetConnectionEnemies("Forest Pirate")
                    if v then
                        repeat wait() Attack.Kill(v, _G.AutoKenVTWO) until not _G.AutoKenVTWO or v.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        _tp(Kv2Pos4)
                    end
                elseif plr.PlayerGui.Main.Quest.Visible == true then 
                    local v = GetConnectionEnemies("Captain Elephant")
                    if v then
                        repeat wait() Attack.Kill(v, _G.AutoKenVTWO) until not _G.AutoKenVTWO or v.Humanoid.Health <= 0 or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        _tp(Kv2Pos5)
                    end
                elseif plr.PlayerGui.Main.Quest.Visible == false then
                    CommF_Remote:InvokeServer("CitizenQuestProgress","Citizen") wait(.1)
                    CommF_Remote:InvokeServer("StartQuest","CitizenQuest",1)
                end
                
                if CommF_Remote:InvokeServer("CitizenQuestProgress","Citizen") == 2 then
                    _tp(CFrame.new(-12513.51953125, 340.1137390136719, -9873.048828125))
                end
                
                if not plr.Backpack:FindFirstChild("Fruit Bowl") or not plr.Character:FindFirstChild("Fruit Bowl") then
                    if not GetBP("Fruit Bowl") then
                        if not GetBP("Apple") then
                            CommF_Remote:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
                            for i, v in pairs(Workspace:GetDescendants()) do
                                if v.Name == "Apple" then
                                    v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10) wait()
                                    firetouchinterest(plr.Character.HumanoidRootPart, v.Handle, 0) wait()
                                end
                            end
                        elseif not GetBP("Banana") then
                            _tp(CFrame.new(2286.0078125,73.13391876220703,-7159.80908203125))
                            for i, v in pairs(Workspace:GetDescendants()) do
                                if v.Name == "Banana" then
                                    v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10) wait()
                                    firetouchinterest(plr.Character.HumanoidRootPart, v.Handle, 0) wait()
                                end
                            end
                        elseif not GetBP("Pineapple") then
                            _tp(CFrame.new(-712.8272705078125,98.5770492553711,5711.9541015625))
                            for i, v in pairs(Workspace:GetDescendants()) do
                                if v.Name == "Pineapple" then
                                    v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,10) wait()
                                    firetouchinterest(plr.Character.HumanoidRootPart, v.Handle, 0) wait()
                                end
                            end
                        end
                    end
                    
                    if plr.Backpack:FindFirstChild("Banana") and plr.Backpack:FindFirstChild("Apple") and plr.Backpack:FindFirstChild("Pineapple") or plr:FindFirstChild("Banana") and plr:FindFirstChild("Apple") and plr:FindFirstChild("Pineapple") then
                        repeat wait() _tp(Kv2Pos1) until _G.AutoKenVTWO or plr.Character.HumanoidRootPart.CFrame == Kv2Pos1
                        CommF_Remote:InvokeServer("CitizenQuestProgress","Citizen")
                    end
                    
                    if plr.Backpack:FindFirstChild("Fruit Bowl") or plr.Character:FindFirstChild("Fruit Bowl") then
                        if plr.Character.HumanoidRootPart.CFrame ~= Kv2Pos3 then 
                            _tp(Kv2Pos3)
                        elseif plr.Character.HumanoidRootPart.CFrame == Kv2Pos3 then
                            CommF_Remote:InvokeServer("KenTalk2","Start") wait(.1)
                            CommF_Remote:InvokeServer("KenTalk2","Buy")
                        end
                    end
                end
            end)
        end
    end
end)

ObservationFarm.CreateToggle({
    Title = "Farm Observation",
    Default = false,
    Callback = function(Value)
        _G.obsFarm = Value
    end
})

task.spawn(function()
    while wait(.2) do
        pcall(function()
            if _G.obsFarm then
                ReplicatedStorage.Remotes.CommE:FireServer("Ken",true)
                if plr:GetAttribute("KenDodgesLeft") == 0 then
                    KenTest = false
                elseif plr:GetAttribute("KenDodgesLeft") > 0 then
                    ReplicatedStorage.Remotes.CommE:FireServer("Ken",true)
                    KenTest = true
                end
            end
        end)
    end
end)

task.spawn(function()
    while wait(.2) do
        pcall(function()
            if _G.obsFarm then
                if World1 then
                    if Workspace.Enemies:FindFirstChild("Galley Captain") then
                        if KenTest then
                            repeat wait()
                                plr.Character.HumanoidRootPart.CFrame = Workspace.Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                            until _G.obsFarm == false or KenTest == false
                        else
                            repeat wait()
                                plr.Character.HumanoidRootPart.CFrame = Workspace.Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
                            until _G.obsFarm == false or KenTest
                        end
                    else
                        _tp(CFrame.new(5533.29785, 88.1079102, 4852.3916))
                    end
                elseif World2 then
                    if Workspace.Enemies:FindFirstChild("Lava Pirate") then
                        if KenTest then
                            repeat wait()
                                plr.Character.HumanoidRootPart.CFrame = Workspace.Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(3,0,0)
                            until _G.obsFarm == false or KenTest == false
                        else
                            repeat wait()
                                plr.Character.HumanoidRootPart.CFrame = Workspace.Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(0,50,0)
                            until _G.obsFarm == false or KenTest
                        end
                    else
                        _tp(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
                    end
                elseif World3 then
                    if Workspace.Enemies:FindFirstChild("Venomous Assailant") then
                        if KenTest then
                            repeat wait()
                                _tp(Workspace.Enemies:FindFirstChild("Venomous Assailant").HumanoidRootPart.CFrame * CFrame.new(3,0,0))
                            until _G.obsFarm == false or KenTest == false
                        else
                            repeat wait()
                                _tp(Workspace.Enemies:FindFirstChild("Venomous Assailant").HumanoidRootPart.CFrame * CFrame.new(0,50,0))
                            until _G.obsFarm == false or KenTest
                        end
                    else
                        _tp(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
                    end
                end        
            end
        end)
    end
end)

ObservationFarm.CreateToggle({
    Title = "Farm Observation [ Hop Server ]",
    Default = false,
    Callback = function(Value)
        _G.ObservationFarmHop = Value
        if not _G.obsFarm then 
            Library.CreateNoti({
                Title = "Banana Cat Hub",
                Desc = "Open Auto Observation Plz!",
                Duration = 3
            })
        end
    end
})

task.spawn(function()      
    while wait(.2) do
        pcall(function()
            if _G.obsFarm and _G.ObservationFarmHop then
                if KenTest then
                    Hop()
                end
            end
        end)
    end
end)

--========================================
-- 30. AUTO BOSS
--========================================
local BossAuto = Other.CreateSection("Auto Boss")

if World1 then
    tableBoss = {
        "The Gorilla King", "Bobby", "Yeti", "Mob Leader", "Vice Admiral",
        "Warden", "Chief Warden", "Swan", "Magma Admiral", "Fishman Lord",
        "Wysper", "Thunder God", "Cyborg", "Saber Expert"
    }
elseif World2 then
    tableBoss = {
        "Diamond", "Jeremy", "Fajita", "Don Swan", "Smoke Admiral",
        "Cursed Captain", "Darkbeard", "Order", "Awakened Ice Admiral", "Tide Keeper"
    }
elseif World3 then
    tableBoss = {
        "Stone", "Island Empress", "Kilo Admiral", "Captain Elephant",
        "Beautiful Pirate", "rip_indra True Form", "Longma", "Soul Reaper",
        "Cake Queen", "Cake Prince", "Dough King"
    }
end

BossAuto.CreateDropdown({
    Title = "Select Boss",
    List = tableBoss,
    Default = nil,
    Callback = function(Value)
        getgenv().SelectBoss = Value
    end
})

BossAuto.CreateToggle({
    Title = "Kill Boss",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFarmBoss = Value
    end
})

BossAuto.CreateToggle({
    Title = "Kill All Boss",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFarmAllBoss = Value
    end
})

local function AutoHaki()
    if Boud then
        if not plr.Character:FindFirstChild("HasBuso") then
            CommF_Remote:InvokeServer("Buso")
        end
    end
end

local function AttackBoss(v)
    if not v or not v.Parent or not v:FindFirstChild("Humanoid") or not v:FindFirstChild("HumanoidRootPart") then return end
    if v.Humanoid.Health <= 0 then return end

    AutoHaki()
    EquipWeapon(_G.SelectWeapon)
    
    v.HumanoidRootPart.CanCollide = false
    v.Humanoid.WalkSpeed = 0
    v.HumanoidRootPart.Size = Vector3.new(80, 80, 80)
    
    _tp(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
end

task.spawn(function()
    while task.wait(0.2) do
        if getgenv().AutoFarmBoss and getgenv().SelectBoss ~= "" then
            pcall(function()
                local bossName = getgenv().SelectBoss
                local enemy = Workspace.Enemies:FindFirstChild(bossName)
                if enemy then
                    AttackBoss(enemy)
                else
                    local repBoss = replicated:FindFirstChild(bossName)
                    if repBoss then
                        if getgenv().BypassTP then
                            BTP(repBoss.HumanoidRootPart.CFrame)
                        else
                            _tp(repBoss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                        end
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if getgenv().AutoFarmAllBoss then
            pcall(function()
                for _, bossName in pairs(tableBoss) do
                    local enemy = Workspace.Enemies:FindFirstChild(bossName)
                    if enemy then
                        AttackBoss(enemy)
                        break
                    else
                        local repBoss = replicated:FindFirstChild(bossName)
                        if repBoss then
                            _tp(repBoss.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                            break
                        end
                    end
                end
            end)
        end
    end
end)
print("FRD 1")
local ok, err = pcall(function()
task.wait(7)
--========================================
-- 31. FRUIT AND RAID, DUNGEON TAB
--========================================
local FRD = Main.CreatePage({Page_Name = "Fruit And Raid, Dungeon", Page_Title = "Fruit and Raid and Dungeon Tab"})
local DevilFruitOpen = FRD.CreateSection("Devil Fruit")

DevilFruitOpen.CreateToggle({
    Title = "Random Devil Fruit",
    Default = false,
    Callback = function(Value)
        _G.Random_Auto = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Random_Auto then CommF_Remote:InvokeServer("Cousin","Buy") end 
        end)
    end
end)

DevilFruitOpen.CreateToggle({
    Title = "Auto Store",
    Default = false,
    Callback = function(Value)
        _G.StoreF = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        if _G.StoreF then
            pcall(function() UpdStFruit() end)
        end
    end
end)

FruitsSniper = {
    "Rocket-Rocket", "Spin-Spin", "Blade-Blade", "Spring-Spring", "Bomb-Bomb",
    "Smoke-Smoke", "Spike-Spike", "Flame-Flame", "Ice-Ice", "Sand-Sand",
    "Dark-Dark", "Eagle-Eagle", "Diamond-Diamond", "Light-Light",
    "Rubber-Rubber", "Ghost-Ghost", "Magma-Magma", "Quake-Quake",
    "Buddha-Buddha", "Love-Love", "Creation-Creation", "Spider-Spider",
    "Sound-Sound", "Phoenix-Phoenix", "Portal-Portal", "Lightning-Lightning", 
    "Pain-Pain", "Blizzard-Blizzard", "Gravity-Gravity", "Mammoth-Mammoth",
    "T-Rex-T-Rex", "Dough-Dough", "Shadow-Shadow", "Venom-Venom",
    "Gas-Gas", "Spirit-Spirit", "Tiger-Tiger", "Yeti-Yeti",
    "Kitsune-Kitsune", "Control-Control", "Dragon-Dragon"
}

DevilFruitOpen.CreateDropdown({
    Title = "Blox Fruit Sniper Shop",
    List = FruitsSniper,
    Default = nil,
    Callback = function(Value)
        getgenv().SelectFruit = Value
    end
})

DevilFruitOpen.CreateToggle({
    Title = "Buy Blox Fruit Sniper Shop",
    Default = false,
    Callback = function(Value)
        getgenv().AutoBuyFruitSniper = Value
    end
})

task.spawn(function()
    pcall(function()
        while task.wait(1) do
            if getgenv().AutoBuyFruitSniper then
                CommF_Remote:InvokeServer("GetFruits")
                CommF_Remote:InvokeServer("PurchaseRawFruit", getgenv().SelectFruit)
            end
        end
    end)
end)

--========================================
-- 32. RAIDS
--========================================
local RaidOpen = FRD.CreateSection("Raids")

RaidOpen.CreateDropdown({
    Title = "Select Raid",
    List = {"Flame","Ice","Quake","Light","Dark","Spider","Magma","Buddha","Sand","Phoenix","Dough"},
    Default = nil,
    Callback = function(Value)
        _G.SelectChip = Value
    end
})

RaidOpen.CreateToggle({
    Title = "Get Fruit in Inventory Low Beli",
    Default = false,
    Callback = function(Value)
        getgenv().AutoGetFruit = Value
    end
})

task.spawn(function()
    while task.wait(.1) do
        pcall(function()
            if not getgenv().AutoGetFruit then return end
            
            if GetBP("Special Microchip") then 
                getgenv().AutoGetFruit = false
                return 
            end
            
            local FruitPrice = {}
            local fruits = CommF_Remote:InvokeServer("GetFruits")
            
            for _, v in pairs(fruits) do
                if v.Price <= 490000 then 
                    table.insert(FruitPrice, v.Name) 
                end
            end
            
            for _, fruitName in pairs(FruitPrice) do
                if not getgenv().AutoGetFruit then break end
                if GetBP("Special Microchip") then break end
                
                CommF_Remote:InvokeServer("LoadFruit", tostring(fruitName))
                
                if _G.SelectChip then
                    CommF_Remote:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
                end
                
                task.wait(0.5)
            end
        end)
    end
end)

RaidOpen.CreateToggle({
    Title = "Auto Raid",
    Default = false,
    Callback = function(Value)
        _G.Raiding = Value
        if Value then
            _G.RaidOldBring = _B
            _B = false
            if block and Root then
                block.CFrame = Root.CFrame
            end
        else
            _G.RaidNoclip = false
            if _G.RaidOldBring ~= nil then
                _B = _G.RaidOldBring
            end
        end
    end
})

_G.BossKillAura = _G.BossKillAura or false
_G.BossName = _G.BossName or ""
_G.BossIslandOnly = (_G.BossIslandOnly == nil) and true or _G.BossIslandOnly

local function IsOnIsland5()
    if not _G.BossIslandOnly then return true end

    if _G.RaidIslandCurrent ~= nil then
        return tostring(_G.RaidIslandCurrent) == "5"
    end

    local character = plr.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return false end

    local locations = Workspace:FindFirstChild("_WorldOrigin") and Workspace._WorldOrigin:FindFirstChild("Locations")
    if not locations then return true end

    local island5 = locations:FindFirstChild("Island 5")
    if not island5 then
        for _, child in pairs(locations:GetChildren()) do
            local nameNoSpace = child.Name:gsub("%s+", ""):lower()
            if nameNoSpace == "island5" then
                island5 = child
                break
            end
        end
    end

    if not island5 then return true end

    return (rootPart.Position - island5.Position).Magnitude <= 1500
end

local function FindBoss()
    if _G.BossName == "" then return nil end

    local enemiesFolder = Workspace:FindFirstChild("Enemies")
    if not enemiesFolder then return nil end

    for _, v in pairs(enemiesFolder:GetChildren()) do
        if v.Name == _G.BossName
        and v:FindFirstChild("Humanoid")
        and v:FindFirstChild("HumanoidRootPart")
        and v.Humanoid.Health > 0 then
            return v
        end
    end
    return nil
end

task.spawn(function()
    while true do
        task.wait()
        if _G.RaidNoclip then
            pcall(function()
                for _, part in pairs(plr.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end)
        end
    end
end)

local RaidIslandIndex = 1
local arrivedIsland5Time = nil
local BOSS_SPAWN_DELAY = 5

task.spawn(function()
    while true do
        task.wait()

        if _G.Raiding then
            _B = false
        end

        if not _G.Raiding or not plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
            NextIs = false
            _G.RaidNoclip = false
            arrivedIsland5Time = nil
            if not plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
                RaidIslandIndex = 1
            end
            task.wait(1)
            continue
        end

        _G.RaidNoclip = true

        local islands = {"Island 1","Island 2","Island 3","Island 4","Island 5"}

        if RaidIslandIndex > #islands then
            RaidIslandIndex = 1
        end

        local island = islands[RaidIslandIndex]
        local location = Workspace._WorldOrigin.Locations:FindFirstChild(island)

        if not location then
            local islandNumber = tostring(RaidIslandIndex)
            for _, child in pairs(Workspace._WorldOrigin.Locations:GetChildren()) do
                local nameNoSpace = child.Name:gsub("%s+", ""):lower()
                if nameNoSpace == ("island" .. islandNumber) then
                    location = child
                    break
                end
            end
        end

        if not location then
            task.wait(1)
            continue
        end

        _G.RaidIslandCurrent = RaidIslandIndex

        if block and Root then
            block.CFrame = Root.CFrame
        end

        repeat
            task.wait()
            if location and location.Parent then
                pcall(function() _tp(location.CFrame * CFrame.new(0,30,0)) end)
            else
                break
            end
        until not _G.Raiding
        or not plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible
        or not location.Parent
        or (Root.Position - location.Position).Magnitude <= 200

        if not _G.Raiding or not location or not location.Parent then continue end
        task.wait(0.5)

        local waitMob = tick()
        while _G.Raiding and tick() - waitMob < 10 do
            local hasMob = false
            for _, v in pairs(Workspace.Enemies:GetChildren()) do
                if v:FindFirstChild("Humanoid")
                and v:FindFirstChild("HumanoidRootPart")
                and v.Humanoid.Health > 0
                and (v.HumanoidRootPart.Position - location.Position).Magnitude <= 1200 then
                    hasMob = true
                    break
                end
            end
            if hasMob then break end
            task.wait(0.5)
        end

        while _G.Raiding do
            if _G.BossKillAura and RaidIslandIndex == 5 then
                if not arrivedIsland5Time then
                    arrivedIsland5Time = tick()
                end

                local elapsed = tick() - arrivedIsland5Time
                if elapsed >= BOSS_SPAWN_DELAY then
                    local boss = FindBoss()
                    if boss then
                        pcall(function()
                            local humanoid = boss:FindFirstChild("Humanoid")
                            local rootPart = boss:FindFirstChild("HumanoidRootPart")
                            if humanoid and rootPart and humanoid.Health > 0 then
                                pcall(function()
                                    sethiddenproperty(plr, "SimulationRadius", math.huge)
                                end)
                                if block and Root then
                                    block.CFrame = Root.CFrame
                                end
                                Attack.Kill(boss, _G.BossKillAura)
                            end
                        end)
                        task.wait(0.2)
                        continue
                    end
                end
            else
                arrivedIsland5Time = nil
            end

            local target = nil

            for _, v in pairs(Workspace.Enemies:GetChildren()) do
                if v:FindFirstChild("Humanoid")
                and v:FindFirstChild("HumanoidRootPart")
                and v.Humanoid.Health > 0
                and (v.HumanoidRootPart.Position - location.Position).Magnitude <= 1200 then
                    target = v
                    break
                end
            end

            if not target then
                RaidIslandIndex = RaidIslandIndex + 1
                NextIs = true
                break
            end

            repeat
                task.wait()
                pcall(function()
                    if target.Parent
                    and target:FindFirstChild("Humanoid")
                    and target:FindFirstChild("HumanoidRootPart")
                    and target.Humanoid.Health > 0 then
                        if block and Root then
                            block.CFrame = Root.CFrame
                        end
                        Attack.Kill(target, _G.Raiding)
                        NextIs = false
                    end
                end)
            until not _G.Raiding
            or not plr.PlayerGui.Main.TopHUDList.RaidTimer.Visible
            or not target.Parent
            or not target:FindFirstChild("Humanoid")
            or not target:FindFirstChild("HumanoidRootPart")
            or target.Humanoid.Health <= 0

            task.wait(0.2)
        end

        _G.RaidNoclip = false
    end
end)

RaidOpen.CreateToggle({
    Title = "Auto Awaken Fruit",
    Default = false,
    Callback = function(Value)
        _G.Auto_Awakener = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Awakener then
                CommF_Remote:InvokeServer("Awakener","Check")
                CommF_Remote:InvokeServer("Awakener","Awaken")
            end
        end) -- đóng pcall
    end
end)
print("FRD 2")
--========================================
-- 33. DUNGEON
--========================================
local DungeonOpen = FRD.CreateSection("Dungeon")

local AttackDistance = 35
local MaxTargetDistance = 5000
local AttackHeight = 30
local TeleportOffset = 250
local MaxAttempts = 4
local ExitCheckDelay = 0.15
local DungeonGamePlaceId = 73902483975735
local PropHitboxName = "PropHitboxPlaceholder"
local PropHitboxPriority = 1000000
local BlankBuddyName = "Blank Buddy"

local function TweenTo(pos)
    local char = plr.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    local tweenInfo = TweenInfo.new((char.HumanoidRootPart.Position - pos.Position).Magnitude/200, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(char.HumanoidRootPart, tweenInfo, {CFrame = pos})
    tween:Play()
    tween.Completed:Wait()
end

local function InstantTP(cframe)
    local char = plr.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = cframe
    end
end

local function AutoHaki()
    if not plr.Character then return end
    
    if not plr.Character:FindFirstChild("HasBuso") then
        local args = {[1] = "Buso"}
        CommF_Remote:InvokeServer(unpack(args))
    end
end

local function EquipWeapon(toolName)
    if not toolName or toolName == "" then return end
    
    local char = plr.Character
    local backpack = plr.Backpack
    
    pcall(function()
        if backpack:FindFirstChild(toolName) then
            local tool = backpack[toolName]
            plr.Character.Humanoid:EquipTool(tool)
        end
    end)
end

local function StopTween(forceStop)
    if forceStop then
        local char = plr.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid:MoveTo(char.HumanoidRootPart.Position)
        end
    end
end

local UpdateSelectedWeapon

UpdateSelectedWeapon = function()
    if not _G.ChooseWP or _G.ChooseWP == "" then
        _G.SelectWeapon = ""
        return
    end

    pcall(function()
        local backpack = plr.Backpack

        if _G.ChooseWP == "Melee" then
            for _, v in pairs(backpack:GetChildren()) do
                if v:IsA("Tool") and v.ToolTip == "Melee" then
                    _G.SelectWeapon = v.Name
                    break
                end
            end
        elseif _G.ChooseWP == "Sword" then
            for _, v in pairs(backpack:GetChildren()) do
                if v:IsA("Tool") and v.ToolTip == "Sword" then
                    _G.SelectWeapon = v.Name
                    break
                end
            end
        elseif _G.ChooseWP == "Blox Fruit" then
            for _, v in pairs(backpack:GetChildren()) do
                if v:IsA("Tool") and v.ToolTip == "Blox Fruit" then
                    _G.SelectWeapon = v.Name
                    break
                end
            end
        end
    end)
end

DungeonOpen.CreateDropdown({
    Title = "Select Weapon in Dungeon",
    List = {"Melee", "Sword", "Blox Fruit"},
    Default = nil,
    Callback = function(Value)
        _G.ChooseWP = Value
        UpdateSelectedWeapon()
    end
})

spawn(function()
    while wait(Sec) do
        if AutoFarmDungeon then
            UpdateSelectedWeapon()
        end
    end
end)

DungeonOpen.CreateButton({
    Title = "Teleport to Dungeon",
    Callback = function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
        local DungeonPlaceId = 73902483975735
        
        local function IsDungeonGame()
            return game.PlaceId == DungeonPlaceId
        end

        local function ClickButton(Button)
            if not Button or not Button.Parent then
                return false
            end

            local success = pcall(function()
                Button:Activate()
            end)

            if not success then
                pcall(function()
                    if fireclickdetector then
                        fireclickdetector(Button:FindFirstChildOfClass("ClickDetector"))
                    end
                end)
            end

            return true
        end

        if not IsDungeonGame() then
            local ServerBrowserButton = PlayerGui:WaitForChild("Topbar"):WaitForChild("Frame"):WaitForChild("ServerBrowserButton")
            ClickButton(ServerBrowserButton)
            
            task.wait(0.5)
            
            local ServerBrowserGui = PlayerGui:WaitForChild("ServerBrowser")
            local startTime = tick()
            
            while tick() - startTime < 5 do
                if ServerBrowserGui.Enabled then
                    break
                end
                task.wait(0.1)
            end
            
            local DungeonButton = ServerBrowserGui:WaitForChild("Frame"):WaitForChild("TeleportButtons"):WaitForChild("Dungeon")
            
            for i = 1, 3 do
                ClickButton(DungeonButton)
                task.wait(0.25)
            end
        else
            warn("You are already in Dungeon!")
        end
    end
})

DungeonOpen.CreateToggle({
    Title = "Auto Dungeon",
    Default = false,
    Callback = function(Value)
        AutoFarmDungeon = Value
        if Value then
            StopTween(true)
            GoingToExit = false
            DeathPause = false
        end
    end
})

DungeonOpen.CreateToggle({
    Title = "Bring Mobs",
    Default = true,
    Callback = function(Value)
        DungeonBring = Value
    end
})

local function IsDungeonGamePlace()
    return game.PlaceId == DungeonGamePlaceId
end

local function IsDungeonLoaded()
    return Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("Dungeon")
end

local function GetDungeonCharacter()
    return plr.Character
end

local function GetDungeonHumanoid()
    local Character = GetDungeonCharacter()
    return Character and Character:FindFirstChildOfClass("Humanoid")
end

local function GetLocalRootPart()
    local Character = plr.Character
    return Character and Character:FindFirstChild("HumanoidRootPart")
end

local function GetDungeonRoom(RoomNumber)
    local Map = Workspace:FindFirstChild("Map")
    local Dungeon = Map and Map:FindFirstChild("Dungeon")
    return Dungeon and Dungeon:FindFirstChild(tostring(RoomNumber))
end

local function IsPositionInRoom(Room, Position)
    if not Room or not Position or not Room:IsA("Model") then
        return false
    end

    local success, cf, size = pcall(function()
        return Room:GetBoundingBox()
    end)
    
    if not success then return false end

    local LocalPosition = cf:PointToObjectSpace(Position)
    local Margin = 25

    return math.abs(LocalPosition.X) <= size.X / 2 + Margin and 
           math.abs(LocalPosition.Y) <= size.Y / 2 + Margin and 
           math.abs(LocalPosition.Z) <= size.Z / 2 + Margin
end

local function GetCurrentRoom()
    if not IsDungeonLoaded() then
        return nil
    end

    local RootPart = GetLocalRootPart()
    if not RootPart then
        return nil
    end

    local Dungeon = Workspace.Map.Dungeon

    for _, Room in ipairs(Dungeon:GetChildren()) do
        if Room:IsA("Model") and IsPositionInRoom(Room, RootPart.Position) then
            return Room
        end
    end

    return nil
end

local function RemovePropHitboxes()
    local Enemies = Workspace:FindFirstChild("Enemies")
    if not Enemies then return end

    for _, Enemy in ipairs(Enemies:GetChildren()) do
        if Enemy and Enemy.Name == PropHitboxName then
            Enemy:Destroy()
        end
    end
end

local function CheckAndRemovePropHitboxes()
    local RootPart = GetLocalRootPart()
    local Room16 = GetDungeonRoom(16)

    if Room16 and RootPart and IsPositionInRoom(Room16, RootPart.Position) then
        RemovePropHitboxes()
    end
end

local function IsValidTarget(Target, CharacterPosition)
    if not Target or not Target.Parent then
        return false
    end

    if Target.Name == BlankBuddyName then
        return false
    end

    local Humanoid = Target:FindFirstChild("Humanoid")
    local HumanoidRootPart = Target:FindFirstChild("HumanoidRootPart")

    if not Humanoid or not HumanoidRootPart then
        return false
    end

    if Humanoid.Health <= 0 then
        return false
    end

    local Distance = (CharacterPosition - HumanoidRootPart.Position).Magnitude
    if Distance > MaxTargetDistance then
        return false
    end

    return true
end

local function GetBestTarget()
    local CharacterRoot = GetLocalRootPart()
    if not CharacterRoot then return nil end

    local BestTarget = nil
    local BestDistance = math.huge

    local Enemies = Workspace:FindFirstChild("Enemies")
    if not Enemies then return nil end

    for _, Enemy in ipairs(Enemies:GetChildren()) do
        if IsValidTarget(Enemy, CharacterRoot.Position) then
            local EnemyRoot = Enemy:FindFirstChild("HumanoidRootPart")
            if EnemyRoot then
                local Distance = (CharacterRoot.Position - EnemyRoot.Position).Magnitude
                local PriorityDistance = Distance

                if Enemy.Name == PropHitboxName then
                    PriorityDistance = PriorityDistance - PropHitboxPriority
                end

                if PriorityDistance < BestDistance then
                    BestDistance = PriorityDistance
                    BestTarget = Enemy
                end
            end
        end
    end

    return BestTarget
end

local function HasValidTargets()
    local CharacterRoot = GetLocalRootPart()
    if not CharacterRoot then return false end

    local Enemies = Workspace:FindFirstChild("Enemies")
    if not Enemies then return false end

    for _, Enemy in ipairs(Enemies:GetChildren()) do
        if IsValidTarget(Enemy, CharacterRoot.Position) then
            return true
        end
    end

    return false
end

local function FreezeMob(Mob)
    if not Mob or Mob:FindFirstChild("Frozen") then return end

    pcall(function()
        local FrozenValue = Instance.new("BoolValue")
        FrozenValue.Name = "Frozen"
        FrozenValue.Parent = Mob

        if Mob:FindFirstChild("HumanoidRootPart") then
            Mob.HumanoidRootPart.CanCollide = false
        end
        
        if Mob:FindFirstChild("Humanoid") then
            Mob.Humanoid.WalkSpeed = 0
            Mob.Humanoid.JumpPower = 0
        end
    end)
end

local function GoToExit()
    if not AutoFarmDungeon or GoingToExit then return end
    if not IsDungeonGamePlace() or not IsDungeonLoaded() then return end

    GoingToExit = true
    StopTween(true)

    local function FindExit()
        local CurrentRoom = GetCurrentRoom()
        if CurrentRoom and CurrentRoom:FindFirstChild("ExitTeleporter") then
            local Exit = CurrentRoom.ExitTeleporter
            if Exit:IsA("Model") and Exit.PrimaryPart then
                return Exit.PrimaryPart.CFrame
            elseif Exit:IsA("BasePart") then
                return Exit.CFrame
            end
        end
        
        local Dungeon = Workspace.Map.Dungeon
        local CharacterRoot = GetLocalRootPart()
        if not CharacterRoot then return nil end
        
        local NearestExit = nil
        local NearestDistance = math.huge
        
        for _, Room in pairs(Dungeon:GetChildren()) do
            local ExitTeleporter = Room:FindFirstChild("ExitTeleporter")
            if ExitTeleporter then
                local ExitPart = ExitTeleporter:IsA("Model") and ExitTeleporter.PrimaryPart or ExitTeleporter
                if ExitPart then
                    local Distance = (CharacterRoot.Position - ExitPart.Position).Magnitude
                    if Distance < NearestDistance then
                        NearestDistance = Distance
                        NearestExit = ExitPart.CFrame
                    end
                end
            end
        end
        
        return NearestExit
    end

    for attempt = 1, 3 do
        local ExitCFrame = FindExit()
        if ExitCFrame then
            InstantTP(ExitCFrame * CFrame.new(0, 5, 0))
            task.wait(0.5)
        end
    end

    GoingToExit = false
end

spawn(function()
    while task.wait(0.1) do
        if not AutoFarmDungeon then continue end
        if GoingToExit or DeathPause then continue end
        if not IsDungeonGamePlace() or not IsDungeonLoaded() then continue end

        pcall(function()
            CheckAndRemovePropHitboxes()
            
            if not HasValidTargets() then
                GoToExit()
                return
            end
            
            local Target = GetBestTarget()
            if not Target then
                GoToExit()
                return
            end
            
            local CharacterRoot = GetLocalRootPart()
            if not CharacterRoot then return end
            
            FreezeMob(Target)
            AutoHaki()
            EquipWeapon(_G.SelectWeapon)
            
            local TargetRoot = Target:FindFirstChild("HumanoidRootPart")
            if not TargetRoot then return end
            
            local AttackCFrame = TargetRoot.CFrame * CFrame.new(0, AttackHeight, AttackDistance)
            
            if (CharacterRoot.Position - AttackCFrame.Position).Magnitude > 10 then
                InstantTP(AttackCFrame)
            end
            
            local Character = plr.Character
if not Character then return end

local Tool = Character:FindFirstChildOfClass("Tool")
            if Tool and Tool:FindFirstChild("RemoteEvent") then
                Tool.RemoteEvent:FireServer("Mouse1", TargetRoot.Position)
            end
        end)
    end
end)

local DeathListener
local function SetupDeathListener()
    if DeathListener then
        pcall(function() DeathListener:Disconnect() end)
    end
    
    local Humanoid = GetDungeonHumanoid()
    if not Humanoid then return end
    
    DeathListener = Humanoid.Died:Connect(function()
        if not AutoFarmDungeon then return end
        
        DeathPause = true
        StopTween(true)
        
        task.wait(3)
        
        if plr.Character then
            plr.Character:WaitForChild("HumanoidRootPart", 5)
            DeathPause = false
        end
    end)
end

plr.CharacterAdded:Connect(function()
    task.wait(1)
    SetupDeathListener()
    DeathPause = false
end)

task.wait(1)
SetupDeathListener()
print("FRD END")
end)

print(ok, err)
--========================================
-- 34. SEA EVENT TAB
--========================================
local Sea = Main.CreatePage({Page_Name = "Sea Event", Page_Title = "Sea Event Tab"})
local SettingsSea = Sea.CreateSection("Setting")

SettingsSea.CreateDropdown({
    Title = "Select Zone",
    List = {"Lv 1", "Lv 2", "Lv 3", "Lv 4", "Lv 5", "Lv 6", "Lv Infinite"},
    Default = "Lv 1",
    Callback = function(Value)
        _G.DangerSc = Value
    end
})

SettingsSea.CreateDropdown({
    Title = "Select Sea Events",
    Selected = true,
    List = {"Shark", "Piranha", "Terror Shark", "Fish Crew Member", "Haunted Crew Member", "Sea Beast", "Leviathan", "Pirate Grand Brigade", "Fish Boat"},
    Default = nil,
    Callback = function(Value)
        _G.SelectSeaEvent = Value
        _G.Shark = (Value == "Shark")
        _G.Piranha = (Value == "Piranha")
        _G.TerrorShark = (Value == "Terror Shark")
        _G.MobCrew = (Value == "Fish Crew Member")
        _G.HCM = (Value == "Haunted Crew Member")
        _G.SeaBeast1 = (Value == "Sea Beast")
        _G.Leviathan1 = (Value == "Leviathan")
        _G.PGB = (Value == "Pirate Grand Brigade")
        _G.FishBoat = (Value == "Fish Boat")
    end
})

SettingsSea.CreateDropdown({
    Title = "Select Boat",
    List = {"Guardian", "PirateGrandBrigade", "MarineGrandBrigade", "PirateBrigade", "MarineBrigade", "PirateSloop", "MarineSloop", "Beast Hunter"},
    Default = "Guardian",
    Callback = function(Value)
        _G.SelectedBoat = Value
    end
})

task.spawn(function()
    while wait() do
        pcall(function()
            local selected = _G.SelectSeaEvent
            
            if selected == "Shark" then
                local a = {"Shark"}
                if CheckShark() then
                    for b, c in pairs(Workspace.Enemies:GetChildren()) do
                        if table.find(a, c.Name) then
                            if Attack.Alive(c) then
                                repeat
                                    task.wait()
                                    Attack.Kill(c, true)
                                until _G.SelectSeaEvent ~= "Shark" or not c.Parent or c.Humanoid.Health <= 0
                            end
                        end
                    end
                end
                
            elseif selected == "Piranha" then
                local a = {"Piranha"}
                if CheckPiranha() then
                    for b, c in pairs(Workspace.Enemies:GetChildren()) do
                        if table.find(a, c.Name) then
                            if Attack.Alive(c) then
                                repeat
                                    task.wait()
                                    Attack.Kill(c, true)
                                until _G.SelectSeaEvent ~= "Piranha" or not c.Parent or c.Humanoid.Health <= 0
                            end
                        end
                    end
                end
                
            elseif selected == "Terror Shark" then
                local a = {"Terrorshark"}
                if CheckTerrorShark() then
                    for b, c in pairs(Workspace.Enemies:GetChildren()) do
                        if table.find(a, c.Name) then
                            if Attack.Alive(c) then
                                repeat
                                    task.wait()
                                    Attack.KillSea(c, true)
                                until _G.SelectSeaEvent ~= "Terror Shark" or not c.Parent or c.Humanoid.Health <= 0
                            end
                        end
                    end
                end
                
            elseif selected == "Fish Crew Member" then
                local a = {"Fish Crew Member"}
                if CheckFishCrew() then
                    for b, c in pairs(Workspace.Enemies:GetChildren()) do
                        if table.find(a, c.Name) then
                            if Attack.Alive(c) then
                                repeat
                                    task.wait()
                                    Attack.Kill(c, true)
                                until _G.SelectSeaEvent ~= "Fish Crew Member" or not c.Parent or c.Humanoid.Health <= 0
                            end
                        end
                    end
                end
                
            elseif selected == "Haunted Crew Member" then
                local a = {"Haunted Crew Member"}
                if CheckHauntedCrew() then
                    for b, c in pairs(Workspace.Enemies:GetChildren()) do
                        if table.find(a, c.Name) then
                            if Attack.Alive(c) then
                                repeat
                                    task.wait()
                                    Attack.Kill(c, true)
                                until _G.SelectSeaEvent ~= "Haunted Crew Member" or not c.Parent or c.Humanoid.Health <= 0
                            end
                        end
                    end
                end
                
            elseif selected == "Pirate Grand Brigade" then
                if CheckPirateGrandBrigade() then
                    for a, b in pairs(Workspace.Enemies:GetChildren()) do
                        if b:FindFirstChild("Health") and b.Health.Value > 0 and b:FindFirstChild("VehicleSeat") then
                            repeat
                                task.wait()
                                spawn(function()
                                    if b.Name == "PirateBrigade" then
                                        _tp(b.Engine.CFrame * CFrame.new(0, -30, -10))
                                    elseif b.Name == "PirateGrandBrigade" then
                                        _tp(b.Engine.CFrame * CFrame.new(0, -50, -50))
                                    end
                                end)
                                if plr:DistanceFromCharacter(b.Engine.CFrame.Position) <= 150 then
                                    AitSeaSkill_Custom = b.Engine.CFrame
                                    MousePos = AitSeaSkill_Custom.Position
                                    if CheckF() then
                                        weaponSc("Blox Fruit")
                                        Useskills("Blox Fruit", "Z")
                                        Useskills("Blox Fruit", "X")
                                        Useskills("Blox Fruit", "C")
                                    else
                                        Useskills("Melee", "Z")
                                        Useskills("Melee", "X")
                                        Useskills("Melee", "C")
                                        wait(.1)
                                        Useskills("Sword", "Z")
                                        Useskills("Sword", "X")
                                        wait(.1)
                                        Useskills("Blox Fruit", "Z")
                                        Useskills("Blox Fruit", "X")
                                        Useskills("Blox Fruit", "C")
                                        wait(.1)
                                        Useskills("Gun", "Z")
                                        Useskills("Gun", "X")
                                    end
                                end
                            until _G.SelectSeaEvent ~= "Pirate Grand Brigade" or not b:FindFirstChild("VehicleSeat") or b.Health.Value <= 0
                        end
                    end
                end
                
            elseif selected == "Fish Boat" then
                if CheckEnemiesBoat() then
                    for a, b in pairs(Workspace.Enemies:GetChildren()) do
                        if b:FindFirstChild("Health") and b.Health.Value > 0 and b:FindFirstChild("VehicleSeat") then
                            repeat
                                task.wait()
                                spawn(function()
                                    if b.Name == "FishBoat" then
                                        _tp(b.Engine.CFrame * CFrame.new(0, -50, -25))
                                    end
                                end)
                                if plr:DistanceFromCharacter(b.Engine.CFrame.Position) <= 150 then
                                    AitSeaSkill_Custom = b.Engine.CFrame
                                    MousePos = AitSeaSkill_Custom.Position
                                    if CheckF() then
                                        weaponSc("Blox Fruit")
                                        Useskills("Blox Fruit", "Z")
                                        Useskills("Blox Fruit", "X")
                                        Useskills("Blox Fruit", "C")
                                    else
                                        Useskills("Melee", "Z")
                                        Useskills("Melee", "X")
                                        Useskills("Melee", "C")
                                        wait(.1)
                                        Useskills("Sword", "Z")
                                        Useskills("Sword", "X")
                                        wait(.1)
                                        Useskills("Blox Fruit", "Z")
                                        Useskills("Blox Fruit", "X")
                                        Useskills("Blox Fruit", "C")
                                        wait(.1)
                                        Useskills("Gun", "Z")
                                        Useskills("Gun", "X")
                                    end
                                end
                            until _G.SelectSeaEvent ~= "Fish Boat" or not b:FindFirstChild("VehicleSeat") or b.Health.Value <= 0
                        end
                    end
                end
                
            elseif selected == "Sea Beast" then
                if not Workspace.SeaBeasts:FindFirstChild("SeaBeast1") then
                    task.wait(1)
                end
                if Workspace.SeaBeasts:FindFirstChild("SeaBeast1") then
                    for a, b in pairs(Workspace.SeaBeasts:GetChildren()) do
                        if b.Name == "SeaBeast1" and b:FindFirstChild("HumanoidRootPart") and b:FindFirstChild("Health") and b.Health.Value > 0 then
                            local waterY = Workspace.Map["WaterBase-Plane"].Position.Y
                            repeat
                                task.wait(0.1)
                                pcall(function()
                                    if not b or not b.Parent or not b:FindFirstChild("HumanoidRootPart") then return end
                                    local targetY = waterY + 250
                                    local bPos = b.HumanoidRootPart.Position
                                    _tp(CFrame.new(bPos.X, targetY, bPos.Z))
                                    if plr:DistanceFromCharacter(bPos) <= 600 then
                                        AitSeaSkill_Custom = b.HumanoidRootPart.CFrame
                                        MousePos = bPos
                                        if CheckF() then
                                            weaponSc("Blox Fruit")
                                            Useskills("Blox Fruit", "Z")
                                            wait(0.05) Useskills("Blox Fruit", "X")
                                            wait(0.05) Useskills("Blox Fruit", "C")
                                        else
                                            Useskills("Melee", "Z")
                                            Useskills("Melee", "X")
                                            Useskills("Sword", "Z")
                                            Useskills("Sword", "X")
                                            Useskills("Blox Fruit", "Z")
                                            Useskills("Blox Fruit", "X")
                                            Useskills("Gun", "Z")
                                        end
                                    end
                                end)
                            until _G.SelectSeaEvent ~= "Sea Beast" or not b:FindFirstChild("HumanoidRootPart") or not b.Parent or b.Health.Value <= 0
                        end
                    end
                end
                
            elseif selected == "Leviathan" then
                if Workspace.SeaBeasts:FindFirstChild("Leviathan") then
                    for a, b in pairs(Workspace.SeaBeasts:GetChildren()) do
                        if b:FindFirstChild("HumanoidRootPart") and b:FindFirstChild("Leviathan Segment") and b:FindFirstChild("Health") and b.Health.Value > 0 then
                            repeat
                                task.wait()
                                spawn(function()
                                    _tp(CFrame.new(b.HumanoidRootPart.Position.X, Workspace.Map["WaterBase-Plane"].Position.Y + 200, b.HumanoidRootPart.Position.Z))
                                end)
                                if plr:DistanceFromCharacter(b.HumanoidRootPart.CFrame.Position) <= 500 then
                                    MousePos = b:FindFirstChild("Leviathan Segment").Position
                                    if CheckF() then
                                        weaponSc("Blox Fruit")
                                        Useskills("Blox Fruit", "Z")
                                        Useskills("Blox Fruit", "X")
                                        Useskills("Blox Fruit", "C")
                                    else
                                        Useskills("Melee", "Z")
                                        Useskills("Melee", "X")
                                        Useskills("Melee", "C")
                                        wait(.1)
                                        Useskills("Sword", "Z")
                                        Useskills("Sword", "X")
                                        wait(.1)
                                        Useskills("Blox Fruit", "Z")
                                        Useskills("Blox Fruit", "X")
                                        Useskills("Blox Fruit", "C")
                                        wait(.1)
                                        Useskills("Gun", "Z")
                                        Useskills("Gun", "X")
                                    end
                                end
                            until _G.SelectSeaEvent ~= "Leviathan" or not b:FindFirstChild("HumanoidRootPart") or not b.Parent or b.Health.Value <= 0
                        end
                    end
                end
            end
        end)
    end
end)

SettingsSea.CreateToggle({
    Title = "Auto Penetrate Rocks When Boat Runs",
    Default = true,
    Callback = function(Value)
        getgenv().GoThroughRocks = Value
    end
})

task.spawn(function()
    while task.wait(1) do
        if getgenv().GoThroughRocks or getgenv().SailBoat then
            for _, boat in ipairs(Workspace.Boats:GetChildren()) do
                for _, part in ipairs(boat:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        else
            for _, boat in ipairs(Workspace.Boats:GetChildren()) do
                for _, part in ipairs(boat:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
    end
end)

local SeaEventLabel = SettingsSea.CreateLabel({Title = "Sea Status: Idle"})

SettingsSea.CreateToggle({
    Title = "Auto Sea Event",
    Default = false,
    Callback = function(Value)
        _G.SailBoats = Value
        if Value then
            SeaEventLabel.SetText("Sea Status: 🟢 Active [" .. (tostring(_G.SelectSeaEvent) or "None") .. "]")
        else
            SeaEventLabel.SetText("Sea Status: ❌ Stopped")
        end
    end
})

task.spawn(function()
    while task.wait(2) do
        pcall(function()
            if _G.SailBoats and SeaEventLabel then
                local evt = tostring(_G.SelectSeaEvent or "None")
                local zone = tostring(_G.DangerSc or "None")
                if CheckLeviathan() then
                    SeaEventLabel.SetText("Sea Status: 🔵 LEVIATHAN FOUND!")
                elseif CheckSeaBeast() then
                    SeaEventLabel.SetText("Sea Status: 🔴 Sea Beast Active!")
                elseif CheckEnemiesBoat() then
                    SeaEventLabel.SetText("Sea Status: 🟠 Fish Boat Active!")
                elseif CheckPirateGrandBrigade() then
                    SeaEventLabel.SetText("Sea Status: 🟡 PGB Active!")
                else
                    SeaEventLabel.SetText("Sea Status: 🟢 Sailing [" .. zone .. "]")
                end
            end
        end)
    end
end)

task.spawn(function()
    while wait() do
        if _G.SailBoats then 
            pcall(function()        
                local myBoat = CheckBoat()
                if not myBoat and not(CheckShark()and _G.Shark or CheckTerrorShark()and _G.TerrorShark or CheckFishCrew()and _G.MobCrew or CheckPiranha()and _G.Piranha)and not(CheckEnemiesBoat()and _G.FishBoat)and not(CheckSeaBeast()and _G.SeaBeast1)and not(_G.PGB and CheckPirateGrandBrigade())and not(_G.HCM and CheckHauntedCrew())and not(_G.Leviathan1 and CheckLeviathan())then
                    local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
                    TeleportToTarget(buyBoatCFrame)
                    if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then CommF_Remote:InvokeServer("BuyBoat", _G.SelectedBoat) end
                elseif myBoat and not(CheckShark()and _G.Shark or CheckTerrorShark()and _G.TerrorShark or CheckFishCrew()and _G.MobCrew or CheckPiranha()and _G.Piranha)and not(CheckEnemiesBoat()and _G.FishBoat)and not(CheckSeaBeast()and _G.SeaBeast1)and not(_G.PGB and CheckPirateGrandBrigade())and not(_G.HCM and CheckHauntedCrew())and not(_G.Leviathan1 and CheckLeviathan())then
                    if plr.Character.Humanoid.Sit == false then
                        local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
                        _tp(boatSeatCFrame)
                    else                         
                        if _G.DangerSc == "Lv 1" then CFrameSelectedZone = CFrame.new(-21998.375, 30.0006084, -682.309143)
                        elseif _G.DangerSc == "Lv 2" then CFrameSelectedZone = CFrame.new(-26779.5215, 30.0005474, -822.858032)
                        elseif _G.DangerSc == "Lv 3" then CFrameSelectedZone = CFrame.new(-31171.957, 30.0001011, -2256.93774)
                        elseif _G.DangerSc == "Lv 4" then CFrameSelectedZone = CFrame.new(-34054.6875, 30.2187767, -2560.12012)
                        elseif _G.DangerSc == "Lv 5" then CFrameSelectedZone = CFrame.new(-38887.5547, 30.0004578, -2162.99023)
                        elseif _G.DangerSc == "Lv 6" then CFrameSelectedZone = CFrame.new(-44541.7617, 30.0003204, -1244.8584)
                        elseif _G.DangerSc == "Lv Infinite" then CFrameSelectedZone = CFrame.new(-10000000, 31, 37016.25)
                        end           
                        repeat wait() 
                            if (not _G.FishBoat and CheckEnemiesBoat()) or (not _G.PGB and CheckPirateGrandBrigade()) or (not _G.TerrorShark and CheckTerrorShark()) then
                                _tp(CFrameSelectedZone * CFrame.new(0,150,0))
                            else
                                _tp(CFrameSelectedZone)
                            end           
                        until _G.SailBoats==false or(CheckShark()and _G.Shark or CheckTerrorShark()and _G.TerrorShark or CheckFishCrew()and _G.MobCrew or CheckPiranha()and _G.Piranha)or CheckSeaBeast()and _G.SeaBeast1 or CheckEnemiesBoat()and _G.FishBoat or _G.Leviathan1 and CheckLeviathan() or _G.HCM and CheckHauntedCrew() or _G.PGB and CheckPirateGrandBrigade() or plr.Character:WaitForChild("Humanoid").Sit==false plr.Character.Humanoid.Sit = false
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            for a,b in pairs(Workspace.Boats:GetChildren()) do
                for c,d in pairs(Workspace.Boats[b.Name]:GetDescendants()) do
                    if d:IsA("BasePart") then
                        if _G.SailBoats or _G.Prehis_Find or _G.FindMirage or _G.SailBoat_Hydra or _G.AutofindKitIs then
                            d.CanCollide=false
                        else
                            d.CanCollide=true
                        end
                    end
                end
            end
        end)
    end
end)

--========================================
-- 35. KITSUNE EVENT
--========================================
local KitsuneSection = Sea.CreateSection("Kitsune Event")

KitsuneSection.CreateToggle({
    Title = "Teleport To Kitsune Island",
    Default = false,
    Callback = function(Value)
        _G.tweenKitsune = Value
    end
})

KitsuneSection.CreateToggle({
    Title = "Auto Summon Soul EmBer",
    Default = false,
    Callback = function(Value)
        _G.tweenKitShrine = Value
    end
})

KitsuneSection.CreateToggle({
    Title = "Auto Collect Azure Wisp",
    Default = false,
    Callback = function(Value)
        _G.Collect_Ember = Value
    end
})

KitsuneSection.CreateSlider({
    Title = "Values Azure Ember",
    Min = 0,
    Max = 25,
    Default = 20,
    Callback = function(Value)
        _G.SetAzureEmber = Value
    end
})

KitsuneSection.CreateToggle({
    Title = "Auto Trade Azure Ember",
    Default = false,
    Callback = function(Value)
        _G.AutofindKitIs = Value
    end
})

KitsuneSection.CreateButton({
    Title = "Trade Azure Wisp",
    Callback = function()
        local net = replicated:FindFirstChild("Modules") and replicated.Modules:FindFirstChild("Net")
        local prayFunction = net and net:FindFirstChild("RF/KitsuneStatuePray")
        if prayFunction then prayFunction:InvokeServer() end
    end
})

--========================================
-- 36. LEVIATHAN EVENT
--========================================
local LeviathanSection = Sea.CreateSection("Leviathan Event")

LeviathanSection.CreateButton({
    Title = "Buy Spy",
    Callback = function()
        CommF_Remote:InvokeServer("InfoLeviathan", "2")
    end
})

LeviathanSection.CreateToggle({
    Title = "Teleport To Frozen Dimension",
    Default = false,
    Callback = function(Value)
        _G.FrozenTP = Value
    end
})

LeviathanSection.CreateToggle({
    Title = "Auto Attack Leviathan",
    Default = false,
    Callback = function(Value)
        _G.Leviathan1 = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        if _G.tweenKitsune then
            pcall(function()
                local map = Workspace.Map
                local kitsuneIsland = map:FindFirstChild("KitsuneIsland")
                if kitsuneIsland then
                    local shrinePart = kitsuneIsland.ShrineActive.NeonShrinePart
                    _tp(shrinePart.CFrame * CFrame.new(0, 0, 10))
                end
            end)
        end
    end
end)

task.spawn(function()
    while wait(Sec) do
        if _G.tweenKitShrine and World3 then
            pcall(function()
                local net = replicated:FindFirstChild("Modules") and replicated.Modules:FindFirstChild("Net")
                local prayFunction = net and net:FindFirstChild("RF/KitsuneStatuePray")
                if prayFunction then prayFunction:InvokeServer() end
            end)
        end
    end
end)

task.spawn(function()
    while wait(Sec) do
        if _G.Collect_Ember then
            pcall(function()
                local attachedAzure = Workspace:FindFirstChild("AttachedAzureEmber")
                local emberTemplate = Workspace:FindFirstChild("EmberTemplate")
                if attachedAzure and emberTemplate then
                    local part = emberTemplate:FindFirstChild("Part")
                    if part then
                        local playerPos = Root.Position
                        local targetPos = part.Position
                        if (playerPos - targetPos).Magnitude > 10 then
                            _tp(part.CFrame)
                        end
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while wait(Sec) do
        if _G.AutofindKitIs then
            pcall(function()
                local AzureAvailable = GetM("Azure Ember")
                if AzureAvailable >= _G.SetAzureEmber then
                    local net = replicated:FindFirstChild("Modules") and replicated.Modules:FindFirstChild("Net")
                    local prayFunction = net and net:FindFirstChild("RF/KitsuneStatuePray")
                    if prayFunction then prayFunction:InvokeServer() end
                    CommF_Remote:InvokeServer("KitsuneStatuePray")
                    wait(5)
                end
            end)
        end
    end
end)

task.spawn(function()
    while wait(Sec) do
        if _G.FrozenTP and World3 then
            pcall(function()
                local frozenDim = Workspace.Map:FindFirstChild("FrozenDimension")
                if frozenDim then
                    local targetPos = frozenDim.Center.Position
                    local playerPos = Root.Position
                    if (playerPos - Vector3.new(targetPos.X, 500, targetPos.Z)).Magnitude > 10 then
                        _tp(CFrame.new(targetPos.X, 500, targetPos.Z))
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while wait(Sec) do
        if _G.Leviathan1 and World3 then
            pcall(function()
                for _, v in pairs(Workspace.SeaBeasts:GetChildren()) do
                    if v.Name == "Leviathan" and v:FindFirstChild("HumanoidRootPart") then
                        repeat
                            wait(0.2)
                            if (Root.Position - v.HumanoidRootPart.Position).Magnitude > 10 then
                                _tp(v.HumanoidRootPart.CFrame * CFrame.new(0, 500, 0))
                            end
                            if not _G.SeaBeast1 then
                                _G.SeaBeast1 = true
                            end
                            if not plr.Character:FindFirstChild("HasBuso") then
                                CommF_Remote:InvokeServer("Buso")
                            end
                            MousePos = v.HumanoidRootPart.Position
                        until not v:FindFirstChild("HumanoidRootPart") or not _G.Leviathan1
                        _G.SeaBeast1 = false
                    end
                end
            end)
        end
    end
end)

--========================================
-- 37. RACE TAB
--========================================
local Race = Main.CreatePage({Page_Name = "Upgrade Race", Page_Title = "Upgrade Race Tab"})
-- RACE DRACO
local DracoRace = Race.CreateSection("Race Draco")

DracoRace.CreateToggle({
    Title = "Auto Upgrade Race V2-V3 Draco",
    Default = false,
    Callback = function(Value)
        _G.AutoFireFlowers = Value
        _G.DragoV3 = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        if _G.AutoFireFlowers then
            pcall(function()
                local FireFlower = Workspace:FindFirstChild("FireFlowers")
                local v = GetConnectionEnemies("Forest Pirate")
                
                if v then 
                    repeat 
                        wait() 
                        Attack.Kill(v, _G.AutoFireFlowers) 
                    until not _G.AutoFireFlowers or not v.Parent or v.Humanoid.Health <= 0 or FireFlower
                else 
                    _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
                end      
                
                if FireFlower then
                    for i, v in pairs(FireFlower:GetChildren()) do
                        if v:IsA("Model") and v.PrimaryPart then
                            local FlowerPos = v.PrimaryPart.Position
                            local playerRoot = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                            if playerRoot then
                                local Magnited = (FlowerPos - playerRoot.Position).Magnitude
                                
                                if Magnited <= 100 then
                                    vim1:SendKeyEvent(true, "E", false, game) 
                                    wait(1.5) 
                                    vim1:SendKeyEvent(false, "E", false, game)
                                else
                                    _tp(CFrame.new(FlowerPos))
                                end
                            end
                        end
                    end
                end
            end)
        end
        
        if _G.DragoV3 then
            pcall(function()
                _G.DangerLV = "Lv Infinite"
                _G.SailBoats = true
                _G.TerrorShark = true
                
                while _G.DragoV3 do
                    wait()
                end
                
                _G.DangerLV = "Lv 1"
                _G.SailBoats = false
                _G.TerrorShark = false
            end)
        end
    end
end)

DracoRace.CreateToggle({
    Title = "Auto Trial Draco",
    Default = false,
    Callback = function(Value)
        _G.Relic123 = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        if _G.Relic123 then
            pcall(function()
                if Workspace.Map:FindFirstChild("DracoTrial") then
                    CommF_Remote.DracoTrial:InvokeServer()                  
                    wait(.5)
                    
                    if Root then
                        repeat 
                            wait() 
                            _tp(CFrame.new(-39934.9765625, 10685.359375, 22999.34375)) 
                        until not _G.Relic123 or (Root.Position - Vector3.new(-39934.9765625, 10685.359375, 22999.34375)).Magnitude <= 10
                        
                        repeat 
                            wait() 
                            _tp(CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625)) 
                        until not _G.Relic123 or (Root.Position - Vector3.new(-40511.25390625, 9376.4013671875, 23458.37890625)).Magnitude <= 10
                        
                        wait(2.5)
                        
                        repeat 
                            wait() 
                            _tp(CFrame.new(-39914.65625, 10685.384765625, 23000.177734375)) 
                        until not _G.Relic123 or (Root.Position - Vector3.new(-39914.65625, 10685.384765625, 23000.177734375)).Magnitude <= 10
                        
                        repeat 
                            wait() 
                            _tp(CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375)) 
                        until not _G.Relic123 or (Root.Position - Vector3.new(-40045.83203125, 9376.3984375, 22791.287109375)).Magnitude <= 10
                        
                        wait(2.5)
                        
                        repeat 
                            wait() 
                            _tp(CFrame.new(-39908.5, 10685.4052734375, 22990.04296875)) 
                        until not _G.Relic123 or (Root.Position - Vector3.new(-39908.5, 10685.4052734375, 22990.04296875)).Magnitude <= 10
                        
                        repeat 
                            wait() 
                            _tp(CFrame.new(-39609.5, 9376.400390625, 23472.94335975)) 
                        until not _G.Relic123 or (Root.Position - Vector3.new(-39609.5, 9376.400390625, 23472.94335975)).Magnitude <= 10
                    end
                else
                    local drago = Workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
                    if drago and drago:IsA("Part") then 
                        _tp(CFrame.new(drago.Position)) 
                    end        
                end
            end)
        end
    end
end)

-- RACE NORMAL
local RaceNormalUpgrade = Race.CreateSection("Race Normal")

RaceNormalUpgrade.CreateToggle({
    Title = "Auto Upgrade Race V2",
    Default = false,
    Callback = function(Value)
        _G.AutoEvoRace = Value
    end
})

task.spawn(function()
    while wait(0.2) do
        if _G.AutoEvoRace and World2 then
            pcall(function()
                local alchemistStatus = CommF_Remote:InvokeServer("Alchemist","1")
                if alchemistStatus == 0 then
                    _tp(CFrame.new(-2779.83521, 72.9661407, -3574.02002))
                    wait(1.1)
                    CommF_Remote:InvokeServer("Alchemist","2")
                elseif alchemistStatus == 1 then
                    if not GetBP("Flower 1") then
                        if Workspace:FindFirstChild("Flower1") then
                            _tp(Workspace.Flower1.CFrame)
                        end
                    elseif not GetBP("Flower 2") then
                        if Workspace:FindFirstChild("Flower2") then
                            _tp(Workspace.Flower2.CFrame)
                        end
                    elseif not GetBP("Flower 3") then
                        local v = GetConnectionEnemies("Zombie")
                        if v then
                            repeat 
                                wait() 
                                Attack.Kill(v, _G.AutoEvoRace) 
                            until GetBP("Flower 3") or not v.Parent or v.Humanoid.Health <= 0
                        else
                            _tp(CFrame.new(-5685.923, 48.48, -853.237))
                        end
                    end
                elseif alchemistStatus == 2 then
                    CommF_Remote:InvokeServer("Alchemist","3")
                end
            end)
        end
    end
end)

RaceNormalUpgrade.CreateToggle({
    Title = "Auto Get Ghoul",
    Default = false,
    Callback = function(Value)
        _G.GhoulGet = Value
    end
})

task.spawn(function()
    while wait(0.1) do
        if _G.GhoulGet then
            pcall(function()
                local v = GetConnectionEnemies("Cursed Captain")
                if v then
                    repeat 
                        wait() 
                        Attack.Kill(v, _G.GhoulGet) 
                    until not _G.GhoulGet or not v.Parent or v.Humanoid.Health <= 0
                else
                    local storageCaptain = replicated:FindFirstChild("Cursed Captain")
                    if storageCaptain and storageCaptain:FindFirstChild("HumanoidRootPart") then
                        _tp(storageCaptain.HumanoidRootPart.CFrame * CFrame.new(5,10,2))
                    end
                end
            end)
        end
    end
end)

-- RACE V4
local TrialRace = Race.CreateSection("Race V4")

TrialRace.CreateToggle({
    Title = "Auto Get Cyborg",
    Default = false,
    Callback = function(Value)
        _G.CyborgGet = Value
    end
})

task.spawn(function()
    while wait(0.5) do
        if _G.CyborgGet then
            pcall(function()
                if not GetBP("Microchip") then
                    CommF_Remote:InvokeServer("BlackbeardReward", "Microchip", "1")
                    CommF_Remote:InvokeServer("BlackbeardReward", "Microchip", "2")
                end
                
                if not Workspace.Enemies:FindFirstChild("Order") and not replicated:FindFirstChild("Order") then
                    if GetBP("Microchip") then
                        local button = Workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector
                        if button then
                            fireclickdetector(button)
                        end
                    end
                end
                
                if replicated:FindFirstChild("Order") or Workspace.Enemies:FindFirstChild("Order") then
                    local v = GetConnectionEnemies("Order")
                    if v then
                        repeat 
                            wait() 
                            Attack.Kill(v, _G.CyborgGet) 
                        until not v.Parent or v.Humanoid.Health <= 0
                    else
                        _tp(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
                    end
                end
            end)
        end
    end
end)

TrialRace.CreateToggle({
    Title = "No Frog",
    Default = false,
    Callback = function(Value)
        _G.NoFrog = Value
    end
})

task.spawn(function()
    while wait(1) do
        if _G.NoFrog then
            pcall(function()
                if Lighting:FindFirstChild("LightingLayers") then
                    Lighting.LightingLayers:Destroy()
                end
                if Lighting:FindFirstChild("Sky") then
                    Lighting.Sky:Destroy()
                end
            end)
        end
    end
end)

TrialRace.CreateToggle({
    Title = "Teleport Ancient Clock",
    Default = false,
    Callback = function(Value)
        _G.AcientOne = Value
    end
})

task.spawn(function()
    while wait(0.5) do
        if _G.AcientOne then
            _tp(CFrame.new(29549, 15069, -88))
        end
    end
end)

TrialRace.CreateToggle({
    Title = "Auto Buy Gear",
    Default = false,
    Callback = function(Value)
        _G.AutoBuyGear = Value
    end
})

task.spawn(function()
    while wait(0.1) do
        if _G.AutoBuyGear and World3 then
            pcall(function()
                CommF_Remote:InvokeServer("UpgradeRace", "Buy")
            end)
        end
    end
end)

TrialRace.CreateToggle({
    Title = "Auto Finish Train Quest",
    Default = false,
    Callback = function(Value)
        _G.TrainDrago = Value
    end
})

local function UseSkills(skillName, key)
    if key == "Y" then
        vim1:SendKeyEvent(true, "Y", false, game)
        wait(0.1)
        vim1:SendKeyEvent(false, "Y", false, game)
    end
end

task.spawn(function()
    while wait(0.5) do
        if _G.TrainDrago then
            pcall(function()
                if plr.Character:FindFirstChild("RaceTransformed") and plr.Character.RaceTransformed.Value then
                    _tp(CFrame.new(-9507.03125, 713.654968, 6186.39453))
                else
                    local BonesTable = {"Reborn Skeleton","Living Zombie","Demonic Soul","Posessed Mummy"}
                    local v = GetConnectionEnemies(BonesTable)
                    if v then
                        repeat 
                            wait() 
                            Attack.Kill(v, _G.TrainDrago) 
                        until not _G.TrainDrago or not v.Parent or v.Humanoid.Health <= 0
                    end
                    _tp(CFrame.new(-9507.03125, 713.654968, 6186.39453))
                end
            end)
        end
    end
end)

task.spawn(function()
    while wait(0.5) do
        if _G.TrainDrago then
            pcall(function()
                if plr.Character:FindFirstChild("RaceEnergy") and plr.Character.RaceEnergy.Value >= 1 then
                    UseSkills("nil", "Y")
                end
            end)
        end
    end
end)

local PullLeverLabel = TrialRace.CreateLabel({Title = "Pull Lever Done Status: "})

task.spawn(function()
    local previousStatus = ""
    while wait(1) do
        local success, result = pcall(function()
            return CommF_Remote:InvokeServer("templedoorcheck")
        end)
        if success then
            local currentStatus = result and "✅" or "❌"
            if currentStatus ~= previousStatus then
                PullLeverLabel.SetText("Pull Lever Done Status: " .. currentStatus)
                previousStatus = currentStatus
            end
        end
    end
end)

TrialRace.CreateToggle({
    Title = "Teleport To Migare Island",
    Default = false,
    Callback = function(Value)
        _G.MigareIsland = Value
    end
})

task.spawn(function()
    while wait(0.5) do
        if _G.MigareIsland and World3 then
            pcall(function()
                local island = Workspace.Map:FindFirstChild("MysticIsland")
                if island and island:FindFirstChild("Center") then
                    local targetPos = island.Center.Position
                    _tp(CFrame.new(targetPos.X, 500, targetPos.Z))
                end
            end)
        end
    end
end)

TrialRace.CreateToggle({
    Title = "Teleport To Highest Point",
    Default = false,
    Callback = function(Value)
        _G.HighestPoint = Value
    end
})

task.spawn(function()
    while wait(0.5) do
        if _G.HighestPoint and World3 then
            pcall(function()
                local highestY = -math.huge
                local highestPos = nil
                
                for _, part in pairs(Workspace:GetDescendants()) do
                    if part:IsA("BasePart") and part.Position.Y > highestY then
                        highestY = part.Position.Y
                        highestPos = part.Position
                    end
                end
                
                if highestPos then
                    _tp(CFrame.new(highestPos.X + 10, highestPos.Y + 10, highestPos.Z + 10))
                end
            end)
        end
    end
end)

TrialRace.CreateToggle({
    Title = "Teleport To Advanced Fruit Dealer",
    Default = false,
    Callback = function(Value)
        _G.TPFruitDealer = Value
    end
})

task.spawn(function()
    while wait(0.5) do
        if _G.TPFruitDealer then
            pcall(function()
                local MysticIsland = Workspace.Map:FindFirstChild("MysticIsland")
                if MysticIsland then
                    for _, v in pairs(Workspace.NPCs:GetChildren()) do
                        if v.Name == "Advanced Fruit Dealer" and v:FindFirstChild("HumanoidRootPart") then
                            _tp(v.HumanoidRootPart.CFrame)
                            break
                        end
                    end
                end
            end)
        end
    end
end)

TrialRace.CreateToggle({
    Title = "Lock Moon And On Race V3",
    Default = false,
    Callback = function(Value)
        _G.RaceClickAutov3 = Value
    end
})

task.spawn(function()
    while wait(0.5) do
        if _G.RaceClickAutov3 and World3 then
            pcall(function()
                local moonDir = Lighting:GetMoonDirection()
                if moonDir and moonDir.Magnitude > 0 then
                    local lookAtPos = Workspace.CurrentCamera.CFrame.p + moonDir * 100
                    Workspace.CurrentCamera.CFrame = CFrame.lookAt(Workspace.CurrentCamera.CFrame.p, lookAtPos)
                end
            end)
        end
    end
end)

TrialRace.CreateToggle({
    Title = "Teleport To Blue Gear",
    Default = false,
    Callback = function(Value)
        _G.TPBlueGear = Value
    end
})

task.spawn(function()
    while wait(0.1) do
        if _G.TPBlueGear and World3 then
            pcall(function()
                local MysticIsland = Workspace.Map:FindFirstChild("MysticIsland")
                if MysticIsland then
                    for _, v in ipairs(MysticIsland:GetChildren()) do
                        if v:IsA("MeshPart") and v.Material == Enum.Material.Neon then
                            _tp(v.CFrame)
                            break
                        end
                    end
                end
            end)
        end
    end
end)

TrialRace.CreateButton({
    Title = "Teleport To Trial Door",
    Callback = function()
        local positions = {
            Human = CFrame.new(29221.822, 14890.975, -205.991),
            Skypiea = CFrame.new(28960.158, 14919.624, 235.039),
            Fishman = CFrame.new(28231.175, 14890.975, -211.641),
            Cyborg = CFrame.new(28502.681, 14895.975, -423.727),
            Ghoul = CFrame.new(28674.244, 14890.676, 445.431),
            Mink = CFrame.new(29012.341, 14890.975, -380.149)
        }
        local race = plr.Data.Race.Value
        if positions[race] then
            _tp(positions[race])
        end
    end
})

TrialRace.CreateToggle({
    Title = "Auto Trial Race",
    Default = false,
    Callback = function(Value)
        _G.Complete_Trials = Value
    end
})

local function BTP(cframe)
    _tp(cframe)
end

task.spawn(function()
    while wait(0.5) do
        if _G.Complete_Trials then
            pcall(function()
                local race = plr.Data.Race.Value
                if race == "Human" or race == "Ghoul" then
                    for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                        if Attack.Alive(enemy) then
                            repeat 
                                wait() 
                                Attack.Kill(enemy, _G.Complete_Trials) 
                            until not _G.Complete_Trials or not enemy.Parent or enemy.Humanoid.Health <= 0
                        end
                    end
                elseif race == "Skypiea" then
                    local skyTrial = Workspace.Map.SkyTrial.Model
                    if skyTrial then
                        for _, obj in pairs(skyTrial:GetDescendants()) do
                            if obj.Name == "snowisland_Cylinder.081" then
                                BTP(obj.CFrame)
                                break
                            end
                        end
                    end
                elseif race == "Fishman" then
                    local seaBeast = Workspace.SeaBeasts:FindFirstChild("SeaBeast1")
                    if seaBeast then
                        repeat 
                            wait() 
                            Attack.KillSea(seaBeast, _G.Complete_Trials) 
                        until not _G.Complete_Trials or not seaBeast.Parent or seaBeast.Humanoid.Health <= 0
                    end
                elseif race == "Cyborg" then
                    _tp(CFrame.new(28654, 14898.7832, -30))
                elseif race == "Mink" then
                    for _, obj in pairs(Workspace:GetDescendants()) do
                        if obj.Name == "StartPoint" then
                            _tp(obj.CFrame * CFrame.new(0, 10, 0))
                            break
                        end
                    end
                end
            end)
        end
    end
end)

TrialRace.CreateToggle({
    Title = "Auto Kill Player After Trial V4",
    Default = false,
    Callback = function(Value)
        _G.Defeating = Value
    end
})

task.spawn(function()
    while wait(0.2) do
        if _G.Defeating and World3 then
            pcall(function()
                for _, v in ipairs(Workspace.Characters:GetChildren()) do
                    if v.Name ~= plr.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        if v.Humanoid.Health > 0 and Root and (Root.Position - v.HumanoidRootPart.Position).Magnitude <= 230 then
                            repeat 
                                wait() 
                                Attack.Kill(v, _G.Defeating) 
                            until not _G.Defeating or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            end)
        end
    end
end)

--========================================
-- 38. GET AND UPGRADE ITEMS TAB
--========================================
local Items = Main.CreatePage({Page_Name = "Get and Upgrade Items", Page_Title = "Get and Upgrade Items"})
local GetItems = Items.CreateSection("Get Items")

GetItems.CreateToggle({
    Title = "Auto Trade Bone",
    Default = false,
    Callback = function(Value)
        _G.Auto_Random_Bone = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Random_Bone then    
                repeat task.wait() CommF_Remote:InvokeServer("Bones","Buy",1,1) until not _G.Auto_Random_Bone
            end
        end)
    end
end)

GetItems.CreateToggle({
    Title = "Auto Buy Legendary Sword",
    Default = false,
    Callback = function(Value)
        _G.Auto_Buy_Legendary_Sword = Value
    end
})

task.spawn(function()
    while wait(0.1) do
        pcall(function()
            if _G.Auto_Buy_Legendary_Sword then    
                local hasAllSwords = true
                if not hasAllSwords then
                    CommF_Remote:InvokeServer("LegendarySwordDealer", "1")
                    wait(0.5)
                    CommF_Remote:InvokeServer("LegendarySwordDealer", "2")
                    wait(0.5)
                    CommF_Remote:InvokeServer("LegendarySwordDealer", "3")
                    wait(0.5)
                else
                    _G.Auto_Buy_Legendary_Sword = false
                end
            end
        end)
    end
end)

GetItems.CreateToggle({
    Title = "Auto Buy Haki Color",
    Default = false,
    Callback = function(Value)
        _G.HakiColorBusoBuy = Value
    end
})

task.spawn(function()
    while wait(0.1) do
        pcall(function()
            if _G.HakiColorBusoBuy then    
                local hasHakiColor = false
                if not hasHakiColor then
                    CommF_Remote:InvokeServer("ColorsDealer", "2")
                    wait(0.5)
                else
                    _G.HakiColorBusoBuy = false
                end
            end
        end)
    end
end)

GetItems.CreateToggle({
    Title = "Hop Server [Haki Color or Legendary Sword]",
    Default = false,
    Callback = function(Value)
        _G.AutoHopColorAndSword = Value 
        if not _G.Auto_Buy_Legendary_Sword and not _G.HakiColorBusoBuy then
            Library.CreateNoti({
                Title = "Banana Cat Hub",
                Desc = "Open Buy Haki Color or Legendary Sword Plz!",
                Duration = 3
            })
        end
    end
})

local function IsDealerPresent(dealerName)
    local npcs = Workspace:FindFirstChild("NPCs")
    if npcs then
        return npcs:FindFirstChild(dealerName) ~= nil
    end
    return false
end

task.spawn(function()
    while wait(0.1) do
        pcall(function()
            if _G.Auto_Buy_Legendary_Sword and _G.AutoHopColorAndSword then    
                if not IsDealerPresent("LegendarySwordDealer") then 
                    Hop()
                end
            end
        end)
    end
end)

task.spawn(function()
    while wait(0.1) do
        pcall(function()
            if _G.HakiColorBusoBuy and _G.AutoHopColorAndSword then    
                if not IsDealerPresent("ColorsDealer") then 
                    Hop()
                end
            end
        end)
    end
end)

GetItems.CreateToggle({
    Title = "Auto Get Rainbow Haki",
    Default = false,
    Callback = function(Value)
        _G.Auto_Rainbow_Haki = Value
    end
})

task.spawn(function()
    pcall(function()
        while wait(Sec) do
            if _G.Auto_Rainbow_Haki then
                if plr.PlayerGui.Main.Quest.Visible == false then
                    if _G.GetQFast then
                        if plr.PlayerGui.Main.Quest.Visible == false then CommF_Remote:InvokeServer("HornedMan","Bet") end     
                    else
                        Rainbow1 = CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875)
                        if (plr.Character.HumanoidRootPart.CFrame ~= Rainbow1) then
                            _tp(Rainbow1)
                        elseif (plr.Character.HumanoidRootPart.CFrame == Rainbow1) then
                            wait(1)
                            CommF_Remote:InvokeServer("HornedMan","Bet")
                        end
                    end
                elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
                    local v = GetConnectionEnemies("Stone")
                    if v then
                        repeat wait() Attack.Kill(v,_G.Auto_Rainbow_Haki) until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        _tp(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 2.03251839e-05, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199))
                    end
                elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Hydra Leader") then
                    local v = GetConnectionEnemies("Hydra Leader")
                    if v then
                        repeat task.wait()Attack.Kill(v,_G.Auto_Rainbow_Haki) until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        CommF_Remote:InvokeServer("requestEntrance",Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625))
                        local framelong1 = Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625)
                        local framelong2 = CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547)
                        if (plr.Character.HumanoidRootPart.CFrame.Position == framelong1) then _tp(framelong2)end
                    end
                elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
                    local v = GetConnectionEnemies("Kilo Admiral")
                    if v then
                        repeat task.wait()Attack.Kill(v,_G.Auto_Rainbow_Haki) until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        _tp(CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, -0, -0.143904909, -0, 1.00000012, -0, 0.143904924, 0, -0.989591479))
                    end
                elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
                    local v = GetConnectionEnemies("Captain Elephant")
                    if v then
                        repeat task.wait() Attack.Kill(v,_G.Auto_Rainbow_Haki)until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        local gamergayror1 = Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375)
                        local gamergayror2 = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
                        if (plr.Character.HumanoidRootPart.CFrame.Position ~= gamergayror1) then
                            CommF_Remote:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
                        elseif (plr.Character.HumanoidRootPart.CFrame.Position == gamergayror1) then
                            _tp(gamergayror2)
                        end
                    end
                elseif plr.PlayerGui.Main.Quest.Visible == true and string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
                    local v = GetConnectionEnemies("Captain Elephant")
                    if v then
                        repeat task.wait() Attack.Kill(v,_G.Auto_Rainbow_Haki) until _G.Auto_Rainbow_Haki == false or v.Humanoid.Health <= 0 or not v.Parent or plr.PlayerGui.Main.Quest.Visible == false
                    else
                        CommF_Remote:InvokeServer("requestEntrance",Vector3.new(5314.54638671875, 22.562219619750977, -127.06755065917969))
                    end
                end                  
            end
        end    
    end)
end)

GetItems.CreateToggle({
    Title = "Auto Soul Guitar",
    Default = false,
    Callback = function(Value)
        _G.Auto_Soul_Guitar = Value
    end
})

task.spawn(function()
    while wait() do
        if _G.Auto_Soul_Guitar then 
            pcall(function() 
                local v = GetConnectionEnemies("Living Zombie")
                if v then 
                    v.HumanoidRootPart.CFrame = CFrame.new(-10138.3974609375, 138.6524658203125, 5902.89208984375)
                    v.Head.CanCollide = false
                    v.Humanoid.Sit = false
                    v.HumanoidRootPart.CanCollide = false
                    v.Humanoid.JumpPower = 0
                    v.Humanoid.WalkSpeed = 0
                    if v.Humanoid:FindFirstChild('Animator') then v.Humanoid:FindFirstChild('Animator'):Destroy() end
                end    
            end)
        end
    end
end)

function getT(num)
    local rotation
    if num == 1 then
        rotation = Workspace.Map["Haunted Castle"].Tablet.Segment1.Line.Rotation
    elseif num == 3 then
        rotation = Workspace.Map["Haunted Castle"].Tablet.Segment3.Line.Rotation
    elseif num == 4 then
        rotation = Workspace.Map["Haunted Castle"].Tablet.Segment4.Line.Rotation
    elseif num == 7 then
        rotation = Workspace.Map["Haunted Castle"].Tablet.Segment7.Line.Rotation
    elseif num == 10 then
        rotation = Workspace.Map["Haunted Castle"].Tablet.Segment10.Line.Rotation
    end
    if rotation then
        return rotation.Z
    end
end

function getRT(num)
    local Trophy_Q = Workspace.Map["Haunted Castle"].Trophies.Quest
    local Trophy_Pos
    for _, v in pairs(Trophy_Q:GetChildren()) do
        if num == 1 and v.Name == "Trophy1" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation
        elseif num == 2 and v.Name == "Trophy2" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation         
        elseif num == 3 and v.Name == "Trophy3" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation       
        elseif num == 4 and v.Name == "Trophy4" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation  
        elseif num == 5 and v.Name == "Trophy5" and v:FindFirstChild("Handle") then
            Trophy_Pos = v.Handle.Rotation     
        end          
        if Trophy_Pos then
            return Trophy_Pos.Z   
        end
    end
end

GetFirePlacard = function(Number,Side)
    if tostring(Workspace.Map["Haunted Castle"]["Placard"..Number][Side].Indicator.BrickColor) ~= "Pearl" then
        fireclickdetector(Workspace.Map["Haunted Castle"]["Placard"..Number][Side].ClickDetector)
    end
end

task.spawn(function()
    repeat task.wait() until _G.Auto_Soul_Guitar
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Soul_Guitar then
                if World3 then
                    CommF_Remote:InvokeServer("gravestoneEvent", 2)
                    CommF_Remote:InvokeServer("gravestoneEvent", 2, true)
                    if CommF_Remote:InvokeServer("GuitarPuzzleProgress","Check") == nil then
                        _tp(CFrame.new(-8655.0166015625, 141.3166961669922, 6160.0224609375))
                        CommF_Remote:InvokeServer("gravestoneEvent", 2)
                        CommF_Remote:InvokeServer("gravestoneEvent", 2, true)
                    elseif CommF_Remote:InvokeServer("GuitarPuzzleProgress","Check").Swamp == false then
                        Quest1 = true
                        Quest2 = false
                        Quest3 = false
                        Quest4 = false
                        local v = GetConnectionEnemies("Living Zombie")
                        if v then 
                            repeat task.wait() Attack.Kill(v,_G.Auto_Soul_Guitar) until not _G.Auto_Soul_Guitar or v.Humanoid.Health <= 0 or not v.Parent or Workspace.Map["Haunted Castle"].SwampWater.Color ~= Color3.fromRGB(117, 0, 0)
                        else 
                            _tp(CFrame.new(-10170.7275390625, 138.6524658203125, 5934.26513671875))
                        end
                    elseif CommF_Remote:InvokeServer("GuitarPuzzleProgress","Check").Gravestones == false then
                        Quest1 = false
                        Quest2 = true
                        Quest3 = false
                        Quest4 = false
                        GetFirePlacard("7","Left")
                        GetFirePlacard("6","Left")
                        GetFirePlacard("5","Left")
                        GetFirePlacard("4","Right")
                        GetFirePlacard("3","Left")
                        GetFirePlacard("2","Right")
                        GetFirePlacard("1","Right")
                    elseif CommF_Remote:InvokeServer("GuitarPuzzleProgress","Check").Ghost == false then
                        CommF_Remote:InvokeServer("GuitarPuzzleProgress", "Ghost")
                        CommF_Remote:InvokeServer("GuitarPuzzleProgress", "Ghost", true)
                    elseif CommF_Remote:InvokeServer("GuitarPuzzleProgress","Check").Trophies == false then
                        Quest1 = false
                        Quest2 = false
                        Quest3 = true
                        Quest4 = false
                        _tp(CFrame.new(-9532.8232421875, 6.471667766571045, 6078.068359375))
                        repeat wait()
                            local z1 = getRT(1)
                            local _z1 = getT(1)
                            if z1 and _z1 then
                                fireclickdetector(Workspace.Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector"))
                            end
                        until z1 == _z1
                        repeat wait()
                            local z2 = getRT(2)
                            local _z2 = getT(3)
                            if z2 and _z2 then
                                fireclickdetector(Workspace.Map["Haunted Castle"].Tablet.Segment3:FindFirstChild("ClickDetector"))
                            end
                        until z2 == _z2
                        repeat wait()
                            local z3 = getRT(3)
                            local _z3 = getT(4)
                            if z3 and _z3 then
                                fireclickdetector(Workspace.Map["Haunted Castle"].Tablet.Segment4:FindFirstChild("ClickDetector"))
                            end
                        until z3 == _z3
                        repeat wait()
                            local z4 = getRT(4)
                            local _z4 = getT(7)
                            if z4 and _z4 then
                                fireclickdetector(Workspace.Map["Haunted Castle"].Tablet.Segment7:FindFirstChild("ClickDetector"))
                            end
                        until z4 == _z4
                        repeat wait()
                            local z5 = getRT(5)
                            local _z5 = getT(10)
                            if z5 and _z5 then
                                fireclickdetector(Workspace.Map["Haunted Castle"].Tablet.Segment10:FindFirstChild("ClickDetector"))    
                            end
                        until z5 == _z5
                        repeat wait()    
                            fireclickdetector(Workspace.Map["Haunted Castle"].Tablet.Segment2:FindFirstChild("ClickDetector"))
                            fireclickdetector(Workspace.Map["Haunted Castle"].Tablet.Segment5:FindFirstChild("ClickDetector"))
                            fireclickdetector(Workspace.Map["Haunted Castle"].Tablet.Segment6:FindFirstChild("ClickDetector"))
                            fireclickdetector(Workspace.Map["Haunted Castle"].Tablet.Segment8:FindFirstChild("ClickDetector"))
                            fireclickdetector(Workspace.Map["Haunted Castle"].Tablet.Segment9:FindFirstChild("ClickDetector"))       
                        until Workspace.Map["Haunted Castle"].Tablet.Segment2.Line.Rotation.Z == 0 or Workspace.Map["Haunted Castle"].Tablet.Segment5.Line.Rotation.Z == 0 or Workspace.Map["Haunted Castle"].Tablet.Segment6.Line.Rotation.Z == 0 or Workspace.Map["Haunted Castle"].Tablet.Segment8.Line.Rotation.Z == 0 or Workspace.Map["Haunted Castle"].Tablet.Segment9.Line.Rotation.Z == 0
                    elseif CommF_Remote:InvokeServer("GuitarPuzzleProgress","Check").Pipes == false then
                        Quest1 = false
                        Quest2 = false
                        Quest3 = false
                        Quest4 = true
                        _tp(Workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
                        fireclickdetector(Workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
                        _tp(Workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
                        fireclickdetector(Workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                        fireclickdetector(Workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                        fireclickdetector(Workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                        _tp(Workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
                        fireclickdetector(Workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                        fireclickdetector(Workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                        _tp(Workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
                        fireclickdetector(Workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
                        _tp(Workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
                        fireclickdetector(Workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                        fireclickdetector(Workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                        fireclickdetector(Workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                    end
                end
            end
        end)
    end
end)

GetItems.CreateDropdown({
    Title = "Select Method Hop CDK",
    List = {"Quest Yama", "Quest Tushita", "Last Quest"},
    Default = "Quest Yama",
    Callback = function(Value)
        _G.SelectCDKFarm = Value
    end
})

GetItems.CreateToggle({
    Title = "Auto CDK",
    Default = false,
    Callback = function(Value)
        _G.AutoCDK = Value
    end
})

task.spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoCDK and _G.SelectCDKFarm == "Quest Yama" then
                if tostring(CommF_Remote:InvokeServer("CDKQuest", "OpenDoor")) ~= "opened" then                  
                    CommF_Remote:InvokeServer("CDKQuest", "OpenDoor")
                    CommF_Remote:InvokeServer("CDKQuest", "OpenDoor", true)
                else
                    if CommF_Remote:InvokeServer("CDKQuest","Progress")["Finished"] == nil then
                        CommF_Remote:InvokeServer("CDKQuest","StartTrial","Evil")
                        CommF_Remote:InvokeServer("CDKQuest","StartTrial","Evil")
                    elseif CommF_Remote:InvokeServer("CDKQuest","Progress")["Finished"] == false then                        
                        if tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Evil"]) == -3 then
                            QuestYama_1 = true QuestYama_2 = false QuestYama_3 = false
                            repeat task.wait()
                                if not Workspace.Enemies:FindFirstChild("Forest Pirate") then
                                    _tp(CFrame.new(-13223.521484375, 428.1938171386719, -7766.06787109375))
                                else
                                    local v = GetConnectionEnemies("Forest Pirate")
                                    if v then _tp(Workspace.Enemies:FindFirstChild("Forest Pirate").HumanoidRootPart.CFrame)end
                                end
                            until not _G.AutoCDK or tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Evil"]) == 1 or _G.SelectCDKFarm ~= "Auto Yama CDK"
                        elseif tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Evil"]) == -4 then
                            QuestYama_1 = false QuestYama_2 = true QuestYama_3 = false
                            for ix,HitMon in pairs(Player.QuestHaze:GetChildren()) do
                                for NameMonHaze, CFramePos in pairs(PosMsList) do
                                    if string.find(NameMonHaze,HitMon.Name) and HitMon.Value > 0 then
                                        if (CFramePos.Position - Root.Position).Magnitude <= 1000 and Workspace.Enemies:FindFirstChild(NameMonHaze) then
                                            for i,v in pairs(Workspace.Enemies:GetChildren()) do
                                                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and v:FindFirstChild("HazeESP") then
                                                    repeat wait() Attack.Kill(v, _G.AutoCDK and _G.SelectCDKFarm == "Auto Yama CDK") until not _G.AutoCDK or _G.SelectCDKFarm ~= "Auto Yama CDK" or tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Evil"]) == 2 or not v:FindFirstChild("HazeESP") or v.Humanoid.Health <= 0
                                                end
                                            end
                                        else   
                                            _tp(CFramePos)                               
                                        end
                                    end
                                end
                            end
                        elseif tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Evil"]) == -5 then
                            QuestYama_1 = false QuestYama_2 = false QuestYama_3 = true
                            if Workspace.Map:FindFirstChild("HellDimension") then
                                if (Root.Position - Workspace.Map.HellDimension.Spawn.Position).Magnitude <= 1000 then
                                    for gg,ez in pairs(Workspace.Map.HellDimension.Exit:GetChildren()) do
                                        if tonumber(gg) == 2 then
                                            repeat task.wait() Root.CFrame = Workspace.Map.HellDimension.Exit.CFrame until not _G.AutoCDK or _G.SelectCDKFarm ~= "Auto Yama CDK" or tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
                                        end
                                    end
                                    EquipWeapon(_G.SelectWeapon)
                                    if tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Evil"]) ~= 3 then
                                        repeat task.wait()
                                            repeat task.wait() 
                                                _tp(Workspace.Map.HellDimension.Torch1.Particles.CFrame) 
                                                for i, v in pairs(Workspace.Map.HellDimension:GetDescendants()) do
                                                    if v:IsA("ProximityPrompt") then fireproximityprompt(v) end
                                                end
                                            until (Workspace.Map.HellDimension.Torch1.Particles.Position - Root.Position).Magnitude < 5
                                            wait(2) _G.T1Yama = true
                                        until not _G.AutoCDK or _G.SelectCDKFarm ~= "Auto Yama CDK" or _G.T1Yama or tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
                                        repeat task.wait()
                                            repeat task.wait()
                                                _tp(Workspace.Map.HellDimension.Torch2.Particles.CFrame) 
                                                for i, v in pairs(Workspace.Map.HellDimension:GetDescendants()) do
                                                    if v:IsA("ProximityPrompt") then fireproximityprompt(v)end
                                                end
                                            until (Workspace.Map.HellDimension.Torch2.Particles.Position - Root.Position).Magnitude < 5
                                            wait(2) _G.T2Yama = true
                                        until _G.T2Yama or not _G.AutoCDK or _G.SelectCDKFarm ~= "Auto Yama CDK" or tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
                                        repeat wait()
                                            repeat task.wait() 
                                                _tp(Workspace.Map.HellDimension.Torch3.Particles.CFrame) 
                                                for i, v in pairs(Workspace.Map.HellDimension:GetDescendants()) do
                                                    if v:IsA("ProximityPrompt") then fireproximityprompt(v)end
                                                end
                                            until (Workspace.Map.HellDimension.Torch3.Particles.Position - Root.Position).Magnitude < 5 
                                            wait(2) _G.T3Yama = true
                                        until _G.T3Yama or not _G.AutoCDK or _G.SelectCDKFarm ~= "Auto Yama CDK" or tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
                                    end
                                    for i,v in pairs(Workspace.Enemies:GetChildren()) do
                                        if (v:FindFirstChild("HumanoidRootPart").Position - Workspace.Map.HellDimension.Spawn.Position).Magnitude <= 300 then
                                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                                repeat task.wait() Attack.Kill(v, _G.AutoCDK and _G.SelectCDKFarm == "Auto Yama CDK") until not _G.AutoCDK or _G.SelectCDKFarm ~= "Auto Yama CDK" or v.Humanoid.Health <= 0 or not v.Parent or tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Evil"]) == 3
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoCDK and _G.SelectCDKFarm == "Quest Yama" then
                if tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Evil"]) == -5 then
                    if not Workspace.Map:FindFirstChild("HellDimension") or (Root.Position - Workspace.Map.HellDimension.Spawn.Position).Magnitude > 1000 then
                        local v = GetConnectionEnemies("Soul Reaper")
                        if v then 
                            repeat task.wait()_tp(v.HumanoidRootPart.CFrame) until v.Humanoid.Health <= 0 or not _G.AutoCDK or _G.SelectCDKFarm ~= "Auto Yama CDK" or not v.Parent or tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Evil"]) == 3 or (Workspace.Map:FindFirstChild("HellDimension") and (Root.Position - Workspace.Map.HellDimension.Spawn.Position).Magnitude <= 1000)
                        elseif plr.Backpack:FindFirstChild("Hallow Essence") or plr.Character:FindFirstChild("Hallow Essence") then
                            repeat _tp(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125)) task.wait() until (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - Root.Position).Magnitude <= 8
                            EquipWeapon("Hallow Essence")
                        elseif replicated:FindFirstChild("Soul Reaper") and replicated:FindFirstChild("Soul Reaper").Humanoid.Health > 0 then
                            _tp(replicated:FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame)
                        else
                            if CommF_Remote:InvokeServer("Bones","Check") < 50 and not Workspace.Enemies:FindFirstChild("Soul Reaper") and not replicated:FindFirstChild("Soul Reaper") and not Workspace.Map:FindFirstChild("HellDimension") then
                                if Workspace.Enemies:FindFirstChild("Reborn Skeleton") or Workspace.Enemies:FindFirstChild("Living Zombie") or Workspace.Enemies:FindFirstChild("Domenic Soul") or Workspace.Enemies:FindFirstChild("Posessed Mummy") then
                                    for i,v in pairs(Workspace.Enemies:GetChildren()) do
                                        if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                                repeat task.wait() Attack.Kill(v, _G.AutoCDK and _G.SelectCDKFarm == "Auto Yama CDK") until not _G.AutoCDK or _G.SelectCDKFarm ~= "Auto Yama CDK" or v.Humanoid.Health <= 0 or not v.Parent
                                            end
                                        end
                                    end
                                else
                                    _tp(CFrame.new(-9515.2255859375, 164.0062255859375, 5785.38330078125))
                                end
                            else
                                CommF_Remote:InvokeServer("Bones", "Buy", 1, 1)
                            end
                        end
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoCDK and _G.SelectCDKFarm == "Quest Tushita" then
                if tostring(CommF_Remote:InvokeServer("CDKQuest", "OpenDoor")) ~= "opened" then
                    wait(.7) CommF_Remote:InvokeServer("CDKQuest", "OpenDoor")
                    wait(.3) CommF_Remote:InvokeServer("CDKQuest", "OpenDoor", true)
                else
                    if CommF_Remote:InvokeServer("CDKQuest","Progress")["Finished"] == nil then
                        CommF_Remote:InvokeServer("CDKQuest","StartTrial","Good")
                    elseif CommF_Remote:InvokeServer("CDKQuest","Progress")["Finished"] == false then
                        if tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Good"]) == -3 then
                            QuestTushita_1 = true
                            QuestTushita_2 = false
                            QuestTushita_3 = false
                            repeat wait() _tp(CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875)) until (CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875).Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.AutoCDK or _G.SelectCDKFarm ~= "Auto Tushita CDK" or tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Good"]) == 1
                            if (CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875).Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                wait(.7) CommF_Remote:InvokeServer("CDKQuest","BoatQuest",Workspace.NPCs:FindFirstChild("Luxury Boat Dealer"),"Check")
                                wait(.5) CommF_Remote:InvokeServer("CDKQuest","BoatQuest",Workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                            end
                            wait(1) 
                            repeat wait() _tp(CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125)) until (CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125).Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.AutoCDK or _G.SelectCDKFarm ~= "Auto Tushita CDK" or tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Good"]) == 1
                            if (CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125).Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                wait(.7) CommF_Remote:InvokeServer("CDKQuest","BoatQuest",Workspace.NPCs:FindFirstChild("Luxury Boat Dealer"),"Check")
                                wait(.5) CommF_Remote:InvokeServer("CDKQuest","BoatQuest",Workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                            end
                            wait(1) 
                            repeat wait() _tp(CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625)) until (CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625).Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.AutoCDK or _G.SelectCDKFarm ~= "Auto Tushita CDK" or tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Good"]) == 1
                            if (CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625).Position - Player.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                                wait(.7) CommF_Remote:InvokeServer("CDKQuest","BoatQuest",Workspace.NPCs:FindFirstChild("Luxury Boat Dealer"),"Check")
                                wait(.5) CommF_Remote:InvokeServer("CDKQuest","BoatQuest",Workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                            end
                            wait(1)
                        elseif tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Good"]) == -4 then
                            QuestTushita_1 = false
                            QuestTushita_2 = true
                            QuestTushita_3 = false
                            repeat wait()
                                _G.AutoRaidCastle = true
                            until not _G.AutoCDK or _G.SelectCDKFarm ~= "Auto Tushita CDK" or tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Good"]) == 2 
                            _G.AutoRaidCastle = false         
                        elseif tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Good"]) == -5 then
                            QuestTushita_1 = false
                            QuestTushita_2 = false
                            QuestTushita_3 = true
                            if Workspace.Enemies:FindFirstChild("Cake Queen") then
                                for i,v in pairs(Workspace.Enemies:GetChildren()) do
                                    if v.Name == "Cake Queen" then
                                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            repeat wait()
                                                Attack.Kill(v, _G.AutoCDK and _G.SelectCDKFarm == "Auto Tushita CDK")
                                            until not _G.AutoCDK or _G.SelectCDKFarm ~= "Auto Tushita CDK" or not v.Parent or v.Humanoid.Health <= 0 or tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Good"]) == 3
                                        end
                                    end
                                end
                            elseif replicated:FindFirstChild("Cake Queen") and replicated:FindFirstChild("Cake Queen").Humanoid.Health > 0 then
                                _tp(replicated:FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                            else
                                if (Player.Character.HumanoidRootPart.Position - Workspace.Map.HeavenlyDimension.Spawn.Position).Magnitude <= 1000 then
                                    for i,v in pairs(Workspace.Map.HeavenlyDimension.Exit:GetChildren()) do
                                        Ex = i
                                    end
                                    if Ex == 2 then
                                        repeat wait()
                                            Player.Character.HumanoidRootPart.CFrame = Workspace.Map.HeavenlyDimension.Exit.CFrame
                                        until not _G.AutoCDK or _G.SelectCDKFarm ~= "Auto Tushita CDK" or tonumber(CommF_Remote:InvokeServer("CDKQuest","Progress")["Good"]) == 3
                                    end
                                    repeat wait()
                                        repeat wait() 
                                            _tp(CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625)) 
                                            for i, v in pairs(Workspace.Map.HeavenlyDimension:GetDescendants()) do
                                                if v:IsA("ProximityPrompt") then fireproximityprompt(v) end
                                            end
                                        until (CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625).Position - Player.Character.HumanoidRootPart.Position).Magnitude < 5
                                        wait(2)
                                        _G.DoneT1 = true
                                    until not _G.AutoCDK or _G.SelectCDKFarm ~= "Auto Tushita CDK" or _G.DoneT1
                                    repeat wait()
                                        repeat wait()
                                            _tp(CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875)) 
                                            for i, v in pairs(Workspace.Map.HeavenlyDimension:GetDescendants()) do
                                                if v:IsA("ProximityPrompt") then fireproximityprompt(v) end
                                            end
                                        until (CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875).Position - Player.Character.HumanoidRootPart.Position).Magnitude < 5
                                        wait(2) _G.DoneT2 = true
                                    until _G.DoneT2 or not _G.AutoCDK or _G.SelectCDKFarm ~= "Auto Tushita CDK"
                                    repeat wait()
                                        repeat task.wait() 
                                            _tp(CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375)) 
                                            for i, v in pairs(Workspace.Map.HeavenlyDimension:GetDescendants()) do
                                                if v:IsA("ProximityPrompt") then fireproximityprompt(v) end
                                            end
                                        until (CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375).Position - Player.Character.HumanoidRootPart.Position).Magnitude < 5
                                        wait(2) _G.DoneT3 = true
                                    until _G.DoneT3 or not _G.AutoCDK or _G.SelectCDKFarm ~= "Auto Tushita CDK"
                                    for i,v in pairs(Workspace.Enemies:GetChildren()) do
                                        if (v:FindFirstChild("HumanoidRootPart").Position - CFrame.new(-22695.7012, 5270.93652, 3814.42847, 0.11794927, 3.32185834e-08, 0.99301964, -8.73070718e-08, 1, -2.30819008e-08, -0.99301964, -8.3975138e-08, 0.11794927).Position).Magnitude <= 300 then
                                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 then
                                                repeat wait()
                                                    Attack.Kill(v, _G.AutoCDK and _G.SelectCDKFarm == "Auto Tushita CDK")
                                                until not _G.AutoCDK or _G.SelectCDKFarm ~= "Auto Tushita CDK" or v.Humanoid.Health <= 0 or not v.Parent                      
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

task.spawn(function()    
    while wait(Sec) do
        pcall(function()
            if _G.AutoCDK and _G.SelectCDKFarm == "Last Quest" then
                CommF_Remote:InvokeServer("CDKQuest","Progress","Good")
                CommF_Remote:InvokeServer("CDKQuest","Progress","Evil")
                CommF_Remote:InvokeServer("CDKQuest","StartTrial","Boss")
                local v = GetConnectionEnemies("Cursed Skeleton Boss")
                if v then
                    repeat wait()
                        if plr.Character:FindFirstChild("Yama") or plr.Backpack:FindFirstChild("Yama") then EquipWeapon("Yama")
                        elseif plr.Character:FindFirstChild("Tushita") or plr.Backpack:FindFirstChild("Tushita") then EquipWeapon("Tushita")                                    
                        end _tp(v.HumanoidRootPart.CFrame * CFrame.new(0,20,0))
                    until not _G.AutoCDK or _G.SelectCDKFarm ~= "Auto Get CDK [Last Quest]" or not v.Parent or v.Humanoid.Health <= 0                                
                else
                    _tp(CFrame.new(-12318.193359375, 601.9518432617188, -6538.662109375)) wait(.5)
                    _tp(Workspace.Map.Turtle.Cursed.BossDoor.CFrame)
                end
            end
        end)
    end
end)

GetItems.CreateToggle({
    Title = "Auto Yama",
    Default = false,
    Callback = function(Value)
        _G.Auto_Yama = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Yama then
                if CommF_Remote:InvokeServer("EliteHunter", "Progress") < 30 then
                    _G.FarmEliteHunt = true
                elseif CommF_Remote:InvokeServer("EliteHunter", "Progress") > 30 then
                    _G.FarmEliteHunt = false
                    if (Workspace.Map.Waterfall.SealedKatana.Handle.Position-plr.Character.HumanoidRootPart.Position).Magnitude >= 20 then
                        _tp(Workspace.Map.Waterfall.SealedKatana.Handle.CFrame)
                        local zx = GetConnectionEnemies("Ghost")
                        if zx then
                            repeat wait() Attack.Kill(zx,_G.Auto_Yama) until zx.Humanoid.Health <= 0 or not zx.Parent or not _G.Auto_Yama               
                            fireclickdetector(Workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)
                        end
                    end
                end
            end
        end)
    end
end)

GetItems.CreateToggle({
    Title = "Auto Tushita",
    Default = false,
    Callback = function(Value)
        _G.Auto_Tushita = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Tushita then
                if Workspace.Map.Turtle:FindFirstChild("TushitaGate") then
                    if not GetBP("Holy Torch") then
                        _tp(CFrame.new(5148.03613, 162.352493, 910.548218))
                        wait(0.7)
                    else
                        EquipWeapon("Holy Torch")
                        task.wait(1)
                        repeat task.wait() _tp(CFrame.new(-10752, 417, -9366)) until not _G.Auto_Tushita or (CFrame.new(-10752, 417, -9366).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
                        wait(.7)
                        repeat task.wait() _tp(CFrame.new(-11672, 334, -9474)) until not _G.Auto_Tushita or (CFrame.new(-11672, 334, -9474).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
                        wait(.7)
                        repeat task.wait() _tp(CFrame.new(-12132, 521, -10655)) until not _G.Auto_Tushita or (CFrame.new(-12132, 521, -10655).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
                        wait(.7)
                        repeat task.wait() _tp(CFrame.new(-13336, 486, -6985)) until not _G.Auto_Tushita or (CFrame.new(-13336, 486, -6985).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
                        wait(.7)
                        repeat task.wait() _tp(CFrame.new(-13489, 332, -7925)) until not _G.Auto_Tushita or (CFrame.new(-13489, 332, -7925).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10
                    end
                else
                    local v = GetConnectionEnemies("Longma")
                    if v then 
                        repeat task.wait() Attack.Kill(v,_G.Auto_Tushita) until v.Humanoid.Health <= 0 or not _G.Auto_Tushita or not v.Parent
                    else 
                        if replicated:FindFirstChild("Longma") then _tp(replicated:FindFirstChild("Longma").HumanoidRootPart.CFrame * CFrame.new(0,40,0)) end
                    end                     
                end
            end
        end)
    end
end)

GetItems.CreateToggle({
    Title = "Auto TTK",
    Default = false,
    Callback = function(Value)
        _G.Auto_Tushita = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Auto_Tushita then
                CommF_Remote:InvokeServer("MysteriousMan","2")
            end
        end)
    end
end)

GetItems.CreateToggle({
    Title = "Auto Saber",
    Default = false,
    Callback = function(Value)
        _G.AutoSaber = Value
    end
})

task.spawn(function()
    while wait(.2) do
        pcall(function()
            if _G.AutoSaber and plr.Data.Level.Value >= 200 and not plr.Backpack:FindFirstChild("Saber") and not plr.Character:FindFirstChild("Saber") then
                if Workspace.Map.Jungle.Final.Part.Transparency == 0 then
                    if Workspace.Map.Jungle.QuestPlates.Door.Transparency == 0 then
                        if (CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279).Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 100 then
                            _tp(plr.Character.HumanoidRootPart.CFrame)
                            wait(0.5)
                            plr.Character.HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate1.Button.CFrame
                            wait(0.5)
                            plr.Character.HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate2.Button.CFrame
                            wait(0.5)
                            plr.Character.HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate3.Button.CFrame
                            wait(0.5)
                            plr.Character.HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate4.Button.CFrame
                            wait(0.5)
                            plr.Character.HumanoidRootPart.CFrame = Workspace.Map.Jungle.QuestPlates.Plate5.Button.CFrame
                            wait(0.5) 
                        else
                            _tp(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-09, -0.928667724, 3.97099491e-08, 1, 1.91679348e-08, 0.928667724, -4.39869794e-08, 0.37091279))
                        end
                    else
                        if Workspace.Map.Desert.Burn.Part.Transparency == 0 then
                            if plr.Backpack:FindFirstChild("Torch") or plr.Character:FindFirstChild("Torch") then
                                EquipWeapon("Torch")
                                firetouchinterest(plr.Character.Torch.Handle,Workspace.Map.Desert.Burn.Fire,0)
                                firetouchinterest(plr.Character.Torch.Handle,Workspace.Map.Desert.Burn.Fire,1)
                                _tp(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-09, 0.761243105, -5.70652914e-10, 1, 1.20584542e-09, -0.761243105, 3.47544882e-10, -0.648466587))
                            else
                                _tp(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408))                    
                            end
                        else
                            if CommF_Remote:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
                                CommF_Remote:InvokeServer("ProQuestProgress","GetCup")
                                wait(0.5)
                                EquipWeapon("Cup")
                                wait(0.5)
                                CommF_Remote:InvokeServer("ProQuestProgress","FillCup",plr.Character.Cup)
                                wait(Sec)
                                CommF_Remote:InvokeServer("ProQuestProgress","SickMan") 
                            else
                                if CommF_Remote:InvokeServer("ProQuestProgress","RichSon") == nil then
                                    CommF_Remote:InvokeServer("ProQuestProgress","RichSon")
                                elseif CommF_Remote:InvokeServer("ProQuestProgress","RichSon") == 0 then
                                    if Workspace.Enemies:FindFirstChild("Mob Leader") or replicated:FindFirstChild("Mob Leader") then
                                        _tp(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559))
                                        for i,v in pairs(Workspace.Enemies:GetChildren()) do
                                            if v.Name == "Mob Leader" and Attack.Alive(v) then
                                                repeat task.wait() Attack.Kill(v, _G.AutoSaber)until v.Humanoid.Health <= 0 or _G.AutoSaber == false
                                            end
                                        end
                                    end
                                elseif CommF_Remote:InvokeServer("ProQuestProgress","RichSon") == 1 then
                                    CommF_Remote:InvokeServer("ProQuestProgress","RichSon")
                                    EquipWeapon("Relic")
                                    _tp(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-09, 0.481375456, 2.53851997e-08, 1, -5.79995607e-08, -0.481375456, 6.30572643e-08, 0.876514494))
                                end
                            end
                        end
                    end
                else
                    if Workspace.Enemies:FindFirstChild("Saber Expert") or replicated:FindFirstChild("Saber Expert") then
                        for _,v in pairs(Workspace.Enemies:GetChildren()) do
                            if v.Name == "Saber Expert" and Attack.Alive(v) then
                                repeat task.wait() Attack.Kill(v, _G.AutoSaber) until v.Humanoid.Health <= 0 or _G.AutoSaber == false
                                if v.Humanoid.Health <= 0 then CommF_Remote:InvokeServer("ProQuestProgress","PlaceRelic") end		      
                            end
                        end
                    else
                        _tp(CFrame.new(-1401.85046, 29.9773273, 8.81916237, 0.85820812, 8.76083845e-08, 0.513301849, -8.55007443e-08, 1, -2.77243419e-08, -0.513301849, -2.00944328e-08, 0.85820812))
                    end
                end
            end
        end)
    end
end)

--========================================
-- 39. MASTERY WEAPON
--========================================
local MasteryWeaponMS = Items.CreateSection("Mastery Weapon")

MasteryWeaponMS.CreateToggle({
    Title = "Auto Farm Mastery 600 Melees",
    Default = false,
    Callback = function(Value)
        _G.MeleeMastery = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.MeleeMastery then
                for _, weaponData in next, CommF_Remote:InvokeServer("getInventory") do          
                    if type(weaponData) == "table" then
                        if weaponData.Type == "Melee" then
                            local weaponName = weaponData.Name
                            if tonumber(weaponData.Mastery) >= 1 and tonumber(weaponData.Mastery) <= 599 then
                                if GetBP(weaponName) then
                                    local enemy = GetConnectionEnemies(mastery2)
                                    if enemy then
                                        repeat 
                                            wait() 
                                            Attack.Sword(enemy, _G.MeleeMastery) 
                                        until _G.MeleeMastery == false or not enemy.Parent or enemy.Humanoid.Health <= 0
                                    else
                                        _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
                                    end
                                else
                                    CommF_Remote:InvokeServer("LoadItem", weaponName)
                                end
                            elseif tonumber(weaponData.Mastery) >= 600 then
                                if not GetBP(weaponName) then 
                                    CommF_Remote:InvokeServer("LoadItem", weaponName)
                                end
                            end
                            break
                        end
                    end
                end
            end
        end)
    end
end)

MasteryWeaponMS.CreateToggle({
    Title = "Auto Farm Mastery 600 Swords",
    Default = false,
    Callback = function(Value)
        _G.SwordMastery = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.SwordMastery then
                for _, weaponData in next, CommF_Remote:InvokeServer("getInventory") do          
                    if type(weaponData) == "table" then
                        if weaponData.Type == "Sword" then
                            local weaponName = weaponData.Name
                            if tonumber(weaponData.Mastery) >= 1 and tonumber(weaponData.Mastery) <= 599 then
                                if GetBP(weaponName) then
                                    local enemy = GetConnectionEnemies(mastery2)
                                    if enemy then
                                        repeat 
                                            wait() 
                                            Attack.Sword(enemy, _G.SwordMastery) 
                                        until _G.SwordMastery == false or not enemy.Parent or enemy.Humanoid.Health <= 0
                                    else
                                        _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
                                    end
                                else
                                    CommF_Remote:InvokeServer("LoadItem", weaponName)
                                end
                            elseif tonumber(weaponData.Mastery) >= 600 then
                                if not GetBP(weaponName) then 
                                    CommF_Remote:InvokeServer("LoadItem", weaponName)
                                end
                            end
                            break
                        end
                    end
                end
            end
        end)
    end
end)

--========================================
-- 40. VOLCANO EVENT TAB
--========================================
local Volcano = Main.CreatePage({Page_Name = "Volcano Event", Page_Title = "Volcano Event Tab"})
local VolcanoFarm = Volcano.CreateSection("Farming Volcano")

VolcanoFarm.CreateToggle({
    Title = "Auto Crafting Volcanic Magnet",
    Default = false,
    Callback = function(Value)
        _G.CraftVolcanicMagnet = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.CraftVolcanicMagnet then
                CommF_Remote:InvokeServer("CraftItem", "Craft", "Volcanic Magnet")
            end
        end)
    end
end)

local PrehistoricIslandFindToggle = VolcanoFarm.CreateToggle({
    Title = "Auto Find Prehistoric Island",
    Default = false,
    Callback = function(Value)
        _G.Prehis_Find = Value
    end
})

local targetDestination = nil
task.spawn(function()
    while wait() do
        if _G.Prehis_Find then 
            pcall(function()
                if not Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island", true) then                
                    local myBoat = CheckBoat()
                    if not myBoat then
                        local buyBoatCFrame = CFrame.new(-16927.451, 9.086, 433.864)
                        TeleportToTarget(buyBoatCFrame)
                        if (buyBoatCFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 then 
                            CommF_Remote:InvokeServer("BuyBoat", _G.SelectedBoat) 
                        end
                    else
                        if plr.Character.Humanoid.Sit == false then
                            local boatSeatCFrame = myBoat.VehicleSeat.CFrame * CFrame.new(0, 1, 0)
                            _tp(boatSeatCFrame)
                        else                            
                            repeat wait() 
                                local targetDestination = CFrame.new(-10000000, 31, 37016.25)
                                if CheckEnemiesBoat() or CheckTerrorShark() or CheckPirateGrandBrigade() then
                                    _tp(CFrame.new(-10000000, 150, 37016.25))
                                else
                                    _tp(CFrame.new(-10000000, 31, 37016.25))
                                end
                            until not _G.Prehis_Find or (targetDestination.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 10 or Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") or plr.Character.Humanoid.Sit == false
                            plr.Character.Humanoid.Sit = false
                        end
                    end
                else
                    if (Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island").CFrame.Position - plr.Character.HumanoidRootPart.Position).Magnitude >= 2000 then 
                        _tp(Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island").CFrame)
                    end
                    if Workspace.Map:FindFirstChild("PrehistoricIsland", true) or Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island", true) then            
                        if Workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild("ProximityPrompt", true) then
                            if plr:DistanceFromCharacter(Workspace.Map.PrehistoricIsland.Core.ActivationPrompt.CFrame.Position) <= 150 then
                                fireproximityprompt(Workspace.Map.PrehistoricIsland.Core.ActivationPrompt.ProximityPrompt, math.huge)
                                vim1:SendKeyEvent(true, "E", false, game) 
                                wait(1.5) 
                                vim1:SendKeyEvent(false, "E", false, game)
                            end
                            _tp(Workspace.Map.PrehistoricIsland.Core.ActivationPrompt.CFrame)              
                        end
                    end

                    _G.Prehis_Find = false
                    PrehistoricIslandFindToggle.SetValue(false)
                    Library.CreateNoti({
                        Title = "Banana Cat Hub",
                        Desc = "Prehistoric Island Spawned",
                        Duration = 5
                    })
                end
            end)
        end
    end
end)

VolcanoFarm.CreateToggle({
    Title = "Auto Event Prehistoric Island",
    Desc = "auto Start Event and Auto kill golem, Auto Fix Volcano",
    Default = false,
    Callback = function(Value)
        _G.Prehis_Skills = Value
    end
})

task.spawn(function()
    while wait() do
        if _G.Prehis_Skills then
            local prehistoricIsland = Workspace.Map:FindFirstChild("PrehistoricIsland")
            if prehistoricIsland then
                for _, obj in pairs(prehistoricIsland:GetDescendants()) do
                    if obj:IsA("Part") and obj.Name:lower():find("lava") then obj:Destroy() end
                    if obj:IsA("MeshPart") and obj.Name:lower():find("lava") then obj:Destroy() end
                end
                local lavaModel = Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava")
                if lavaModel and lavaModel:IsA("Model") then lavaModel:Destroy() end
                local Island = Workspace.Map:FindFirstChild("PrehistoricIsland")
                if Island then   
                    local trialTeleport = Workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")   
                    for _, v in pairs(Island:GetDescendants()) do
                        if v.Name == "TouchInterest" then
                            if not (trialTeleport and v:IsDescendantOf(trialTeleport)) then
                                v.Parent:Destroy()
                            end
                        end
                    end
                end  
            end
        end
    end
end)

task.spawn(function()
    while wait() do
        pcall(function()
            if _G.Prehis_Skills then
                if Workspace.Enemies:FindFirstChild("Lava Golem") then
                    local v = GetConnectionEnemies("Lava Golem")
                    if v then 
                        repeat 
                            wait()
                            Attack.Kill(v,_G.Prehis_Skills) 
                            v.Humanoid:ChangeState(15)
                        until not _G.Prehis_Skills or not v.Parent or v.Humanoid.Health <= 0 
                    end
                end
                for i,v in pairs(Workspace.Map.PrehistoricIsland.Core.VolcanoRocks:GetChildren()) do
                    if v:FindFirstChild("VFXLayer") then
                        if v:FindFirstChild("VFXLayer").At0.Glow.Enabled == true or v.VFXLayer.At0.Glow.Enabled == true then
                            repeat wait()
                                _tp(v.VFXLayer.CFrame)
                                if v.VFXLayer.At0.Glow.Enabled == true and plr:DistanceFromCharacter(v.VFXLayer.CFrame.Position) <= 150 then
                                    MousePos = v.VFXLayer.CFrame.Position
                                    Useskills("Melee","Z") wait(.5)
                                    Useskills("Melee","X") wait(.5)
                                    Useskills("Melee","C") wait(.5)
                                    Useskills("Blox Fruit","Z") wait(.5)
                                    Useskills("Blox Fruit","X") wait(.5)
                                    Useskills("Blox Fruit","C")
                                end   
                            until not _G.Prehis_Skills or v:FindFirstChild("VFXLayer").At0.Glow.Enabled == false or v.VFXLayer.At0.Glow.Enabled == false            
                        end
                    end
                end
            end
        end)
    end
end)

VolcanoFarm.CreateToggle({
    Title = "Auto Collect Bone",
    Default = false,
    Callback = function(Value)
        _G.Prehis_DB = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Prehis_DB then
                if Workspace:FindFirstChild("DinoBone") then
                    for i,v in pairs(Workspace:GetChildren()) do
                        if v.Name == "DinoBone" then _tp(v.CFrame) end
                    end
                end
            end
        end)
    end
end)

VolcanoFarm.CreateToggle({
    Title = "Auto Collect Egg",
    Default = false,
    Callback = function(Value)
        _G.Prehis_DE = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.Prehis_DE then
                if Workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg") then 
                    _tp(Workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg").Molten.CFrame) 
                    fireproximityprompt(Workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs.DragonEgg.Molten.ProximityPrompt, 30) 
                end        
            end
        end)
    end
end)

--========================================
-- 41. FULLY VOLCANO
--========================================
local FullyVolcano = Volcano.CreateSection("Fully Volcano")

FullyVolcano.CreateToggle({
    Title = "Ignore Craft Volcanic Magnet [ Fully ]",
    Default = false,
    Callback = function(Value)
        _G.CraftVM = Value
    end
})

task.spawn(function()
    while wait(Sec) do
        pcall(function()
            if _G.CraftVM then     
                if GetM("Volcanic Magnet") < 1 then
                    if GetM("Scrap Metal") >= 10 and GetM("Blaze Ember") >= 15 then
                        CommF_Remote:InvokeServer("CraftItem","Craft","Volcanic Magnet")
                    elseif GetM("Scrap Metal") < 10 then
                        local v = GetConnectionEnemies("Forest Pirate")
                        if v then 
                            repeat 
                                wait() 
                                Attack.Kill(v,_G.CraftVM) 
                            until not _G.CraftVM or not v.Parent or v.Humanoid.Health <= 0 or GetM("Scrap Metal") >= 10
                        else 
                            _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
                        end     
                    elseif GetM("Blaze Ember") < 15 then
                        repeat 
                            wait() 
                            _G.FarmBlazeEM = true 
                        until not _G.CraftVM or GetM("Blaze Ember") >= 15 
                        _G.FarmBlazeEM = false
                    end   
                end            
            end
        end)
    end
end)

--========================================
-- 42. ESP TAB
--========================================
local HasESP = Main.CreatePage({Page_Name = "ESP", Page_Title = "ESP Tab"})
local ESP = HasESP.CreateSection("ESP")

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer

local IslandESP = false
local islandUpdateConnection

function UpdateIslandESP()
    if not Player or not Player.Character or not Player.Character:FindFirstChild("Head") then return end
    
    local headPosition = Player.Character.Head.Position
    local locations = Workspace._WorldOrigin.Locations:GetChildren()
    
    for _, v in ipairs(locations) do
        if v.Name ~= "Sea" then
            if IslandESP then
                local bill = v:FindFirstChild("NameEsp")
                if not bill then
                    bill = Instance.new("BillboardGui")
                    bill.Name = "NameEsp"
                    bill.ExtentsOffset = Vector3.new(0, 1, 0)
                    bill.Size = UDim2.new(1, 200, 1, 30)
                    bill.Adornee = v
                    bill.AlwaysOnTop = true
                    bill.Parent = v
                    
                    local name = Instance.new("TextLabel", bill)
                    name.Font = Enum.Font.GothamBold
                    name.TextSize = 14
                    name.TextWrapped = true
                    name.Size = UDim2.new(1, 0, 1, 0)
                    name.TextYAlignment = Enum.TextYAlignment.Top
                    name.BackgroundTransparency = 1
                    name.TextStrokeTransparency = 0.5
                    name.TextColor3 = Color3.fromRGB(255, 255, 255)
                    name.Parent = bill
                end
                
                local textLabel = bill:FindFirstChildOfClass("TextLabel")
                if textLabel then
                    local distance = (headPosition - v.Position).Magnitude / 3
                    textLabel.Text = string.format("%s\n%d Distance", v.Name, math.floor(distance + 0.5))
                end
            else
                local existingBill = v:FindFirstChild("NameEsp")
                if existingBill then
                    existingBill:Destroy()
                end
            end
        end
    end
end

local DevilFruitESP = false
local fruitUpdateConnection
local FruitNumber = math.random(1, 1000000)

function UpdateDevilChams()
    if not Player or not Player.Character or not Player.Character:FindFirstChild("Head") then return end
    
    local headPosition = Player.Character.Head.Position
    
    for _, v in ipairs(Workspace:GetChildren()) do
        pcall(function()
            if v:IsA("Model") and string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
                local handle = v.Handle
                if DevilFruitESP then
                    local bill = handle:FindFirstChild("NameEsp" .. FruitNumber)
                    if not bill then
                        bill = Instance.new("BillboardGui")
                        bill.Name = "NameEsp" .. FruitNumber
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = handle
                        bill.AlwaysOnTop = true
                        bill.Parent = handle
                        
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.TextSize = 14
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Top
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.TextColor3 = Color3.fromRGB(255, 255, 255)
                        name.Parent = bill
                    end
                    
                    local textLabel = bill:FindFirstChildOfClass("TextLabel")
                    if textLabel then
                        local distance = (headPosition - handle.Position).Magnitude / 3
                        textLabel.Text = string.format("%s\n%d Distance", v.Name, math.floor(distance + 0.5))
                    end
                else
                    local existingBill = handle:FindFirstChild("NameEsp" .. FruitNumber)
                    if existingBill then
                        existingBill:Destroy()
                    end
                end
            end
        end)
    end
end

local ESPPlayer = false
local playerUpdateConnection
local PlayerNumber = math.random(1, 1000000)

function UpdatePlayerChams()
    if not Player or not Player.Character or not Player.Character:FindFirstChild("Head") then return end
    
    local headPosition = Player.Character.Head.Position
    
    for _, v in ipairs(Players:GetPlayers()) do
        pcall(function()
            if v ~= Player and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") then
                local head = v.Character.Head
                local humanoid = v.Character.Humanoid
                local bill = head:FindFirstChild("NameEsp" .. PlayerNumber)
                
                if ESPPlayer then
                    if not bill then
                        bill = Instance.new("BillboardGui")
                        bill.Name = "NameEsp" .. PlayerNumber
                        bill.ExtentsOffset = Vector3.new(0, 1, 0)
                        bill.Size = UDim2.new(1, 200, 1, 30)
                        bill.Adornee = head
                        bill.AlwaysOnTop = true
                        bill.Parent = head
                        
                        local name = Instance.new("TextLabel", bill)
                        name.Font = Enum.Font.GothamSemibold
                        name.TextSize = 14
                        name.TextWrapped = true
                        name.Size = UDim2.new(1, 0, 1, 0)
                        name.TextYAlignment = Enum.TextYAlignment.Top
                        name.BackgroundTransparency = 1
                        name.TextStrokeTransparency = 0.5
                        name.Parent = bill
                    end
                    
                    local textLabel = bill:FindFirstChildOfClass("TextLabel")
                    if textLabel then
                        local distance = math.floor((headPosition - head.Position).Magnitude / 3 + 0.5)
                        local healthPercent = math.floor((humanoid.Health / humanoid.MaxHealth) * 100 + 0.5)
                        textLabel.Text = string.format("%s\n%d Distance\nHealth: %d%%", v.Name, distance, healthPercent)
                        
                        if v.Team == Player.Team then
                            textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                        else
                            textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    end
                else
                    if bill then
                        bill:Destroy()
                    end
                end
            end
        end)
    end
end

local BerryEsp = false
local BerryArray = nil

local function berriesEsp()
    if BerryEsp then
        local CollectionService = game:GetService("CollectionService")
        local BerryBushes = CollectionService:GetTagged("BerryBush")
        
        for _, Bush in ipairs(BerryBushes) do
            local bushPosition = Bush.Parent:GetPivot().Position
            
            for _, BerryName in pairs(Bush:GetAttributes()) do
                if BerryName and (not BerryArray or table.find(BerryArray, BerryName)) then
                    local espPartName = "BerryEspPart_" .. BerryName .. "_" .. tostring(bushPosition)
                    local existingEsp = Workspace:FindFirstChild(espPartName)
                    
                    if not existingEsp then
                        existingEsp = Instance.new("Part")
                        existingEsp.Name = espPartName
                        existingEsp.Transparency = 1
                        existingEsp.Size = Vector3.new(1, 1, 1)
                        existingEsp.Anchored = true
                        existingEsp.CanCollide = false
                        existingEsp.Parent = Workspace
                        existingEsp.CFrame = CFrame.new(bushPosition)
                    end
                    
                    if not existingEsp:FindFirstChild("NameEsp") then
                        local nameEsp = Instance.new("BillboardGui", existingEsp)
                        nameEsp.Name = "NameEsp"
                        nameEsp.ExtentsOffset = Vector3.new(0, 1, 0)
                        nameEsp.Size = UDim2.new(0, 200, 0, 30)
                        nameEsp.Adornee = existingEsp
                        nameEsp.AlwaysOnTop = true
                        
                        local nameLabel = Instance.new("TextLabel", nameEsp)
                        nameLabel.Font = Enum.Font.Code
                        nameLabel.TextSize = 14
                        nameLabel.TextWrapped = true
                        nameLabel.Size = UDim2.new(1, 0, 1, 0)
                        nameLabel.TextYAlignment = Enum.TextYAlignment.Top
                        nameLabel.BackgroundTransparency = 1
                        nameLabel.TextStrokeTransparency = 0.5
                        nameLabel.TextColor3 = Color3.fromRGB(80, 245, 245)
                        nameLabel.Parent = nameEsp
                    end
                    
                    local nameEsp = existingEsp:FindFirstChild("NameEsp")
                    if nameEsp and nameEsp.TextLabel then
                        local distance = (Player.Character.Head.Position - bushPosition).Magnitude / 3
                        nameEsp.TextLabel.Text = ('[' .. BerryName .. ']' .. " " .. math.round(distance) .. " M")
                        
                        if _G.AutoBerry and math.round(distance) <= 20 then
                            existingEsp:Destroy()
                        end
                    end
                end
            end
        end
    else
        for _, v in ipairs(Workspace:GetChildren()) do
            if v:IsA("Part") and v.Name:match("BerryEspPart_.*") then
                v:Destroy()
            end
        end
    end
end

ESP.CreateToggle({
    Title = "ESP Berry",
    Default = false,
    Callback = function(Value)
        BerryEsp = Value
        while BerryEsp do
            wait()
            berriesEsp()
        end
    end
})

ESP.CreateToggle({
    Title = "ESP Island",
    Default = false,
    Callback = function(Value)
        IslandESP = Value
        if IslandESP then
            if not islandUpdateConnection then
                islandUpdateConnection = RunService.Heartbeat:Connect(UpdateIslandESP)
            end
        else
            if islandUpdateConnection then
                islandUpdateConnection:Disconnect()
                islandUpdateConnection = nil
            end
            for _, v in ipairs(Workspace._WorldOrigin.Locations:GetChildren()) do
                local existingBill = v:FindFirstChild("NameEsp")
                if existingBill then
                    existingBill:Destroy()
                end
            end
        end
    end
})

ESP.CreateToggle({
    Title = "ESP Fruit",
    Default = false,
    Callback = function(Value)
        DevilFruitESP = Value
        if DevilFruitESP then
            if not fruitUpdateConnection then
                fruitUpdateConnection = RunService.Heartbeat:Connect(UpdateDevilChams)
            end
        else
            if fruitUpdateConnection then
                fruitUpdateConnection:Disconnect()
                fruitUpdateConnection = nil
            end
            for _, v in ipairs(Workspace:GetChildren()) do
                if v:IsA("Model") and string.find(v.Name, "Fruit") and v:FindFirstChild("Handle") then
                    local handle = v.Handle
                    local existingBill = handle:FindFirstChild("NameEsp" .. FruitNumber)
                    if existingBill then
                        existingBill:Destroy()
                    end
                end
            end
        end
    end
})

ESP.CreateToggle({
    Title = "ESP Player",
    Default = false,
    Callback = function(Value)
        ESPPlayer = Value
        if ESPPlayer then
            if not playerUpdateConnection then
                playerUpdateConnection = RunService.Heartbeat:Connect(UpdatePlayerChams)
            end
        else
            if playerUpdateConnection then
                playerUpdateConnection:Disconnect()
                playerUpdateConnection = nil
            end
            for _, v in ipairs(Players:GetPlayers()) do
                if v ~= Player and v.Character and v.Character:FindFirstChild("Head") then
                    local head = v.Character.Head
                    local existingBill = head:FindFirstChild("NameEsp" .. PlayerNumber)
                    if existingBill then
                        existingBill:Destroy()
                    end
                end
            end
        end
    end
})

--========================================
-- 43. PVP TAB
--========================================
local PlayerPVP = Main.CreatePage({Page_Name = "PVP", Page_Title = "PVP Tab"})
local PVP = PlayerPVP.CreateSection("PVP")

Playerslist = {}
for i, player in ipairs(Players:GetPlayers()) do
    Playerslist[i] = player.Name
end

PVP.CreateDropdown({
    Title = "Select Player PVP",
    Search = true,
    List = Playerslist,
    Default = nil,
    Multi = true,
    Callback = function(Value)
        _G.BfSkills = Value
    end
})

AimbotMethod = {"AimBots Skill", "Auto Aimbots"}

PVP.CreateDropdown({
    Title = "Select Method Aimbot",
    Search = true,
    List = AimbotMethod,
    Default = nil,
    Multi = true,
    Callback = function(Value)
        ABmethod = Value
    end
})

PVP.CreateToggle({
    Title = "Teleport Player",
    Default = false,
    Callback = function(Value)
        _G.TpPly = Value
        pcall(function()
            if _G.TpPly then
                repeat
                    wait()
                    _tp(Players[_G.PlayersList].Character.HumanoidRootPart.CFrame)
                until not _G.TpPly
            end
        end)
    end
})

PVP.CreateToggle({
    Title = "Auto Aimbot",
    Default = false,
    Callback = function(Value)
        _G.AimMethod = Value
    end
})

task.spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AimMethod and ABmethod == "AimBots Skill" then
                for i, v in pairs(Players:GetPlayers()) do
                    if v.Name == _G.PlayersList and v.Team ~= Player.Team then
                        MousePos = v.Character:FindFirstChild("HumanoidRootPart").Position
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AimMethod and ABmethod == "Auto Aimbots" then
                local MaxDistance = math.huge
                for i, v in pairs(Players:GetPlayers()) do
                    if v.Name ~= plr.Name and v.Team ~= Player.Team then
                        local Distance = v:DistanceFromCharacter(plr.Character.HumanoidRootPart.Position)
                        if Distance < MaxDistance then
                            MaxDistance = Distance
                            MousePos = v.Character:FindFirstChild("HumanoidRootPart").Position
                        end
                    end
                end
            end
        end)
    end
end)

PVP.CreateToggle({
    Title = "Auto Aimbot Gun",
    Default = false,
    Callback = function(Value)
        getgenv().AimbotGun = Value
    end
})

task.spawn(function()
    while task.wait(0.1) do
        if getgenv().AimbotGun and SelectWeaponGun then
            local character = Player.Character
            local weapon = character and character:FindFirstChild(SelectWeaponGun)
            local targetPlayer = Players:FindFirstChild(getgenv().SelectPlayer)
            local targetCharacter = targetPlayer and targetPlayer.Character
            local targetHumanoidRootPart = targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart")
            if weapon and targetHumanoidRootPart then
                pcall(function()
                    weapon.Cooldown.Value = 0
                    local args = {
                        [1] = targetHumanoidRootPart.Position,
                        [2] = targetHumanoidRootPart
                    }
                    weapon.RemoteFunctionShoot:InvokeServer(unpack(args))
                    vim2:Button1Down(Vector2.new(1280, 672))
                end)
            end
        end
    end
end)

local MiscPVP = PlayerPVP.CreateSection("MISC PVP")

MiscPVP.CreateSlider({
    Title = "Input WalkSpeed",
    Description = "",
    Min = 0,
    Max = 500,
    Default = 200,
    Rounding = 1,
    Callback = function(Value)
        getgenv().WalkSpeedValue = Value
    end
})

MiscPVP.CreateSlider({
    Title = "Input JumpPower",
    Description = "",
    Min = 0,
    Max = 500,
    Default = 200,
    Rounding = 1,
    Callback = function(Value)
        getgenv().JumpValue = Value
    end
})

MiscPVP.CreateToggle({
    Title = "Change JumpPower",
    Default = false,
    Callback = function(Value)
        getgenv().JumpPowerEnabled = Value
        
        if Value then
            local player = Player
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.JumpPower = getgenv().JumpValue
            end
        else
            local player = Player
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.JumpPower = 50
            end
        end
    end
})

MiscPVP.CreateToggle({
    Title = "Change WalkSpeed",
    Default = false,
    Callback = function(Value)
        getgenv().WalkSpeedEnabled = Value
        
        if Value then
            local player = Player
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
            end
        else
            local player = Player
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = 16
            end
        end
    end
})

Player.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid")
    
    if getgenv().WalkSpeedEnabled then
        character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
    end
    
    if getgenv().JumpPowerEnabled then
        character.Humanoid.JumpPower = getgenv().JumpValue
    end
end)

MiscPVP.CreateToggle({
    Title = "Walk On Water",
    Default = false,
    Callback = function(Value)
        _G.WalkWater_Part = Value
        if _G.WalkWater_Part then
            Workspace.Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
        else
            Workspace.Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
        end
    end
})

if not PrepareMultiSelectList then
    PrepareMultiSelectList = function(rarityTable, selectedSettings)
        local list = {}
        for key, value in pairs(rarityTable) do
            local item = {Value = key, Text = key}
            if selectedSettings and selectedSettings[key] == true then
                item.Selected = true
            else
                item.Selected = false
            end
            table.insert(list, item)
        end
        return list
    end
end

local TabWebhook = Main.CreatePage({Page_Name = "Tab Webhook", Page_Title = "Tab Webhook"})
local SectionWebhook = TabWebhook.CreateSection("Webhook")

SectionWebhook.CreateBox({
    Title = "Input Url Webhook",
    Placeholder = "Type here",
    Number = false,
    Default = Settings["Input Url Webhook"],
    Callback = function(v) Settings["Input Url Webhook"] = v SaveSettings("Input Url Webhook", v) end
})

SectionWebhook.CreateBox({
    Title = "Input Discord Ping (Everyone/ID)",
    Placeholder = "Type here",
    Number = false,
    Default = Settings["Input Discord Ping"],
    Callback = function(v) Settings["Input Discord Ping"] = v SaveSettings("Input Discord Ping", v) end
})

SectionWebhook.CreateToggle({
    Title = "Ping Everyone/Id Discord",
    Desc = "",
    Default = Settings["Ping Discord"] or false,
    Callback = function(v) Settings["Ping Discord"] = v SaveSettings("Ping Discord", v) end
})

local WebhookData = {
    Username = "Binini Hub",
    AvatarURL = "https://images-ext-1.discordapp.net/external/9LSZu__Uvs7I0N8MWag-JmwF2iT-pHCHSe2UdixGEXQ/%3Fsize%3D4096/https/cdn.discordapp.com/avatars/1262364141968949308/a_0c5fb64e2cbb35d029d73b44576c6a60.gif",
    BannerURL = "https://cdn.discordapp.com/attachments/1017024488665264218/1262729537578471504/banner_server.jpg",
    Title = "Banana Hub Notification",
    FooterText = "Binini Hub",
    Color = 16776960
}

local function safe_str(val) return tostring(val) or "nil" end

local function get_ping_tag()
    if pcall(function() return Settings["Ping Discord"] end) and Settings["Ping Discord"] then
        local id = Settings["Input Discord Ping"]
        if id then
            if tonumber(id) then return "<@" .. id .. ">" else return "@everyone" end
        end
    end
    return ""
end

local function get_webhook_url()
    return Settings["Input Url Webhook"]
end

local function iso8601_utc_now()
    return os.date("!%Y-%m-%dT%H:%M:%SZ")
end

local function base_fields(event, detail)
    return {
        {name = "Event", value = "`" .. safe_str(event) .. "`", inline = true},
        {name = "Detail", value = "`" .. safe_str(detail) .. "`", inline = true},
        {name = "Username", value = "||" .. safe_str(game.Players.LocalPlayer.Name) .. "||", inline = true},
        {name = "PlaceId", value = "`" .. safe_str(game.PlaceId) .. "`", inline = true},
        {name = "JobId", value = "`" .. safe_str(game.JobId) .. "`", inline = true}
    }
end

local function SendWebhook(event, detail, isStore)
    local url = get_webhook_url()
    if not url or url == "" then return end

    local fields
    if isStore then
        fields = {
            {name = "Stored Fruit", value = "```" .. safe_str(detail) .. "```", inline = false},
            {name = "Username", value = "||" .. safe_str(game.Players.LocalPlayer.Name) .. "||", inline = true},
            {name = "Time", value = os.date("%Y-%m-%d %H:%M:%S"), inline = true},
            {name = "PlaceId", value = "`" .. safe_str(game.PlaceId) .. "`", inline = true}
        }
    else
        fields = base_fields(event, detail)
    end

    local data = {
        content = get_ping_tag(),
        username = WebhookData.Username,
        avatar_url = WebhookData.AvatarURL,
        embeds = {{
            title = WebhookData.Title,
            description = "**Main Status**\nUsername : ||" .. safe_str(game.Players.LocalPlayer.Name) .. "||",
            color = WebhookData.Color,
            footer = {text = WebhookData.FooterText},
            fields = fields,
            thumbnail = {url = WebhookData.BannerURL},
            timestamp = iso8601_utc_now()
        }}
    }

    pcall(function()
        ExploitReq({
            Url = url,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = game:GetService("HttpService"):JSONEncode(data)
        })
    end)
end

getgenv().WebhookStoreFruit = function(fruit) SendWebhook("Store Fruit", fruit, true) end
getgenv().WebhookFindVolcano = function() SendWebhook("Prehistoric Island", "Spawned", false) end
getgenv().WebhookFindLeviathan = function() SendWebhook("Frozen Dimension", "Spawned", false) end
getgenv().WebhookFindMirage = function() SendWebhook("Mirage", "Spawned", false) end
getgenv().WebhookDestroyIdk = function() SendWebhook("Status", "Can Find Leviathan", false) end

local function WebhookProfile()
    local HttpService = game:GetService("HttpService")
    local CommF = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
    local Player = game.Players.LocalPlayer

    local config = {
        Color = 16776960,
        BannerURL = "https://cdn.discordapp.com/attachments/1017024488665264218/1262729537578471504/banner_server.jpg",
        AvatarURL = "https://images-ext-1.discordapp.net/external/9LSZu__Uvs7I0N8MWag-JmwF2iT-pHCHSe2UdixGEXQ/%3Fsize%3D4096/https/cdn.discordapp.com/avatars/1262364141968949308/a_0c5fb64e2cbb35d029d73b44576c6a60.gif",
        Username = "Binini Hub",
        Title = "<:bananacon:1261744974534541352>  Banana Hub Notification <:bananacon:1261744974534541352>",
        FooterText = "Binini Hub",
        FruitMinValue = 1000000,
        ItemMinRarity = 3,
        MaxFieldLen = 1024,
        MaxDescLen = 3800
    }

    local function safe_str2(v) return tostring(v) or "nil" end

    local function truncate(str, len)
        str = str or ""
        if #str > len then return str:sub(1, len - 3) .. "..." else return str end
    end

    local function code_block(str, len)
        return "```\n" .. truncate(str, len - 8) .. "\n```"
    end

    local function join_names(list)
        local t = {}
        for _, v in ipairs(list or {}) do
            table.insert(t, safe_str2(v.Name or v))
        end
        return table.concat(t, ",\n")
    end

    local function remote_invoke(...)
        local args = {...}
        local success, result = pcall(function() return CommF.InvokeServer(unpack(args)) end)
        return success and result or nil
    end

    local function get_race_version()
        if Player.Character and Player.Character:FindFirstChild("RaceTransformed") then
            return "V4"
        end
        local v1 = remote_invoke("Wenlocktoad", "1")
        local v2 = remote_invoke("Alchemist", "1")
        if v1 ~= -2 and v2 ~= -2 then return "V1"
        elseif v1 == -2 then return "V3"
        else return "V2" end
    end

    local function get_fruit_info()
        local fruit = Player.Data.DevilFruit and Player.Data.DevilFruit.Value or "None"
        local mastery = 0
        if fruit ~= "None" then
            local tool = Player.Backpack:FindFirstChild(fruit) or (Player.Character and Player.Character:FindFirstChild(fruit))
            if tool and tool:FindFirstChild("Level") then
                mastery = tonumber(tool.Level.Value) or 0
            end
        end
        return fruit, mastery
    end

    local function get_awakened()
        if remote_invoke("AwakeningChanger", "Check") then
            local abilities = remote_invoke("getAwakenedAbilities")
            local list = {}
            if type(abilities) == "table" then
                for k, v in pairs(abilities) do
                    if type(v) == "table" and v.Awakened then
                        table.insert(list, safe_str2(k))
                    end
                end
            end
            table.sort(list)
            return list
        end
        return {}
    end

    local function get_melee_bought()
        local melee_list = {"Death Step", "Sharkman Karate", "Electric Claw", "Dragon Talon", "Superhuman", "Godhuman", "Sanguine Art"}
        local bought = {}
        for _, name in ipairs(melee_list) do
            local result = remote_invoke("Buy" .. name:gsub(" ", ""), true)
            if result == 1 then
                table.insert(bought, name)
            end
        end
        table.sort(bought)
        return bought
    end

    local function get_inventory_items()
        local highValue = {}
        local highRarity = {}
        local items = getgenv().CheckItemInventory and getgenv().CheckItemInventory() or {}
        for _, item in ipairs(items) do
            local val = tonumber(item.Value)
            local rarity = tonumber(item.Rarity)
            if val and val >= config.FruitMinValue then
                table.insert(highValue, {Name = item.Name, Value = val})
            elseif rarity and rarity >= config.ItemMinRarity then
                table.insert(highRarity, {Name = item.Name, Rarity = rarity})
            end
        end
        table.sort(highValue, function(a,b) return (a.Value or 0) > (b.Value or 0) end)
        table.sort(highRarity, function(a,b) return (a.Rarity or 0) > (b.Rarity or 0) end)
        return highValue, highRarity
    end

    local fruit, fruitMastery = get_fruit_info()
    local fruitShort = fruit:match("(.-)%-") or fruit
    local awakened = get_awakened()
    local awakenedText = #awakened > 0 and " " .. table.concat(awakened, " ") or ""
    local fruitText = (fruit == "None") and "None" or (fruitShort .. " [" .. tostring(fruitMastery) .. awakenedText .. "]")

    local melees = get_melee_bought()
    local invFruit, invRarity = get_inventory_items()

    local profile = {
        Name = safe_str2(Player.Name),
        Level = Player.Data.Level and Player.Data.Level.Value or 0,
        Race = safe_str2(Player.Data.Race and Player.Data.Race.Value or "Unknown"),
        RaceVer = "[" .. get_race_version() .. "]",
        Fruit = fruit,
        FruitShort = fruitShort,
        FruitMastery = fruitMastery,
        FruitText = fruitText,
        Melees = melees,
        InventoryFruit = invFruit,
        Inventory = invRarity
    }

    local desc = "Username : " .. safe_str2(profile.Name) ..
                 ",\nLevel : " .. tostring(profile.Level) ..
                 ",\nRace : " .. profile.Race .. " " .. profile.RaceVer ..
                 ",\nFruits : " .. profile.FruitText .. " "

    local meleeStr = code_block(truncate(join_names(profile.Melees), config.MaxFieldLen - 10), config.MaxFieldLen)
    local invFruitStr = code_block(truncate(join_names(profile.InventoryFruit), config.MaxFieldLen - 10), config.MaxFieldLen)
    local invStr = code_block(truncate(join_names(profile.Inventory), config.MaxFieldLen - 10), config.MaxFieldLen)

    local embed = {
        username = config.Username,
        avatar_url = config.AvatarURL,
        embeds = {{
            title = config.Title,
            description = code_block(truncate(desc, config.MaxDescLen), config.MaxDescLen),
            color = tonumber(config.Color),
            footer = {text = config.FooterText},
            fields = {
                {name = "**Melee**", value = meleeStr, inline = true},
                {name = "**Inventory Fruit**", value = invFruitStr, inline = true},
                {name = "**Inventory**", value = invStr, inline = false}
            },
            thumbnail = {url = config.BannerURL},
            timestamp = iso8601_utc_now()
        }}
    }

    local url = get_webhook_url()
    if url and url ~= "" then
        pcall(function()
            ExploitReq({
                Url = url,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode(embed)
            })
        end)
    end
end

SectionWebhook.CreateToggle({
    Title = "Noti Profile",
    Desc = "",
    Default = Settings["Noti Profile"] or false,
    Callback = function(v)
        Settings["Noti Profile"] = v
        SaveSettings("Noti Profile", v)
        if v then
            spawn(function()
                while Settings["Noti Profile"] do
                    wait()
                    pcall(WebhookProfile)
                    wait(300)
                end
            end)
        end
    end
})

local TableRarityFruit = {Mythical = false, Legendary = false, Rare = false, Uncommon = false, Common = false}

SectionWebhook.CreateDropdown({
    Title = "Select Rarity Fruit",
    List = PrepareMultiSelectList(TableRarityFruit, Settings["Select Rarity Fruit"]),
    Search = true,
    Selected = true,
    Default = Settings["Select Rarity Fruit"],
    Callback = function(v) Settings["Select Rarity Fruit"] = v SaveSettings("Select Rarity Fruit", v) end
})

SectionWebhook.CreateToggle({
    Title = "Webhook Store Fruit",
    Desc = "",
    Default = Settings["Webhook Store Fruit"] or false,
    Callback = function(v) Settings["Webhook Store Fruit"] = v SaveSettings("Webhook Store Fruit", v) end
})

SectionWebhook.CreateToggle({
    Title = "Webhook Find Prehistoric Island",
    Desc = "",
    Default = Settings["Webhook Find Prehistoric Island"] or false,
    Callback = function(v) Settings["Webhook Find Prehistoric Island"] = v SaveSettings("Webhook Find Prehistoric Island", v) end
})

SectionWebhook.CreateToggle({
    Title = "Webhook Find Leviathan",
    Desc = "",
    Default = Settings["Webhook Find Leviathan"] or false,
    Callback = function(v) Settings["Webhook Find Leviathan"] = v SaveSettings("Webhook Find Leviathan", v) end
})

SectionWebhook.CreateToggle({
    Title = "Webhook Destroy IDK",
    Desc = "",
    Default = Settings["Webhook Destroy IDK"] or false,
    Callback = function(v) Settings["Webhook Destroy IDK"] = v SaveSettings("Webhook Destroy IDK", v) end
})

SectionWebhook.CreateToggle({
    Title = "Webhook Find Mirage",
    Desc = "",
    Default = Settings["Webhook Find Mirage"] or false,
    Callback = function(v) Settings["Webhook Find Mirage"] = v SaveSettings("Webhook Find Mirage", v) end
})

local SettingPage = Main.CreatePage({Page_Name = "Setting", Page_Title = "Setting Tab"})
local SettingSection = SettingPage.CreateSection("Settings")

SettingSection.CreateToggle({
    Title = "White Screen",
    Desc = "",
    Default = Settings["White Screen"] or false,
    Callback = function(v)
        Settings["White Screen"] = v
        game:GetService("RunService"):Set3dRenderingEnabled(not v)
        SaveSettings("White Screen", v)
    end
})

SettingSection.CreateToggle({
    Title = "Black Screen",
    Desc = "",
    Default = Settings["Black Screen"] or false,
    Callback = function(v)
        Settings["Black Screen"] = v
        spawn(function()
            wait()
            if v then
                if not R91 then
                    R91 = Instance.new("Frame")
                    R91.Size = UDim2.new(1,0,1,0)
                    R91.BackgroundColor3 = Color3.new(0,0,0)
                    R91.Parent = game.CoreGui
                end
                R91.Visible = true
                game:GetService("RunService"):Set3dRenderingEnabled(false)
                SetRobloxGUI(false)
            else
                if R91 then R91.Visible = false end
                game:GetService("RunService"):Set3dRenderingEnabled(true)
                SetRobloxGUI(true)
            end
        end)
        SaveSettings("Black Screen", v)
    end
})

SettingSection.CreateToggle({
    Title = "Remove Notifications",
    Desc = "",
    Default = Settings["Remove Notifications"] or false,
    Callback = function(v)
        Settings["Remove Notifications"] = v
        SaveSettings("Remove Notifications", v)
    end
})

spawn(function()
    while true do
        wait(1)
        if Settings["Remove Notifications"] then break end
    end
    local Notification = require(game:GetService("ReplicatedStorage").Notification)
    local DisplayNoti = (getupvalues(Notification.Display))[1]
    Notification.Dead = function(n)
        if Settings["Remove Notifications"] then return true end
        return tick() - n.CreationTime > n.Duration
    end
    Notification.Display = function(n)
        if Settings["Remove Notifications"] then return true end
        if n.Displayed then return false end
        n.Displayed = true
        n.CreationTime = tick()
        n.Label.Visible = true
        DisplayNoti:Add(n)
        return true
    end
end)

SettingSection.CreateToggle({
    Title = "Auto rejoin Disconnect",
    Desc = "",
    Default = Settings["Auto rejoin Disconnect"] or false,
    Callback = function(v) Settings["Auto rejoin Disconnect"] = v SaveSettings("Auto rejoin Disconnect", v) end
})

SettingSection.CreateToggle({
    Title = "Auto Load Script",
    Desc = "",
    Default = Settings["Auto Load Script"] or false,
    Callback = function(v) Settings["Auto Load Script"] = v SaveSettings("Auto Load Script", v) end
})

SettingSection.CreateToggle({
    Title = "Boost Fps",
    Desc = "",
    Default = Settings["Boost Fps"] or false,
    Callback = function(v)
        Settings["Boost Fps"] = v
        if v then
            local Lighting = game.Lighting
            local Terrain = game.Workspace.Terrain
            Terrain.WaterWaveSize = 0
            Terrain.WaterWaveSpeed = 0
            Terrain.WaterReflectance = 0
            Terrain.WaterTransparency = 0
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 9e9
            Lighting.Brightness = 0
            settings().Rendering.QualityLevel = "Level01"

            for _, obj in pairs(game.Workspace:GetDescendants()) do
                if obj:IsA("BasePart") then
                    obj.Material = "Plastic"
                    obj.Reflectance = 0
                elseif obj:IsA("Decal") or obj:IsA("Texture") then
                    obj.Transparency = 1
                elseif obj:IsA("ParticleEmitter") then
                    if obj.Parent.Name ~= "RelicFire" then
                        obj.Lifetime = NumberRange.new(0)
                    end
                elseif obj:IsA("Trail") or obj:IsA("Explosion") or obj:IsA("Fire") or obj:IsA("SpotLight") or obj:IsA("Smoke") or obj:IsA("Sparkles") then
                    obj.Enabled = false
                elseif obj:IsA("MeshPart") then
                    obj.Material = "Plastic"
                    obj.Reflectance = 0
                    obj.TextureID = 10385902758728956
                end
            end

            for _, effect in pairs(game.Lighting:GetDescendants()) do
                if effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect") or effect:IsA("DepthOfFieldEffect") then
                    effect.Enabled = false
                end
            end

            wait(1)
            local Map = game.Workspace:WaitForChild("Map")
            local Unloaded = game.ReplicatedStorage:WaitForChild("Unloaded")
            local Material = Enum.Material.SmoothPlastic
            local desc1 = Map:GetDescendants()
            wait(0.5)
            local desc2 = Unloaded:GetDescendants()
            wait(0.5)
            local start = os.clock()
            local last = start
            for _, part in ipairs(desc1) do
                if part:IsA("BasePart") then
                    part.Material = Material
                elseif part:IsA("Texture") and not part:GetAttribute("Offset") then
                    part:Destroy()
                end
                if os.clock() - last > 0.0083 then task.wait(2) last = os.clock() end
            end
            for _, part in ipairs(desc2) do
                if part:IsA("BasePart") then
                    part.Material = Material
                elseif part:IsA("Texture") and not part:GetAttribute("Offset") then
                    part:Destroy()
                end
                if os.clock() - last > 0.0083 then task.wait(2) last = os.clock() end
            end
            game.Players.LocalPlayer.PlayerScripts.OptimizerClientActor:SendMessage("Optimize", true)
            print("Boost Fps applied")
        end
        SaveSettings("Boost Fps", v)
    end
})

spawn(function()
    while true do
        wait()
        if Settings["Boost Fps"] and game.Workspace:FindFirstChild("_WorldOrigin") then break end
    end
    local function optimizePart(part)
        if part:IsA("BasePart") then
            part.Transparency = 1
            part.Material = "Plastic"
            part.Reflectance = 0
        elseif part:IsA("Decal") or part:IsA("Texture") then
            part.Transparency = 1
        elseif part:IsA("ParticleEmitter") then
            if part.Parent.Name ~= "RelicFire" then
                part.Enabled = false
                part.Lifetime = NumberRange.new(0)
            end
        elseif part:IsA("Trail") or part:IsA("Explosion") or part:IsA("Fire") or part:IsA("SpotLight") or part:IsA("Smoke") or part:IsA("Sparkles") then
            part.Enabled = false
        elseif part:IsA("MeshPart") then
            part.Transparency = 1
            part.Material = "Plastic"
            part.Reflectance = 0
            part.TextureID = 10385902758728956
        end
    end
    workspace._WorldOrigin.DescendantAdded:Connect(optimizePart)
end)

SettingSection.CreateButton({
    Title = "Copy Config",
    Callback = function()
        local config = game:GetService("HttpService"):JSONDecode(readfile(FolderName .. "/" .. SaveFileName))
        local str = "getgenv().Config = " .. table.concat({}, "")
        setclipboard(str)
        BananaCatHub.CreateNoti({Title = "Banana Cat Hub", Desc = "Successfully Copy Config", ShowTime = 5})
    end
})

SettingSection.CreateBind({
    Title = "Toggle GUI",
    Key = Enum.KeyCode.LeftControl,
    Callback = function()
        getgenv().UIToggled = not getgenv().UIToggled
        for _, gui in ipairs(game.CoreGui:GetChildren()) do
            if gui.Name == "Nousigi Hub GUI" then
                gui.Enabled = getgenv().UIToggled
            end
        end
    end
})

spawn(function()
    pcall(function()
        if not Settings["Auto Load Script"] then
            while true do
                wait()
                if Settings["Auto Load Script"] then break end
            end
        end
        local teleportFunc = syn and syn.queue_on_teleport or queue_on_teleport
        teleportFunc(string.format([[
            repeat wait() until game:IsLoaded()
            getgenv().Key = "%s"
            getgenv().NewUI = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()
        ]], getgenv().Key or ""))
    end)
end)
