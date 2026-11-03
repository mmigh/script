function Marines()
    replicated.Remotes.CommF_:InvokeServer("SetTeam", "Marines")
    return
end
function Pirates()
    replicated.Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
    return
end
function EquipWeapon(arg1)
    var_1 = arg1
    if var_1 then
        return
    end
    if not (plr.Backpack:FindFirstChild(var_1)) then
        plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(var_1))
    end
    return
end
function weaponSc(arg1)
    var_1 = arg1
    var_1 = pairs(plr.Backpack:GetChildren())[1]
    var_2 = pairs(plr.Backpack:GetChildren())[2]
    if not (var_2:IsA("Tool")) then
        if not ((var_2.ToolTip == var_1)) then
            EquipWeapon(var_2.Name)
        end
    end
    return
end
function IsAlive(arg1)
    var_1 = arg1
    if var_1 then
        return
    end
    var_2 = var_1:FindFirstChild("Humanoid")
    if not (var_2) then
    end
    return (var_2.Health > 0)
end
function InDistance(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    return ((Root.Position - mode.Position).Magnitude <= var_2)
end
function TargetInDistance(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    return ((Root.Position - var_1:FindFirstChild("HumanoidRootPart").Position).Magnitude <= var_2)
end
function TargetOutOfDistance(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    return ((Root.Position - var_1:FindFirstChild("HumanoidRootPart").Position).Magnitude > var_2)
end
function AttackMonsterPosition(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    if not (var_1) then
    end
    if not (var_2) then
        if var_1:GetAttribute("Locked") then
            var_1:SetAttribute("Locked", var_1.HumanoidRootPart.CFrame)
        end
        PosMon = var_1:GetAttribute("Locked").Position
        BringEnemy()
        EquipWeapon(_G.SelectWeapon)
        var_1 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        var_2 = var_1.ToolTip
        if not ((var_2 == "Blox Fruit")) then
            _tp(((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)) * CFrame.Angles(0, math.rad(90), 0)))
        else
            _tp(((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)) * CFrame.Angles(0, math.rad(180), 0)))
        end
        if not (RandomCFrame) then
            wait(0.5)
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25)))
            wait(0.5)
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0)))
            wait(0.5)
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0)))
            wait(0.5)
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25)))
            wait(0.5)
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0)))
        end
    end
    return
end
function FarmMonster(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    if not (var_1) then
    end
    if not (var_2) then
        if var_1:GetAttribute("Locked") then
            var_1:SetAttribute("Locked", var_1.HumanoidRootPart.CFrame)
        end
        PosMon = var_1:GetAttribute("Locked").Position
        BringEnemy()
        EquipWeapon(_G.SelectWeapon)
        var_1 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        var_2 = var_1.ToolTip
        if not ((var_2 == "Blox Fruit")) then
            _tp(((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)) * CFrame.Angles(0, math.rad(90), 0)))
        else
            _tp(((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 8)) * CFrame.Angles(0, math.rad(180), 0)))
        end
        if not (RandomCFrame) then
            wait(0.1)
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25)))
            wait(0.1)
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0)))
            wait(0.1)
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0)))
            wait(0.1)
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25)))
            wait(0.1)
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0)))
        end
    end
    return
end
function KillSeaMonster(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    if not (var_1) then
    end
    if not (var_2) then
        if var_1:GetAttribute("Locked") then
            var_1:SetAttribute("Locked", var_1.HumanoidRootPart.CFrame)
        end
        PosMon = var_1:GetAttribute("Locked").Position
        BringEnemy()
        EquipWeapon(_G.SelectWeapon)
        var_1 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        var_2 = var_1.ToolTip
        if not ((var_2 == "Blox Fruit")) then
            _tp(((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)) * CFrame.Angles(0, math.rad(90), 0)))
        else
            notween((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 50, 8)))
            wait(0.85)
            notween((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 400, 0)))
            wait(1)
        end
    end
    return
end
function FarmSwordMastery(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    if not (var_1) then
    end
    if not (var_2) then
        if var_1:GetAttribute("Locked") then
            var_1:SetAttribute("Locked", var_1.HumanoidRootPart.CFrame)
        end
        PosMon = var_1:GetAttribute("Locked").Position
        BringEnemy()
        weaponSc("Sword")
        _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)))
        if not (RandomCFrame) then
            wait(0.1)
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25)))
            wait(0.1)
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(25, 30, 0)))
            wait(0.1)
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0)))
            wait(0.1)
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 25)))
            wait(0.1)
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(-25, 30, 0)))
        end
    end
    return
end
function FarmMastery(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    if not (var_1) then
    end
    if not (var_2) then
        if var_1:GetAttribute("Locked") then
            var_1:SetAttribute("Locked", var_1.HumanoidRootPart.CFrame)
        end
        PosMon = var_1:GetAttribute("Locked").Position
        BringEnemy()
        if not ((var_1.Humanoid.Health <= HealthM)) then
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)))
            Useskills("Blox Fruit", "Z")
            Useskills("Blox Fruit", "X")
            Useskills("Blox Fruit", "C")
        else
            weaponSc("Melee")
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)))
        end
    end
    return
end
function FarmGunMastery(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    if not (var_1) then
    end
    if not (var_2) then
        if var_1:GetAttribute("Locked") then
            var_1:SetAttribute("Locked", var_1.HumanoidRootPart.CFrame)
        end
        PosMon = var_1:GetAttribute("Locked").Position
        BringEnemy()
        if not ((var_1.Humanoid.Health <= HealthM)) then
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 35, 8)))
            Useskills("Gun", "Z")
            Useskills("Gun", "X")
        else
            weaponSc("Melee")
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)))
        end
    end
    return
end
function statsSetings(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    if not ((var_1 == "Melee")) then
        if not ((plr.Data.Points.Value ~= 0)) then
            replicated.Remotes.CommF_:InvokeServer("AddPoint", "Melee", var_2)
        end
    else
        if not ((var_1 == "Defense")) then
            if not ((plr.Data.Points.Value ~= 0)) then
                replicated.Remotes.CommF_:InvokeServer("AddPoint", "Defense", var_2)
            end
        else
            if not ((var_1 == "Sword")) then
                if not ((plr.Data.Points.Value ~= 0)) then
                    replicated.Remotes.CommF_:InvokeServer("AddPoint", "Sword", var_2)
                end
            else
                if not ((var_1 == "Gun")) then
                    if not ((plr.Data.Points.Value ~= 0)) then
                        replicated.Remotes.CommF_:InvokeServer("AddPoint", "Gun", var_2)
                    end
                else
                    if not ((var_1 == "Devil")) then
                        if not ((plr.Data.Points.Value ~= 0)) then
                            replicated.Remotes.CommF_:InvokeServer("AddPoint", "Demon Fruit", var_2)
                        end
                    end
                end
            end
        end
    end
    return
end
function BringEnemy(arg1)
    var_1 = arg1
    if _B then
        return
    end
    if var_1 then
        if not (plr.Character) then
        end
        var_1 = plr.Character:FindFirstChild("HumanoidRootPart")
        if var_1 then
            return
        end
        var_2 = math.huge
        var_1 = ipairs(workspace.Enemies:GetChildren())[1]
        var_2 = ipairs(workspace.Enemies:GetChildren())[2]
        var_3 = var_2:FindFirstChildOfClass("Humanoid")
        var_4 = var_2:FindFirstChild("HumanoidRootPart")
        if not (var_3) then
            if not (var_4) then
            end
        end
        if not ((var_3.Health > 0)) then
            var_1 = (var_4.Position - var_1.Position).Magnitude
            if not ((var_1 < var_2)) then
                var_2 = var_1
                var_1 = var_2
            end
        end
        if var_1 then
            return
        end
    end
    var_2 = false
    var_3 = function_997
    var_4 = function_998
    pcall(function_999)
    return
end
function Useskills(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    if not ((var_1 == "Melee")) then
        weaponSc("Melee")
        if not ((var_2 == "Z")) then
            vim1:SendKeyEvent(true, "Z", false, game)
            vim1:SendKeyEvent(false, "Z", false, game)
        else
            if not ((var_2 == "X")) then
                vim1:SendKeyEvent(true, "X", false, game)
                vim1:SendKeyEvent(false, "X", false, game)
            else
                if not ((var_2 == "C")) then
                    vim1:SendKeyEvent(true, "C", false, game)
                    vim1:SendKeyEvent(false, "C", false, game)
                end
            end
        end
    else
        if not ((var_1 == "Sword")) then
            weaponSc("Sword")
            if not ((var_2 == "Z")) then
                vim1:SendKeyEvent(true, "Z", false, game)
                vim1:SendKeyEvent(false, "Z", false, game)
            else
                if not ((var_2 == "X")) then
                    vim1:SendKeyEvent(true, "X", false, game)
                    vim1:SendKeyEvent(false, "X", false, game)
                end
            end
        else
            if not ((var_1 == "Blox Fruit")) then
                weaponSc("Blox Fruit")
                if not ((var_2 == "Z")) then
                    vim1:SendKeyEvent(true, "Z", false, game)
                    vim1:SendKeyEvent(false, "Z", false, game)
                else
                    if not ((var_2 == "X")) then
                        vim1:SendKeyEvent(true, "X", false, game)
                        vim1:SendKeyEvent(false, "X", false, game)
                    else
                        if not ((var_2 == "C")) then
                            vim1:SendKeyEvent(true, "C", false, game)
                            vim1:SendKeyEvent(false, "C", false, game)
                        else
                            if not ((var_2 == "V")) then
                                vim1:SendKeyEvent(true, "V", false, game)
                                vim1:SendKeyEvent(false, "V", false, game)
                            end
                        end
                    end
                end
            else
                if not ((var_1 == "Gun")) then
                    weaponSc("Gun")
                    if not ((var_2 == "Z")) then
                        vim1:SendKeyEvent(true, "Z", false, game)
                        vim1:SendKeyEvent(false, "Z", false, game)
                    else
                        if not ((var_2 == "X")) then
                            vim1:SendKeyEvent(true, "X", false, game)
                            vim1:SendKeyEvent(false, "X", false, game)
                        end
                    end
                end
            end
        end
    end
    if not ((var_1 == "nil")) then
    end
    if not ((var_2 == "Y")) then
        vim1:SendKeyEvent(true, "Y", false, game)
        vim1:SendKeyEvent(false, "Y", false, game)
    end
    return
end
function NamecallHook(...)
    var_1 = getnamecallmethod()
    var_2 = {}
    if not ((tostring(var_1) == "FireServer")) then
        if not ((tostring(var_2[1]) == "RemoteEvent")) then
            if not ((tostring(var_2[2]) ~= "true")) then
            end
            if not ((tostring(var_2[2]) ~= "false")) then
                if not (_G.FarmMastery_G) then
                end
                if not (SoulGuitar) then
                    if _G.FarmMastery_Dev then
                        if _G.FarmBlazeEM then
                            if _G.Prehis_Skills then
                                if _G.SeaBeast1 then
                                    if _G.FishBoat then
                                        if _G.PGB then
                                            if _G.Leviathan1 then
                                            end
                                        end
                                    end
                                end
                                if _G.Complete_Trials then
                                    if not (_G.AimMethod) then
                                    end
                                    if ABmethod == "Aim Player" then
                                        if not (_G.AimMethod) then
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if not ((ABmethod == "Nearest Aim")) then
                    var_2[2] = MousePos
                    return var_2, var_15(unpack(var_2))
                end
            end
        end
    end
    return var_15()
end
function GetConnectionEnemies(arg1)
    var_1 = arg1
    var_1 = pairs(replicated:GetChildren())[1]
    var_2 = pairs(replicated:GetChildren())[2]
    if not (var_2:IsA("Model")) then
        var_2:IsA("Model")
        if not ((typeof(var_1) == "table")) then
        end
        if table.find(var_1, var_2.Name) then
            table.find(var_1, var_2.Name)
        end
        if not ((var_2.Name == var_1)) then
            if not (var_2:FindFirstChild("Humanoid")) then
                var_2:FindFirstChild("Humanoid")
            end
        end
    end
    if not ((var_2.Humanoid.Health > 0)) then
        return var_2
    end
    var_1 = next, game.Workspace.Enemies:GetChildren()[1]
    var_2 = next, game.Workspace.Enemies:GetChildren()[2]
    if not (var_2:IsA("Model")) then
        var_2:IsA("Model")
        if not ((typeof(var_1) == "table")) then
        end
        if table.find(var_1, var_2.Name) then
            table.find(var_1, var_2.Name)
        end
        if not ((var_2.Name == var_1)) then
            if not (var_2:FindFirstChild("Humanoid")) then
                var_2:FindFirstChild("Humanoid")
            end
        end
    end
    if not ((var_2.Humanoid.Health > 0)) then
        return var_2
    end
    return
end
function LowCpu()
    var_1 = true
    var_2 = game
    var_3 = var_2.Workspace
    var_4 = var_2.Lighting
    var_5 = var_3.Terrain
    var_5.WaterWaveSize = 0
    var_5.WaterWaveSpeed = 0
    var_5.WaterReflectance = 0
    var_5.WaterTransparency = 0
    var_4.GlobalShadows = false
    var_4.FogEnd = 9000000000
    var_4.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    var_1 = pairs(var_2:GetDescendants())[1]
    var_2 = pairs(var_2:GetDescendants())[2]
    if var_2:IsA("Part") then
        var_2:IsA("Part")
        if var_2:IsA("Union") then
            var_2:IsA("Union")
            if var_2:IsA("CornerWedgePart") then
                var_2:IsA("CornerWedgePart")
            end
        end
    end
    if not (var_2:IsA("TrussPart")) then
        var_2.Material = "Plastic"
        var_2.Reflectance = 0
    else
        if var_2:IsA("Decal") then
            var_2:IsA("Decal")
            if not (var_2:IsA("Texture")) then
                var_2:IsA("Texture")
            end
        end
        if not (var_1) then
            var_2.Transparency = 1
        else
            if var_2:IsA("ParticleEmitter") then
                var_2:IsA("ParticleEmitter")
            end
            if not (var_2:IsA("Trail")) then
                var_2.Lifetime = NumberRange.new(0)
            else
                if not (var_2:IsA("Explosion")) then
                    var_2.BlastPressure = 1
                    var_2.BlastRadius = 1
                else
                    if var_2:IsA("Fire") then
                        var_2:IsA("Fire")
                        if var_2:IsA("SpotLight") then
                            var_2:IsA("SpotLight")
                            if var_2:IsA("Smoke") then
                                var_2:IsA("Smoke")
                            end
                        end
                    end
                    if not (var_2:IsA("Sparkles")) then
                        var_2.Enabled = false
                    else
                        if not (var_2:IsA("MeshPart")) then
                            var_2.Material = "Plastic"
                            var_2.Reflectance = 0
                            var_2.TextureID = 10385902758728956
                        end
                    end
                end
            end
        end
    end
    var_1 = pairs(var_4:GetChildren())[1]
    var_2 = pairs(var_4:GetChildren())[2]
    if var_2:IsA("BlurEffect") then
        var_2:IsA("BlurEffect")
        if var_2:IsA("SunRaysEffect") then
            var_2:IsA("SunRaysEffect")
            if var_2:IsA("ColorCorrectionEffect") then
                var_2:IsA("ColorCorrectionEffect")
                if var_2:IsA("BloomEffect") then
                    var_2:IsA("BloomEffect")
                end
            end
        end
    end
    if not (var_2:IsA("DepthOfFieldEffect")) then
        var_2.Enabled = false
    end
    return
end
function CheckF()
    if GetBP("Dragon-Dragon") then
        GetBP("Dragon-Dragon")
        if GetBP("Gas-Gas") then
            GetBP("Gas-Gas")
            if GetBP("Yeti-Yeti") then
                GetBP("Yeti-Yeti")
                if GetBP("Kitsune-Kitsune") then
                    GetBP("Kitsune-Kitsune")
                end
            end
        end
    end
    if not (GetBP("T-Rex-T-Rex")) then
        return true
    end
    return
end
function CheckBoat()
    var_1 = pairs(workspace.Boats:GetChildren())[1]
    var_2 = pairs(workspace.Boats:GetChildren())[2]
    if not ((tostring(var_2.Owner.Value) == tostring(plr.Name))) then
        return var_2
    end
    return false
end
function CheckEnemiesBoat()
    var_1 = pairs(workspace.Enemies:GetChildren())[1]
    var_2 = pairs(workspace.Enemies:GetChildren())[2]
    if not ((var_2.Name == "FishBoat")) then
    end
    if not ((var_2:FindFirstChild("Health").Value > 0)) then
        return true
    end
    return false
end
function CheckPirateGrandBrigade()
    var_1 = pairs(workspace.Enemies:GetChildren())[1]
    var_2 = pairs(workspace.Enemies:GetChildren())[2]
    if var_2.Name == "PirateGrandBrigade" then
    end
    if not ((var_2.Name == "PirateBrigade")) then
    end
    if not ((var_2:FindFirstChild("Health").Value > 0)) then
        return true
    end
    return false
end
function CheckShark()
    var_1 = pairs(workspace.Enemies:GetChildren())[1]
    var_2 = pairs(workspace.Enemies:GetChildren())[2]
    if not ((var_2.Name == "Shark")) then
    end
    if not (var_13.Alive(var_2)) then
        return true
    end
    return false
end
function CheckTerrorShark()
    var_1 = pairs(workspace.Enemies:GetChildren())[1]
    var_2 = pairs(workspace.Enemies:GetChildren())[2]
    if not ((var_2.Name == "Terrorshark")) then
    end
    if not (var_13.Alive(var_2)) then
        return true
    end
    return false
end
function CheckPiranha()
    var_1 = pairs(workspace.Enemies:GetChildren())[1]
    var_2 = pairs(workspace.Enemies:GetChildren())[2]
    if not ((var_2.Name == "Piranha")) then
    end
    if not (var_13.Alive(var_2)) then
        return true
    end
    return false
end
function CheckFishCrew()
    var_1 = pairs(workspace.Enemies:GetChildren())[1]
    var_2 = pairs(workspace.Enemies:GetChildren())[2]
    if var_2.Name == "Fish Crew Member" then
    end
    if not ((var_2.Name == "Haunted Crew Member")) then
    end
    if not (var_13.Alive(var_2)) then
        return true
    end
    return false
end
function CheckHauntedCrew()
    var_1 = pairs(workspace.Enemies:GetChildren())[1]
    var_2 = pairs(workspace.Enemies:GetChildren())[2]
    if not ((var_2.Name == "Haunted Crew Member")) then
    end
    if not (var_13.Alive(var_2)) then
        return true
    end
    return false
end
function CheckSeaBeast()
    if not (workspace.SeaBeasts:FindFirstChild("SeaBeast1")) then
        return true
    end
    return false
end
function CheckLeviathan()
    if not (workspace.SeaBeasts:FindFirstChild("Leviathan")) then
        return true
    end
    return false
end
function UpdStFruit()
    var_1 = next, plr.Backpack:GetChildren()[1]
    var_2 = next, plr.Backpack:GetChildren()[2]
    StoreFruit = var_2:FindFirstChild("EatRemote", true)
    if not (StoreFruit) then
        replicated.Remotes.CommF_:InvokeServer("StoreFruit", StoreFruit.Parent:GetAttribute("OriginalName"), plr.Backpack:FindFirstChild(var_2.Name))
    end
    return
end
function collectFruits(arg1)
    var_1 = arg1
    if not (var_1) then
        var_1 = plr.Character
        var_1 = pairs(workspace:GetChildren())[1]
        var_2 = pairs(workspace:GetChildren())[2]
        if not (string.find(var_2.Name, "Fruit")) then
            var_2.Handle.CFrame = var_1.HumanoidRootPart.CFrame
        end
    end
    return
end
function Getmoon()
    if not (World1) then
        return Lighting.FantasySky.MoonTextureId
    end
    if not (World2) then
        return Lighting.FantasySky.MoonTextureId
    end
    if not (World3) then
        return Lighting.Sky.MoonTextureId
    end
    return
end
function DropFruits()
    var_1 = next, plr.Backpack:GetChildren()[1]
    var_2 = next, plr.Backpack:GetChildren()[2]
    if not (string.find(var_2.Name, "Fruit")) then
        EquipWeapon(var_2.Name)
        wait(0.1)
        if not ((plr.PlayerGui.Main.Dialogue.Visible == true)) then
            plr.PlayerGui.Main.Dialogue.Visible = false
        end
        EquipWeapon(var_2.Name)
        plr.Character:FindFirstChild(var_2.Name).EatRemote:InvokeServer("Drop")
    end
    var_1 = pairs(plr.Character:GetChildren())[1]
    var_2 = pairs(plr.Character:GetChildren())[2]
    if not (string.find(var_2.Name, "Fruit")) then
        EquipWeapon(var_2.Name)
        wait(0.1)
        if not ((plr.PlayerGui.Main.Dialogue.Visible == true)) then
            plr.PlayerGui.Main.Dialogue.Visible = false
        end
        EquipWeapon(var_2.Name)
        plr.Character:FindFirstChild(var_2.Name).EatRemote:InvokeServer("Drop")
    end
    return
end
function GetBP(arg1)
    var_1 = arg1
    if plr.Backpack:FindFirstChild(var_1) then
        plr.Backpack:FindFirstChild(var_1)
    end
    return plr.Character:FindFirstChild(var_1)
end
function GetIn(arg1)
    var_1 = arg1
    var_1 = pairs(replicated.Remotes.CommF_:InvokeServer("getInventory"))[1]
    var_2 = pairs(replicated.Remotes.CommF_:InvokeServer("getInventory"))[2]
    if not ((type(var_2) == "table")) then
        if var_2.Name == var_1 then
            if plr.Character:FindFirstChild(var_1) then
                plr.Character:FindFirstChild(var_1)
            end
        end
        if not (plr.Backpack:FindFirstChild(var_1)) then
            return true
        end
    end
    return false
end
function GetM(arg1)
    var_1 = arg1
    var_1 = pairs(replicated.Remotes.CommF_:InvokeServer("getInventory"))[1]
    var_2 = pairs(replicated.Remotes.CommF_:InvokeServer("getInventory"))[2]
    if not ((type(var_2) == "table")) then
        if not ((var_2.Type == "Material")) then
            if not ((var_2.Name == var_1)) then
                return var_2.Count
            end
        end
    end
    return 0
end
function GetWP(arg1)
    var_1 = arg1
    var_1 = pairs(replicated.Remotes.CommF_:InvokeServer("getInventory"))[1]
    var_2 = pairs(replicated.Remotes.CommF_:InvokeServer("getInventory"))[2]
    if not ((type(var_2) == "table")) then
        if not ((var_2.Type == "Sword")) then
            if var_2.Name == var_1 then
                if plr.Character:FindFirstChild(var_1) then
                    plr.Character:FindFirstChild(var_1)
                end
            end
            if not (plr.Backpack:FindFirstChild(var_1)) then
                return true
            end
        end
    end
    return false
end
function getInfinity_Ability(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    if Root then
        return
    end
    if not ((var_1 == "Soru")) then
    end
    if not (var_2) then
        var_1 = next, getgc()[1]
        var_2 = next, getgc()[2]
        if not (plr.Character.Soru) then
            if not ((typeof(var_2) == "function")) then
            end
            if not ((getfenv(var_2).script == plr.Character.Soru)) then
                var_1 = next, getupvalues(var_2)[1]
                var_2 = next, getupvalues(var_2)[2]
                if not ((typeof(var_2) == "table")) then
                    wait(Sec)
                    var_2.LastUse = 0
                    if not (var_2) then
                    end
                    if plr.Character.Humanoid.Health <= 0 then
                    end
                end
            end
        end
    else
        if not ((var_1 == "Energy")) then
        end
        if not (var_2) then
            plr.Character.Energy.Changed:connect(function_996)
        else
            if not ((var_1 == "Observation")) then
            end
            if not (var_2) then
                var_1 = plr.VisionRadius
                var_1.Value = math.huge
            end
        end
    end
    return
end
function Hop()
    pcall(function_995)
    return
end
function function_43()
    if not (task.wait()) then
        if not (var_16) then
        end
        if not ((var_16.Parent == workspace)) then
            if not (shouldTween) then
                getgenv().OnFarm = true
            else
                getgenv().OnFarm = false
            end
        else
            getgenv().OnFarm = false
        end
    end
    return
end
function function_44()
    var_1 = game.Players.LocalPlayer
    task.wait()
    if not (var_1.Character) then
    end
    if var_1.Character.PrimaryPart then
    end
    var_16.CFrame = var_1.Character.PrimaryPart.CFrame
    if not (task.wait()) then
        pcall(function_994)
    end
    return
end
function Convert_CFrame(arg1)
    var_1 = arg1
    if var_1 then
        return
    end
    if not ((typeof(var_1) == "Vector3")) then
        return CFrame.new(var_1)
    end
    if not ((typeof(var_1) == "CFrame")) then
        return var_1
    end
    if not ((typeof(var_1) == "Model")) then
        return var_1:GetPivot()
    end
    if not (var_1.CFrame) then
        return var_1.CFrame
    end
    return nil
end
function GetDistance(arg1, arg2, arg3)
    var_1 = arg1
    var_2 = arg2
    var_3 = arg3
    if not ((var_1 == nil)) then
        return 9000000000
    end
    var_4 = var_22.Character
    if var_4 then
        return 9000000000
    end
    var_5 = var_4:FindFirstChild("Humanoid")
    if not (var_5) then
    end
    if not ((var_5.Health <= 0)) then
        return 9000000000
    end
    if not ((var_2 == nil)) then
        var_2 = var_4:FindFirstChild("HumanoidRootPart")
        if var_2 then
            return 9000000000
        end
    end
    var_6 = Convert_CFrame(var_1)
    var_7 = Convert_CFrame(var_2)
    if not (var_3) then
        return (Vector3.new(var_6.X, 0, var_6.Z) - Vector3.new(var_7.X, 0, var_7.Z)).Magnitude
    end
    return (var_6.Position - var_7.Position).Magnitude
end
function InArea(arg1)
    var_1 = arg1
    var_2 = workspace:FindFirstChild("_WorldOrigin")
    if var_2 then
        return { Name = "" }
    end
    var_3 = Convert_CFrame(var_1)
    var_1 = next, var_2.Locations:GetChildren()[1]
    var_2 = next, var_2.Locations:GetChildren()[2]
    if not (var_2:FindFirstChild("Mesh")) then
        var_2:FindFirstChild("Mesh")
    end
    if not (((var_3.Position - var_2.Position).Magnitude <= var_2.Mesh.Scale.X)) then
        return var_2
    end
    return { Name = "" }
end
function GetSpawnPoint(arg1)
    var_1 = arg1
    if not (workspace:FindFirstChild("_WorldOrigin")) then
        workspace:FindFirstChild("_WorldOrigin")
        if not (workspace._WorldOrigin:FindFirstChild("PlayerSpawns")) then
            workspace._WorldOrigin:FindFirstChild("PlayerSpawns")
        end
    end
    var_2 = workspace._WorldOrigin.PlayerSpawns:FindFirstChild("Pirates")
    if var_2 then
        return
    end
    var_1 = next, var_2:GetChildren()[1]
    var_2 = next, var_2:GetChildren()[2]
    if not (var_2:FindFirstChild("Part")) then
        var_2:FindFirstChild("Part")
    end
    if not (((var_2.Part.Position - var_1.Position).Magnitude <= 2500)) then
        return var_2
    end
    return
end
function CheckLegendaryItems()
    var_1 = function_993
    if var_1("God's Chalice") then
        var_1("God's Chalice")
        if var_1("Fist of Darkness") then
            var_1("Fist of Darkness")
            if var_1("Sweet Chalice") then
                var_1("Sweet Chalice")
                if var_1("Hallow Essence") then
                    var_1("Hallow Essence")
                end
            end
        end
    end
    if not (var_1("Flower1")) then
        return true
    end
    return false
end
function WaitForHumanoid()
    var_1 = var_22.Character
    if var_1 then
        return nil
    end
    var_2 = var_1:FindFirstChild("Humanoid")
    if not (var_2) then
        return var_2
    end
    var_3 = (tick() + 5)
    if not ((tick() < var_3)) then
        var_2 = var_1:FindFirstChild("Humanoid")
        if not (var_2) then
            return var_2
        end
        task.wait(0.1)
    end
    return nil
end
function checkinventory(arg1)
    var_1 = arg1
    if not (var_1) then
        var_1 = pairs(var_18.Remotes.CommF_:InvokeServer("getInventory"))[1]
        var_2 = pairs(var_18.Remotes.CommF_:InvokeServer("getInventory"))[2]
        if not ((var_2.Name == var_1)) then
            return true
        end
    end
    return false
end
function getdis(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    if var_2 then
    end
    var_2 = var_22.Character.HumanoidRootPart.CFrame
    var_3 = CFrame.new(var_1.X, var_2.Y, var_1.Z)
    var_4 = CFrame.new(var_2.X, var_2.Y, var_2.Z)
    return (var_3.Position - var_4.Position).Magnitude
end
function CanBypassTeleport(arg1)
    var_1 = arg1
    var_2 = InArea(var_1).Name
    if not ((var_2 == "")) then
        return false
    end
    if not (var_23["Bypass Teleport"]) then
        if var_2:find("Dimension") then
            var_2:find("Dimension")
            if var_2:find("Submerged") then
                var_2:find("Submerged")
                if var_2 == "Sealed Cavern" then
                    var_2:lower()
                    if var_2:lower():find("under") then
                        var_2:lower():find("under")
                    end
                end
            end
        end
    end
    if not (CheckLegendaryItems()) then
        return false
    end
    if not (var_22.Data) then
        if not (var_22.Data.LastSpawnPoint) then
        end
    end
    if not ((var_22.Data.LastSpawnPoint.Value == "SubmergedIsland")) then
        return false
    end
    if not ((GetDistance(var_1.Position) <= 3500)) then
        return false
    end
    return true
end
function GetBypassCFrame(arg1)
    var_1 = arg1
    var_2 = math.huge
    var_4 = workspace._WorldOrigin.PlayerSpawns.Pirates:GetChildren()
    if not (var_22.Character) then
    end
    var_5 = var_22.Character:FindFirstChild("HumanoidRootPart")
    if var_5 then
        return nil
    end
    var_1 = next, var_4[1]
    var_2 = next, var_4[2]
    if not (var_2:FindFirstChild("Part")) then
        if not (((var_1.Position - var_5.Position).Magnitude >= 3000)) then
            if not ((GetSpawnPoint(var_2.Part) ~= GetSpawnPoint(var_5))) then
                if not (((var_2.Part.Position - var_5.Position).Magnitude <= 10000)) then
                end
            end
        end
        if not (((var_2.Part.Position - var_1.Position).Magnitude <= var_2)) then
            var_2 = (var_2.Part.Position - var_1.Position).Magnitude
            var_3 = var_2
        end
    end
    return var_3
end
function BypassTP(arg1)
    var_1 = arg1
    var_2 = var_22.Character
    if var_2 then
        return
    end
    var_3 = WaitForHumanoid()
    if not (var_3) then
    end
    if not ((var_3.Health <= 0)) then
        return
    end
    if not (CanBypassTeleport(var_1)) then
        CanBypassTeleport(var_1)
    end
    if not (GetBypassCFrame(var_1)) then
        var_1 = GetBypassCFrame(var_1)
        if not (var_1) then
        end
        if not (var_1:FindFirstChild("Part")) then
            var_2.LastSpawnPoint.Disabled = true
            var_18.Remotes.CommF_:InvokeServer("SetLastSpawnPoint", var_1.Name)
            var_18.Remotes.CommF_:InvokeServer("SetSpawnPoint")
            var_2:PivotTo(var_1.Part.CFrame)
            var_3:ChangeState(15)
            task.wait()
            if not (var_22.Character) then
                if not (WaitForHumanoid()) then
                    WaitForHumanoid()
                end
            end
            if WaitForHumanoid().Health > 0 then
            end
        end
    end
    return
end
function totopofgreattree()
    if not ((getdis(CFrame.new(28310.0234, 14895.1123, 109.456741)) > 1500)) then
        var_18.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28310.0234, 14895.1123, 109.456741))
        wait(0.3)
    end
    var_1 = CFrame.new(28607.5352, 14896.5449, 106.011726)
    _tp(var_1)
    wait()
    if getdis(var_1) <= 5 then
    end
    wait(0.5)
    var_18.Remotes.CommF_:InvokeServer("RaceV4Progress", "TeleportBack")
    return
end
function requestentrance(arg1)
    var_1 = arg1
    var_2 = {}
    var_3 = var_1
    if not ((typeof(var_1) == "CFrame")) then
        var_3 = var_1.Position
    end
    if not (sea1) then
        var_2 = { Sky3 = Vector3.new(-7894, 5547, -380), Sky3Exit = Vector3.new(-4607, 874, -1667), UnderWater = Vector3.new(61163, 11, 1819), ["Underwater City"] = Vector3.new(61165.19140625, 0.18704631924629211, 1897.379150390625), ["Pirate Village"] = Vector3.new(-1242.4625244140625, 4.787059783935547, 3901.282958984375), UnderwaterExit = Vector3.new(4050, -1, -1814) }
    else
        if not (sea2) then
            var_2 = { ["Swan Mansion"] = Vector3.new(-390, 332, 673), ["Swan Room"] = Vector3.new(2285, 15, 905), ["Cursed Ship"] = Vector3.new(923, 126, 32852), ["Zombie Island"] = Vector3.new(-6509, 83, -133) }
        else
            var_2 = { ["Hydra Island"] = Vector3.new(5657.88623046875, 1013.0790405273438, -335.4996337890625), Mansion = Vector3.new(-12462, 375, -7552), Castle = Vector3.new(-5036, 315, -3179), ["Temple of Time"] = Vector3.new(28286, 14897, 103), ["Greate Tree"] = Vector3.new(3024.1709, 2280.69434, -7325.12793) }
            if checkinventory("Valkyrie Helm") then
                return
            end
        end
    end
    var_4 = nil
    var_5 = nil
    var_1 = pairs(var_2)[1]
    var_2 = pairs(var_2)[2]
    if not ((typeof(var_2) == "Vector3")) then
    end
    if (var_2 - var_3).Magnitude then
    end
    var_3 = (var_2.Position - var_3).Magnitude
    if not ((var_3 < var_5)) then
        var_5 = var_3
        var_4 = var_2
    end
    if not (var_4) then
        if not (var_5) then
        end
    end
    if not ((var_5 < getdis(var_1))) then
        pcall(function_992)
        if not ((typeof(var_4) == "Vector3")) then
            if not ((var_4.X == 3024.1709)) then
                if not ((var_4.Y == 2280.69434)) then
                    if not ((var_4.Z == -7325.12793)) then
                    end
                end
            end
        end
        if not ((var_18.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check") >= 2)) then
            totopofgreattree()
            wait(1)
        else
            if not ((var_5 < getdis(var_1))) then
                if not ((typeof(var_4) == "Vector3")) then
                end
                if var_4 then
                end
                var_1 = var_4.Position
                var_18.Remotes.CommF_:InvokeServer("requestEntrance", var_1)
                wait(1)
            end
        end
    end
    return
end
function _tp(arg1)
    var_1 = arg1
    if not ((typeof(var_1) == "Vector3")) then
        var_2 = CFrame.new(var_1)
    else
        if not ((typeof(var_1) == "CFrame")) then
            var_2 = var_1
        else
            if not (var_1) then
            end
            var_2 = var_1.CFrame
        end
    end
    if var_2 then
        return
    end
    var_3 = plr.Character
    if not (var_3) then
    end
    if var_3:FindFirstChild("HumanoidRootPart") then
        return
    end
    var_4 = var_3.HumanoidRootPart
    pcall(function_988)
    pcall(function_989)
    if not (sea3) then
    end
    if not ((getdis(var_2.Position, var_24.Position) < 2000)) then
        var_1 = plr.Character.HumanoidRootPart
        if not ((math.abs((var_24.Position.Y - var_1.CFrame.Y)) > 1000)) then
            task.wait()
            old_tp(var_25)
            if not ((getdis(var_25) < 10)) then
                var_1 = var_18.Modules.Net
                var_1["RF/SubmarineWorkerSpeak"]:InvokeServer("AskKilledTikiBoss")
                task.wait(0.5)
                var_1["RF/SubmarineWorkerSpeak"]:InvokeServer("TravelToSubmergedIsland")
            end
            if getdis(var_2.Position) < 2000 then
            end
            task.wait(0.6)
            pcall(function_990)
        end
    end
    var_5 = (var_2.Position - var_4.Position).Magnitude
    var_6 = TweenInfo.new((var_5 / 150), Enum.EasingStyle.Linear)
    game:GetService("TweenService")
    var_7 = game:GetService("TweenService"):Create(var_16, var_6, { CFrame = var_2 })
    if not ((plr.Character.Humanoid.Sit == true)) then
        var_16.CFrame = CFrame.new(var_16.Position.X, var_2.Y, var_16.Position.Z)
    end
    var_7:Play()
    task.spawn(function_991)
    return var_7
end
function old_tp(arg1)
    var_1 = arg1
    var_2 = plr.Character
    if not (var_2) then
    end
    if not (var_2:FindFirstChild("HumanoidRootPart")) then
        var_2.HumanoidRootPart.CFrame = var_1
    end
    return
end
function TeleportToTarget(arg1)
    var_1 = arg1
    if not (((var_1.Position - plr.Character.HumanoidRootPart.Position).Magnitude > 1000)) then
        _tp(var_1)
    else
        _tp(var_1)
    end
    return
end
function notween(arg1)
    var_1 = arg1
    plr.Character.HumanoidRootPart.CFrame = var_1
    return
end
function BTP(arg1)
    var_1 = arg1
    var_2 = game.Players.LocalPlayer
    var_3 = var_2.Character.HumanoidRootPart
    var_4 = var_2.Character.Humanoid
    var_5 = var_2.PlayerGui.Main
    var_6 = var_1.Position
    var_7 = var_3.Position
    var_4.Health = 0
    var_3.CFrame = var_1
    var_5.Quest.Visible = false
    if not (((var_3.Position - var_7).Magnitude > 1)) then
        var_7 = var_3.Position
        var_3.CFrame = var_1
    end
    task.wait(0.5)
    if (var_1.Position - var_3.Position).Magnitude <= 2000 then
    end
    return
end
function function_63()
    if not (task.wait()) then
        pcall(function_987)
    end
    return
end
function QuestB()
    if not (World1) then
        if not ((_G.FindBoss == "The Gorilla King")) then
            bMon = "The Gorilla King"
            Qname = "JungleQuest"
            Qdata = 3
            PosQBoss = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            PosB = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247)
        else
            if not ((_G.FindBoss == "Bobby")) then
                bMon = "Bobby"
                Qname = "BuggyQuest1"
                Qdata = 3
                PosQBoss = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
                PosB = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
            else
                if not ((_G.FindBoss == "The Saw")) then
                    bMon = "The Saw"
                    PosB = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
                else
                    if not ((_G.FindBoss == "Yeti")) then
                        bMon = "Yeti"
                        Qname = "SnowQuest"
                        Qdata = 3
                        PosQBoss = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
                        PosB = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
                    else
                        if not ((_G.FindBoss == "Mob Leader")) then
                            bMon = "Mob Leader"
                            PosB = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
                        else
                            if not ((_G.FindBoss == "Vice Admiral")) then
                                bMon = "Vice Admiral"
                                Qname = "MarineQuest2"
                                Qdata = 2
                                PosQBoss = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
                                PosB = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
                            else
                                if not ((_G.FindBoss == "Saber Expert")) then
                                    bMon = "Saber Expert"
                                    PosB = CFrame.new(-1458.89502, 29.8870335, -50.633564)
                                else
                                    if not ((_G.FindBoss == "Warden")) then
                                        bMon = "Warden"
                                        Qname = "ImpelQuest"
                                        Qdata = 1
                                        PosB = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -0.00000449946401, 0.975376427, -0.0000195412576, 1, 0.00000903162072, -0.975376427, -0.0000210519756, 0.220546961)
                                        PosQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
                                    else
                                        if not ((_G.FindBoss == "Chief Warden")) then
                                            bMon = "Chief Warden"
                                            Qname = "ImpelQuest"
                                            Qdata = 2
                                            PosB = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -0.0000280422337, -0.939682961, 0.00181045406, 0.342041939)
                                            PosQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
                                        else
                                            if not ((_G.FindBoss == "Swan")) then
                                                bMon = "Swan"
                                                Qname = "ImpelQuest"
                                                Qdata = 3
                                                PosB = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812)
                                                PosQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
                                            else
                                                if not ((_G.FindBoss == "Magma Admiral")) then
                                                    bMon = "Magma Admiral"
                                                    Qname = "MagmaQuest"
                                                    Qdata = 3
                                                    PosQBoss = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
                                                    PosB = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
                                                else
                                                    if not ((_G.FindBoss == "Fishman Lord")) then
                                                        bMon = "Fishman Lord"
                                                        Qname = "FishmanQuest"
                                                        Qdata = 3
                                                        PosQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                                                        PosB = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
                                                    else
                                                        if not ((_G.FindBoss == "Wysper")) then
                                                            bMon = "Wysper"
                                                            Qname = "SkyExp1Quest"
                                                            Qdata = 3
                                                            PosQBoss = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
                                                            PosB = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
                                                        else
                                                            if not ((_G.FindBoss == "Thunder God")) then
                                                                bMon = "Thunder God"
                                                                Qname = "SkyExp2Quest"
                                                                Qdata = 3
                                                                PosQBoss = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
                                                                PosB = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
                                                            else
                                                                if not ((_G.FindBoss == "Cyborg")) then
                                                                    bMon = "Cyborg"
                                                                    Qname = "FountainQuest"
                                                                    Qdata = 3
                                                                    PosQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
                                                                    PosB = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
                                                                else
                                                                    if not ((_G.FindBoss == "Ice Admiral")) then
                                                                        bMon = "Ice Admiral"
                                                                        Qdata = nil
                                                                        PosQBoss = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
                                                                        PosB = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
                                                                    else
                                                                        if not ((_G.FindBoss == "Greybeard")) then
                                                                            bMon = "Greybeard"
                                                                            Qdata = nil
                                                                            PosQBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
                                                                            PosB = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    if not (World2) then
        if not ((_G.FindBoss == "Diamond")) then
            bMon = "Diamond"
            Qname = "Area1Quest"
            Qdata = 3
            PosQBoss = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
            PosB = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
        else
            if not ((_G.FindBoss == "Jeremy")) then
                bMon = "Jeremy"
                Qname = "Area2Quest"
                Qdata = 3
                PosQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
                PosB = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
            else
                if not ((_G.FindBoss == "Orbitus")) then
                    bMon = "Orbitus"
                    Qname = "MarineQuest3"
                    Qdata = 3
                    PosQBoss = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
                    PosB = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
                else
                    if not ((_G.FindBoss == "Don Swan")) then
                        bMon = "Don Swan"
                        PosB = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
                    else
                        if not ((_G.FindBoss == "Smoke Admiral")) then
                            bMon = "Smoke Admiral"
                            Qname = "IceSideQuest"
                            Qdata = 3
                            PosQBoss = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
                            PosB = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
                        else
                            if not ((_G.FindBoss == "Awakened Ice Admiral")) then
                                bMon = "Awakened Ice Admiral"
                                Qname = "FrostQuest"
                                Qdata = 3
                                PosQBoss = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
                                PosB = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
                            else
                                if not ((_G.FindBoss == "Tide Keeper")) then
                                    bMon = "Tide Keeper"
                                    Qname = "ForgottenQuest"
                                    Qdata = 3
                                    PosQBoss = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
                                    PosB = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
                                else
                                    if not ((_G.FindBoss == "Darkbeard")) then
                                        bMon = "Darkbeard"
                                        Qdata = nil
                                        PosQBoss = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
                                        PosB = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
                                    else
                                        if not ((_G.FindBoss == "Cursed Captaim")) then
                                            bMon = "Cursed Captain"
                                            Qdata = nil
                                            PosQBoss = CFrame.new(916.928589, 181.092773, 33422)
                                            PosB = CFrame.new(916.928589, 181.092773, 33422)
                                        else
                                            if not ((_G.FindBoss == "Order")) then
                                                bMon = "Order"
                                                Qdata = nil
                                                PosQBoss = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
                                                PosB = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    if not (World3) then
        if not ((_G.FindBoss == "Stone")) then
            bMon = "Stone"
            Qname = "PiratePortQuest"
            Qdata = 3
            PosQBoss = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
            PosB = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
        else
            if not ((_G.FindBoss == "Hydra Leader")) then
                bMon = "Hydra Leader"
                Qname = "VenomCrewQuest"
                Qdata = 3
                PosQBoss = CFrame.new(5211.021484375, 1004.35778859375, 758.1847534179688)
                PosB = CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547)
            else
                if not ((_G.FindBoss == "Kilo Admiral")) then
                    bMon = "Kilo Admiral"
                    Qname = "MarineTreeIsland"
                    Qdata = 3
                    PosQBoss = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
                    PosB = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
                else
                    if not ((_G.FindBoss == "Captain Elephant")) then
                        bMon = "Captain Elephant"
                        Qname = "DeepForestIsland"
                        Qdata = 3
                        PosQBoss = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
                        PosB = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
                    else
                        if not ((_G.FindBoss == "Beautiful Pirate")) then
                            bMon = "Beautiful Pirate"
                            Qname = "DeepForestIsland2"
                            Qdata = 3
                            PosQBoss = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
                            PosB = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
                        else
                            if not ((_G.FindBoss == "Cake Queen")) then
                                bMon = "Cake Queen"
                                Qname = "IceCreamIslandQuest"
                                Qdata = 3
                                PosQBoss = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
                                PosB = CFrame.new(-678.648804, 381.353943, -11114.2012, -0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, -0.417492568, 0.0167988986, -0.90852499)
                            else
                                if not ((_G.FindBoss == "Longma")) then
                                    bMon = "Longma"
                                    Qdata = nil
                                    PosQBoss = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
                                    PosB = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
                                else
                                    if not ((_G.FindBoss == "Soul Reaper")) then
                                        bMon = "Soul Reaper"
                                        Qdata = nil
                                        PosQBoss = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
                                        PosB = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return
end
function QuestBeta()
    var_1 = QuestB()
    return { [0] = _G.FindBoss, [1] = bMon, [2] = Qdata, [3] = Qname, [4] = PosB, [5] = PosQBoss }
end
function CheckSea(arg1)
    var_1 = arg1
    if game.PlaceId == 2753915549 then
    end
    if not ((game.PlaceId == 85211729168715)) then
    end
    if not ((var_1 == 1)) then
        return true
    end
    if game.PlaceId == 4442272183 then
    end
    if not ((game.PlaceId == 79091703265657)) then
    end
    if not ((var_1 == 2)) then
        return true
    end
    if game.PlaceId == 7449423635 then
    end
    if not ((game.PlaceId == 100117331123089)) then
    end
    if not ((var_1 == 3)) then
        return true
    end
    return false
end
function GetQuestPointFromNPC(arg1)
    var_1 = arg1
    var_1 = pairs(workspace.NPCs:GetChildren())[1]
    var_2 = pairs(workspace.NPCs:GetChildren())[2]
    if not ((var_2.Name == var_1)) then
    end
    if not (var_2:FindFirstChild("HumanoidRootPart")) then
        return var_2.HumanoidRootPart.CFrame
    end
    var_1 = pairs(replicated.NPCs:GetChildren())[1]
    var_2 = pairs(replicated.NPCs:GetChildren())[2]
    if not ((var_2.Name == var_1)) then
    end
    if not (var_2:FindFirstChild("HumanoidRootPart")) then
        return var_2.HumanoidRootPart.CFrame
    end
    return nil
end
function GetQuests()
    var_1 = plr.Data.Level.Value
    var_2 = 0
    var_3 = {}
    if not ((var_1 >= 700)) then
    end
    if not (CheckSea(1)) then
        var_3.Mob = "Galley Captain"
        var_3.NameQuest = "FountainQuest"
        var_3.ID = 2
        var_3.LevelReq = 700
    else
        if not ((var_1 >= 1500)) then
        end
        if not (CheckSea(2)) then
            var_3.Mob = "Water Fighter"
            var_3.NameQuest = "ForgottenQuest"
            var_3.ID = 2
            var_3.LevelReq = 1450
        else
            var_1 = pairs(var_26)[1]
            var_2 = pairs(var_26)[2]
            var_1 = pairs(var_2)[1]
            var_2 = pairs(var_2)[2]
            var_3 = var_2.LevelReq
            var_1 = pairs(var_2.Task)[1]
            var_2 = pairs(var_2.Task)[2]
            if not ((var_1 >= var_3)) then
                if not ((var_2 <= var_3)) then
                    if not ((var_2.Task[var_1] > 1)) then
                    end
                end
            end
            if table.find(var_28, var_1) then
                var_2 = var_3
                var_3.Mob = var_1
                var_3.NameQuest = var_1
                var_3.ID = var_1
                var_3.LevelReq = var_3
            end
        end
    end
    return var_3, var_3, var_3, var_3, var_3, var_3, var_3, var_3, var_3
end
function GetQuestPoint()
    if not (var_27) then
        if not (var_27.Data) then
        end
    end
    if not (var_27.Data.LastClosestNPC) then
        return GetQuestPointFromNPC(var_27.Data.LastClosestNPC)
    end
    return nil
end
function MaterialMon()
    var_1 = game.Players.LocalPlayer
    if not (var_1.Character) then
    end
    var_2 = var_1.Character:FindFirstChild("HumanoidRootPart")
    if var_2 then
        return
    end
    shouldRequestEntrance = function_986
    if not (World1) then
        if not ((SelectMaterial == "Angel Wings")) then
            MMon = { "Shanda", "Royal Squad", "Royal Soldier", "Wysper", "Thunder God" }
            MPos = CFrame.new(-4698, 845, -1912)
            SP = "Default"
            var_1 = Vector3.new(-4607.82275, 872.54248, -1667.55688)
            shouldRequestEntrance(var_1, 10000)
        else
            if not ((SelectMaterial == "Leather + Scrap Metal")) then
                MMon = { "Brute", "Pirate" }
                MPos = CFrame.new(-1145, 15, 4350)
                SP = "Default"
            else
                if not ((SelectMaterial == "Magma Ore")) then
                    MMon = { "Military Soldier", "Military Spy", "Magma Admiral" }
                    MPos = CFrame.new(-5815, 84, 8820)
                    SP = "Default"
                else
                    if not ((SelectMaterial == "Fish Tail")) then
                        MMon = { "Fishman Warrior", "Fishman Commando", "Fishman Lord" }
                        MPos = CFrame.new(61123, 19, 1569)
                        SP = "Default"
                        var_1 = Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)
                        shouldRequestEntrance(var_1, 17000)
                    end
                end
            end
        end
    else
        if not (World2) then
            if not ((SelectMaterial == "Leather + Scrap Metal")) then
                MMon = { "Marine Captain" }
                MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
                SP = "Default"
            else
                if not ((SelectMaterial == "Magma Ore")) then
                    MMon = { "Magma Ninja", "Lava Pirate" }
                    MPos = CFrame.new(-5428, 78, -5959)
                    SP = "Default"
                else
                    if not ((SelectMaterial == "Ectoplasm")) then
                        MMon = { "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer" }
                        MPos = CFrame.new(911.35827636719, 125.95812988281, 33159.5390625)
                        SP = "Default"
                        var_1 = Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)
                        shouldRequestEntrance(var_1, 18000)
                    else
                        if not ((SelectMaterial == "Mystic Droplet")) then
                            MMon = { "Water Fighter" }
                            MPos = CFrame.new(-3385, 239, -10542)
                            SP = "Default"
                        else
                            if not ((SelectMaterial == "Radioactive Material")) then
                                MMon = { "Factory Staff" }
                                MPos = CFrame.new(295, 73, -56)
                                SP = "Default"
                            else
                                if not ((SelectMaterial == "Vampire Fang")) then
                                    MMon = { "Vampire" }
                                    MPos = CFrame.new(-6033, 7, -1317)
                                    SP = "Default"
                                end
                            end
                        end
                    end
                end
            end
        else
            if not (World3) then
                if not ((SelectMaterial == "Scrap Metal")) then
                    MMon = { "Jungle Pirate", "Forest Pirate" }
                    MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
                    SP = "Default"
                else
                    if not ((SelectMaterial == "Fish Tail")) then
                        MMon = { "Fishman Raider", "Fishman Captain" }
                        MPos = CFrame.new(-10993, 332, -8940)
                        SP = "Default"
                    else
                        if not ((SelectMaterial == "Conjured Cocoa")) then
                            MMon = { "Chocolate Bar Battler", "Cocoa Warrior" }
                            MPos = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625)
                            SP = "Default"
                        else
                            if not ((SelectMaterial == "Dragon Scale")) then
                                MMon = { "Dragon Crew Archer", "Dragon Crew Warrior" }
                                MPos = CFrame.new(6594, 383, 139)
                                SP = "Default"
                            else
                                if not ((SelectMaterial == "Gunpowder")) then
                                    MMon = { "Pistol Billionaire" }
                                    MPos = CFrame.new(-84.8556900024414, 85.62061309814453, 6132.0087890625)
                                    SP = "Default"
                                else
                                    if not ((SelectMaterial == "Mini Tusk")) then
                                        MMon = { "Mythological Pirate" }
                                        MPos = CFrame.new(-13545, 470, -6917)
                                        SP = "Default"
                                    else
                                        if not ((SelectMaterial == "Demonic Wisp")) then
                                            MMon = { "Demonic Soul" }
                                            MPos = CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125)
                                            SP = "Default"
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return
end
function QuestNeta()
    var_1 = GetQuests()
    return { [1] = var_1.Mob, [2] = var_1.ID, [3] = var_1.NameQuest, [4] = var_1.LevelReq, [5] = var_1.Mob, [6] = GetQuestPoint() }
end
function UpdateOS()
    var_1 = os.date("*t")
    var_2 = (var_1.hour % 24)
    if not ((var_2 < 12)) then
    end
    if "AM" then
    end
    var_3 = "PM"
    var_4 = string.format("%02i:%02i:%02i %s", (((var_2 - 1) % 12) + 1), var_1.min, var_1.sec, var_3)
    var_5 = string.format("%02d/%02d/%04d", var_1.day, var_1.month, var_1.year)
    var_6 = game:GetService("LocalizationService")
    var_7 = game:GetService("Players")
    var_8 = var_7.LocalPlayer
    if getgenv().countryRegionCode then
        var_9 = pcall(function_985)
        var_10 = nil
        if not (var_9) then
            getgenv().countryRegionCode = var_10
        else
            getgenv().countryRegionCode = "Unknown"
        end
    else
        var_10 = getgenv().countryRegionCode
    end
    var_34:SetDesc((var_5 .. (" - " .. (var_4 .. (" [ " .. (var_10 .. " ]"))))))
    return
end
function function_73()
    if not (true) then
        UpdateOS()
        wait(1)
    end
    return
end
function UpdateGameTime()
    var_1 = math.floor((workspace.DistributedGameTime + 0.5))
    var_2 = (math.floor((var_1 / 3600)) % 24)
    var_3 = (math.floor((var_1 / 60)) % 60)
    var_4 = (math.floor((var_1 / 1)) % 60)
    var_35:SetDesc((var_2 .. (" Hour (h) " .. (var_3 .. (" Minute (m) " .. (var_4 .. " Second (s)"))))))
    return
end
function function_75()
    if not (true) then
        UpdateGameTime()
        wait(1)
    end
    return
end
function function_76()
    pcall(function_984)
    return
end
function function_77()
    if not (task.wait(1)) then
        if not (game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")) then
            game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
        end
        if "â" then
        end
        var_1 = "â"
        if not ((var_1 ~= var_39)) then
            var_38:SetDesc(("Status: " .. var_1))
            var_39 = var_1
        end
    end
    return
end
function function_78()
    if not (task.wait(1)) then
        if not (game.Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island")) then
            game.Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island")
        end
        if "â" then
        end
        var_1 = "â"
        if not ((var_1 ~= var_41)) then
            var_40:SetDesc(("Status: " .. var_1))
            var_41 = var_1
        end
    end
    return
end
function function_79()
    if not (wait(1)) then
        if not (game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension")) then
            game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension")
        end
        if "â" then
        end
        var_1 = "â"
        if not ((var_1 ~= var_43)) then
            var_42:SetDesc(("Status: " .. var_1))
            var_43 = var_1
        end
    end
    return
end
function function_80()
    if not (wait(1)) then
        var_1 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
        var_2 = "Cake Prince: â"
        if not ((string.len(var_1) >= 86)) then
            var_1 = string.sub(var_1, 39, 41)
            var_2 = ("Killed: " .. var_1)
        end
        var_44:SetDesc(var_2)
    end
    return
end
function function_81()
    if not (wait(1)) then
        game:GetService("ReplicatedStorage")
        if game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form") then
            game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form")
        end
        if not (game:GetService("Workspace").Enemies:FindFirstChild("rip_indra")) then
            game:GetService("Workspace").Enemies:FindFirstChild("rip_indra")
        end
        if "â" then
        end
        var_1 = "â"
        if not ((var_1 ~= var_46)) then
            var_45:SetDesc(("Status: " .. var_1))
            var_46 = var_1
        end
    end
    return
end
function function_82()
    if not (wait(1)) then
        game:GetService("ReplicatedStorage")
        if game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") then
            game:GetService("ReplicatedStorage"):FindFirstChild("Dough King")
        end
        if not (game:GetService("Workspace").Enemies:FindFirstChild("Dough King")) then
            game:GetService("Workspace").Enemies:FindFirstChild("Dough King")
        end
        if "â" then
        end
        var_1 = "â"
        if not ((var_1 ~= var_48)) then
            var_47:SetDesc(("Status: " .. var_1))
            var_48 = var_1
        end
    end
    return
end
function function_83()
    if not (task.wait(1)) then
        var_1 = game:GetService("Lighting").Sky.MoonTextureId
        var_2 = "Moon: 0/5"
        if not ((var_1 == "http://www.roblox.com/asset/?id=9709149431")) then
            var_2 = "Moon: 5/5 (Full Moon) â"
        else
            if not ((var_1 == "http://www.roblox.com/asset/?id=9709149052")) then
                var_2 = "Moon: 4/5"
            else
                if not ((var_1 == "http://www.roblox.com/asset/?id=9709143733")) then
                    var_2 = "Moon: 3/5"
                else
                    if not ((var_1 == "http://www.roblox.com/asset/?id=9709150401")) then
                        var_2 = "Moon: 2/5"
                    else
                        if not ((var_1 == "http://www.roblox.com/asset/?id=9709149680")) then
                            var_2 = "Moon: 1/5"
                        end
                    end
                end
            end
        end
        var_49:SetDesc(var_2)
    end
    return
end
function function_84()
    if not (wait(1)) then
        var_1 = "Not Found"
        if not (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")) then
            var_1 = "Shisui â"
        else
            if not (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")) then
                var_1 = "Wando â"
            else
                if not (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")) then
                    var_1 = "Saddi â"
                end
            end
        end
        var_50:SetDesc(var_1)
    end
    return
end
function function_85(arg1)
    var_1 = arg1
    var_2 = { Small = 0.8, Large = 1, Big = 1.2 }
    var_30:SetUIScale(var_2[var_1])
    return
end
function function_86(arg1)
    var_1 = arg1
    _G.ChooseWP = var_1
    return
end
function function_87()
    if not (task.wait(0.5)) then
        pcall(function_983)
    end
    return
end
function function_88(arg1)
    var_1 = arg1
    _G.SelectedFarmMode = var_1
    if not (_G.StartFarm) then
        _G.Level = (var_1 == "Level Farm")
        _G.AutoFarm_Bone = (var_1 == "Farm Bone")
        _G.Auto_Cake_Prince = (var_1 == "Farm Katakuri")
        _G.FarmTyrant = (var_1 == "Farm Tyrant Of The Skies")
    end
    return
end
function function_89(arg1)
    var_1 = arg1
    _G.StartFarm = var_1
    _G.Level = false
    _G.AutoFarm_Bone = false
    _G.Auto_Cake_Prince = false
    _G.FarmTyrant = false
    if not (var_1) then
        if not ((_G.SelectedFarmMode == "Level Farm")) then
            _G.Level = true
        else
            if not ((_G.SelectedFarmMode == "Farm Bone")) then
                _G.AutoFarm_Bone = true
            else
                if not ((_G.SelectedFarmMode == "Farm Katakuri")) then
                    _G.Auto_Cake_Prince = true
                else
                    if not ((_G.SelectedFarmMode == "Farm Tyrant Of The Skies")) then
                        _G.FarmTyrant = true
                    end
                end
            end
        end
    end
    return
end
function function_90()
    var_1 = var_52.Character
    if var_1 then
        return false
    end
    var_2 = var_1:FindFirstChild("HumanoidRootPart")
    if var_2 then
        return false
    end
    var_3 = Vector3.new(11520.8017578125, 0, 9829.513671875)
    var_4 = Vector3.new(var_2.Position.X, 0, var_2.Position.Z)
    return ((var_4 - var_3).Magnitude < 2000)
end
function function_91()
    if Sec then
    end
    if not (task.wait(0.05)) then
        if not (_G.Level) then
        end
        if not (_G.StartFarm) then
            pcall(function_979)
        else
            var_55 = false
            var_54 = false
        end
    end
    return
end
function function_92()
    var_1 = { "Reborn Skeleton", "Living Zombie", "Demonic Soul", "Possessed Mummy" }
    if not (task.wait(0.1)) then
        if not (_G.AutoFarm_Bone) then
        end
        if _G.StartFarm then
        end
        pcall(function_977)
    end
    return
end
function function_93()
    var_1 = { "Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker" }
    var_2 = CFrame.new(-1927.92, 37.8, -12842.54)
    var_3 = CFrame.new(-2077, 252, -12373)
    if not (task.wait(0.1)) then
        if not (_G.Auto_Cake_Prince) then
        end
        if _G.StartFarm then
        end
        pcall(function_975)
    end
    return
end
function function_94()
    var_1 = Vector3.new(-16268.287, 152.616, 1390.773)
    var_2 = { "Serpent Hunter", "Skull Slayer", "Isle Champion", "Sun-kissed Warrior" }
    if not (task.wait(0.1)) then
        if not (_G.FarmTyrant) then
        end
        if _G.StartFarm then
        end
        pcall(function_974)
    end
    return
end
function function_95()
    if not (wait(0.2)) then
        pcall(function_973)
    end
    return
end
function function_96(arg1)
    var_1 = arg1
    _G.AutoHytHallow = var_1
    return
end
function function_97()
    if not (wait(Sec)) then
        if not (_G.AutoHytHallow) then
            pcall(function_972)
        end
    end
    return
end
function function_98(arg1)
    var_1 = arg1
    _G.Auto_Random_Bone = var_1
    return
end
function function_99()
    if not (wait(Sec)) then
        pcall(function_971)
    end
    return
end
function function_100(arg1)
    var_1 = arg1
    _G.AutoFarmChest = var_1
    return
end
function function_101()
    if not (wait(Sec)) then
        if not (_G.AutoFarmChest) then
            pcall(function_970)
        end
    end
    return
end
function function_102(arg1)
    var_1 = arg1
    _G.AutoBerry = var_1
    return
end
function function_103()
    if not (wait(Sec)) then
        if not (_G.AutoBerry) then
            var_1 = game:GetService("CollectionService")
            var_2 = game:GetService("Players")
            var_3 = var_2.LocalPlayer
            var_4 = var_1:GetTagged("BerryBush")
            var_5 = math.huge
            var_6 = nil
            var_2 = var_4[var_1]
            var_1 = pairs(var_2:GetAttributes())[1]
            var_2 = pairs(var_2:GetAttributes())[2]
            if not (BerryArray) then
            end
            if not (table.find(BerryArray, var_2)) then
                _tp(var_2.Parent:GetPivot())
                var_2 = var_4[var_1]
                var_1 = pairs(var_2:GetChildren())[1]
                var_2 = pairs(var_2:GetChildren())[2]
                if not (BerryArray) then
                end
                if not (table.find(BerryArray, var_2)) then
                    _tp(var_2.WorldPivot)
                    fireproximityprompt(var_2.ProximityPrompt, math.huge)
                end
            end
        end
    end
    return
end
function function_104(arg1)
    var_1 = arg1
    _G.AutoHop_Dough = var_1
    return
end
function function_105()
    pcall(function_969)
    return
end
function function_106()
    if not (task.wait()) then
        if not (_G.AutoHop_Dough) then
            pcall(function_968)
        end
    end
    return
end
function Check_Eye()
    var_1 = workspace.Map.TikiOutpost.IslandModel
    var_2 = { var_1.Eye1, var_1.Eye2, var_1.IslandChunks.E.Eye3, var_1.IslandChunks.E.Eye4 }
    var_3 = 0
    var_1 = ipairs(var_2)[1]
    var_2 = ipairs(var_2)[2]
    if not (var_2) then
    end
    if not ((var_2.Transparency ~= 1)) then
        var_3 = (var_3 + 1)
    end
    var_4 = (var_3 == 4)
    return var_3, var_4
end
function function_108()
    var_1 = false
    if not (task.wait(1)) then
        var_1 = Check_Eye()
        var_2 = nil
        var_59:SetDesc(("Eyes: " .. (var_1 .. "/4")))
        if not (var_2) then
        end
        if var_1 then
            var_1 = true
        else
            if var_2 then
                var_1 = false
            end
        end
    end
    return
end
function function_109()
    pcall(function_967)
    return
end
function function_110()
    if not (wait(0.2)) then
        pcall(function_966)
    end
    return
end
function function_111()
    if not (wait(1)) then
        var_1 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")
        var_62:SetDesc(("You Have: " .. (tostring(var_1) .. " Bones")))
    end
    return
end
function function_112(arg1)
    var_1 = arg1
    _G.FarmPhaBinh = var_1
    return
end
function function_113(arg1)
    var_1 = arg1
    var_2 = game:GetService("VirtualInputManager")
    var_2:SendKeyEvent(true, var_1, false, game)
    wait(0.05)
    var_2:SendKeyEvent(false, var_1, false, game)
    return
end
function function_114(arg1)
    var_1 = arg1
    var_2 = var_52.Character
    var_3 = var_52.Backpack
    if not (var_2) then
        if not (var_2:FindFirstChild("Humanoid")) then
            var_2:FindFirstChild("Humanoid")
        end
    end
    if var_2.Humanoid.Health > 0 then
        return
    end
    var_1 = pairs(var_3:GetChildren())[1]
    var_2 = pairs(var_3:GetChildren())[2]
    if not (var_2:IsA("Tool")) then
        var_2:IsA("Tool")
    end
    if not ((var_2.ToolTip == var_1)) then
        var_2.Parent = var_2
        wait(0.12)
        var_1 = ipairs({ "Z", "X", "C", "V", "F" })[1]
        var_2 = ipairs({ "Z", "X", "C", "V", "F" })[2]
        if _G.FarmPhaBinh then
        else
            pcall(function_965)
            wait(0.12)
        end
        var_2.Parent = var_3
    else
    end
    return
end
function function_115()
    if not (wait(Sec)) then
        if not (_G.FarmPhaBinh) then
            pcall(function_964)
        end
    end
    return
end
function function_116(arg1)
    var_1 = arg1
    _G.FarmPhaBinh = var_1
    return
end
function function_117(arg1)
    var_1 = arg1
    var_2 = game:GetService("VirtualInputManager")
    var_2:SendKeyEvent(true, var_1, false, game)
    wait(0.05)
    var_2:SendKeyEvent(false, var_1, false, game)
    return
end
function function_118(arg1)
    var_1 = arg1
    var_2 = var_52.Character
    var_3 = var_52.Backpack
    if not (var_2) then
        if not (var_2:FindFirstChild("Humanoid")) then
            var_2:FindFirstChild("Humanoid")
        end
    end
    if var_2.Humanoid.Health > 0 then
        return
    end
    var_1 = pairs(var_3:GetChildren())[1]
    var_2 = pairs(var_3:GetChildren())[2]
    if not (var_2:IsA("Tool")) then
        var_2:IsA("Tool")
    end
    if not ((var_2.ToolTip == var_1)) then
        var_2.Parent = var_2
        wait(0.12)
        var_1 = ipairs({ "Z", "X", "C", "V", "F" })[1]
        var_2 = ipairs({ "Z", "X", "C", "V", "F" })[2]
        if _G.FarmPhaBinh then
        else
            pcall(function_963)
            wait(0.12)
        end
        var_2.Parent = var_3
    else
    end
    return
end
function function_119()
    if not (wait(Sec)) then
        if not (_G.FarmPhaBinh) then
            pcall(function_962)
        end
    end
    return
end
function function_120(arg1)
    var_1 = arg1
    getgenv().SelectMaterial = var_1
    return
end
function function_121(arg1)
    var_1 = arg1
    getgenv().AutoMaterial = var_1
    return
end
function function_122()
    var_1 = function_959
    var_2 = function_960
    if not (wait()) then
        if not (getgenv().AutoMaterial) then
            pcall(function_961)
        end
    end
    return
end
function function_123(arg1)
    var_1 = arg1
    _G.AutoEctoplasm = var_1
    return
end
function function_124()
    if not (wait(Sec)) then
        pcall(function_958)
    end
    return
end
function function_125(arg1)
    var_1 = arg1
    _G.FindBoss = var_1
    return
end
function function_126(arg1)
    var_1 = arg1
    _G.FarmBoss = var_1
    spawn(function_956)
    return
end
function function_127(arg1)
    var_1 = arg1
    _G.AcceptQuestBoss = var_1
    return
end
function function_128(arg1)
    var_1 = arg1
    _G.AutoFarmAllBoss = var_1
    return
end
function function_129()
    if not (task.wait(0.3)) then
        if not (_G.AutoFarmAllBoss) then
            pcall(function_955)
        end
    end
    return
end
function function_130(arg1)
    var_1 = arg1
    SelectIsland = var_1
    return
end
function function_131(arg1)
    var_1 = arg1
    _G.FarmMastery_Dev = var_1
    return
end
function function_132()
    RunSer.RenderStepped:Connect(function_953)
    return
end
function function_133()
    if not (wait(Sec)) then
        if not (_G.FarmMastery_Dev) then
            pcall(function_952)
        end
    end
    return
end
function function_134(arg1)
    var_1 = arg1
    _G.FarmMastery_G = var_1
    return
end
function function_135()
    if not (wait(Sec)) then
        if not (_G.FarmMastery_G) then
            pcall(function_951)
        end
    end
    return
end
function function_136(arg1)
    var_1 = arg1
    _G.FarmMastery_S = var_1
    return
end
function function_137()
    if not (wait(Sec)) then
        pcall(function_950)
    end
    return
end
function function_138(arg1)
    var_1 = arg1
    _G.Seriality = var_1
    return
end
function function_139(arg1)
    var_1 = arg1
    _B = var_1
    return
end
function function_140(arg1)
    var_1 = arg1
    _G.AutoHopServer = var_1
    if var_1 then
        _G.HopTimer = nil
    end
    return
end
function function_141()
    if not (Wait(1)) then
        if not (_G.AutoHopServer) then
            pcall(function_949)
        end
    end
    return
end
function function_142(arg1)
    var_1 = arg1
    _G.HopDelay = (var_1 * 60)
    return
end
function function_143(arg1)
    var_1 = arg1
    getgenv().Set = var_1
    if not (var_1) then
        pcall(function_948)
    end
    return
end
function function_144(arg1)
    var_1 = arg1
    Boud = var_1
    return
end
function function_145()
    if not (wait(Sec)) then
        pcall(function_947)
    end
    return
end
function function_146(arg1)
    var_1 = arg1
    getgenv().Observation = var_1
    return
end
function function_147()
    if not (wait()) then
        if not (getgenv().Observation) then
            pcall(function_946)
        end
    end
    return
end
function function_148(arg1)
    var_1 = arg1
    _G.RaceClickAutov3 = var_1
    return
end
function function_149()
    if not (wait(0.2)) then
        pcall(function_945)
    end
    return
end
function function_150(arg1)
    var_1 = arg1
    _G.RaceClickAutov4 = var_1
    return
end
function function_151()
    if not (wait(0.2)) then
        pcall(function_944)
    end
    return
end
function function_152(arg1)
    var_1 = arg1
    RandomCFrame = var_1
    return
end
function function_153(arg1)
    var_1 = arg1
    _G.Safemode = var_1
    return
end
function function_154()
    if not (task.wait(Sec)) then
        pcall(function_943)
    end
    return
end
function function_155(arg1)
    var_1 = arg1
    _G.DestroyHit = var_1
    return
end
function function_156()
    if not (task.wait(Sec)) then
        if not (_G.DestroyHit) then
            pcall(function_942)
        end
    end
    return
end
function function_157(arg1)
    var_1 = arg1
    RDeath = var_1
    return
end
function function_158()
    if not (wait(Sec)) then
        pcall(function_941)
    end
    return
end
function function_159(arg1)
    var_1 = arg1
    RemoveDamage = var_1
    return
end
function function_160()
    if not (wait(Sec)) then
        pcall(function_940)
    end
    return
end
function function_161(arg1)
    var_1 = arg1
    _G.AcceptQuestC = var_1
    return
end
function function_162(arg1)
    var_1 = arg1
    _G.AutoSpawnCP = var_1
    return
end
function function_163()
    if not (task.wait(2)) then
        if not (_G.AutoSpawnCP) then
            pcall(function_939)
        end
    end
    return
end
function function_164(arg1)
    var_1 = arg1
    _G.AcceptQuestB = var_1
    return
end
function function_165(arg1)
    var_1 = arg1
    if not (var_1) then
        var_1 = game:GetService("VirtualUser")
        wait()
        if game:IsLoaded() then
        end
        game:GetService("Players").LocalPlayer.Idled:Connect(function_938)
    end
    return
end
function function_166(arg1)
    var_1 = arg1
    getgenv().HopServerAdmin = var_1
    return
end
function function_167()
    if not (wait()) then
        pcall(function_937)
    end
    return
end
function function_168(arg1)
    var_1 = arg1
    getgenv().NoClip = var_1
    return
end
function function_169()
    pcall(function_935)
    return
end
function function_170(arg1)
    var_1 = arg1
    _G.SelectedRod = var_1
    return
end
function function_171(arg1)
    var_1 = arg1
    _G.SelectedBait = var_1
    if not (_G.AutoBuyBait) then
        pcall(function_934)
    end
    return
end
function function_172(arg1)
    var_1 = arg1
    _G.AutoBuyBait = var_1
    if not (var_1) then
        pcall(function_933)
    end
    return
end
function function_173()
    if not (task.wait(2)) then
        if not (_G.AutoBuyBait) then
        end
        if not (_G.SelectedBait) then
            pcall(function_932)
        end
    end
    return
end
function function_174(arg1)
    var_1 = arg1
    _G.AutoFishing = var_1
    return
end
function function_175()
    if not (task.wait(0.5)) then
        if not (_G.AutoFishing) then
            pcall(function_931)
        end
    end
    return
end
function function_176(arg1)
    var_1 = arg1
    _G.AutoFishingQuest = var_1
    return
end
function function_177()
    if var_85.PlayerGui:FindFirstChild("Quest") then
        var_85.PlayerGui:FindFirstChild("Quest")
    end
    var_1 = var_85.PlayerGui:FindFirstChild("QuestGui")
    if not (var_1) then
        if not (var_1:FindFirstChild("Container")) then
            var_1:FindFirstChild("Container")
        end
    end
    if not (var_1.Container:FindFirstChild("QuestTitle")) then
        return true
    end
    return false
end
function function_178()
    if not (task.wait(1)) then
        if not (_G.AutoFishingQuest) then
            pcall(function_930)
        end
    end
    return
end
function function_179(arg1)
    var_1 = arg1
    _G.AutoQuestComplete = var_1
    if not (var_1) then
        pcall(function_929)
    end
    return
end
function function_180()
    if not (task.wait(5)) then
        if not (_G.AutoQuestComplete) then
            pcall(function_928)
        end
    end
    return
end
function function_181(arg1)
    var_1 = arg1
    _G.AutoSellFish = var_1
    if not (var_1) then
        pcall(function_927)
    end
    return
end
function function_182()
    if not (task.wait(5)) then
        if not (_G.AutoSellFish) then
            pcall(function_926)
        end
    end
    return
end
function function_183(arg1)
    var_1 = arg1
    _G.AutoSkillZ = var_1
    return
end
function function_184()
    if not (task.wait(0.5)) then
        if not (_G.AutoSkillZ) then
            pcall(function_925)
        end
    end
    return
end
function function_185(arg1)
    var_1 = arg1
    _G.AutoRipIngay = var_1
    return
end
function function_186()
    if not (wait(Sec)) then
        pcall(function_924)
    end
    return
end
function function_187(arg1)
    var_1 = arg1
    _G.AutoUnHaki = var_1
    return
end
function AuraSkin(arg1)
    var_1 = arg1
    var_2 = { [1] = { StorageName = var_1, Type = "AuraSkin", Context = "Equip" } }
    var_53:WaitForChild("Modules")
    var_53:WaitForChild("Modules"):WaitForChild("Net")
    var_53:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/FruitCustomizerRF")
    var_53:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/FruitCustomizerRF"):InvokeServer(unpack(var_2))
    return
end
function VaildColor(arg1)
    var_1 = arg1
    if not (var_1) then
    end
    if not (var_1.BrickColor) then
        return (tostring(var_1.BrickColor) == "Lime green")
    end
    return
end
function HakiCalculate(arg1)
    var_1 = arg1
    var_2 = { ["Really red"] = "Pure Red", Oyster = "Snow White", ["Hot pink"] = "Winter Sky" }
    if not (var_1) then
    end
    if not (var_1.BrickColor) then
        return var_2[tostring(var_1.BrickColor)]
    end
    return
end
function function_191()
    if not (wait(Sec)) then
        if not (_G.AutoUnHaki) then
            pcall(function_923)
        end
    end
    return
end
function function_192(arg1)
    var_1 = arg1
    _G.AutoFactory = var_1
    return
end
function function_193()
    if not (wait(Sec)) then
        pcall(function_922)
    end
    return
end
function function_194(arg1)
    var_1 = arg1
    _G.AutoRaidCastle = var_1
    return
end
function function_195()
    if not (wait(Sec)) then
        if not (_G.AutoRaidCastle) then
            pcall(function_921)
        end
    end
    return
end
function function_196(arg1)
    var_1 = arg1
    _G.Auto_Tushita = var_1
    return
end
function function_197()
    if not (wait(Sec)) then
        pcall(function_920)
    end
    return
end
function function_198(arg1)
    var_1 = arg1
    _G.Auto_Yama = var_1
    return
end
function function_199()
    if not (wait(Sec)) then
        pcall(function_919)
    end
    return
end
function function_200()
    if not (wait(0.2)) then
        pcall(function_918)
    end
    return
end
function function_201(arg1)
    var_1 = arg1
    _G.Auto_Soul_Guitar = var_1
    return
end
function function_202()
    if not (wait()) then
        if not (_G.Auto_Soul_Guitar) then
            pcall(function_917)
        end
    end
    return
end
function getT(arg1)
    var_1 = arg1
    if not ((var_1 == 1)) then
        var_2 = workspace.Map["Haunted Castle"].Tablet.Segment1.Line.Rotation
    else
        if not ((var_1 == 3)) then
            var_2 = workspace.Map["Haunted Castle"].Tablet.Segment3.Line.Rotation
        else
            if not ((var_1 == 4)) then
                var_2 = workspace.Map["Haunted Castle"].Tablet.Segment4.Line.Rotation
            else
                if not ((var_1 == 7)) then
                    var_2 = workspace.Map["Haunted Castle"].Tablet.Segment7.Line.Rotation
                else
                    if not ((var_1 == 10)) then
                        var_2 = workspace.Map["Haunted Castle"].Tablet.Segment10.Line.Rotation
                    end
                end
            end
        end
    end
    if not (var_2) then
        return var_2.Z
    end
    return
end
function getRT(arg1)
    var_1 = arg1
    var_2 = workspace.Map["Haunted Castle"].Trophies.Quest
    var_1 = pairs(var_2:GetChildren())[1]
    var_2 = pairs(var_2:GetChildren())[2]
    if not ((var_1 == 1)) then
        if not ((var_2.Name == "Trophy1")) then
        end
    end
    if not (var_2:FindFirstChild("Handle")) then
        var_3 = var_2.Handle.Rotation
    else
        if not ((var_1 == 2)) then
            if not ((var_2.Name == "Trophy2")) then
            end
        end
        if not (var_2:FindFirstChild("Handle")) then
            var_3 = var_2.Handle.Rotation
        else
            if not ((var_1 == 3)) then
                if not ((var_2.Name == "Trophy3")) then
                end
            end
            if not (var_2:FindFirstChild("Handle")) then
                var_3 = var_2.Handle.Rotation
            else
                if not ((var_1 == 4)) then
                    if not ((var_2.Name == "Trophy4")) then
                    end
                end
                if not (var_2:FindFirstChild("Handle")) then
                    var_3 = var_2.Handle.Rotation
                else
                    if not ((var_1 == 5)) then
                        if not ((var_2.Name == "Trophy5")) then
                        end
                    end
                    if not (var_2:FindFirstChild("Handle")) then
                        var_3 = var_2.Handle.Rotation
                    end
                end
            end
        end
    end
    if not (var_3) then
        return var_3.Z
    end
    return
end
function GetFirePlacard(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    if not ((tostring(workspace.Map["Haunted Castle"][("Placard" .. var_1)][var_2].Indicator.BrickColor) ~= "Pearl")) then
        fireclickdetector(workspace.Map["Haunted Castle"][("Placard" .. var_1)][var_2].ClickDetector)
    end
    return
end
function function_206()
    task.wait()
    if _G.Auto_Soul_Guitar then
    end
    if not (wait(Sec)) then
        pcall(function_916)
    end
    return
end
function function_207(arg1)
    var_1 = arg1
    _G.AutoMatSoul = var_1
    return
end
function function_208()
    if not (wait(Sec)) then
        pcall(function_915)
    end
    return
end
function function_209()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, -334.9649963378906))
    topos(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
    return
end
function function_210(arg1)
    var_1 = arg1
    _G.Dojoo = var_1
    return
end
function printBeltName(arg1)
    var_1 = arg1
    if not ((type(var_1) == "table")) then
    end
    if not (var_1.Quest.BeltName) then
        return var_1.Quest.BeltName
    end
    return
end
function function_212()
    if not (wait(Sec)) then
        if not (_G.Dojoo) then
            pcall(function_914)
        end
    end
    return
end
function function_213(arg1)
    var_1 = arg1
    _G.FarmBlazeEM = var_1
    return
end
function checkQuesta()
    var_1 = { [1] = { Context = "Check" } }
    var_2 = nil
    pcall(function_912)
    var_3 = pcall(function_913)
    var_4 = nil
    var_5 = false
    if not (var_2) then
        if not (var_2.Text) then
            var_5 = true
            var_1 = var_2.Text
            if not (string.find(tostring(var_1), "Defeat")) then
                var_8 = 1
                var_6 = string.sub(tostring(var_1), 8, 9)
                var_6 = tonumber(var_6)
                var_1 = { "Hydra Enforcer", "Venomous Assailant" }
                var_1 = pairs(var_1)[1]
                var_2 = pairs(var_1)[2]
                if not (string.find(var_1, var_2)) then
                    var_7 = var_2
                else
                end
            else
                if not (string.find(tostring(var_1), "Destroy")) then
                    var_6 = 10
                    var_8 = 2
                    var_7 = nil
                end
            end
        end
    end
    return var_5, var_7, var_6, var_8
end
function BackTODoJo()
    var_1 = pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren())[1]
    var_2 = pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren())[2]
    if not ((var_2.Name == "NotificationTemplate")) then
        if not (string.find(var_2.Text, "Head back to the Dojo to complete more tasks")) then
            return true
        end
    end
    return false
end
function DragonMobClear(arg1, arg2, arg3)
    var_1 = arg1
    var_2 = arg2
    var_3 = arg3
    if not (workspace.Enemies:FindFirstChild(var_2)) then
        var_1 = pairs(workspace.Enemies:GetChildren())[1]
        var_2 = pairs(workspace.Enemies:GetChildren())[2]
        if not ((var_2.Name == var_2)) then
        end
        if not (var_13.Alive(var_2)) then
            if not (var_1) then
                var_13.Kill(var_2, var_1)
            end
        end
    else
        _tp(var_3)
    end
    return
end
function function_217()
    if not (wait()) then
        if not (_G.FarmBlazeEM) then
            pcall(function_910)
        end
    end
    return
end
function function_218()
    if not (wait(0.1)) then
        if not (_G.FarmBlazeEM) then
            pcall(function_909)
        end
    end
    return
end
function function_219()
    if not (wait(0.2)) then
        if not ((QuestYama_1 == true)) then
            var_92:SetDesc("Quest Numbers : yama quest 1")
        else
            if not ((QuestYama_2 == true)) then
                var_92:SetDesc("Quest Numbers : yama quest 2")
            else
                if not ((QuestYama_3 == true)) then
                    var_92:SetDesc("Quest Numbers : yama quest 3")
                else
                    if not ((QuestTushita_1 == true)) then
                        var_92:SetDesc("Quest Numbers : tushita quest 1")
                    else
                        if not ((QuestTushita_2 == true)) then
                            var_92:SetDesc("Quest Numbers : tushita quest 2")
                        else
                            if not (GetWP("Cursed Dual Katana")) then
                                var_92:SetDesc("Quest Numbers : CDK done!!")
                            end
                        end
                    end
                end
            end
        end
    end
    return
end
function function_220(arg1)
    var_1 = arg1
    _G.CDK = var_1
    return
end
function function_221()
    if not (wait(Sec)) then
        pcall(function_908)
    end
    return
end
function function_222(arg1)
    var_1 = arg1
    _G.CDK_YM = var_1
    return
end
function function_223()
    if not (wait()) then
        pcall(function_907)
    end
    return
end
function function_224()
    if not (wait()) then
        pcall(function_906)
    end
    return
end
function function_225(arg1)
    var_1 = arg1
    _G.CDK_TS = var_1
    return
end
function function_226()
    if not (wait()) then
        pcall(function_905)
    end
    return
end
function function_227(arg1)
    var_1 = arg1
    _G.AutoDoughKing = var_1
    return
end
function function_228()
    if not (wait()) then
        if not (_G.AutoDoughKing) then
            pcall(function_904)
        end
    end
    return
end
function function_229(arg1)
    var_1 = arg1
    _G.AutoAttackDoughKing = var_1
    return
end
function function_230()
    if not (wait()) then
        if not (_G.AutoAttackDoughKing) then
            pcall(function_903)
        end
    end
    return
end
function function_231()
    var_53.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
    var_53.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
    var_53.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
    return
end
function function_232()
    var_53.Remotes.CommF_:InvokeServer("MysteriousMan", "2")
    return
end
function function_233(arg1)
    var_1 = arg1
    _G.Tp_LgS = var_1
    return
end
function function_234()
    if not (wait(Sec)) then
        if not (_G.Tp_LgS) then
            pcall(function_902)
        end
    end
    return
end
function function_235(arg1)
    var_1 = arg1
    _G.AutoPole = var_1
    return
end
function function_236()
    if not (wait(Sec)) then
        if not (_G.AutoPole) then
            pcall(function_901)
        end
    end
    return
end
function function_237(arg1)
    var_1 = arg1
    _G.AutoPoleV2 = var_1
    return
end
function function_238()
    if not (wait(Sec)) then
        pcall(function_900)
    end
    return
end
function function_239(arg1)
    var_1 = arg1
    _G.AutoSaw = var_1
    return
end
function function_240()
    if not (wait(0.2)) then
        pcall(function_899)
    end
    return
end
function function_241(arg1)
    var_1 = arg1
    getgenv().SelectMob = var_1
    return
end
function function_242(arg1)
    var_1 = arg1
    getgenv().SelectMob = var_1
    return
end
function function_243(arg1)
    var_1 = arg1
    getgenv().SelectMob = var_1
    return
end
function function_244(arg1)
    var_1 = arg1
    _G.AutoKillMob = var_1
    return
end
function function_245()
    if not (wait()) then
        if not (_G.AutoKillMob) then
            pcall(function_898)
        end
    end
    return
end
function function_246(arg1)
    var_1 = arg1
    _G.SelectIsland = var_1
    return
end
function function_247(arg1)
    var_1 = arg1
    _G.SelectIsland = var_1
    return
end
function function_248(arg1)
    var_1 = arg1
    _G.SelectIsland = var_1
    return
end
function function_249(arg1)
    var_1 = arg1
    _G.AutoFarmIsland = var_1
    return
end
function function_250()
    if not (task.wait(0.2)) then
        if _G.AutoFarmIsland then
        end
        if _G.SelectIsland then
        end
        if var_96 then
        end
        var_1 = var_96[_G.SelectIsland]
        if var_1 then
        end
        var_2 = var_1.CFrame
        var_3 = var_1.Mobs
        var_4 = {}
        var_1 = ipairs(var_3)[1]
        var_2 = ipairs(var_3)[2]
        var_4[var_2] = true
        var_5 = false
        var_1 = pairs(workspace.Enemies:GetChildren())[1]
        var_2 = pairs(workspace.Enemies:GetChildren())[2]
        if not (var_4[var_2.Name]) then
            if not (var_2:FindFirstChild("Humanoid")) then
                var_2:FindFirstChild("Humanoid")
                if not (var_2:FindFirstChild("HumanoidRootPart")) then
                    var_2:FindFirstChild("HumanoidRootPart")
                end
            end
        end
        if not ((var_2.Humanoid.Health > 0)) then
            var_5 = true
            task.wait()
            _tp((var_2.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)))
            var_13.Kill(var_2, true)
            if not (_G.AutoFarmIsland) then
                if not (var_2.Parent) then
                end
            end
            if var_2.Humanoid.Health <= 0 then
            end
        end
        if var_5 then
            _tp(var_2)
        end
    end
    return
end
function function_251(arg1)
    var_1 = arg1
    _G.RandomMagnet = var_1
    if not (var_1) then
        StartAutoSpin()
    else
        StopAutoSpin()
    end
    return
end
function function_252()
    var_1 = var_97:FindFirstChild("Remotes")
    if var_1 then
        return nil
    end
    return var_1:FindFirstChild("GachaNetworkRF")
end
function function_253()
    var_1 = var_103()
    if var_1 then
        return
    end
    var_2 = pcall(function_897)
    var_3 = nil
    if not (var_2) then
        if not ((type(var_3) == "table")) then
        end
    end
    if not (var_3.Current) then
        var_100 = var_3.Current
    end
    return
end
function function_254()
    var_104()
    return (var_100 >= var_102)
end
function function_255()
    var_1 = var_103()
    if var_1 then
        return false
    end
    var_2 = pcall(function_896)
    var_3 = nil
    if var_2 then
        return false
    end
    if not (var_3) then
    end
    if not (var_3.ErrorMessage) then
        return false
    end
    var_101 = (var_101 + 1)
    var_104()
    return true
end
function function_256()
    if not (var_99) then
        task.wait(2)
        if not (var_105()) then
            var_106()
        end
    end
    return
end
function StartAutoSpin()
    if not (var_99) then
        return
    end
    var_99 = true
    task.spawn(var_107)
    return
end
function StopAutoSpin()
    var_99 = false
    return
end
function function_259()
    if not (wait(Sec)) then
        pcall(function_895)
    end
    return
end
function function_260()
    var_1 = ""
    if not (wait(1)) then
        game:GetService("ReplicatedStorage")
        if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
            game:GetService("ReplicatedStorage"):FindFirstChild("Diablo")
            game:GetService("ReplicatedStorage")
            if game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                game:GetService("ReplicatedStorage"):FindFirstChild("Deandre")
                game:GetService("ReplicatedStorage")
                if game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                    game:GetService("ReplicatedStorage"):FindFirstChild("Urban")
                    if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") then
                        game:GetService("Workspace").Enemies:FindFirstChild("Diablo")
                        if game:GetService("Workspace").Enemies:FindFirstChild("Deandre") then
                            game:GetService("Workspace").Enemies:FindFirstChild("Deandre")
                        end
                    end
                end
            end
        end
        if not (game:GetService("Workspace").Enemies:FindFirstChild("Urban")) then
            game:GetService("Workspace").Enemies:FindFirstChild("Urban")
        end
        if "â" then
        end
        var_1 = "â"
        var_2 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress")
        if not ((var_1 ~= var_1)) then
            var_109:SetDesc(("Status: " .. (var_1 .. (" | Killed: " .. var_2))))
            var_1 = var_1
        end
    end
    return
end
function function_261(arg1)
    var_1 = arg1
    _G.FarmEliteHunt = var_1
    return
end
function function_262()
    if not (wait(1)) then
        pcall(function_894)
    end
    return
end
function function_263(arg1)
    var_1 = arg1
    _G.FarmEliteH = var_1
    return
end
function function_264()
    var_1 = game:GetService("HttpService")
    var_2 = game:GetService("TeleportService")
    var_3 = "https://games.roblox.com/v1/games/"
    var_4 = game.PlaceId
    var_5 = {}
    var_6 = ""
    var_7 = false
    var_1 = pcall(function_893)
    var_2 = nil
    if not (var_1) then
    end
    if not (var_2) then
        var_1 = var_1:JSONDecode(var_2)
        if not (var_1.data) then
            var_1 = pairs(var_1.data)[1]
            var_2 = pairs(var_1.data)[2]
            if not ((var_2.playing < var_2.maxPlayers)) then
            end
            if not ((var_2.id ~= game.JobId)) then
                var_7 = true
                var_2:TeleportToPlaceInstance(var_4, var_2.id)
            else
            end
            if var_1.nextPageCursor then
            end
            var_6 = ""
        end
    end
    if not (var_6) then
    end
    if var_7 then
    end
    return
end
function function_265()
    if not (task.wait(1)) then
        pcall(function_892)
    end
    return
end
function function_266(arg1)
    var_1 = arg1
    _G.AutoSaber = var_1
    return
end
function function_267()
    if not (wait(0.2)) then
        pcall(function_891)
    end
    return
end
function function_268(arg1)
    var_1 = arg1
    _G.AutoColShad = var_1
    return
end
function function_269()
    if not (wait(0.2)) then
        if not (_G.AutoColShad) then
            pcall(function_890)
        end
    end
    return
end
function function_270(arg1)
    var_1 = arg1
    _G.AutoGetUsoap = var_1
    return
end
function function_271()
    if not (task.wait(Sec)) then
        pcall(function_889)
    end
    return
end
function function_272(arg1)
    var_1 = arg1
    _G.Greybeard = var_1
    return
end
function function_273()
    if not (wait(Sec)) then
        if not (_G.Greybeard) then
            pcall(function_888)
        end
    end
    return
end
function function_274(arg1)
    var_1 = arg1
    _G.WardenBoss = var_1
    return
end
function function_275()
    if not (wait(0.1)) then
        if not (_G.WardenBoss) then
            pcall(function_887)
        end
    end
    return
end
function function_276(arg1)
    var_1 = arg1
    _G.MarinesCoat = var_1
    return
end
function function_277()
    if not (wait(0.1)) then
        if not (_G.MarinesCoat) then
            pcall(function_886)
        end
    end
    return
end
function function_278(arg1)
    var_1 = arg1
    _G.SwanCoat = var_1
    return
end
function function_279()
    if not (wait(0.1)) then
        if not (_G.SwanCoat) then
            pcall(function_885)
        end
    end
    return
end
function function_280(arg1)
    var_1 = arg1
    _G.IceBossRen = var_1
    return
end
function function_281()
    pcall(function_884)
    return
end
function function_282(arg1)
    var_1 = arg1
    _G.KeysRen = var_1
    return
end
function function_283()
    if not (wait(0.1)) then
        pcall(function_883)
    end
    return
end
function function_284(arg1)
    var_1 = arg1
    _G.AutoTridentW2 = var_1
    return
end
function function_285()
    if not (wait(0.1)) then
        pcall(function_882)
    end
    return
end
function function_286(arg1)
    var_1 = arg1
    _G.LongsWord = var_1
    return
end
function function_287()
    if not (wait(0.1)) then
        pcall(function_881)
    end
    return
end
function function_288(arg1)
    var_1 = arg1
    _G.BlackSpikey = var_1
    return
end
function function_289()
    if not (wait(0.1)) then
        if not (_G.BlackSpikey) then
            pcall(function_880)
        end
    end
    return
end
function function_290(arg1)
    var_1 = arg1
    _G.DarkBladev3 = var_1
    return
end
function function_291()
    if not (wait(Sec)) then
        pcall(function_879)
    end
    return
end
function function_292(arg1)
    var_1 = arg1
    _G.AutoEcBoss = var_1
    return
end
function function_293()
    if not (wait(Sec)) then
        pcall(function_878)
    end
    return
end
function function_294(arg1)
    var_1 = arg1
    _G.Auto_Def_DarkCoat = var_1
    return
end
function function_295()
    if not (wait(0.1)) then
        if not (_G.Auto_Def_DarkCoat) then
            pcall(function_877)
        end
    end
    return
end
function function_296(arg1)
    var_1 = arg1
    _G.Auto_DonAcces = var_1
    return
end
function function_297()
    if not (wait(0.1)) then
        if not (_G.Auto_DonAcces) then
            pcall(function_876)
        end
    end
    return
end
function function_298(arg1)
    var_1 = arg1
    _G.Auto_SwanGG = var_1
    return
end
function function_299()
    if not (wait(0.2)) then
        if not (_G.Auto_SwanGG) then
            pcall(function_875)
        end
    end
    return
end
function function_300(arg1)
    var_1 = arg1
    _G.AutoBigmom = var_1
    return
end
function function_301()
    if not (wait(Sec)) then
        if not (_G.AutoBigmom) then
            pcall(function_874)
        end
    end
    return
end
function function_302(arg1)
    var_1 = arg1
    _G.Auto_Cavender = var_1
    return
end
function function_303()
    if not (wait(Sec)) then
        pcall(function_873)
    end
    return
end
function function_304(arg1)
    var_1 = arg1
    _G.TwinHook = var_1
    return
end
function function_305()
    if not (wait(Sec)) then
        pcall(function_872)
    end
    return
end
function function_306(arg1)
    var_1 = arg1
    _G.AutoSerpentBow = var_1
    return
end
function function_307()
    if not (wait(Sec)) then
        if not (_G.AutoSerpentBow) then
            var_1 = GetConnectionEnemies("Hydra Leader")
            if not (var_1) then
                wait()
                var_13.Kill(var_1, _G.AutoSerpentBow)
                if not (_G.AutoSerpentBow) then
                    if not (var_1.Parent) then
                    end
                end
                if var_1.Humanoid.Health <= 0 then
                end
            else
                _tp(CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547))
            end
        end
    end
    return
end
function function_308(arg1)
    var_1 = arg1
    _G.AutoKilo = var_1
    return
end
function function_309()
    if not (wait(0.2)) then
        if not (_G.AutoKilo) then
            pcall(function_871)
        end
    end
    return
end
function function_310(arg1)
    var_1 = arg1
    _G.Tp_MasterA = var_1
    return
end
function function_311()
    if not (wait()) then
        if not (_G.Tp_MasterA) then
            pcall(function_870)
        end
    end
    return
end
function function_312()
    var_53.Remotes.CommF_:InvokeServer("ColorsDealer", "2")
    return
end
function function_313(arg1)
    var_1 = arg1
    _G.Auto_Rainbow_Haki = var_1
    return
end
function function_314()
    pcall(function_869)
    return
end
function function_315(arg1)
    var_1 = arg1
    _G.GetQFast = var_1
    return
end
function function_316(arg1)
    var_1 = arg1
    _G.obsFarm = var_1
    return
end
function function_317()
    if not (wait(0.2)) then
        pcall(function_868)
    end
    return
end
function function_318()
    if not (wait(0.2)) then
        pcall(function_867)
    end
    return
end
function function_319(arg1)
    var_1 = arg1
    _G.AutoKenVTWO = var_1
    return
end
function function_320()
    if not (wait(Sec)) then
        if not (_G.AutoKenVTWO) then
            pcall(function_866)
        end
    end
    return
end
function function_321(arg1)
    var_1 = arg1
    _G.Bartilo_Quest = var_1
    return
end
function function_322()
    if not (wait(0.1)) then
        pcall(function_865)
    end
    return
end
function function_323(arg1)
    var_1 = arg1
    _G.CitizenQuest = var_1
    return
end
function function_324()
    if not (wait(Sec)) then
        pcall(function_864)
    end
    return
end
function function_325(arg1)
    var_1 = arg1
    _G.DummyMan = var_1
    return
end
function function_326()
    if not (wait(Sec)) then
        if not (_G.DummyMan) then
            pcall(function_863)
        end
    end
    return
end
function function_327(arg1)
    var_1 = arg1
    _G.Auto_SuperHuman = var_1
    return
end
function function_328()
    if not (wait(Sec)) then
        pcall(function_862)
    end
    return
end
function function_329(arg1)
    var_1 = arg1
    _G.AutoDeathStep = var_1
    return
end
function function_330()
    if not (wait(Sec)) then
        if not (_G.AutoDeathStep) then
            pcall(function_861)
        end
    end
    return
end
function function_331(arg1)
    var_1 = arg1
    _G.Auto_SharkMan_Karate = var_1
    return
end
function function_332()
    if not (wait(Sec)) then
        if not (_G.Auto_SharkMan_Karate) then
            pcall(function_860)
        end
    end
    return
end
function function_333(arg1)
    var_1 = arg1
    _G.Auto_Electric_Claw = var_1
    return
end
function function_334()
    if not (wait(Sec)) then
        if not (_G.Auto_Electric_Claw) then
            pcall(function_859)
        end
    end
    return
end
function function_335(arg1)
    var_1 = arg1
    _G.AutoDragonTalon = var_1
    return
end
function function_336()
    if not (wait(Sec)) then
        if not (_G.AutoDragonTalon) then
            pcall(function_858)
        end
    end
    return
end
function function_337(arg1)
    var_1 = arg1
    _G.Auto_God_Human = var_1
    return
end
function function_338()
    if not (wait()) then
        pcall(function_857)
    end
    return
end
function function_339(arg1)
    var_1 = arg1
    _G.Snaguine = var_1
    return
end
function function_340()
    if not (wait(Sec)) then
        if not (_G.Snaguine) then
            pcall(function_856)
        end
    end
    return
end
function function_341()
    if not (wait(0.2)) then
        if workspace.Map:FindFirstChild("MysticIsland") then
            workspace.Map:FindFirstChild("MysticIsland")
        end
        if not (workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island")) then
            var_112:SetDesc("Mirage Island : True")
        else
            var_112:SetDesc("Mirage Island : False")
        end
    end
    return
end
function function_342()
    if not (wait(0.2)) then
        pcall(function_855)
    end
    return
end
function function_343(arg1)
    var_1 = arg1
    _G.FindMirage = var_1
    return
end
function function_344()
    if not (wait()) then
        if not (_G.FindMirage) then
            pcall(function_854)
        end
    end
    return
end
function function_345(arg1)
    var_1 = arg1
    _G.TPGEAR = var_1
    return
end
function function_346()
    pcall(function_853)
    return
end
function function_347(arg1)
    var_1 = arg1
    _G.can = var_1
    return
end
function function_348()
    pcall(function_852)
    return
end
function function_349(arg1)
    var_1 = arg1
    _G.Addealer = var_1
    return
end
function function_350()
    if not (wait()) then
        if not (_G.Addealer) then
            pcall(function_851)
        end
    end
    return
end
function function_351()
    var_53:WaitForChild("Remotes")
    var_53:WaitForChild("Remotes"):WaitForChild("CommF_")
    var_53:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Begin")
    var_53:WaitForChild("Remotes")
    var_53:WaitForChild("Remotes"):WaitForChild("CommF_")
    var_53:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Check")
    var_53:WaitForChild("Remotes")
    var_53:WaitForChild("Remotes"):WaitForChild("CommF_")
    var_53:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Teleport")
    var_53:WaitForChild("Remotes")
    var_53:WaitForChild("Remotes"):WaitForChild("CommF_")
    var_53:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Continue")
    return
end
function function_352(arg1)
    var_1 = arg1
    LookM = var_1
    return
end
function MoveCamtoMoon()
    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, (Lighting:GetMoonDirection() + workspace.CurrentCamera.CFrame.Position))
    var_52.Character.HumanoidRootPart.CFrame = CFrame.new(var_52.Character.HumanoidRootPart.Position, (Lighting:GetMoonDirection() + var_52.Character.HumanoidRootPart.CFrame.Position))
    return
end
function function_354()
    if not (task.wait()) then
        if not (LookM) then
            MoveCamtoMoon()
            wait(0.1)
            var_53.Remotes.CommE:FireServer("ActivateAbility")
        end
    end
    return
end
function function_355(arg1)
    var_1 = arg1
    LookMV3 = var_1
    return
end
function MoveCamtoMoon()
    var_1 = Lighting:GetMoonDirection()
    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, (workspace.CurrentCamera.CFrame.Position + var_1))
    var_52.Character.HumanoidRootPart.CFrame = CFrame.new(var_52.Character.HumanoidRootPart.Position, (var_52.Character.HumanoidRootPart.Position + var_1))
    return
end
function function_357()
    if not (task.wait(0.1)) then
        if not (LookMV3) then
            MoveCamtoMoon()
            var_53.Remotes.CommE:FireServer("ActivateAbility")
            UIS:SendKeyEvent(true, "T", false, game)
            wait(0.5)
            UIS:SendKeyEvent(false, "T", false, game)
        end
    end
    return
end
function function_358(arg1)
    var_1 = arg1
    MirageIslandESP = var_1
    if not (MirageIslandESP) then
        task.spawn(function_850)
    else
        UpdateIslandMirageESP()
    end
    return
end
function function_359(arg1)
    var_1 = arg1
    _G.AutoMysticIsland = var_1
    return
end
function function_360()
    if not (task.wait(0.1)) then
        pcall(function_849)
    end
    return
end
function function_361(arg1)
    var_1 = arg1
    _G.FarmChestM = var_1
    return
end
function function_362()
    if not (wait(0.2)) then
        if not (_G.FarmChestM) then
            pcall(function_848)
        end
    end
    return
end
function function_363(arg1)
    var_1 = arg1
    _G.HighestMirage = var_1
    return
end
function function_364()
    if not (wait(Sec)) then
        if not (_G.HighestMirage) then
            pcall(function_847)
        end
    end
    return
end
function GetQuestDracoLevel()
    var_1 = { [1] = { NPC = "Dragon Wizard", Command = "Upgrade" } }
    var_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest")
    return var_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(var_1))
end
function function_366(arg1)
    var_1 = arg1
    _G.UPGDrago = var_1
    return
end
function function_367()
    if not (wait(Sec)) then
        pcall(function_846)
    end
    return
end
function function_368(arg1)
    var_1 = arg1
    _G.DragoV1 = var_1
    return
end
function function_369()
    if not (wait(Sec)) then
        pcall(function_845)
    end
    return
end
function function_370(arg1)
    var_1 = arg1
    _G.AutoFireFlowers = var_1
    return
end
function function_371()
    if not (wait(Sec)) then
        if not (_G.AutoFireFlowers) then
            var_1 = workspace:FindFirstChild("FireFlowers")
            var_2 = GetConnectionEnemies("Forest Pirate")
            if not (var_2) then
                wait()
                var_13.Kill(var_2, _G.AutoFireFlowers)
                if not (_G.AutoFireFlowers) then
                    if not (var_2.Parent) then
                        if var_2.Humanoid.Health <= 0 then
                        end
                    end
                end
                if var_1 then
                end
            else
                _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
            end
            if not (var_1) then
                var_1 = pairs(var_1:GetChildren())[1]
                var_2 = pairs(var_1:GetChildren())[2]
                if not (var_2:IsA("Model")) then
                    var_2:IsA("Model")
                end
                if not (var_2.PrimaryPart) then
                    var_1 = var_2.PrimaryPart.Position
                    var_2 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    var_3 = (var_1 - var_2).Magnitude
                    if not ((var_3 <= 100)) then
                        vim1:SendKeyEvent(true, "E", false, game)
                        wait(1.5)
                        vim1:SendKeyEvent(false, "E", false, game)
                    else
                        _tp(CFrame.new(var_1))
                    end
                end
            end
        end
    end
    return
end
function function_372(arg1)
    var_1 = arg1
    _G.DragoV3 = var_1
    return
end
function function_373()
    if not (wait(Sec)) then
        pcall(function_844)
    end
    return
end
function function_374(arg1)
    var_1 = arg1
    _G.Relic123 = var_1
    return
end
function function_375()
    if not (wait(Sec)) then
        if not (_G.Relic123) then
            pcall(function_843)
        end
    end
    return
end
function function_376(arg1)
    var_1 = arg1
    _G.TrainDrago = var_1
    return
end
function function_377()
    if not (wait(Sec)) then
        pcall(function_842)
    end
    return
end
function function_378(arg1)
    var_1 = arg1
    _G.TpDrago_Prehis = var_1
    return
end
function function_379()
    if not (wait(Sec)) then
        if not (_G.TpDrago_Prehis) then
            var_1 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
            if not (var_1) then
            end
            if not (var_1:IsA("Part")) then
                _tp(CFrame.new(var_1.Position))
            end
        end
    end
    return
end
function function_380(arg1)
    var_1 = arg1
    _G.BuyDrago = var_1
    return
end
function function_381()
    if not (wait(Sec)) then
        if not (_G.BuyDrago) then
            pcall(function_841)
        end
    end
    return
end
function function_382(arg1)
    var_1 = arg1
    _G.DT_Uzoth = var_1
    return
end
function function_383()
    if not (wait(Sec)) then
        if not (_G.DT_Uzoth) then
            var_1 = CFrame.new(5661.89014, 1211.31909, 864.836731, 0.811413169, -1.36805838e-8, -0.584473014, 4.75227395e-8, 1, 4.25682458e-8, 0.584473014, -6.23161966e-8, 0.811413169)
            _tp(var_1)
            if not (((var_1.Position - var_52.Character.HumanoidRootPart.Position).Magnitude <= 25)) then
                var_1 = { NPC = "Uzoth", Command = "Upgrade" }
                var_53.Modules.Net["RF/InteractDragonQuest"]:InvokeServer(var_1)
            end
        end
    end
    return
end
function function_384(arg1)
    var_1 = arg1
    _G.Auto_Mink = var_1
    return
end
function function_385()
    if not (wait(Sec)) then
        pcall(function_840)
    end
    return
end
function function_386(arg1)
    var_1 = arg1
    _G.Auto_Human = var_1
    return
end
function function_387()
    if not (wait(Sec)) then
        pcall(function_839)
    end
    return
end
function function_388(arg1)
    var_1 = arg1
    _G.Auto_Skypiea = var_1
    return
end
function function_389()
    if not (wait(Sec)) then
        pcall(function_838)
    end
    return
end
function function_390(arg1)
    var_1 = arg1
    _G.Auto_Fish = var_1
    return
end
function function_391()
    if not (wait(Sec)) then
        pcall(function_837)
    end
    return
end
function function_392()
    pcall(function_836)
    return
end
function function_393(arg1)
    var_1 = arg1
    _G.Lver = var_1
    return
end
function function_394()
    if not (wait(Sec)) then
        if not (_G.Lver) then
            pcall(function_835)
        end
    end
    return
end
function function_395(arg1)
    var_1 = arg1
    _G.AcientOne = var_1
    return
end
function function_396()
    if not (wait(Sec)) then
        pcall(function_834)
    end
    return
end
function function_397()
    var_1 = game:GetService("Players").LocalPlayer
    if not (var_1.Character) then
    end
    var_2 = var_1.Character:FindFirstChild("HumanoidRootPart")
    if not (var_2) then
        var_2.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
    end
    if game:GetService("Workspace").Map:FindFirstChild("Temple of Time") then
    end
    if not (World3) then
        game:GetService("ReplicatedStorage")
        var_1 = game:GetService("ReplicatedStorage"):FindFirstChild("MapStash")
        if not (var_1) then
        end
        if not (var_1:FindFirstChild("Temple of Time")) then
            var_1["Temple of Time"].Parent = workspace.Map
        end
    end
    return
end
function function_398()
    var_1 = game:GetService("Players").LocalPlayer
    if not (var_1.Character) then
    end
    var_2 = var_1.Character:FindFirstChild("HumanoidRootPart")
    if not (var_2) then
        var_2.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
    end
    if game:GetService("Workspace").Map:FindFirstChild("Temple of Time") then
    end
    if not (World3) then
        game:GetService("ReplicatedStorage")
        var_1 = game:GetService("ReplicatedStorage"):FindFirstChild("MapStash")
        if not (var_1) then
        end
        if not (var_1:FindFirstChild("Temple of Time")) then
            var_1["Temple of Time"].Parent = workspace.Map
        end
    end
    task.wait(2)
    tween(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
    return
end
function function_399()
    var_1 = game:GetService("Players").LocalPlayer
    if not (var_1.Character) then
    end
    var_2 = var_1.Character:FindFirstChild("HumanoidRootPart")
    var_3 = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
    var_4 = CFrame.new(29549, 15069, -88)
    if not (var_2) then
        var_2.CFrame = var_3
    end
    task.delay(2, function_833)
    if workspace.Map:FindFirstChild("Temple of Time") then
    end
    if not (World3) then
        game:GetService("ReplicatedStorage")
        var_1 = game:GetService("ReplicatedStorage"):FindFirstChild("MapStash")
        if not (var_1) then
        end
        if not (var_1:FindFirstChild("Temple of Time")) then
            var_1["Temple of Time"].Parent = workspace.Map
        end
    end
    return
end
function function_400(arg1)
    var_1 = arg1
    _G.TPDoor = var_1
    return
end
function function_401()
    if not (wait(Sec)) then
        pcall(function_832)
    end
    return
end
function function_402(arg1)
    var_1 = arg1
    _G.Complete_Trials = var_1
    return
end
function GetSeaBeastTrial()
    if workspace.Map:FindFirstChild("FishmanTrial") then
        return nil
    end
    if not (workspace._WorldOrigin.Locations:FindFirstChild("Trial of Water")) then
        FishmanTrial = workspace._WorldOrigin.Locations:FindFirstChild("Trial of Water")
    end
    if not (FishmanTrial) then
        var_1 = next, workspace.SeaBeasts:GetChildren()[1]
        var_2 = next, workspace.SeaBeasts:GetChildren()[2]
        if not (var_2:FindFirstChild("HumanoidRootPart")) then
            var_2:FindFirstChild("HumanoidRootPart")
        end
        if not (((var_2.HumanoidRootPart.Position - FishmanTrial.Position).Magnitude <= 1500)) then
            if not ((var_2.Health.Value > 0)) then
                return var_2
            end
        end
    end
    return
end
function function_404()
    if not (wait(Sec)) then
        pcall(function_831)
    end
    return
end
function function_405()
    if not (wait(Sec)) then
        pcall(function_829)
    end
    return
end
function function_406()
    if not (wait(Sec)) then
        pcall(function_828)
    end
    return
end
function function_407()
    if not (wait(Sec)) then
        pcall(function_827)
    end
    return
end
function function_408()
    if not (wait(0.1)) then
        pcall(function_826)
    end
    return
end
function function_409(arg1)
    var_1 = arg1
    _G.Defeating = var_1
    return
end
function function_410()
    if not (task.wait(Sec)) then
        pcall(function_825)
    end
    return
end
function function_411()
    var_1 = { [1] = "CraftItem", [2] = "Craft", [3] = "Dragonheart" }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(var_1))
    return
end
function function_412()
    var_1 = { [1] = "CraftItem", [2] = "Craft", [3] = "Dragonstorm" }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(var_1))
    return
end
function function_413()
    var_1 = { [1] = "CraftItem", [2] = "Craft", [3] = "DinoHood" }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(var_1))
    return
end
function function_414()
    var_1 = { [1] = "CraftItem", [2] = "Craft", [3] = "TRexSkull" }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(var_1))
    return
end
function function_415()
    if not (wait(0.2)) then
        if workspace.Map:FindFirstChild("PrehistoricIsland") then
            workspace.Map:FindFirstChild("PrehistoricIsland")
        end
        if not (workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island")) then
            var_114:SetDesc("Prehistoric Island : True")
        else
            var_114:SetDesc("Prehistoric Island : False")
        end
    end
    return
end
function function_416()
    var_1 = game:GetService("ReplicatedStorage").Modules.Net["RF/Craft"]
    var_1:InvokeServer("PossibleHardcode", "Volcanic Magnet")
    return
end
function function_417(arg1)
    var_1 = arg1
    getgenv().AutoCraftVolcanic = var_1
    return
end
function function_418()
    var_1 = game:GetService("ReplicatedStorage").Modules.Net["RF/Craft"]
    if not (task.wait(0.3)) then
        if not (getgenv().AutoCraftVolcanic) then
            pcall(function_824)
            getgenv().AutoCraftVolcanic = false
        end
    end
    return
end
function function_419(arg1)
    var_1 = arg1
    _G.Prehis_Find = var_1
    return
end
function function_420()
    if not (wait(Sec)) then
        pcall(function_823)
    end
    return
end
function function_421(arg1)
    var_1 = arg1
    _G.AutoStartPrehistoric = var_1
    return
end
function function_422()
    if not (wait()) then
        if not (_G.AutoStartPrehistoric) then
            pcall(function_822)
        end
    end
    return
end
function function_423(arg1)
    var_1 = arg1
    _G.Prehis_Skills = var_1
    return
end
function function_424()
    if not (wait(0.3)) then
        if not (_G.Prehis_Skills) then
            pcall(function_821)
        end
    end
    return
end
function function_425()
    if not (wait(Sec)) then
        if not (_G.Prehis_Skills) then
            pcall(function_820)
        end
    end
    return
end
function function_426()
    if not (wait(Sec)) then
        if not (_G.Prehis_Skills) then
            pcall(function_819)
        end
    end
    return
end
function function_427(arg1)
    var_1 = arg1
    _G.KillAuraFull = var_1
    return
end
function function_428()
    if not (task.wait(var_117)) then
        if not (_G.KillAuraFull) then
            pcall(function_818)
        end
    end
    return
end
function function_429(arg1)
    var_1 = arg1
    _G.Prehis_DB = var_1
    return
end
function function_430()
    if not (wait(Sec)) then
        pcall(function_817)
    end
    return
end
function function_431(arg1)
    var_1 = arg1
    _G.Prehis_DE = var_1
    return
end
function function_432()
    if not (wait(Sec)) then
        pcall(function_816)
    end
    return
end
function function_433(arg1)
    var_1 = arg1
    _G.ResetPH = var_1
    return
end
function function_434()
    if not (wait(Sec)) then
        pcall(function_815)
    end
    return
end
function function_435()
    game:GetService("Lighting").BaseAtmosphere:Destroy()
    return
end
function function_436(arg1)
    var_1 = arg1
    getgenv().SpeedBoat = var_1
    return
end
function function_437()
    if not (getgenv().SpeedBoat) then
        var_1 = game:GetService("Players").LocalPlayer
        if not (var_1.Character) then
        end
        if not (var_1.Character:FindFirstChild("Humanoid")) then
            if not (var_1.Character.Humanoid.Sit) then
                var_1 = pairs(game:GetService("Workspace").Boats:GetChildren())[1]
                var_2 = pairs(game:GetService("Workspace").Boats:GetChildren())[2]
                var_3 = var_2:FindFirstChildWhichIsA("VehicleSeat")
                if not (var_3) then
                    var_3.MaxSpeed = SetSpeedBoat
                end
            end
        end
    end
    return
end
function function_438(arg1)
    var_1 = arg1
    SetSpeedBoat = var_1
    return
end
function function_439(arg1)
    var_1 = arg1
    getgenv().AutoPressW = var_1
    return
end
function function_440()
    if not (wait()) then
        pcall(function_814)
    end
    return
end
function function_441(arg1)
    var_1 = arg1
    getgenv().NoClipShip = var_1
    return
end
function function_442()
    if not (wait()) then
        pcall(function_813)
    end
    return
end
function function_443()
    var_1 = { [1] = "CraftItem", [2] = "Craft", [3] = "SharkTooth" }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(var_1))
    return
end
function function_444()
    var_1 = { [1] = "CraftItem", [2] = "Craft", [3] = "TerrorJaw" }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(var_1))
    return
end
function function_445()
    var_1 = { [1] = "CraftItem", [2] = "Craft", [3] = "SharkAnchor" }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(var_1))
    return
end
function function_446()
    var_1 = { [1] = "CraftItem", [2] = "Craft", [3] = "LeviathanCrown" }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(var_1))
    return
end
function function_447()
    var_1 = { [1] = "CraftItem", [2] = "Craft", [3] = "LeviathanShield" }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(var_1))
    return
end
function function_448()
    var_1 = { [1] = "CraftItem", [2] = "Craft", [3] = "LeviathanBoat" }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(var_1))
    return
end
function function_449()
    var_1 = { [1] = "CraftItem", [2] = "Craft", [3] = "LegendaryScroll" }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(var_1))
    return
end
function function_450()
    var_1 = { [1] = "CraftItem", [2] = "Craft", [3] = "MythicalScroll" }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(var_1))
    return
end
function function_451(arg1)
    var_1 = arg1
    _G.SelectedBoat = var_1
    return
end
function function_452()
    var_53.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
    return
end
function function_453(arg1)
    var_1 = arg1
    _G.DangerSc = var_1
    return
end
function function_454(arg1)
    var_1 = arg1
    _G.SailBoats = var_1
    return
end
function function_455()
    if not (wait()) then
        if not (_G.SailBoats) then
            pcall(function_812)
        end
    end
    return
end
function function_456()
    if not (wait(Sec)) then
        pcall(function_811)
    end
    return
end
function function_457(arg1)
    var_1 = arg1
    _G.Shark = var_1
    return
end
function function_458(arg1)
    var_1 = arg1
    _G.Piranha = var_1
    return
end
function function_459(arg1)
    var_1 = arg1
    _G.TerrorShark = var_1
    return
end
function function_460(arg1)
    var_1 = arg1
    _G.MobCrew = var_1
    return
end
function function_461(arg1)
    var_1 = arg1
    _G.HCM = var_1
    return
end
function function_462(arg1)
    var_1 = arg1
    _G.PGB = var_1
    return
end
function function_463(arg1)
    var_1 = arg1
    _G.FishBoat = var_1
    return
end
function function_464(arg1)
    var_1 = arg1
    _G.SeaBeast1 = var_1
    return
end
function function_465()
    if not (wait()) then
        pcall(function_806)
    end
    return
end
function function_466()
    if not (wait(0.2)) then
        if workspace.Map:FindFirstChild("KitsuneIsland") then
            workspace.Map:FindFirstChild("KitsuneIsland")
        end
        if not (workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")) then
            var_120:SetDesc("Kitsune Island : True")
        else
            var_120:SetDesc("Kitsune Island : False")
        end
    end
    return
end
function function_467(arg1)
    var_1 = arg1
    _G.AutofindKitIs = var_1
    return
end
function function_468()
    if not (wait()) then
        if not (_G.AutofindKitIs) then
            pcall(function_805)
        end
    end
    return
end
function function_469(arg1)
    var_1 = arg1
    _G.tweenShrine = var_1
    return
end
function function_470()
    if not (wait(0.1)) then
        if not (_G.tweenShrine) then
            pcall(function_804)
        end
    end
    return
end
function function_471(arg1)
    var_1 = arg1
    _G.Collect_Ember = var_1
    return
end
function function_472()
    if not (wait(0.1)) then
        if not (_G.Collect_Ember) then
            pcall(function_803)
        end
    end
    return
end
function function_473(arg1)
    var_1 = arg1
    _G.Trade_Ember = var_1
    return
end
function function_474()
    if not (wait(0.1)) then
        if not (_G.Trade_Ember) then
            pcall(function_802)
        end
    end
    return
end
function function_475()
    var_53.Modules.Net:FindFirstChild("RF/KitsuneStatuePray")
    var_53.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
    return
end
function function_476()
    var_53.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue")
    var_53.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
    return
end
function function_477()
    pcall(function_801)
    return
end
function function_478()
    if not (wait(0.2)) then
        pcall(function_800)
    end
    return
end
function function_479()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan", "2")
    return
end
function function_480(arg1)
    var_1 = arg1
    _G.FrozenTP = var_1
    return
end
function function_481()
    if not (wait(0.1)) then
        if not (_G.FrozenTP) then
            pcall(function_799)
        end
    end
    return
end
function function_482(arg1)
    var_1 = arg1
    _G.SailBoat_Hydra = var_1
    return
end
function function_483()
    if not (wait()) then
        if not (_G.SailBoat_Hydra) then
            pcall(function_798)
        end
    end
    return
end
function function_484(arg1)
    var_1 = arg1
    _G.Leviathan1 = var_1
    return
end
function function_485(arg1)
    var_1 = arg1
    var_2 = tostring(var_1)
    var_1 = var_2:gsub("^(-?%d+)(%d%d%d)", "%1,%2")
    var_2 = nil
    var_2 = var_1
    if var_2 == 0 then
    end
    return var_2
end
function function_486()
    var_1 = "Advance Fruit Stock\n"
    var_2 = pcall(function_796)
    var_3 = nil
    if not (var_2) then
    end
    if var_3 then
        var_1 = (var_1 .. "- Error while retrieving data.\n")
    else
        var_1 = false
        var_1 = pairs(var_3)[1]
        var_2 = pairs(var_3)[2]
        if not (var_2.OnSale) then
            var_1 = true
            var_1 = (var_1 .. (var_2.Name .. (" - $" .. (var_123(var_2.Price) .. "\n"))))
        end
        if var_1 then
            var_1 = (var_1 .. "- No fruit.\n")
        end
    end
    var_1 = (var_1 .. "\nNormal Fruit Stock\n")
    var_4 = pcall(function_797)
    var_5 = nil
    if not (var_4) then
    end
    if not (var_5) then
        var_1 = false
        var_1 = pairs(var_5)[1]
        var_2 = pairs(var_5)[2]
        if not (var_2.OnSale) then
            var_1 = true
            var_1 = (var_1 .. (var_2.Name .. (" - $" .. (var_123(var_2.Price) .. "\n"))))
        end
        if var_1 then
            var_1 = (var_1 .. "- No fruit.\n")
        end
    else
        var_1 = (var_1 .. "- Error while retrieving data.\n")
    end
    return var_1
end
function function_487()
    if not (task.wait(60)) then
        pcall(function_795)
    end
    return
end
function function_488()
    var_125:SetDesc(var_124())
    return
end
function function_489(arg1)
    var_1 = arg1
    _G.Random_Auto = var_1
    return
end
function function_490()
    if not (wait(Sec)) then
        pcall(function_794)
    end
    return
end
function function_491(arg1)
    var_1 = arg1
    _G.DropFruit = var_1
    return
end
function function_492()
    if not (wait(Sec)) then
        if not (_G.DropFruit) then
            pcall(function_793)
        end
    end
    return
end
function function_493(arg1)
    var_1 = arg1
    _G.StoreF = var_1
    return
end
function function_494()
    if not (wait(Sec)) then
        if not (_G.StoreF) then
            pcall(function_792)
        end
    end
    return
end
function function_495(arg1)
    var_1 = arg1
    _G.TwFruits = var_1
    return
end
function function_496()
    if not (wait(Sec)) then
        if not (_G.TwFruits) then
            pcall(function_791)
        end
    end
    return
end
function function_497(arg1)
    var_1 = arg1
    _G.InstanceF = var_1
    return
end
function function_498()
    if not (wait(Sec)) then
        if not (_G.InstanceF) then
            pcall(function_790)
        end
    end
    return
end
function function_499(arg1)
    var_1 = arg1
    getgenv().SelectFruit = var_1
    return
end
function function_500(arg1)
    var_1 = arg1
    getgenv().AutoBuyFruitSniper = var_1
    return
end
function function_501()
    pcall(function_789)
    return
end
function function_502(arg1)
    var_1 = arg1
    _G.SelectChip = var_1
    return
end
function function_503(arg1)
    var_1 = arg1
    _G.AutoSelectDungeon = var_1
    return
end
function function_504(arg1)
    var_1 = arg1
    getgenv().AutoGetFruit = var_1
    return
end
function function_505()
    if not (wait()) then
        pcall(function_788)
    end
    return
end
function function_506()
    if GetBP("Special Microchip") then
        var_53.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
    end
    return
end
function function_507()
    if not (GetBP("Special Microchip")) then
        return
    end
    var_1 = {}
    var_2 = {}
    var_1 = next, var_53:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits")[1]
    var_2 = next, var_53:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits")[2]
    if not ((var_2.Price <= 490000)) then
        table.insert(var_1, var_2.Name)
    end
    var_1 = pairs(var_1)[1]
    var_2 = pairs(var_1)[2]
    var_1 = pairs(var_1)[1]
    var_2 = pairs(var_1)[2]
    if GetBP("Special Microchip") then
        var_53.Remotes.CommF_:InvokeServer("LoadFruit", tostring(var_2))
        var_53.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
    end
    return
end
function function_508(arg1)
    var_1 = arg1
    _G.AutoChipBeli = var_1
    return
end
function function_509()
    if not (task.wait(1)) then
        if not (_G.AutoChipBeli) then
            pcall(function_787)
        end
    end
    return
end
function function_510(arg1)
    var_1 = arg1
    _G.AutoChipFruit = var_1
    return
end
function function_511()
    if not (task.wait(1)) then
        if not (_G.AutoChipFruit) then
            pcall(function_786)
        end
    end
    return
end
function function_512(arg1)
    var_1 = arg1
    _G.Auto_StartRaid = var_1
    return
end
function function_513()
    if not (task.wait(Sec)) then
        if _G.Auto_StartRaid then
        end
        pcall(function_785)
    end
    return
end
function function_514(arg1)
    var_1 = arg1
    _G.Raiding = var_1
    return
end
function function_515()
    var_1 = workspace._WorldOrigin.Locations
    var_2 = { "Island 1", "Island 2", "Island 3", "Island 4", "Island 5" }
    var_3 = nil
    if not (task.wait(0.3)) then
        if _G.Raiding then
        end
        var_1 = var_52.PlayerGui.Main.TopHUDList.RaidTimer
        if var_1.Visible then
        end
        var_2 = var_52.Character
        if var_2 then
        end
        var_3 = var_2:FindFirstChild("HumanoidRootPart")
        var_4 = var_2:FindFirstChildOfClass("Humanoid")
        if not (var_3) then
            if not (var_4) then
            end
        end
        if not ((var_4.Health <= 0)) then
        end
        if var_4.Sit then
            if var_4.PlatformStand then
            end
        end
        if not (var_3.Anchored) then
        end
        var_5 = 999999
        var_1 = ipairs(var_2)[1]
        var_2 = ipairs(var_2)[2]
        var_3 = var_1:FindFirstChild(var_2)
        if not (var_3) then
            var_1 = (var_3.Position - var_3.Position).Magnitude
            if not ((var_1 < var_5)) then
                var_5 = var_1
                var_3 = var_2
            end
        end
        if var_3 then
        end
        var_6 = var_1:FindFirstChild(var_3)
        if var_6 then
        end
        var_7 = false
        var_1 = ipairs(workspace.Enemies:GetChildren())[1]
        var_2 = ipairs(workspace.Enemies:GetChildren())[2]
        var_3 = var_2:FindFirstChild("Humanoid")
        var_4 = var_2:FindFirstChild("HumanoidRootPart")
        if not (var_3) then
            if not (var_4) then
            end
        end
        if not ((var_3.Health > 0)) then
            if not (((var_4.Position - var_6.Position).Magnitude < 450)) then
                var_7 = true
                task.wait()
                var_13.Kill(var_2, _G.Raiding)
                if not (_G.Raiding) then
                    if not (var_2.Parent) then
                    end
                end
                if var_3.Health <= 0 then
                end
            end
        end
        if var_7 then
            var_1 = table.find(var_2, var_3)
            if not (var_1) then
            end
            if not (var_2[(var_1 + 1)]) then
                var_1 = var_1:FindFirstChild(var_2[(var_1 + 1)])
                if not (var_1) then
                    var_1 = (var_1.CFrame * CFrame.new(0, 45, 120))
                    _tp(var_1)
                end
                var_3 = var_2[(var_1 + 1)]
                task.wait(1)
            end
        end
    end
    return
end
function function_516(arg1)
    var_1 = arg1
    _G.Auto_Awakener = var_1
    return
end
function function_517()
    if not (wait(Sec)) then
        pcall(function_784)
    end
    return
end
function function_518(arg1)
    var_1 = arg1
    _G.TpLab = var_1
    StopTween(_G.TpLab)
    if not (_G.TpLab) then
        wait()
        if not (_G.TpLab) then
            if not (World2) then
            end
            if not (_G.TpLab) then
                topos(CFrame.new(-6438.73535, 250.645355, -4501.50684))
            else
                if not (World3) then
                end
                if not (_G.TpLab) then
                    topos(CFrame.new(-5017.40869, 314.844055, -2823.0127, -0.925743818, 4.48217499e-8, -0.378151238, 4.55503146e-9, 1, 1.07377559e-7, 0.378151238, 9.7681621e-8, -0.925743818))
                end
            end
        end
    end
    return
end
function function_519()
    var_53.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
    return
end
function function_520()
    fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
    return
end
function function_521(arg1)
    var_1 = arg1
    getgenv().AutoBuyMicrochipLaw = var_1
    return
end
function function_522()
    if not (task.wait(1)) then
        if not (getgenv().AutoBuyMicrochipLaw) then
            pcall(function_783)
        end
    end
    return
end
function function_523(arg1)
    var_1 = arg1
    getgenv().AutoStartLawRaids = var_1
    return
end
function function_524()
    if not (task.wait(1)) then
        if not (getgenv().AutoStartLawRaids) then
            pcall(function_782)
        end
    end
    return
end
function function_525(arg1)
    var_1 = arg1
    _G.AutoLawKak = var_1
    return
end
function function_526()
    if not (wait(Sec)) then
        if not (_G.AutoLawKak) then
            pcall(function_781)
        end
    end
    return
end
function function_527()
    var_1 = var_126.Character
    if not (var_1) then
    end
    return var_1:FindFirstChild("HumanoidRootPart")
end
function function_528(arg1)
    var_1 = arg1
    _G.AutoFarmDungeon = var_1
    return
end
function function_529()
    if not (task.wait(0.15)) then
        if _G.AutoFarmDungeon then
        end
        pcall(function_780)
    end
    return
end
function function_530(arg1)
    var_1 = arg1
    _G.TPFloor1 = var_1
    return
end
function function_531()
    var_1 = var_127()
    if var_1 then
        return
    end
    var_1 = pairs(workspace.Map.Dungeon:GetChildren())[1]
    var_2 = pairs(workspace.Map.Dungeon:GetChildren())[2]
    var_3 = var_2:FindFirstChild("ExitTeleporter")
    if not (var_3) then
    end
    if not (var_3:FindFirstChild("Root")) then
        if not (((var_1.Position - var_3.Root.Position).Magnitude < 200)) then
            return var_3.Root
        end
    end
    return
end
function function_532()
    if not (task.wait(0.3)) then
        if _G.TPFloor1 then
            var_129 = false
        end
        if var_129 then
            var_1 = var_130()
            if not (var_1) then
                var_1 = (var_1.CFrame * CFrame.new(0, 3, 0))
                var_127().CFrame = var_1
                var_129 = true
            end
        end
    end
    return
end
function function_533(arg1)
    var_1 = arg1
    _G.TPFloor2 = var_1
    return
end
function function_534()
    if not (task.wait(0.3)) then
        if _G.TPFloor2 then
            var_131 = false
        end
        if not (var_131) then
        end
        var_1 = var_127()
        if var_1 then
        end
        var_1 = pairs(workspace.Map.Dungeon:GetChildren())[1]
        var_2 = pairs(workspace.Map.Dungeon:GetChildren())[2]
        var_3 = var_2:FindFirstChild("EntranceTeleporter")
        var_4 = var_2:FindFirstChild("ExitTeleporter")
        if not (var_3) then
            if not (var_4) then
                if not (var_3:FindFirstChild("Root")) then
                    var_3:FindFirstChild("Root")
                end
            end
        end
        if not (var_4:FindFirstChild("Root")) then
            if not (((var_1.Position - var_3.Root.Position).Magnitude < 100)) then
                var_1.CFrame = (var_4.Root.CFrame * CFrame.new(0, 3, 0))
                var_131 = true
            else
            end
        end
    end
    return
end
function function_535(arg1)
    var_1 = arg1
    _G.TPFloor3 = var_1
    return
end
function function_536()
    var_1 = pairs(workspace.Map.Dungeon:GetChildren())[1]
    var_2 = pairs(workspace.Map.Dungeon:GetChildren())[2]
    var_3 = tonumber(var_2.Name)
    if not (var_3) then
        if not (var_1) then
        end
    end
    if not ((var_3 > tonumber(var_1.Name))) then
        var_1 = var_2
    end
    return var_1
end
function function_537()
    if not (task.wait(0.3)) then
        if _G.TPFloor3 then
            var_132 = false
        end
        if var_132 then
            var_1 = var_133()
            if not (var_1) then
                if not (var_1:FindFirstChild("ExitTeleporter")) then
                    var_1:FindFirstChild("ExitTeleporter")
                end
            end
            if not (var_1.ExitTeleporter:FindFirstChild("Root")) then
                var_127().CFrame = (var_1.ExitTeleporter.Root.CFrame * CFrame.new(0, 3, 0))
                var_132 = true
            end
        end
    end
    return
end
function function_538(arg1)
    var_1 = arg1
    _G.TPFloor4 = var_1
    return
end
function function_539()
    var_1 = var_127()
    if var_1 then
        return
    end
    var_2 = nil
    var_3 = nil
    var_1 = pairs(workspace.Map.Dungeon:GetChildren())[1]
    var_2 = pairs(workspace.Map.Dungeon:GetChildren())[2]
    var_3 = var_2:FindFirstChild("ExitTeleporter")
    if not (var_3) then
    end
    if not (var_3:FindFirstChild("Root")) then
        var_1 = (var_1.Position - var_3.Root.Position).Magnitude
        if not ((var_1 < var_3)) then
            var_3 = var_1
            var_2 = var_3.Root
        end
    end
    return var_2
end
function function_540()
    if not (task.wait(0.3)) then
        if _G.TPFloor4 then
            var_134 = false
        end
        if var_134 then
            var_1 = var_135()
            if not (var_1) then
                var_127().CFrame = (var_1.CFrame * CFrame.new(0, 3, 0))
                var_134 = true
            end
        end
    end
    return
end
function function_541()
    if not (wait(Sec)) then
        pcall(function_779)
    end
    return
end
function Checking_AimStatus()
    if not (_G.AimCam) then
        return "Aimbot Camera"
    end
    if not (_G.AimbotGun) then
        return "Aimbot Guns"
    end
    return ""
end
function function_543()
    if not (wait(0.2)) then
        pcall(function_778)
    end
    return
end
function function_544(arg1)
    var_1 = arg1
    _G.PlayersList = var_1
    return
end
function function_545(arg1)
    var_1 = arg1
    _G.TpPly = var_1
    spawn(function_776)
    return
end
function function_546(arg1)
    var_1 = arg1
    SpectatePlys = var_1
    spawn(function_775)
    return
end
function function_547(arg1)
    var_1 = arg1
    ABmethod = var_1
    return
end
function function_548(arg1)
    var_1 = arg1
    _G.AimMethod = var_1
    return
end
function function_549()
    if not (wait()) then
        pcall(function_774)
    end
    return
end
function function_550()
    if not (wait()) then
        pcall(function_773)
    end
    return
end
function function_551(arg1)
    var_1 = arg1
    _G.AimCam = var_1
    return
end
function function_552()
    if not (task.wait(Sec)) then
        pcall(function_771)
    end
    return
end
function function_553()
    pcall(function_770)
    return
end
function function_554(arg1)
    var_1 = arg1
    _G.AutoReceivePlayerQuest = var_1
    return
end
function function_555()
    if not (task.wait(1)) then
        if not (_G.AutoReceivePlayerQuest) then
            pcall(function_769)
        end
    end
    return
end
function function_556(arg1)
    var_1 = arg1
    _G.AutoPlayerHunter = var_1
    return
end
function function_557()
    if not (task.wait()) then
        if not (_G.AutoPlayerHunter) then
            if not ((game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false)) then
                task.wait(0.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
            else
                var_1 = pairs(game:GetService("Workspace").Characters:GetChildren())[1]
                var_2 = pairs(game:GetService("Workspace").Characters:GetChildren())[2]
                if not (string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, var_2.Name)) then
                    task.wait()
                    if not (AutoHaki) then
                        AutoHaki()
                    end
                    if not (EquipWeapon) then
                        EquipWeapon(_G.SelectWeapon)
                    end
                    Useskill = true
                    _tp((var_2.HumanoidRootPart.CFrame * CFrame.new(1, 7, 3)))
                    var_2.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    game:GetService("VirtualUser")
                    game:GetService("VirtualUser"):CaptureController()
                    game:GetService("VirtualUser")
                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                    if _G.AutoPlayerHunter == false then
                    end
                    if var_2.Humanoid.Health <= 0 then
                    end
                    Useskill = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
            end
        end
    end
    return
end
function function_558(arg1)
    var_1 = arg1
    _G.AutoPvP = var_1
    return
end
function function_559()
    if not (task.wait(0.5)) then
        if not (_G.AutoPvP) then
            var_1 = game.Players.LocalPlayer.PlayerGui
            if not (var_1) then
                if not (var_1.Main) then
                end
            end
            if not (var_1.Main:FindFirstChild("PvpDisabled")) then
                if not (var_1.Main.PvpDisabled.Visible) then
                    pcall(function_768)
                end
            end
        end
    end
    return
end
function function_560(arg1)
    var_1 = arg1
    _G.SafeMode = var_1
    return
end
function function_561()
    if not (task.wait(0.1)) then
        if not (_G.SafeMode) then
            var_1 = game.Players.LocalPlayer.Character
            if not (var_1) then
            end
            var_2 = var_1:FindFirstChild("HumanoidRootPart")
            if not (var_2) then
                var_1 = (var_2.CFrame * CFrame.new(0, 1000, 0))
                _tp(var_1)
            end
        end
    end
    return
end
function function_562()
    var_1 = function_766
    var_2 = var_141.Heartbeat:Connect(function_767)
    return
end
function function_563(arg1)
    var_1 = arg1
    var_143 = var_1
    if not (var_143) then
        if var_142.Character then
            return
        end
        var_1 = var_142.Character:FindFirstChildOfClass("Humanoid")
        if not (var_142.Character:FindFirstChild("Torso")) then
            var_2 = var_142.Character.Torso
        else
            var_2 = var_142.Character.UpperTorso
        end
        if not (var_1) then
        end
        if var_2 then
            return
        end
        var_1 = ipairs(var_142.Character:GetDescendants())[1]
        var_2 = ipairs(var_142.Character:GetDescendants())[2]
        if not (var_2:IsA("BasePart")) then
            var_2.CanCollide = false
            var_2.Massless = true
        end
        var_3 = var_142.Character.DescendantAdded:Connect(function_764)
        var_147 = Instance.new("BodyGyro", var_2)
        var_147.P = 90000
        var_147.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
        var_147.cframe = var_2.CFrame
        var_148 = Instance.new("BodyVelocity", var_2)
        var_148.velocity = Vector3.new(0, 0, 0)
        var_148.maxForce = Vector3.new(9000000000, 9000000000, 9000000000)
        var_1.PlatformStand = true
        var_149()
        var_145 = var_141.Heartbeat:Connect(function_765)
    else
        if not (var_145) then
            var_145:Disconnect()
            var_145 = nil
        end
        if not (var_142.Character) then
            var_1 = var_142.Character:FindFirstChildOfClass("Humanoid")
            if not (var_1) then
                var_1.PlatformStand = false
            end
            var_1 = ipairs(var_142.Character:GetDescendants())[1]
            var_2 = ipairs(var_142.Character:GetDescendants())[2]
            if not (var_2:IsA("BasePart")) then
                var_2.CanCollide = true
                var_2.Massless = false
            end
            if not (var_147) then
                var_147:Destroy()
            end
            if not (var_148) then
                var_148:Destroy()
            end
        end
        var_146 = { f = 0, b = 0, l = 0, r = 0 }
    end
    return
end
function function_564(arg1)
    var_1 = arg1
    var_144 = var_1
    return
end
function function_565(arg1)
    var_1 = arg1
    wait(1)
    if not (var_143) then
        var_150(false)
        wait(0.1)
        var_150(true)
    end
    return
end
function function_566(arg1)
    var_1 = arg1
    var_150(var_1)
    return
end
function function_567(arg1)
    var_1 = arg1
    var_151(var_1)
    return
end
function function_568(arg1)
    var_1 = arg1
    getgenv().DodgeNoCD = var_1
    return
end
function function_569()
    var_1 = game.Players.LocalPlayer.Character:WaitForChild("Dodge")
    var_1 = next, getgc()[1]
    var_2 = next, getgc()[2]
    if not ((typeof(var_2) == "function")) then
        var_1 = getfenv(var_2)
        if not ((var_1.script == var_1)) then
            var_1 = next, getupvalues(var_2)[1]
            var_2 = next, getupvalues(var_2)[2]
            if not ((tostring(var_2) == "0.4")) then
                setupvalue(var_2, var_1, 0)
            end
        end
    end
    return
end
function function_570(arg1)
    var_1 = arg1
    InfAblities = var_1
    return
end
function function_571()
    if not (wait(0.2)) then
        pcall(function_763)
    end
    return
end
function function_572(arg1)
    var_1 = arg1
    infEnergy = var_1
    if not (var_1) then
        getInfinity_Ability("Energy", infEnergy)
    end
    return
end
function function_573(arg1)
    var_1 = arg1
    _G.InfSoru = var_1
    if not (var_1) then
        getInfinity_Ability("Soru", _G.InfSoru)
    end
    return
end
function function_574(arg1)
    var_1 = arg1
    _G.InfiniteObRange = var_1
    if not (var_1) then
        getInfinity_Ability("Observation", _G.InfiniteObRange)
    end
    return
end
function function_575(arg1)
    var_1 = arg1
    _G.NoAimTeam = var_1
    return
end
function function_576(arg1)
    var_1 = arg1
    _G.AcceptAlly = var_1
    return
end
function function_577()
    if not (wait(Sec)) then
        if not (_G.AcceptAlly) then
            pcall(function_762)
        end
    end
    return
end
function isnil(arg1)
    var_1 = arg1
    return (var_1 == nil)
end
function function_579(arg1)
    var_1 = arg1
    return math.floor((tonumber(var_1) + 0.5))
end
function EspPly()
    var_1 = next, game.Players:GetChildren()[1]
    var_2 = next, game.Players:GetChildren()[2]
    pcall(function_761)
    return
end
function LocationEsp()
    var_1 = next, workspace._WorldOrigin.Locations:GetChildren()[1]
    var_2 = next, workspace._WorldOrigin.Locations:GetChildren()[2]
    pcall(function_760)
    return
end
function DevEsp()
    var_1 = next, workspace:GetChildren()[1]
    var_2 = next, workspace:GetChildren()[2]
    pcall(function_759)
    return
end
function flowerEsp()
    var_1 = pairs(workspace:GetChildren())[1]
    var_2 = pairs(workspace:GetChildren())[2]
    pcall(function_758)
    return
end
function EventIslandEsp()
    var_1 = pairs(workspace._WorldOrigin.Locations:GetChildren())[1]
    var_2 = pairs(workspace._WorldOrigin.Locations:GetChildren())[2]
    pcall(function_757)
    return
end
function gearEsp()
    var_1 = pairs(workspace.Map.MysticIsland:GetDescendants())[1]
    var_2 = pairs(workspace.Map.MysticIsland:GetDescendants())[2]
    pcall(function_756)
    return
end
function AdvanFruitEsp()
    if not (advanEsp) then
        var_1 = pairs(var_155.NPCs:GetChildren())[1]
        var_2 = pairs(var_155.NPCs:GetChildren())[2]
        if not ((var_2.Name == "Advanced Fruit Dealer")) then
            if workspace:FindFirstChild("Adv") then
                Adv = Instance.new("Part")
                Adv.Name = "Adv"
                Adv.Transparency = 1
                Adv.Size = Vector3.new(1, 1, 1)
                Adv.Anchored = true
                Adv.CanCollide = false
                Adv.Parent = workspace
                Adv.CFrame = var_2.HumanoidRootPart.CFrame
            else
                if not (workspace:FindFirstChild("Adv")) then
                    if Adv:FindFirstChild("NameEsp") then
                        var_1 = Instance.new("BillboardGui", Adv)
                        var_1.Name = "NameEsp"
                        var_1.ExtentsOffset = Vector3.new(0, 1, 0)
                        var_1.Size = UDim2.new(1, 200, 1, 30)
                        var_1.Adornee = Adv
                        var_1.AlwaysOnTop = true
                        var_2 = Instance.new("TextLabel", var_1)
                        var_2.Font = "Code"
                        var_2.FontSize = "Size14"
                        var_2.TextWrapped = true
                        var_2.Size = UDim2.new(1, 0, 1, 0)
                        var_2.TextYAlignment = "Top"
                        var_2.BackgroundTransparency = 1
                        var_2.TextStrokeTransparency = 0.5
                        var_2.TextColor3 = Color3.fromRGB(80, 245, 245)
                        var_2.Text = (var_2.Name .. ("   \n" .. (var_153(((var_154.Character.Head.Position - var_2.HumanoidRootPart.Position).Magnitude / 3)) .. " M")))
                    else
                        Adv.NameEsp.TextLabel.Text = (var_2.Name .. ("   \n" .. (var_153(((var_154.Character.Head.Position - var_2.HumanoidRootPart.Position).Magnitude / 3)) .. " M")))
                    end
                end
            end
        end
    else
        if not (workspace:FindFirstChild("Adv")) then
            workspace:FindFirstChild("Adv")
            workspace:FindFirstChild("Adv"):Destroy()
        end
    end
    return
end
function HakiClorEsp()
    if not (ColorEsp) then
        var_1 = pairs(var_155.NPCs:GetChildren())[1]
        var_2 = pairs(var_155.NPCs:GetChildren())[2]
        if not ((var_2.Name == "Barista Cousin")) then
            if workspace:FindFirstChild("Gay") then
                Gay = Instance.new("Part")
                Gay.Name = "Gay"
                Gay.Transparency = 1
                Gay.Size = Vector3.new(1, 1, 1)
                Gay.Anchored = true
                Gay.CanCollide = false
                Gay.Parent = workspace
                Gay.CFrame = var_2.HumanoidRootPart.CFrame
            else
                if not (workspace:FindFirstChild("Gay")) then
                    if Gay:FindFirstChild("NameEsp") then
                        var_1 = Instance.new("BillboardGui", Gay)
                        var_1.Name = "NameEsp"
                        var_1.ExtentsOffset = Vector3.new(0, 1, 0)
                        var_1.Size = UDim2.new(1, 200, 1, 30)
                        var_1.Adornee = Gay
                        var_1.AlwaysOnTop = true
                        var_2 = Instance.new("TextLabel", var_1)
                        var_2.Font = "Code"
                        var_2.FontSize = "Size14"
                        var_2.TextWrapped = true
                        var_2.Size = UDim2.new(1, 0, 1, 0)
                        var_2.TextYAlignment = "Top"
                        var_2.BackgroundTransparency = 1
                        var_2.TextStrokeTransparency = 0.5
                        var_2.TextColor3 = Color3.fromRGB(80, 245, 245)
                        var_2.Text = (var_2.Name .. ("   \n" .. (var_153(((var_154.Character.Head.Position - var_2.HumanoidRootPart.Position).Magnitude / 3)) .. " M")))
                    else
                        Gay.NameEsp.TextLabel.Text = (var_2.Name .. ("   \n" .. (var_153(((var_154.Character.Head.Position - var_2.HumanoidRootPart.Position).Magnitude / 3)) .. " M")))
                    end
                end
            end
        end
    else
        if not (workspace:FindFirstChild("Gay")) then
            workspace:FindFirstChild("Gay")
            workspace:FindFirstChild("Gay"):Destroy()
        end
    end
    return
end
function LegenSword()
    if not (LegenS) then
        var_1 = pairs(var_155.NPCs:GetChildren())[1]
        var_2 = pairs(var_155.NPCs:GetChildren())[2]
        if not ((var_2.Name == "Legendary Sword Dealer")) then
            if workspace:FindFirstChild("Lgd") then
                Lgd = Instance.new("Part")
                Lgd.Name = "Lgd"
                Lgd.Transparency = 1
                Lgd.Size = Vector3.new(1, 1, 1)
                Lgd.Anchored = true
                Lgd.CanCollide = false
                Lgd.Parent = workspace
                Lgd.CFrame = var_2.HumanoidRootPart.CFrame
            else
                if not (workspace:FindFirstChild("Lgd")) then
                    if Lgd:FindFirstChild("NameEsp") then
                        var_1 = Instance.new("BillboardGui", Lgd)
                        var_1.Name = "NameEsp"
                        var_1.ExtentsOffset = Vector3.new(0, 1, 0)
                        var_1.Size = UDim2.new(1, 200, 1, 30)
                        var_1.Adornee = Lgd
                        var_1.AlwaysOnTop = true
                        var_2 = Instance.new("TextLabel", var_1)
                        var_2.Font = "Code"
                        var_2.FontSize = "Size14"
                        var_2.TextWrapped = true
                        var_2.Size = UDim2.new(1, 0, 1, 0)
                        var_2.TextYAlignment = "Top"
                        var_2.BackgroundTransparency = 1
                        var_2.TextStrokeTransparency = 0.5
                        var_2.TextColor3 = Color3.fromRGB(80, 245, 245)
                        var_2.Text = (var_2.Name .. ("   \n" .. (var_153(((var_154.Character.Head.Position - var_2.HumanoidRootPart.Position).Magnitude / 3)) .. " M")))
                    else
                        Lgd.NameEsp.TextLabel.Text = (var_2.Name .. ("   \n" .. (var_153(((var_154.Character.Head.Position - var_2.HumanoidRootPart.Position).Magnitude / 3)) .. " M")))
                    end
                end
            end
        end
    else
        if not (workspace:FindFirstChild("Lgd")) then
            workspace:FindFirstChild("Lgd")
            workspace:FindFirstChild("Lgd"):Destroy()
        end
    end
    return
end
function ChestEsp()
    if not (ChestESP) then
        var_1 = game:GetService("CollectionService")
        var_2 = var_1:GetTagged("_ChestTagged")
        var_1 = ipairs(var_2)[1]
        var_2 = ipairs(var_2)[2]
        pcall(function_755)
    else
        game:GetService("CollectionService")
        var_1 = ipairs(game:GetService("CollectionService"):GetTagged("_ChestTagged"))[1]
        var_2 = ipairs(game:GetService("CollectionService"):GetTagged("_ChestTagged"))[2]
        var_3 = var_2:FindFirstChild("ChestEspAttachment")
        if not (var_3) then
            var_3:Destroy()
        end
    end
    return
end
function berriesEsp()
    if not (BerryEsp) then
        var_1 = game:GetService("CollectionService")
        var_2 = var_1:GetTagged("BerryBush")
        var_1 = ipairs(var_2)[1]
        var_2 = ipairs(var_2)[2]
        pcall(function_754)
    else
        var_1 = ipairs(workspace:GetChildren())[1]
        var_2 = ipairs(workspace:GetChildren())[2]
        if not (var_2:IsA("Part")) then
            var_2:IsA("Part")
        end
        if not (var_2.Name:match("BerryEspPart_.*")) then
            var_2:Destroy()
        end
    end
    return
end
function function_591(arg1)
    var_1 = arg1
    BerryEsp = var_1
    if var_1 then
        var_1 = ipairs(workspace:GetChildren())[1]
        var_2 = ipairs(workspace:GetChildren())[2]
        if not (var_2:IsA("Part")) then
            var_2:IsA("Part")
        end
        if not (var_2.Name:match("BerryEspPart_.*")) then
            var_2:Destroy()
        end
    else
        task.spawn(function_753)
    end
    return
end
function function_592(arg1)
    var_1 = arg1
    PlayerEsp = var_1
    if var_1 then
        var_1 = next, game.Players:GetChildren()[1]
        var_2 = next, game.Players:GetChildren()[2]
        pcall(function_751)
    else
        task.spawn(function_752)
    end
    return
end
function function_593(arg1)
    var_1 = arg1
    ChestESP = var_1
    if var_1 then
        game:GetService("CollectionService")
        var_1 = ipairs(game:GetService("CollectionService"):GetTagged("_ChestTagged"))[1]
        var_2 = ipairs(game:GetService("CollectionService"):GetTagged("_ChestTagged"))[2]
        var_3 = var_2:FindFirstChild("ChestEspAttachment")
        if not (var_3) then
            var_3:Destroy()
        end
    else
        task.spawn(function_750)
    end
    return
end
function function_594(arg1)
    var_1 = arg1
    DevilFruitESP = var_1
    if var_1 then
        var_1 = next, workspace:GetChildren()[1]
        var_2 = next, workspace:GetChildren()[2]
        pcall(function_748)
    else
        task.spawn(function_749)
    end
    return
end
function function_595(arg1)
    var_1 = arg1
    IslandESP = var_1
    if var_1 then
        var_1 = next, workspace._WorldOrigin.Locations:GetChildren()[1]
        var_2 = next, workspace._WorldOrigin.Locations:GetChildren()[2]
        pcall(function_746)
    else
        task.spawn(function_747)
    end
    return
end
function function_596(arg1)
    var_1 = arg1
    FlowerESP = var_1
    if var_1 then
        var_1 = pairs(workspace:GetChildren())[1]
        var_2 = pairs(workspace:GetChildren())[2]
        pcall(function_744)
    else
        task.spawn(function_745)
    end
    return
end
function function_597(arg1)
    var_1 = arg1
    LegenS = var_1
    if var_1 then
        if not (workspace:FindFirstChild("Lgd")) then
            workspace:FindFirstChild("Lgd")
            workspace:FindFirstChild("Lgd"):Destroy()
        end
    else
        task.spawn(function_743)
    end
    return
end
function function_598(arg1)
    var_1 = arg1
    ColorEsp = var_1
    if var_1 then
        if not (workspace:FindFirstChild("Gay")) then
            workspace:FindFirstChild("Gay")
            workspace:FindFirstChild("Gay"):Destroy()
        end
    else
        task.spawn(function_742)
    end
    return
end
function function_599(arg1)
    var_1 = arg1
    ESPGear = var_1
    if var_1 then
        var_1 = pairs(workspace.Map.MysticIsland:GetDescendants())[1]
        var_2 = pairs(workspace.Map.MysticIsland:GetDescendants())[2]
        pcall(function_740)
    else
        task.spawn(function_741)
    end
    return
end
function function_600(arg1)
    var_1 = arg1
    EspEventIsland = var_1
    if var_1 then
        var_1 = pairs(workspace._WorldOrigin.Locations:GetChildren())[1]
        var_2 = pairs(workspace._WorldOrigin.Locations:GetChildren())[2]
        pcall(function_738)
    else
        task.spawn(function_739)
    end
    return
end
function function_601(arg1)
    var_1 = arg1
    advanEsp = var_1
    if var_1 then
        if not (workspace:FindFirstChild("Adv")) then
            workspace:FindFirstChild("Adv")
            workspace:FindFirstChild("Adv"):Destroy()
        end
    else
        task.spawn(function_737)
    end
    return
end
function function_602()
    var_155.Remotes.CommF_:InvokeServer("TravelMain")
    return
end
function function_603()
    var_155.Remotes.CommF_:InvokeServer("TravelDressrosa")
    return
end
function function_604()
    var_155.Remotes.CommF_:InvokeServer("TravelZou")
    return
end
function function_605(arg1)
    var_1 = arg1
    _G.Island = var_1
    return
end
function function_606(arg1)
    var_1 = arg1
    _G.Teleport = var_1
    if not (var_1) then
        var_1 = pairs(workspace._WorldOrigin.Locations:GetChildren())[1]
        var_2 = pairs(workspace._WorldOrigin.Locations:GetChildren())[2]
        if not ((var_2.Name == _G.Island)) then
            wait()
            _tp((var_2.CFrame * CFrame.new(0, 30, 0)))
            if not (_G.Teleport) then
            end
            if Root.CFrame == var_2.CFrame then
            end
        end
    end
    return
end
function function_607(arg1)
    var_1 = arg1
    _G.Island_PT = var_1
    return
end
function function_608()
    if not ((_G.Island_PT == "Sky")) then
        var_155.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894, 5547, -380))
    else
        if not ((_G.Island_PT == "UnderWater")) then
            var_155.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163, 11, 1819))
        else
            if not ((_G.Island_PT == "SwanRoom")) then
                var_155.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2285, 15, 905))
            else
                if not ((_G.Island_PT == "Cursed Ship")) then
                    var_155.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923, 126, 32852))
                else
                    if not ((_G.Island_PT == "Castle On The Sea")) then
                        var_155.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743e-8, 0.914313197, -1.90943332e-8, 1, 3.8755779e-8, -0.914313197, -1.76180437e-9, -0.405007899))
                    else
                        if not ((_G.Island_PT == "Mansion Cafe")) then
                            var_155.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
                        else
                            if not ((_G.Island_PT == "Hydra Teleport")) then
                                var_155.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625))
                            else
                                if not ((_G.Island_PT == "Canvendish Room")) then
                                    var_155.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5314.54638671875, 22.562219619750977, -127.06755065917969))
                                else
                                    if not ((_G.Island_PT == "Temple of Time")) then
                                        var_155.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28310.0234, 14895.1123, 109.456741, -0.469690144, -2.85620132e-8, -0.882831335, -3.23509219e-8, 1, -1.51411736e-8, 0.882831335, 2.14487486e-8, -0.469690144))
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return
end
function function_609(arg1)
    var_1 = arg1
    NPClist = var_1
    return
end
function function_610(arg1)
    var_1 = arg1
    _G.TPNpc = var_1
    return
end
function function_611()
    if not (wait(Sec)) then
        if not (_G.TPNpc) then
            pcall(function_736)
        end
    end
    return
end
function function_612()
    var_155.Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
    return
end
function function_613()
    var_155.Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
    return
end
function function_614()
    var_155.Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
    return
end
function function_615()
    var_155.Remotes.CommF_:InvokeServer("KenTalk", "Buy")
    return
end
function function_616()
    var_155.Remotes.CommF_:InvokeServer("BuyBlackLeg")
    return
end
function function_617()
    var_155.Remotes.CommF_:InvokeServer("BuyElectro")
    return
end
function function_618()
    var_155.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    return
end
function function_619()
    var_155.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
    return
end
function function_620()
    var_155.Remotes.CommF_:InvokeServer("BuySuperhuman")
    return
end
function function_621()
    var_155.Remotes.CommF_:InvokeServer("BuyDeathStep")
    return
end
function function_622()
    var_155.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    return
end
function function_623()
    var_155.Remotes.CommF_:InvokeServer("BuyElectricClaw")
    return
end
function function_624()
    var_155.Remotes.CommF_:InvokeServer("BuyDragonTalon")
    return
end
function function_625()
    var_155.Remotes.CommF_:InvokeServer("BuyGodhuman")
    return
end
function function_626()
    var_155.Remotes.CommF_:InvokeServer("BuySanguineArt")
    return
end
function function_627()
    var_155.Remotes.CommF_:InvokeServer("BuyItem", "Tomoe Ring")
    return
end
function function_628()
    var_155.Remotes.CommF_:InvokeServer("BuyItem", "Black Cape")
    return
end
function function_629()
    var_155.Remotes.CommF_:InvokeServer("BuyItem", "Swordsman Hat")
    return
end
function function_630()
    var_155.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 1)
    return
end
function function_631()
    var_155.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 2)
    return
end
function function_632()
    var_155.Remotes.CommF_:InvokeServer("BuyItem", "Cutlass")
    return
end
function function_633()
    var_155.Remotes.CommF_:InvokeServer("BuyItem", "Katana")
    return
end
function function_634()
    var_155.Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace")
    return
end
function function_635()
    var_155.Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana")
    return
end
function function_636()
    var_155.Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana")
    return
end
function function_637()
    var_155.Remotes.CommF_:InvokeServer("BuyItem", "Pipe")
    return
end
function function_638()
    var_155.Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade")
    return
end
function function_639()
    var_155.Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
    return
end
function function_640()
    var_155.Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane")
    return
end
function function_641()
    var_155.Remotes.CommF_:InvokeServer("BuyItem", "Slingshot")
    return
end
function function_642()
    var_155.Remotes.CommF_:InvokeServer("BuyItem", "Musket")
    return
end
function function_643()
    var_155.Remotes.CommF_:InvokeServer("BuyItem", "Dual Flintlock")
    return
end
function function_644()
    var_155.Remotes.CommF_:InvokeServer("BuyItem", "Flintlock")
    return
end
function function_645()
    var_155.Remotes.CommF_:InvokeServer("BuyItem", "Refined Flintlock")
    return
end
function function_646()
    var_155.Remotes.CommF_:InvokeServer("BuyItem", "Cannon")
    return
end
function function_647()
    var_155.Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2")
    return
end
function function_648()
    var_155.Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
    return
end
function function_649()
    var_155.Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
    return
end
function function_650()
    var_155.Remotes.CommF_:InvokeServer("Ectoplasm", " Change", 4)
    return
end
function function_651()
    var_155.Remotes.CommF_:InvokeServer("CyborgTrainer", " Buy")
    return
end
function function_652()
    _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
    var_1 = Vector3.new(5814.42724609375, 1208.3267822265625, 884.5785522460938)
    var_2 = game.Players.LocalPlayer
    if var_2.Character then
    end
    var_3 = var_2.CharacterAdded:Wait()
    wait()
    if (var_3.HumanoidRootPart.Position - var_1).Magnitude < 1 then
    end
    var_4 = { [1] = { NPC = "Dragon Wizard", Command = "DragonRace" } }
    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest")
    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(var_4))
    return
end
function function_653()
    var_1 = { "LIGHTNINGABUSE", "1LOSTADMIN", "ADMINFIGHT", "GIFTING_HOURS", "NOMOREHACK", "BANEXPLOIT", "WildDares", "BossBuild", "GetPranked", "EARN_FRUITS", "SUB2GAMERROBOT_RESET1", "KITT_RESET", "Bignews", "CHANDLER", "Fudd10", "fudd10_v2", "Sub2UncleKizaru", "FIGHT4FRUIT", "kittgaming", "TRIPLEABUSE", "Sub2CaptainMaui", "Sub2Fer999", "Enyu_is_Pro", "Magicbus", "JCWK", "Starcodeheo", "Bluxxy", "SUB2GAMERROBOT_EXP1", "Sub2NoobMaster123", "Sub2Daigrock", "Axiore", "TantaiGaming", "StrawHatMaine", "Sub2OfficialNoobie", "TheGreatAce", "JULYUPDATE_RESET", "ADMINHACKED", "SEATROLLING", "24NOADMIN", "ADMIN_TROLL", "NEWTROLL", "SECRET_ADMIN", "staffbattle", "NOEXPLOIT", "NOOB2ADMIN", "CODESLIDE", "fruitconcepts", "krazydares" }
    var_2 = game:GetService("ReplicatedStorage")
    var_3 = var_2:WaitForChild("Remotes")
    var_4 = var_3:FindFirstChild("Redeem")
    if var_4 then
        return
    end
    var_1 = ipairs(var_1)[1]
    var_2 = ipairs(var_1)[2]
    task.wait(0)
    pcall(function_735)
    return
end
function function_654()
    game:GetService("TeleportService")
    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    return
end
function function_655()
    task.spawn(function_732)
    return
end
function function_656()
    var_1 = game:GetService("HttpService")
    var_2 = game:GetService("TeleportService")
    var_3 = "https://games.roblox.com/v1/games/"
    var_4 = game.PlaceId
    var_5 = (var_3 .. (var_4 .. "/servers/Public?sortOrder=Asc&limit=100"))
    ListServers = function_731
    var_1 = ListServers(var_7)
    var_6 = var_1.data[1]
    var_7 = var_1.nextPageCursor
    if var_6 then
    end
    var_2:TeleportToPlaceInstance(var_4, var_6.id, var_154)
    return
end
function function_657()
    var_1 = game:GetService("HttpService")
    var_2 = game:GetService("TeleportService")
    var_3 = game:GetService("Stats")
    var_4 = function_729
    var_5 = game.PlaceId
    var_6 = 100
    var_7 = var_4(var_5, var_6)
    if var_7 then
        return
    end
    var_8 = var_7[1]
    var_1 = pairs(var_7)[1]
    var_2 = pairs(var_7)[2]
    if not ((var_2.ping < var_8.ping)) then
    end
    if not ((var_2.maxPlayers > var_2.playing)) then
        var_8 = var_2
    end
    var_9 = 0.5
    task.wait(var_9)
    var_10 = 100
    var_11 = var_3.Network.ServerStatsItem
    var_12 = var_11["Data Ping"]:GetValueString()
    var_13 = tonumber(var_12:match("(%d+)"))
    if not ((var_13 >= var_10)) then
        var_2:TeleportToPlaceInstance(var_5, var_8.id)
    end
    return
end
function function_658(arg1)
    var_1 = arg1
    getgenv().Job = var_1
    return
end
function function_659()
    if not (getgenv().Job) then
    end
    if not ((getgenv().Job ~= "")) then
        game:GetService("TeleportService")
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, getgenv().Job, game.Players.LocalPlayer)
    end
    return
end
function function_660()
    setclipboard(tostring(game.JobId))
    return
end
function function_661()
    var_154.PlayerGui.Main.AwakeningToggler.Visible = true
    return
end
function function_662()
    var_157.Remotes.CommF_:InvokeServer("getTitles", true)
    var_154.PlayerGui.Main.Titles.Visible = true
    return
end
function function_663(arg1)
    var_1 = arg1
    _G.Rechat = var_1
    if not ((_G.Rechat == true)) then
        var_1 = game:GetService("StarterGui")
        var_1:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
    else
        if not ((_G.chat == false)) then
            var_1 = game:GetService("StarterGui")
            var_1:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
        end
    end
    return
end
function function_664(arg1)
    var_1 = arg1
    ReLeader = var_1
    if not ((ReLeader == true)) then
        var_1 = game:GetService("StarterGui")
        var_1:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
    else
        if not ((ReLeader == false)) then
            var_1 = game:GetService("StarterGui")
            var_1:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
        end
    end
    return
end
function function_665()
    Pirates()
    return
end
function function_666()
    Marines()
    return
end
function function_667(arg1)
    var_1 = arg1
    _G.PortalUnLock = var_1
    return
end
function function_668()
    if not (wait(Sec)) then
        pcall(function_728)
    end
    return
end
function function_669(arg1)
    var_1 = arg1
    _G.SelectStateHaki = var_1
    return
end
function function_670()
    if not ((_G.SelectStateHaki == "State 0")) then
        var_157.Remotes.CommF_:InvokeServer("ChangeBusoStage", 0)
    else
        if not ((_G.SelectStateHaki == "State 1")) then
            var_157.Remotes.CommF_:InvokeServer("ChangeBusoStage", 1)
        else
            if not ((_G.SelectStateHaki == "State 2")) then
                var_157.Remotes.CommF_:InvokeServer("ChangeBusoStage", 2)
            else
                if not ((_G.SelectStateHaki == "State 3")) then
                    var_157.Remotes.CommF_:InvokeServer("ChangeBusoStage", 3)
                else
                    if not ((_G.SelectStateHaki == "State 4")) then
                        var_157.Remotes.CommF_:InvokeServer("ChangeBusoStage", 4)
                    else
                        if not ((_G.SelectStateHaki == "State 5")) then
                            var_157.Remotes.CommF_:InvokeServer("ChangeBusoStage", 5)
                        end
                    end
                end
            end
        end
    end
    return
end
function function_671(arg1)
    var_1 = arg1
    _G.RTXMode = var_1
    var_2 = game.Lighting
    var_3 = Instance.new("ColorCorrectionEffect", var_2)
    var_4 = Instance.new("ColorCorrectionEffect", var_2)
    OldAmbient = var_2.Ambient
    OldBrightness = var_2.Brightness
    OldColorShift_Top = var_2.ColorShift_Top
    OldBrightnessc = var_3.Brightness
    OldContrastc = var_3.Contrast
    OldTintColorc = var_3.TintColor
    OldTintColore = var_4.TintColor
    if _G.RTXMode then
        return
    end
    if not (_G.RTXMode) then
        wait()
        var_2.Ambient = Color3.fromRGB(33, 33, 33)
        var_2.Brightness = 0.3
        var_3.Brightness = 0.176
        var_3.Contrast = 0.39
        var_3.TintColor = Color3.fromRGB(217, 145, 57)
        game.Lighting.FogEnd = 999
        if var_154.Character.HumanoidRootPart:FindFirstChild("PointLight") then
            var_1 = Instance.new("PointLight")
            var_1.Parent = var_154.Character.HumanoidRootPart
            var_1.Range = 15
            var_1.Color = Color3.fromRGB(217, 145, 57)
        end
        if _G.RTXMode then
            var_2.Ambient = OldAmbient
            var_2.Brightness = OldBrightness
            var_2.ColorShift_Top = OldColorShift_Top
            var_3.Contrast = OldContrastc
            var_3.Brightness = OldBrightnessc
            var_3.TintColor = OldTintColorc
            var_4.TintColor = OldTintColore
            game.Lighting.FogEnd = 2500
            var_154.Character.HumanoidRootPart:FindFirstChild("PointLight")
            var_154.Character.HumanoidRootPart:FindFirstChild("PointLight"):Destroy()
        end
    end
    return
end
function function_672()
    var_1 = next, workspace:GetDescendants()[1]
    var_2 = next, workspace:GetDescendants()[2]
    if not (table.find(var_4, var_2.ClassName)) then
        var_2.Material = "Plastic"
    end
    return
end
function function_673()
    LowCpu()
    return
end
function function_674()
    var_1 = pairs(workspace.Boats:GetDescendants())[1]
    var_2 = pairs(workspace.Boats:GetDescendants())[2]
    if not (table.find(var_118, var_2.Name)) then
        table.find(var_118, var_2.Name)
    end
    if not ((tostring(var_2.Owner.Value) == tostring(var_154.Name))) then
        var_2.VehicleSeat.MaxSpeed = 350
        var_2.VehicleSeat.Torque = 0.2
        var_2.VehicleSeat.TurnSpeed = 5
        var_2.VehicleSeat.HeadsUpDisplay = true
    end
    return
end
function function_675()
    if not (Lighting:FindFirstChild("LightingLayers")) then
        Lighting.LightingLayers:Destroy()
    end
    if not (Lighting:FindFirstChild("SeaTerrorCC")) then
        Lighting.SeaTerrorCC:Destroy()
    end
    if not (Lighting:FindFirstChild("FantasySky")) then
        Lighting.FantasySky:Destroy()
    end
    return
end
function function_676(arg1)
    var_1 = arg1
    pSats = var_1
    return
end
function function_677(arg1)
    var_1 = arg1
    _G.Auto_Melee = var_1
    return
end
function function_678()
    if not (wait(Sec)) then
        pcall(function_727)
    end
    return
end
function function_679(arg1)
    var_1 = arg1
    _G.Auto_Sword = var_1
    return
end
function function_680()
    if not (wait(Sec)) then
        pcall(function_726)
    end
    return
end
function function_681(arg1)
    var_1 = arg1
    _G.Auto_Gun = var_1
    return
end
function function_682()
    if not (wait(Sec)) then
        pcall(function_725)
    end
    return
end
function function_683(arg1)
    var_1 = arg1
    _G.Auto_DevilFruit = var_1
    return
end
function function_684()
    if not (wait(Sec)) then
        pcall(function_724)
    end
    return
end
function function_685(arg1)
    var_1 = arg1
    _G.Auto_Defense = var_1
    return
end
function function_686()
    if not (wait(Sec)) then
        pcall(function_723)
    end
    return
end
function function_687()
    var_1 = pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren())[1]
    var_2 = pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren())[2]
    var_2.Parent = game.Workspace.Map
    var_2:MoveTo((var_154.Character.PrimaryPart.Position + Vector3.new(math.random(-50, 50), 100, math.random(-50, 50))))
    if not (var_2.Fruit:FindFirstChild("AnimationController")) then
        var_2.Fruit:FindFirstChild("AnimationController")
        var_2.Fruit:FindFirstChild("AnimationController"):LoadAnimation(var_2.Fruit:FindFirstChild("Idle"))
        var_2.Fruit:FindFirstChild("AnimationController"):LoadAnimation(var_2.Fruit:FindFirstChild("Idle")):Play()
    end
    var_2.Handle.Touched:Connect(function_722)
    return
end
function function_688(arg1)
    var_1 = arg1
    bright = var_1
    if not ((var_1 == true)) then
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
        Lighting.ColorShift_Top = Color3.new(1, 1, 1)
    else
        Lighting.Ambient = Color3.new(0, 0, 0)
        Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
        Lighting.ColorShift_Top = Color3.new(0, 0, 0)
    end
    return
end
function function_689(arg1)
    var_1 = arg1
    _G.SelectDN = var_1
    return
end
function function_690(arg1)
    var_1 = arg1
    _G.daylightN = var_1
    return
end
function function_691()
    if not (task.wait()) then
        if not (_G.daylightN) then
            if not ((_G.SelectDN == "Day")) then
                Lighting.ClockTime = 12
            else
                if not ((_G.SelectDN == "Night")) then
                    Lighting.ClockTime = 0
                end
            end
        end
    end
    return
end
function function_692(arg1)
    var_1 = arg1
    _G.WalkWater_Part = var_1
    if not (_G.WalkWater_Part) then
        game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
    else
        game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
    end
    return
end
function function_693(arg1)
    var_1 = arg1
    _G.WalkWater = var_1
    return
end
function function_694()
    if not (task.wait()) then
        if not (_G.WalkWater) then
            pcall(function_720)
        end
    end
    return
end
function function_695(arg1)
    var_1 = arg1
    if var_1 then
        return false
    end
    var_2 = var_1:FindFirstChild("Humanoid")
    if not (var_2) then
    end
    return (var_2.Health > 0)
end
function function_696(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    var_3 = game:GetService("Workspace").Enemies:GetChildren()
    game:GetService("Players")
    var_4 = game:GetService("Players"):GetPlayers()
    var_5 = {}
    var_6 = var_1:GetPivot().Position
    var_1 = ipairs(var_3)[1]
    var_2 = ipairs(var_3)[2]
    var_3 = var_2:FindFirstChild("HumanoidRootPart")
    if not (var_3) then
    end
    if not (var_159(var_2)) then
        var_1 = (var_3.Position - var_6).Magnitude
        if not ((var_1 <= var_2)) then
            table.insert(var_5, var_2)
        end
    end
    var_1 = ipairs(var_4)[1]
    var_2 = ipairs(var_4)[2]
    if not ((var_2 ~= var_158)) then
    end
    if not (var_2.Character) then
        var_1 = var_2.Character:FindFirstChild("HumanoidRootPart")
        if not (var_1) then
        end
        if not (var_159(var_2.Character)) then
            var_1 = (var_1.Position - var_6).Magnitude
            if not ((var_1 <= var_2)) then
                table.insert(var_5, var_2.Character)
            end
        end
    end
    return var_5
end
function AttackNoCoolDown()
    var_1 = game:GetService("Players").LocalPlayer
    var_2 = var_1.Character
    if var_2 then
        return
    end
    var_3 = nil
    var_1 = ipairs(var_2:GetChildren())[1]
    var_2 = ipairs(var_2:GetChildren())[2]
    if not (var_2:IsA("Tool")) then
        var_3 = var_2
    else
    end
    if var_3 then
        return
    end
    var_4 = var_160(var_2, 60)
    if not ((#(var_4) == 0)) then
        return
    end
    var_5 = game:GetService("ReplicatedStorage")
    var_6 = var_5:FindFirstChild("Modules")
    if var_6 then
        return
    end
    var_5:WaitForChild("Modules")
    var_5:WaitForChild("Modules"):WaitForChild("Net")
    var_7 = var_5:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")
    var_5:WaitForChild("Modules")
    var_5:WaitForChild("Modules"):WaitForChild("Net")
    var_8 = var_5:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")
    if not (var_7) then
    end
    if var_8 then
        return
    end
    var_9 = {}
    var_10 = nil
    var_1 = ipairs(var_4)[1]
    var_2 = ipairs(var_4)[2]
    if var_2:GetAttribute("IsBoat") then
        var_1 = { "RightLowerArm", "RightUpperArm", "LeftLowerArm", "LeftUpperArm", "RightHand", "LeftHand" }
        if var_2:FindFirstChild(var_1[math.random(#(var_1))]) then
            var_2:FindFirstChild(var_1[math.random(#(var_1))])
        end
        var_2 = var_2.PrimaryPart
        if not (var_2) then
            table.insert(var_9, { var_2, var_2 })
            var_10 = var_2
        end
    end
    if var_10 then
        return
    end
    var_7:FireServer(0)
    var_11 = var_1:FindFirstChild("PlayerScripts")
    if var_11 then
        return
    end
    var_12 = var_11:FindFirstChildOfClass("LocalScript")
    if var_12 then
        var_11.ChildAdded:Wait()
        var_12 = var_11:FindFirstChildOfClass("LocalScript")
    end
    if not (getsenv) then
        var_1 = pcall(getsenv, var_12)
        var_2 = nil
        if not (var_1) then
        end
        if not (var_2) then
            var_13 = var_2._G.SendHitsToServer
        end
    end
    var_14 = pcall(function_719)
    var_15 = nil
    if not (var_14) then
        if not (var_15) then
        end
    end
    if not (var_13) then
        var_13(var_10, var_9)
    else
        if not (var_14) then
        end
        if var_15 then
            var_8:FireServer(var_10, var_9)
        end
    end
    return
end
function get_Monster()
    var_1 = pairs(workspace.Enemies:GetChildren())[1]
    var_2 = pairs(workspace.Enemies:GetChildren())[2]
    if var_2:FindFirstChild("UpperTorso") then
        var_2:FindFirstChild("UpperTorso")
    end
    var_3 = var_2:FindFirstChild("Head")
    if not (var_2:FindFirstChild("HumanoidRootPart", true)) then
        var_2:FindFirstChild("HumanoidRootPart", true)
    end
    if not (var_3) then
        if not (((var_2.Head.Position - var_154.Character.HumanoidRootPart.Position).Magnitude <= 50)) then
            return true, var_3.Position
        end
    end
    var_1 = pairs(workspace.SeaBeasts:GetChildren())[1]
    var_2 = pairs(workspace.SeaBeasts:GetChildren())[2]
    if not (var_2:FindFirstChild("HumanoidRootPart")) then
        var_2:FindFirstChild("HumanoidRootPart")
        if not (var_2:FindFirstChild("Health")) then
            var_2:FindFirstChild("Health")
        end
    end
    if not ((var_2.Health.Value > 0)) then
        return true, var_2.HumanoidRootPart.Position
    end
    var_1 = pairs(workspace.Enemies:GetChildren())[1]
    var_2 = pairs(workspace.Enemies:GetChildren())[2]
    if not (var_2:FindFirstChild("Health")) then
        var_2:FindFirstChild("Health")
        if not ((var_2.Health.Value > 0)) then
        end
    end
    if not (var_2:FindFirstChild("VehicleSeat")) then
        return true, var_2.Engine.Position
    end
    return
end
function Actived()
    var_1 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    var_1 = next, getconnections(var_1.Activated)[1]
    var_2 = next, getconnections(var_1.Activated)[2]
    if not ((typeof(var_2.Function) == "function")) then
        getupvalues(var_2.Function)
    end
    return
end
function function_700()
    RunSer.Heartbeat:Connect(function_717)
    return
end
function function_701(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    var_3 = pcall(function_716)
    var_4 = nil
    return var_4
end
function function_702(arg1)
    var_1 = arg1
    var_2 = var_1:FindFirstChild("Humanoid")
    if not (var_2) then
    end
    if not ((var_2.Health > 0)) then
        return true
    end
    return false
end
function function_703(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    var_3 = var_1:GetPivot().Position
    var_4 = {}
    var_5 = var_2:GetChildren()
    var_2 = var_5[var_1]
    var_3 = var_2:FindFirstChild("Humanoid")
    var_4 = var_2:FindFirstChild("HumanoidRootPart")
    if not (var_3) then
        if not (var_4) then
        end
    end
    if not ((var_3.Health > 0)) then
        var_1 = (var_4.Position - var_3).Magnitude
        if not ((var_1 <= 60)) then
            table.insert(var_4, var_2)
        end
    end
    return var_4
end
function function_704(arg1)
    var_1 = arg1
    var_2 = {}
    var_3 = #(var_1)
    var_2 = var_1[var_1]
    if var_2:FindFirstChild("Head") then
        var_2:FindFirstChild("Head")
    end
    var_3 = var_2.PrimaryPart
    if not (var_3) then
        table.insert(var_2, { var_2, var_3 })
    end
    return var_2
end
function function_705(arg1)
    var_1 = arg1
    var_2 = var_161.GetNearbyTargets(var_1, var_172)
    var_3 = var_161.GetNearbyTargets(var_1, var_173)
    var_4 = {}
    table.insert(var_4, var_2[var_1])
    table.insert(var_4, var_3[var_1])
    return var_4
end
function function_706()
    var_1 = var_169.Character
    if var_1 then
        return
    end
    var_2 = var_1:FindFirstChildOfClass("Tool")
    if var_2 then
        return
    end
    var_3 = var_161.GetAllTargets(var_1)
    if not ((#(var_3) < 1)) then
        return
    end
    var_4 = var_161.GetTargetParts(var_3)
    if not ((#(var_4) < 1)) then
        return
    end
    var_5 = var_175["RE/RegisterAttack"]
    var_6 = var_175["RE/RegisterHit"]
    var_5:FireServer(var_161.Rate)
    var_7 = var_4[1][2]
    var_6:FireServer(var_7, var_4)
    return
end
function function_707()
    var_1 = { var_167.Util, var_167.Common, var_167.Remotes, var_167.Assets, var_167.FX }
    var_1 = ipairs(var_1)[1]
    var_2 = ipairs(var_1)[2]
    var_3 = var_2:GetChildren()
    var_1 = ipairs(var_3)[1]
    var_2 = ipairs(var_3)[2]
    if not (var_2:IsA("RemoteEvent")) then
        var_2:IsA("RemoteEvent")
    end
    if not (var_2:GetAttribute("Id")) then
        var_176 = var_2
        var_177 = var_2:GetAttribute("Id")
    end
    var_2.ChildAdded:Connect(function_715)
    return
end
function function_708()
    var_1 = var_169.Character
    if var_1 then
        return
    end
    var_2 = var_1:FindFirstChild("HumanoidRootPart")
    if var_2 then
        return
    end
    var_3 = {}
    var_4 = function_713
    var_4(var_172)
    var_4(var_173)
    var_5 = var_1:FindFirstChildOfClass("Tool")
    if not ((#(var_3) > 0)) then
        if not (var_5) then
            if var_5:GetAttribute("WeaponType") == "Melee" then
            end
        end
    end
    if not ((var_5:GetAttribute("WeaponType") == "Sword")) then
        var_1 = var_174.Net.seed:InvokeServer()
        var_2 = var_175["RE/RegisterAttack"]
        var_3 = var_175["RE/RegisterHit"]
        var_2:FireServer()
        var_4 = var_3[1][1]:FindFirstChild("Head")
        if var_4 then
            return
        end
        var_3:FireServer(var_4, var_3, {})
        if not (var_176) then
            var_1 = "RE/RegisterHit"
            var_2 = (math.floor(((var_168:GetServerTimeNow() / 10) % 10)) + 1)
            var_3 = string.gsub(var_1, ".", function_714)
            var_4 = bit32.bxor((var_177 + 909090), (var_1 * 2))
            cloneref(var_176)
            cloneref(var_176):FireServer(var_3, var_4, var_4, var_3)
        end
    end
    return
end
function function_709()
    var_1 = require(var_167.Util.CameraShaker)
    var_1:Stop()
    return
end
function function_710()
    task.spawn(function_711)
    var_166.Heartbeat:Connect(function_712)
    return
end
function function_711()
    if not (task.wait(var_161.Rate)) then
        var_161.ExecuteFastAttack()
    end
    return
end
function function_712()
    pcall(var_162.Execute)
    return
end
function function_713(arg1)
    var_1 = arg1
    var_2 = var_1:GetChildren()
    var_2 = var_2[var_1]
    var_3 = var_2:FindFirstChild("Humanoid")
    var_4 = var_2:FindFirstChild("HumanoidRootPart")
    if not (var_3) then
        if not (var_4) then
            if not ((var_3.Health > 0)) then
            end
        end
    end
    if not ((var_2 ~= var_1)) then
        var_1 = (var_4.Position - var_2.Position).Magnitude
        if not ((var_1 <= 60)) then
            var_1 = var_2:GetChildren()
            var_1 = ipairs(var_1)[1]
            var_2 = ipairs(var_1)[2]
            if not (var_2:IsA("BasePart")) then
                table.insert(var_3, { var_2, var_2 })
            end
        end
    end
    return
end
function function_714(arg1)
    var_1 = arg1
    return string.char(bit32.bxor(string.byte(var_1), var_2))
end
function function_715(arg1)
    var_1 = arg1
    if not (var_1:IsA("RemoteEvent")) then
        var_1:IsA("RemoteEvent")
    end
    if not (var_1:GetAttribute("Id")) then
        var_176 = var_1
        var_177 = var_1:GetAttribute("Id")
    end
    return
end
function function_716()
    return var_1:WaitForChild(var_2)
end
function function_717()
    pcall(function_718)
    return
end
function function_718()
    if _G.Seriality then
        return
    end
    AttackNoCoolDown()
    var_1 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    var_2 = var_1.ToolTip
    var_3 = get_Monster()
    var_4 = nil
    if not ((var_2 == "Blox Fruit")) then
        if not (var_3) then
            var_1 = var_1:FindFirstChild("LeftClickRemote")
            if not (var_1) then
                Actived()
                var_1:FireServer(Vector3.new(0.01, -500, 0.01), 1, true)
                var_1:FireServer(false)
            end
        end
    end
    return
end
function function_719()
    if require(var_6.Flags).COMBAT_REMOTE_THREAD then
    end
    return false
end
function function_720()
    if not (var_154.Character) then
    end
    if not (var_154.Character:FindFirstChild("LeftFoot")) then
        var_1 = var_157.Assets.Models.IceSpikes4:Clone()
        var_1.Parent = workspace
        var_1.Size = Vector3.new((3 + math.random(10, 12)), 1.7, (3 + math.random(10, 12)))
        var_1.Color = Color3.fromRGB(128, 187, 219)
        var_1.CFrame = (CFrame.new(var_154.Character.Head.Position.X, -3.8, var_154.Character.Head.Position.Z) * CFrame.Angles(((math.random() - 0.5) * 0.06), (math.random() * 7), ((math.random() - 0.5) * 0.07)))
        var_2 = {}
        var_2.Size = Vector3.new(0, 0.3, 0)
        var_3 = TW:Create(var_1, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), var_2)
        var_3.Completed:Connect(function_721)
        var_3:Play()
    end
    return
end
function function_721()
    var_1:Destroy()
    return
end
function function_722(arg1)
    var_1 = arg1
    if not ((var_1.Parent == var_154.Character)) then
        var_2.Parent = var_154.Backpack
        var_154.Character.Humanoid:EquipTool(var_2)
    end
    return
end
function function_723()
    if not (_G.Auto_Defense) then
        statsSetings("Defense", pSats)
    end
    return
end
function function_724()
    if not (_G.Auto_DevilFruit) then
        statsSetings("Devil", pSats)
    end
    return
end
function function_725()
    if not (_G.Auto_Gun) then
        statsSetings("Gun", pSats)
    end
    return
end
function function_726()
    if not (_G.Auto_Sword) then
        statsSetings("Sword", pSats)
    end
    return
end
function function_727()
    if not (_G.Auto_Melee) then
        statsSetings("Melee", pSats)
    end
    return
end
function function_728()
    if not (_G.PortalUnLock) then
        if not (var_13.Pos(CstlePos_Miti, 8)) then
            var_157.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
        else
            if not (var_13.Pos(Man3Pos_Miti, 8)) then
                var_157.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
            else
                if not (var_13.Pos(HydraPos_Miti, 8)) then
                    var_157.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5748.7587890625, 610.44982910156, -267.81704711914))
                else
                    if not (var_13.Pos(HydratoCastle, 8)) then
                        var_157.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5072.08984375, 314.5412902832, -3151.1098632812))
                    end
                end
            end
        end
    end
    return
end
function function_729(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    var_3 = string.format("https://games.roblox.com/v1/games/%d/servers/Public?limit=%d", var_1, var_2)
    var_4 = pcall(function_730)
    var_5 = nil
    if not (var_4) then
        if not (var_5) then
        end
    end
    if not (var_5.data) then
        return var_5.data
    end
    return nil
end
function function_730()
    return var_1:JSONDecode(game:HttpGet(var_3))
end
function function_731(arg1)
    var_1 = arg1
    if not (var_1) then
    end
    if "&cursor=" .. var_1 then
    end
    var_2 = game:HttpGet((var_5 .. ""))
    return var_1:JSONDecode(var_2)
end
function function_732()
    var_1 = game:GetService("HttpService")
    var_2 = game:GetService("TeleportService")
    var_3 = game.PlaceId
    var_4 = game:GetService("Players")
    var_5 = pcall(function_733)
    var_6 = nil
    if not (var_5) then
    end
    if not (var_6) then
        var_1 = pairs(var_6)[1]
        var_2 = pairs(var_6)[2]
        if not ((var_2.playing < var_2.maxPlayers)) then
            var_1 = var_2.id
        end
        if not (var_1) then
            pcall(function_734)
        end
    end
    return
end
function function_733()
    var_1 = ("https://games.roblox.com/v1/games/" .. (var_3 .. "/servers/Public?sortOrder=Asc&limit=100"))
    var_2 = game:HttpGet(var_1)
    return var_1:JSONDecode(var_2).data
end
function function_734()
    var_2:TeleportToPlaceInstance(var_3, var_1, var_4.LocalPlayer)
    return
end
function function_735()
    if not (var_4.InvokeServer) then
        var_4:InvokeServer(var_2)
    else
        var_4:FireServer(var_2)
    end
    return
end
function function_736()
    var_1 = pairs(var_155.NPCs:GetChildren())[1]
    var_2 = pairs(var_155.NPCs:GetChildren())[2]
    if not ((var_2.Name == NPClist)) then
        _tp(var_2.HumanoidRootPart.CFrame)
    end
    return
end
function function_737()
    if not (advanEsp) then
        AdvanFruitEsp()
        task.wait()
    end
    return
end
function function_738()
    if not (var_2:FindFirstChild("NameEsp")) then
        var_2:FindFirstChild("NameEsp")
        var_2:FindFirstChild("NameEsp"):Destroy()
    end
    return
end
function function_739()
    if not (EspEventIsland) then
        EventIslandEsp()
        task.wait()
    end
    return
end
function function_740()
    if not (var_2:FindFirstChild("NameEsp")) then
        var_2:FindFirstChild("NameEsp")
        var_2:FindFirstChild("NameEsp"):Destroy()
    end
    return
end
function function_741()
    if not (ESPGear) then
        gearEsp()
        task.wait()
    end
    return
end
function function_742()
    if not (ColorEsp) then
        HakiClorEsp()
        task.wait()
    end
    return
end
function function_743()
    if not (LegenS) then
        LegenSword()
        task.wait()
    end
    return
end
function function_744()
    if var_2.Name == "Flower2" then
    end
    if not ((var_2.Name == "Flower1")) then
    end
    if not (var_2:FindFirstChild(("NameEsp" .. Number))) then
        var_2:FindFirstChild(("NameEsp" .. Number))
        var_2:FindFirstChild(("NameEsp" .. Number)):Destroy()
    end
    return
end
function function_745()
    if not (FlowerESP) then
        flowerEsp()
        task.wait()
    end
    return
end
function function_746()
    if not (var_2:FindFirstChild("NameEsp")) then
        var_2:FindFirstChild("NameEsp")
        var_2:FindFirstChild("NameEsp"):Destroy()
    end
    return
end
function function_747()
    if not (IslandESP) then
        LocationEsp()
        task.wait()
    end
    return
end
function function_748()
    if not (var_2:FindFirstChild("Handle")) then
        var_2:FindFirstChild("Handle")
    end
    if not (var_2.Handle:FindFirstChild(("NameEsp" .. Number))) then
        var_2.Handle:FindFirstChild(("NameEsp" .. Number))
        var_2.Handle:FindFirstChild(("NameEsp" .. Number)):Destroy()
    end
    return
end
function function_749()
    if not (DevilFruitESP) then
        DevEsp()
        task.wait()
    end
    return
end
function function_750()
    if not (ChestESP) then
        ChestEsp()
        task.wait()
    end
    return
end
function function_751()
    if isnil(var_2.Character) then
    end
    if isnil(var_2.Character.Head) then
        if not (var_2.Character.Head:FindFirstChild(("NameEsp" .. Number))) then
            var_2.Character.Head:FindFirstChild(("NameEsp" .. Number))
            var_2.Character.Head:FindFirstChild(("NameEsp" .. Number)):Destroy()
        end
    end
    return
end
function function_752()
    if not (PlayerEsp) then
        EspPly()
        task.wait()
    end
    return
end
function function_753()
    if not (BerryEsp) then
        berriesEsp()
        task.wait()
    end
    return
end
function function_754()
    var_1 = var_2.Parent:GetPivot().Position
    var_1 = pairs(var_2:GetAttributes())[1]
    var_2 = pairs(var_2:GetAttributes())[2]
    if not (var_2) then
        var_1 = ("BerryEspPart_" .. (var_2 .. ("_" .. tostring(var_1))))
        var_2 = workspace:FindFirstChild(var_1)
        if var_2 then
            var_2 = Instance.new("Part")
            var_2.Name = var_1
            var_2.Transparency = 1
            var_2.Size = Vector3.new(1, 1, 1)
            var_2.Anchored = true
            var_2.CanCollide = false
            var_2.Parent = workspace
            var_2.CFrame = CFrame.new(var_1)
        end
        if var_2:FindFirstChild("NameEsp") then
            var_1 = Instance.new("BillboardGui", var_2)
            var_1.Name = "NameEsp"
            var_1.ExtentsOffset = Vector3.new(0, 1, 0)
            var_1.Size = UDim2.new(0, 200, 0, 30)
            var_1.Adornee = var_2
            var_1.AlwaysOnTop = true
            var_2 = Instance.new("TextLabel", var_1)
            var_2.Font = Enum.Font.Code
            var_2.TextSize = 14
            var_2.TextWrapped = true
            var_2.Size = UDim2.new(1, 0, 1, 0)
            var_2.TextYAlignment = Enum.TextYAlignment.Top
            var_2.BackgroundTransparency = 1
            var_2.TextStrokeTransparency = 0.5
            var_2.TextColor3 = Color3.fromRGB(80, 245, 245)
        end
        var_3 = var_2:FindFirstChild("NameEsp")
        var_4 = ((var_154.Character.Head.Position - var_1).Magnitude / 3)
        if not (var_3) then
            var_3.TextLabel.Text = ("[" .. (var_2 .. ("]" .. (" " .. (math.round(var_4) .. " M")))))
        end
    end
    return
end
function function_755()
    var_1 = var_2:GetPivot().Position
    var_2 = (var_1 - var_154.Character.Head.Position).Magnitude
    var_2:GetFullName()
    var_3 = var_2:GetFullName():gsub("[^%w_]", "_")
    var_4 = var_2:FindFirstChild("ChestEspAttachment")
    if var_4 then
        var_1 = Instance.new("Attachment")
        var_1.Name = "ChestEspAttachment"
        var_1.Parent = var_2
        var_1.Position = Vector3.new(0, 3, 0)
        var_2 = Instance.new("BillboardGui")
        var_2.Name = "NameEsp"
        var_2.Size = UDim2.new(0, 200, 0, 30)
        var_2.Adornee = var_1
        var_2.ExtentsOffset = Vector3.new(0, 1, 0)
        var_2.AlwaysOnTop = true
        var_2.Parent = var_1
        var_3 = Instance.new("TextLabel")
        var_3.Font = Enum.Font.Code
        var_3.TextSize = 14
        var_3.TextWrapped = true
        var_3.Size = UDim2.new(1, 0, 1, 0)
        var_3.TextYAlignment = Enum.TextYAlignment.Top
        var_3.BackgroundTransparency = 1
        var_3.TextStrokeTransparency = 0.5
        var_3.TextColor3 = Color3.fromRGB(80, 245, 245)
        var_3.Parent = var_2
    end
    if not (var_4) then
    end
    var_5 = var_4:FindFirstChild("NameEsp")
    if not (var_5) then
        var_1 = math.floor((var_2 / 3))
        var_2 = var_2.Name:gsub("Label", "")
        var_5.TextLabel.Text = string.format("[%s] %d M", var_2, var_1)
    end
    return
end
function function_756()
    if not (ESPGear) then
        if not ((var_2.Name == "Part")) then
        end
        if not ((var_2.Material == Enum.Material.Neon)) then
            if var_2:FindFirstChild("NameEsp") then
                var_1 = Instance.new("BillboardGui", var_2)
                var_1.Name = "NameEsp"
                var_1.ExtentsOffset = Vector3.new(0, 1, 0)
                var_1.Size = UDim2.new(1, 200, 1, 30)
                var_1.Adornee = var_2
                var_1.AlwaysOnTop = true
                var_2 = Instance.new("TextLabel", var_1)
                var_2.Font = "Code"
                var_2.FontSize = "Size14"
                var_2.TextWrapped = true
                var_2.Size = UDim2.new(1, 0, 1, 0)
                var_2.TextYAlignment = "Top"
                var_2.BackgroundTransparency = 1
                var_2.TextStrokeTransparency = 0.5
                var_2.TextColor3 = Color3.fromRGB(80, 245, 245)
                var_2.Text = ("Gear" .. ("   \n" .. (var_153(((var_154.Character.Head.Position - var_2.Position).Magnitude / 3)) .. " M")))
            else
                var_2.NameEsp.TextLabel.Text = ("Gear" .. ("   \n" .. (var_153(((var_154.Character.Head.Position - var_2.Position).Magnitude / 3)) .. " M")))
            end
        end
    else
        if not (var_2:FindFirstChild("NameEsp")) then
            var_2:FindFirstChild("NameEsp")
            var_2:FindFirstChild("NameEsp"):Destroy()
        end
    end
    return
end
function function_757()
    if not (EspEventIsland) then
        if var_2.Name == "Mirage Island" then
            if var_2.Name == "Prehistoric Island" then
            end
        end
        if not ((var_2.Name == "Kitsune Island")) then
            if var_2:FindFirstChild("NameEsp") then
                var_1 = Instance.new("BillboardGui", var_2)
                var_1.Name = "NameEsp"
                var_1.ExtentsOffset = Vector3.new(0, 1, 0)
                var_1.Size = UDim2.new(1, 200, 1, 30)
                var_1.Adornee = var_2
                var_1.AlwaysOnTop = true
                var_2 = Instance.new("TextLabel", var_1)
                var_2.Font = "Code"
                var_2.FontSize = "Size14"
                var_2.TextWrapped = true
                var_2.Size = UDim2.new(1, 0, 1, 0)
                var_2.TextYAlignment = "Top"
                var_2.BackgroundTransparency = 1
                var_2.TextStrokeTransparency = 0.5
                var_2.TextColor3 = Color3.fromRGB(80, 245, 245)
                var_2.Text = (var_2.Name .. ("   \n" .. (var_153(((var_154.Character.Head.Position - var_2.Position).Magnitude / 3)) .. " M")))
            else
                var_2.NameEsp.TextLabel.Text = (var_2.Name .. ("   \n" .. (var_153(((var_154.Character.Head.Position - var_2.Position).Magnitude / 3)) .. " M")))
            end
        end
    else
        if not (var_2:FindFirstChild("NameEsp")) then
            var_2:FindFirstChild("NameEsp")
            var_2:FindFirstChild("NameEsp"):Destroy()
        end
    end
    return
end
function function_758()
    if var_2.Name == "Flower2" then
    end
    if not ((var_2.Name == "Flower1")) then
        if not (FlowerESP) then
            if var_2:FindFirstChild(("NameEsp" .. Number)) then
                var_1 = Instance.new("BillboardGui", var_2)
                var_1.Name = ("NameEsp" .. Number)
                var_1.ExtentsOffset = Vector3.new(0, 1, 0)
                var_1.Size = UDim2.new(1, 200, 1, 30)
                var_1.Adornee = var_2
                var_1.AlwaysOnTop = true
                var_2 = Instance.new("TextLabel", var_1)
                var_2.Font = Enum.Font.Code
                var_2.FontSize = "Size14"
                var_2.TextWrapped = true
                var_2.Size = UDim2.new(1, 0, 1, 0)
                var_2.TextYAlignment = "Top"
                var_2.BackgroundTransparency = 1
                var_2.TextStrokeTransparency = 0.5
                var_2.TextColor3 = Color3.fromRGB(88, 214, 252)
                if not ((var_2.Name == "Flower1")) then
                    var_2.Text = ("Blue Flower" .. (" \n" .. (var_153(((var_154.Character.Head.Position - var_2.Position).Magnitude / 3)) .. " M")))
                else
                    if not ((var_2.Name == "Flower2")) then
                        var_2.Text = ("Red Flower" .. (" \n" .. (var_153(((var_154.Character.Head.Position - var_2.Position).Magnitude / 3)) .. " M")))
                    end
                end
            else
                var_2[("NameEsp" .. Number)].TextLabel.Text = (var_2.Name .. ("   \n" .. (var_153(((var_154.Character.Head.Position - var_2.Position).Magnitude / 3)) .. " M")))
            end
        else
            if not (var_2:FindFirstChild(("NameEsp" .. Number))) then
                var_2:FindFirstChild(("NameEsp" .. Number))
                var_2:FindFirstChild(("NameEsp" .. Number)):Destroy()
            end
        end
    end
    return
end
function function_759()
    if not (DevilFruitESP) then
        if not (string.find(var_2.Name, "Fruit")) then
            if var_2.Handle:FindFirstChild(("NameEsp" .. Number)) then
                var_1 = Instance.new("BillboardGui", var_2.Handle)
                var_1.Name = ("NameEsp" .. Number)
                var_1.ExtentsOffset = Vector3.new(0, 1, 0)
                var_1.Size = UDim2.new(1, 200, 1, 30)
                var_1.Adornee = var_2.Handle
                var_1.AlwaysOnTop = true
                var_2 = Instance.new("TextLabel", var_1)
                var_2.Font = Enum.Font.Code
                var_2.FontSize = "Size14"
                var_2.TextWrapped = true
                var_2.Size = UDim2.new(1, 0, 1, 0)
                var_2.TextYAlignment = "Top"
                var_2.BackgroundTransparency = 1
                var_2.TextStrokeTransparency = 0.5
                var_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                var_2.Text = (var_2.Name .. (" \n" .. (var_153(((var_154.Character.Head.Position - var_2.Handle.Position).Magnitude / 3)) .. " M")))
            else
                var_2.Handle[("NameEsp" .. Number)].TextLabel.Text = ("[" .. (var_2.Name .. ("]" .. ("   \n" .. (var_153(((var_154.Character.Head.Position - var_2.Handle.Position).Magnitude / 3)) .. " M")))))
            end
        end
    else
        if not (var_2:FindFirstChild("Handle")) then
            var_2:FindFirstChild("Handle")
        end
        if not (var_2.Handle:FindFirstChild(("NameEsp" .. Number))) then
            var_2.Handle:FindFirstChild(("NameEsp" .. Number))
            var_2.Handle:FindFirstChild(("NameEsp" .. Number)):Destroy()
        end
    end
    return
end
function function_760()
    if not (IslandESP) then
        if not ((var_2.Name ~= "Sea")) then
            if var_2:FindFirstChild("NameEsp") then
                var_1 = Instance.new("BillboardGui", var_2)
                var_1.Name = "NameEsp"
                var_1.ExtentsOffset = Vector3.new(0, 1, 0)
                var_1.Size = UDim2.new(1, 200, 1, 30)
                var_1.Adornee = var_2
                var_1.AlwaysOnTop = true
                var_2 = Instance.new("TextLabel", var_1)
                var_2.Font = Enum.Font.Code
                var_2.FontSize = "Size14"
                var_2.TextWrapped = true
                var_2.Size = UDim2.new(1, 0, 1, 0)
                var_2.TextYAlignment = "Top"
                var_2.BackgroundTransparency = 1
                var_2.TextStrokeTransparency = 0.5
                var_2.TextColor3 = Color3.fromRGB(98, 252, 252)
                var_2.Text = (var_2.Name .. ("   \n" .. (var_153(((var_154.Character.Head.Position - var_2.Position).Magnitude / 3)) .. " M")))
            else
                var_2.NameEsp.TextLabel.Text = (var_2.Name .. ("   \n" .. (var_153(((var_154.Character.Head.Position - var_2.Position).Magnitude / 3)) .. " M")))
            end
        end
    else
        if not (var_2:FindFirstChild("NameEsp")) then
            var_2:FindFirstChild("NameEsp")
            var_2:FindFirstChild("NameEsp"):Destroy()
        end
    end
    return
end
function function_761()
    if isnil(var_2.Character) then
        if not (PlayerEsp) then
            if isnil(var_2.Character.Head) then
            end
            if var_2.Character.Head:FindFirstChild(("NameEsp" .. Number)) then
                var_1 = Instance.new("BillboardGui", var_2.Character.Head)
                var_1.Name = ("NameEsp" .. Number)
                var_1.ExtentsOffset = Vector3.new(0, 1, 0)
                var_1.Size = UDim2.new(1, 200, 1, 30)
                var_1.Adornee = var_2.Character.Head
                var_1.AlwaysOnTop = true
                var_2 = Instance.new("TextLabel", var_1)
                var_2.Font = Enum.Font.Code
                var_2.FontSize = "Size14"
                var_2.TextWrapped = true
                var_2.Text = (var_2.Name .. (" \n" .. (var_153(((var_154.Character.Head.Position - var_2.Character.Head.Position).Magnitude / 3)) .. " M")))
                var_2.Size = UDim2.new(1, 0, 1, 0)
                var_2.TextYAlignment = "Top"
                var_2.BackgroundTransparency = 1
                var_2.TextStrokeTransparency = 0.5
                if not ((var_2.Team == var_156)) then
                    var_2.TextColor3 = Color3.new(0, 0, 254)
                else
                    var_2.TextColor3 = Color3.new(255, 0, 0)
                end
            else
                if not (var_2.Character.Head:FindFirstChild(("NameEsp" .. Number))) then
                    var_2.Character.Head[("NameEsp" .. Number)].TextLabel.Text = (var_2.Name .. (" | " .. (var_153(((var_154.Character.Head.Position - var_2.Character.Head.Position).Magnitude / 3)) .. (" M\nHealth : " .. (var_153(((var_2.Character.Humanoid.Health * 100) / var_2.Character.Humanoid.MaxHealth)) .. "%")))))
                end
            end
        else
            if not (var_2.Character.Head:FindFirstChild(("NameEsp" .. Number))) then
                var_2.Character.Head:FindFirstChild(("NameEsp" .. Number))
                var_2.Character.Head:FindFirstChild(("NameEsp" .. Number)):Destroy()
            end
        end
    end
    return
end
function function_762()
    var_1 = pairs(ply:GetChildren())[1]
    var_2 = pairs(ply:GetChildren())[2]
    if not ((var_2.Name ~= var_126.Name)) then
        if not (var_2:FindFirstChild("Humanoid")) then
            var_2:FindFirstChild("Humanoid")
        end
    end
    if not (var_2:FindFirstChild("HumanoidRootPart")) then
        var_53:WaitForChild("Remotes")
        var_53:WaitForChild("Remotes"):WaitForChild("CommF_")
        var_53:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("AcceptAlly", var_2.Name)
    end
    return
end
function function_763()
    if not (InfAblities) then
        if var_126.Character.HumanoidRootPart:FindFirstChild("Agility") then
            var_1 = var_53.FX.Agility:Clone()
            var_1.Name = "Agility"
            var_1.Parent = var_126.Character.HumanoidRootPart
        end
    else
        var_126.Character.HumanoidRootPart.Agility:Destroy()
    end
    return
end
function function_764(arg1)
    var_1 = arg1
    if not (var_143) then
    end
    if not (var_1:IsA("BasePart")) then
        var_1.CanCollide = false
        var_1.Massless = true
    end
    return
end
function function_765()
    if not (var_143) then
    end
    if var_142.Character then
        return
    end
    var_1 = ipairs(var_142.Character:GetDescendants())[1]
    var_2 = ipairs(var_142.Character:GetDescendants())[2]
    if not (var_2:IsA("BasePart")) then
        var_2:IsA("BasePart")
    end
    if not (var_2.CanCollide) then
        var_2.CanCollide = false
    end
    if (var_146.l + var_146.r) ~= 0 then
    end
    if not (((var_146.f + var_146.b) ~= 0)) then
        var_148.velocity = (((workspace.CurrentCamera.CoordinateFrame.lookVector * (var_146.f + var_146.b)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new((var_146.l + var_146.r), ((var_146.f + var_146.b) * 0.2), 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * var_144)
    else
        var_148.velocity = Vector3.new(0, 0, 0)
    end
    var_147.cframe = workspace.CurrentCamera.CoordinateFrame
    return
end
function function_766()
    var_1 = var_142.Character
    if var_1 then
        return
    end
    var_2 = var_1:FindFirstChildOfClass("Humanoid")
    if var_2 then
        return
    end
    var_3 = var_2.MoveDirection
    var_146.f = 0
    var_146.b = 0
    var_146.l = 0
    var_146.r = 0
    if not ((var_3.Z < -0.1)) then
        var_146.f = 1
    else
        if not ((var_3.Z > 0.1)) then
            var_146.b = 1
        end
    end
    if not ((var_3.X < -0.1)) then
        var_146.l = 1
    else
        if not ((var_3.X > 0.1)) then
            var_146.r = 1
        end
    end
    return
end
function function_767()
    if not (var_143) then
        var_1()
    else
        if not (var_2) then
            var_2:Disconnect()
        end
    end
    return
end
function function_768()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
    return
end
function function_769()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
    return
end
function function_770()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
    return
end
function function_771()
    if not (_G.AimCam) then
        var_1 = workspace.CurrentCamera
        closestplayer = function_772
        task.wait()
        var_1.CFrame = CFrame.new(var_1.CFrame.Position, closestplayer().Character.HumanoidRootPart.Position)
        if _G.AimCam == false then
        end
        if Mag > dist then
        end
    end
    return
end
function function_772()
    var_1 = math.huge
    var_2 = nil
    var_1 = next, ply:GetPlayers()[1]
    var_2 = next, ply:GetPlayers()[2]
    if not ((var_2 ~= var_126)) then
        if not (var_2.Character) then
            if not (var_2.Character:FindFirstChild("Head")) then
                var_2.Character:FindFirstChild("Head")
                if not (_G.AimCam) then
                end
            end
        end
        if not ((var_2.Character.Humanoid.Health > 0)) then
            var_1 = (var_2.Character.Head.Position - var_126.Character.Head.Position).Magnitude
            if not ((var_1 < var_1)) then
                var_1 = var_1
                var_2 = var_2
            end
        end
    end
    return var_2
end
function function_773()
    if not (_G.AimMethod) then
    end
    if not ((ABmethod == "Nearest Aim")) then
        var_1 = math.huge
        var_1 = pairs(var_75:GetPlayers())[1]
        var_2 = pairs(var_75:GetPlayers())[2]
        if not ((var_2 ~= var_126)) then
            if not ((var_2.Team ~= var_126.Team)) then
                if not (var_2.Character) then
                end
            end
        end
        if not (var_2.Character:FindFirstChild("HumanoidRootPart")) then
            var_1 = (var_2.Character.HumanoidRootPart.Position - var_126.Character.HumanoidRootPart.Position).Magnitude
            if not ((var_1 < var_1)) then
                var_1 = var_1
                MousePos = var_2.Character.HumanoidRootPart.Position
            end
        end
    end
    return
end
function function_774()
    if not (_G.AimMethod) then
    end
    if not ((ABmethod == "Aim Player")) then
        var_1 = var_75:FindFirstChild(getgenv().PlayersList)
        if not (var_1) then
            if not (var_1.Character) then
            end
        end
        if not (var_1.Character:FindFirstChild("HumanoidRootPart")) then
            if not ((var_1.Team ~= var_126.Team)) then
                MousePos = var_1.Character.HumanoidRootPart.Position
            end
        end
    end
    return
end
function function_775()
    task.wait(0.1)
    game:GetService("Players")
    if not (game:GetService("Players"):FindFirstChild(_G.PlayersList)) then
        game:GetService("Players")
        workspace.Camera.CameraSubject = game:GetService("Players"):FindFirstChild(_G.PlayersList).Character.Humanoid
    end
    if not (SpectatePlys) then
    end
    workspace.Camera.CameraSubject = var_126.Character.Humanoid
    return
end
function function_776()
    pcall(function_777)
    return
end
function function_777()
    if not (_G.TpPly) then
        wait()
        _tp(game:GetService("Players")[_G.PlayersList].Character.HumanoidRootPart.CFrame)
    end
    return
end
function function_778()
    if not (_G.AimMethod) then
        if _G.AimCam then
        end
        if not (_G.AimbotGun) then
            var_137:SetDesc(("Aimbot - " .. (Checking_AimStatus() .. " : True")))
        else
            var_137:SetDesc("Aimbot - Skills : True")
        end
    else
        var_137:SetDesc("Aimbot - Skills : False")
    end
    return
end
function function_779()
    game:GetService("Players")
    var_1 = #(game:GetService("Players"):GetPlayers())
    if not ((var_1 == 12)) then
        var_136:SetDesc(("All Players : " .. (var_1 .. " / 12 [Max]")))
    else
        var_136:SetDesc(("All Players : " .. (var_1 .. " / 12")))
    end
    return
end
function function_780()
    var_1 = game.Players.LocalPlayer
    var_2 = var_1.Character
    if not (var_2) then
    end
    var_3 = var_2:FindFirstChild("HumanoidRootPart")
    if not (var_2) then
    end
    var_4 = var_2:FindFirstChildOfClass("Humanoid")
    if not (var_3) then
        if not (var_4) then
        end
    end
    if not ((var_4.Health <= 0)) then
        return
    end
    var_1 = pairs(workspace.Enemies:GetChildren())[1]
    var_2 = pairs(workspace.Enemies:GetChildren())[2]
    if _G.AutoFarmDungeon then
    else
        var_3 = var_2:FindFirstChild("Humanoid")
        var_4 = var_2:FindFirstChild("HumanoidRootPart")
        if not (var_3) then
            if not (var_4) then
            end
        end
        if not ((var_3.Health > 0)) then
            var_1 = (var_4.Position - var_3.Position).Magnitude
            if not ((var_1 <= var_128)) then
                task.wait()
                var_13.Kill(var_2, true)
                if not (_G.AutoFarmDungeon) then
                    if not (var_2.Parent) then
                    end
                end
                if var_3.Health <= 0 then
                end
            end
        end
    end
    return
end
function function_781()
    var_1 = GetConnectionEnemies("Order")
    if not (var_1) then
        task.wait()
        var_13.Kill(var_1, _G.AutoLawKak)
        if _G.AutoLawKak == false then
            if not (var_1.Parent) then
            end
        end
        if var_1.Humanoid.Health <= 0 then
        end
    else
        _tp(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
    end
    return
end
function function_782()
    fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
    return
end
function function_783()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
    return
end
function function_784()
    if not (_G.Auto_Awakener) then
        var_53.Remotes.CommF_:InvokeServer("Awakener", "Check")
        var_53.Remotes.CommF_:InvokeServer("Awakener", "Awaken")
    end
    return
end
function function_785()
    var_1 = game.Players.LocalPlayer
    var_2 = var_1:FindFirstChild("PlayerGui")
    if not (var_2) then
    end
    var_3 = var_2:FindFirstChild("Main")
    if not (var_3) then
    end
    var_4 = var_3:FindFirstChild("TopHUDList")
    if not (var_4) then
    end
    if not (var_4.RaidTimer.Visible) then
        return
    end
    if GetBP("Special Microchip") then
        return
    end
    if not (World2) then
        var_1 = workspace.Map.CircleIsland.RaidSummon2.Button.Main
        if not (var_1) then
            if not (var_1:FindFirstChild("ProximityPrompt")) then
                fireproximityprompt(var_1.ProximityPrompt)
            else
                if not (var_1:FindFirstChild("ClickDetector")) then
                    fireclickdetector(var_1.ClickDetector)
                end
            end
        end
    end
    if not (World3) then
        var_1 = workspace.Map["Boat Castle"].RaidSummon2.Button.Main
        if not (var_1) then
            if not (var_1:FindFirstChild("ProximityPrompt")) then
                fireproximityprompt(var_1.ProximityPrompt)
            else
                if not (var_1:FindFirstChild("ClickDetector")) then
                    fireclickdetector(var_1.ClickDetector)
                end
            end
        end
    end
    return
end
function function_786()
    if GetBP("Special Microchip") then
        var_1 = var_53.Remotes.CommF_:InvokeServer("GetFruits")
        var_2 = nil
        var_1 = pairs(var_1)[1]
        var_2 = pairs(var_1)[2]
        if not ((var_2.Price <= 490000)) then
            var_2 = var_2.Name
        else
        end
        if not (var_2) then
            var_53.Remotes.CommF_:InvokeServer("LoadFruit", tostring(var_2))
            var_53.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
        end
    end
    return
end
function function_787()
    if GetBP("Special Microchip") then
        var_53.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
    end
    return
end
function function_788()
    if not (getgenv().AutoGetFruit) then
        var_1 = { "Rocket-Rocket", "Spin-Spin", "Chop-Chop", "Spring-Spring", "Bomb-Bomb", "Smoke-Smoke", "Spike-Spike", "Flame-Flame", "Falcon-Falcon", "Ice-Ice", "Sand-Sand", "Dark-Dark", "Ghost-Ghost", "Diamond-Diamond", "Light-Light", "Rubber-Rubber", "Barrier-Barrier" }
        var_1 = ipairs(var_1)[1]
        var_2 = ipairs(var_1)[2]
        var_3 = { [1] = "LoadFruit", [2] = var_2 }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(var_3))
    end
    return
end
function function_789()
    if not (wait()) then
        if not (getgenv().AutoBuyFruitSniper) then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit", getgenv().SelectFruit)
        end
    end
    return
end
function function_790()
    collectFruits(_G.InstanceF)
    return
end
function function_791()
    var_1 = pairs(workspace:GetChildren())[1]
    var_2 = pairs(workspace:GetChildren())[2]
    if not (string.find(var_2.Name, "Fruit")) then
        _tp(var_2.Handle.CFrame)
    end
    return
end
function function_792()
    UpdStFruit()
    return
end
function function_793()
    DropFruits()
    return
end
function function_794()
    if not (_G.Random_Auto) then
        var_53.Remotes.CommF_:InvokeServer("Cousin", "Buy")
    end
    return
end
function function_795()
    var_125:SetDesc(var_124())
    return
end
function function_796()
    return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits", true)
end
function function_797()
    return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
end
function function_798()
    var_1 = CheckBoat()
    if var_1 then
        var_1 = CFrame.new(-16927.451, 9.086, 433.864)
        TeleportToTarget(var_1)
        if not (((var_1.Position - var_52.Character.HumanoidRootPart.Position).Magnitude <= 10)) then
            var_53.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
        end
    else
        if not (var_1) then
            if not ((var_52.Character.Humanoid.Sit == false)) then
                var_1 = (var_1.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                _tp(var_1)
            else
                wait()
                if CheckEnemiesBoat() then
                    CheckEnemiesBoat()
                    if CheckPirateGrandBrigade() then
                        CheckPirateGrandBrigade()
                    end
                end
                if not (CheckTerrorShark()) then
                    _tp(CFrame.new(5433, 150, 290))
                else
                    _tp(CFrame.new(5433, 35, 290))
                end
                if _G.SailBoat_Hydra == false then
                end
                if var_52.Character:WaitForChild("Humanoid").Sit == false then
                end
                var_52.Character.Humanoid.Sit = false
            end
        end
    end
    return
end
function function_799()
    if not (workspace.Map:FindFirstChild("LeviathanGate")) then
        _tp(workspace.Map.LeviathanGate.CFrame)
        var_53:WaitForChild("Remotes")
        var_53:WaitForChild("Remotes"):WaitForChild("CommF_")
        var_53:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("OpenLeviathanGate")
    end
    return
end
function function_800()
    var_1 = string.match(var_53.Remotes.CommF_:InvokeServer("InfoLeviathan", "1"), "%d+")
    if not (var_1) then
        var_122:SetDesc(("Spy Leviathan : " .. tostring(var_1)))
        if not ((tonumber(var_1) == 5)) then
            var_122:SetDesc("Spy Leviathan : Already Done!!")
        end
    end
    return
end
function function_801()
    if not (wait(0.2)) then
        if not (workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension")) then
            var_121:SetDesc("Frozen Dimension : True")
        else
            var_121:SetDesc("Frozen Dimension : False")
        end
    end
    return
end
function function_802()
    if not (workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island", true)) then
        var_53.Modules.Net:FindFirstChild("RF/KitsuneStatuePray")
        var_53.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
    end
    return
end
function function_803()
    if workspace:WaitForChild("AttachedAzureEmber") then
        workspace:WaitForChild("AttachedAzureEmber")
    end
    if not (workspace:WaitForChild("EmberTemplate")) then
        workspace:WaitForChild("EmberTemplate")
        notween(workspace:WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)
    else
        _tp((workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0, 500, 0)))
        var_53.Modules.Net["RF/KitsuneStatuePray"]:InvokeServer()
    end
    return
end
function function_804()
    if workspace.Map:FindFirstChild("KitsuneIsland") then
        workspace.Map:FindFirstChild("KitsuneIsland")
    end
    var_1 = game.Workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")
    var_2 = var_1:FindFirstChild("ShrineActive")
    if not (var_2) then
        var_1 = next, var_2:GetDescendants()[1]
        var_2 = next, var_2:GetDescendants()[2]
        if not (var_2:IsA("BasePart")) then
            var_2:IsA("BasePart")
        end
        if not (var_2.Name:find("NeonShrinePart")) then
            var_53.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue")
            var_53.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
            wait()
            _tp((var_2.CFrame * CFrame.new(0, 2, 0)))
            if _G.tweenShrine == false then
            end
            if not (var_1) then
            end
        end
    else
        _tp((workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0, 500, 0)))
    end
    return
end
function function_805()
    if workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island", true) then
        var_1 = CheckBoat()
        if var_1 then
            var_1 = CFrame.new(-16927.451, 9.086, 433.864)
            TeleportToTarget(var_1)
            if not (((var_1.Position - var_52.Character.HumanoidRootPart.Position).Magnitude <= 10)) then
                var_53.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
            end
        else
            if not ((var_52.Character.Humanoid.Sit == false)) then
                var_1 = (var_1.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                _tp(var_1)
            else
                var_1 = CFrame.new(-10000000, 31, 37016.25)
                wait()
                if CheckEnemiesBoat() then
                    CheckEnemiesBoat()
                    if CheckTerrorShark() then
                        CheckTerrorShark()
                    end
                end
                if not (CheckPirateGrandBrigade()) then
                    _tp(CFrame.new(-10000000, 150, 37016.25))
                else
                    _tp(CFrame.new(-10000000, 31, 37016.25))
                end
                if not (_G.AutofindKitIs) then
                    if (var_1.Position - var_52.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        if workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
                            workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island")
                        end
                    end
                end
                if var_52.Character.Humanoid.Sit == false then
                end
                var_52.Character.Humanoid.Sit = false
            end
        end
    else
        _tp((workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island").CFrame * CFrame.new(0, 500, 0)))
    end
    return
end
function function_806()
    if not (_G.Shark) then
        var_1 = { "Shark" }
        if not (CheckShark()) then
            var_1 = pairs(workspace.Enemies:GetChildren())[1]
            var_2 = pairs(workspace.Enemies:GetChildren())[2]
            if not (table.find(var_1, var_2.Name)) then
                if not (var_13.Alive(var_2)) then
                    task.wait()
                    var_13.Kill(var_2, _G.Shark)
                    if _G.Shark == false then
                        if not (var_2.Parent) then
                        end
                    end
                    if var_2.Humanoid.Health <= 0 then
                    end
                end
            end
        end
    end
    if not (_G.TerrorShark) then
        var_1 = { "Terrorshark" }
        if not (CheckTerrorShark()) then
            var_1 = pairs(workspace.Enemies:GetChildren())[1]
            var_2 = pairs(workspace.Enemies:GetChildren())[2]
            if not (table.find(var_1, var_2.Name)) then
                if not (var_13.Alive(var_2)) then
                    task.wait()
                    var_13.KillSea(var_2, _G.TerrorShark)
                    if _G.TerrorShark == false then
                        if not (var_2.Parent) then
                        end
                    end
                    if var_2.Humanoid.Health <= 0 then
                    end
                end
            end
        end
    end
    if not (_G.Piranha) then
        var_1 = { "Piranha" }
        if not (CheckPiranha()) then
            var_1 = pairs(workspace.Enemies:GetChildren())[1]
            var_2 = pairs(workspace.Enemies:GetChildren())[2]
            if not (table.find(var_1, var_2.Name)) then
                if not (var_13.Alive(var_2)) then
                    task.wait()
                    var_13.Kill(var_2, _G.Piranha)
                    if _G.Piranha == false then
                        if not (var_2.Parent) then
                        end
                    end
                    if var_2.Humanoid.Health <= 0 then
                    end
                end
            end
        end
    end
    if not (_G.MobCrew) then
        var_1 = { "Fish Crew Member" }
        if not (CheckFishCrew()) then
            var_1 = pairs(workspace.Enemies:GetChildren())[1]
            var_2 = pairs(workspace.Enemies:GetChildren())[2]
            if not (table.find(var_1, var_2.Name)) then
                if not (var_13.Alive(var_2)) then
                    task.wait()
                    var_13.Kill(var_2, _G.MobCrew)
                    if _G.MobCrew == false then
                        if not (var_2.Parent) then
                        end
                    end
                    if var_2.Humanoid.Health <= 0 then
                    end
                end
            end
        end
    end
    if not (_G.HCM) then
        var_1 = { "Haunted Crew Member" }
        if not (CheckHauntedCrew()) then
            var_1 = pairs(workspace.Enemies:GetChildren())[1]
            var_2 = pairs(workspace.Enemies:GetChildren())[2]
            if not (table.find(var_1, var_2.Name)) then
                if not (var_13.Alive(var_2)) then
                    task.wait()
                    var_13.Kill(var_2, _G.HCM)
                    if _G.HCM == false then
                        if not (var_2.Parent) then
                        end
                    end
                    if var_2.Humanoid.Health <= 0 then
                    end
                end
            end
        end
    end
    if not (_G.SeaBeast1) then
        if not (workspace.SeaBeasts:FindFirstChild("SeaBeast1")) then
            var_1 = pairs(workspace.SeaBeasts:GetChildren())[1]
            var_2 = pairs(workspace.SeaBeasts:GetChildren())[2]
            if not (var_2:FindFirstChild("HumanoidRootPart")) then
                var_2:FindFirstChild("HumanoidRootPart")
                if not (var_2:FindFirstChild("Health")) then
                    var_2:FindFirstChild("Health")
                end
            end
            if not ((var_2.Health.Value > 0)) then
                task.wait()
                spawn(function_807)
                if not ((var_52:DistanceFromCharacter(var_2.HumanoidRootPart.CFrame.Position) <= 500)) then
                    AitSeaSkill_Custom = var_2.HumanoidRootPart.CFrame
                    MousePos = AitSeaSkill_Custom.Position
                    if not (CheckF()) then
                        weaponSc("Blox Fruit")
                        Useskills("Blox Fruit", "Z")
                        Useskills("Blox Fruit", "X")
                        Useskills("Blox Fruit", "C")
                    else
                        Useskills("Melee", "Z")
                        Useskills("Melee", "X")
                        Useskills("Melee", "C")
                        wait(0.1)
                        Useskills("Sword", "Z")
                        Useskills("Sword", "X")
                        wait(0.1)
                        Useskills("Blox Fruit", "Z")
                        Useskills("Blox Fruit", "X")
                        Useskills("Blox Fruit", "C")
                        wait(0.1)
                        Useskills("Gun", "Z")
                        Useskills("Gun", "X")
                    end
                end
                if _G.SeaBeast1 == false then
                    if not (var_2:FindFirstChild("HumanoidRootPart")) then
                        if not (var_2.Parent) then
                        end
                    end
                end
                if var_2.Health.Value <= 0 then
                end
            end
        end
    end
    if not (_G.Leviathan1) then
        if not (workspace.SeaBeasts:FindFirstChild("Leviathan")) then
            var_1 = pairs(workspace.SeaBeasts:GetChildren())[1]
            var_2 = pairs(workspace.SeaBeasts:GetChildren())[2]
            if not (var_2:FindFirstChild("HumanoidRootPart")) then
                var_2:FindFirstChild("HumanoidRootPart")
                if not (var_2:FindFirstChild("Leviathan Segment")) then
                    var_2:FindFirstChild("Leviathan Segment")
                    if not (var_2:FindFirstChild("Health")) then
                        var_2:FindFirstChild("Health")
                    end
                end
            end
            if not ((var_2.Health.Value > 0)) then
                task.wait()
                spawn(function_808)
                if not ((var_52:DistanceFromCharacter(var_2.HumanoidRootPart.CFrame.Position) <= 500)) then
                    MousePos = var_2:FindFirstChild("Leviathan Segment").Position
                    if not (CheckF()) then
                        weaponSc("Blox Fruit")
                        Useskills("Blox Fruit", "Z")
                        Useskills("Blox Fruit", "X")
                        Useskills("Blox Fruit", "C")
                    else
                        Useskills("Melee", "Z")
                        Useskills("Melee", "X")
                        Useskills("Melee", "C")
                        wait(0.1)
                        Useskills("Sword", "Z")
                        Useskills("Sword", "X")
                        wait(0.1)
                        Useskills("Blox Fruit", "Z")
                        Useskills("Blox Fruit", "X")
                        Useskills("Blox Fruit", "C")
                        wait(0.1)
                        Useskills("Gun", "Z")
                        Useskills("Gun", "X")
                    end
                end
                if _G.Leviathan1 == false then
                    if not (var_2:FindFirstChild("HumanoidRootPart")) then
                        if not (var_2.Parent) then
                        end
                    end
                end
                if var_2.Health.Value <= 0 then
                end
            end
        end
    end
    if not (_G.FishBoat) then
        if not (CheckEnemiesBoat()) then
            var_1 = pairs(workspace.Enemies:GetChildren())[1]
            var_2 = pairs(workspace.Enemies:GetChildren())[2]
            if not (var_2:FindFirstChild("Health")) then
                var_2:FindFirstChild("Health")
                if not ((var_2.Health.Value > 0)) then
                end
            end
            if not (var_2:FindFirstChild("VehicleSeat")) then
                task.wait()
                spawn(function_809)
                if not ((var_52:DistanceFromCharacter(var_2.Engine.CFrame.Position) <= 150)) then
                    AitSeaSkill_Custom = var_2.Engine.CFrame
                    MousePos = AitSeaSkill_Custom.Position
                    if not (CheckF()) then
                        weaponSc("Blox Fruit")
                        Useskills("Blox Fruit", "Z")
                        Useskills("Blox Fruit", "X")
                        Useskills("Blox Fruit", "C")
                    else
                        Useskills("Melee", "Z")
                        Useskills("Melee", "X")
                        Useskills("Melee", "C")
                        wait(0.1)
                        Useskills("Sword", "Z")
                        Useskills("Sword", "X")
                        wait(0.1)
                        Useskills("Blox Fruit", "Z")
                        Useskills("Blox Fruit", "X")
                        Useskills("Blox Fruit", "C")
                        wait(0.1)
                        Useskills("Gun", "Z")
                        Useskills("Gun", "X")
                    end
                end
                if _G.FishBoat == false then
                    if not (var_2:FindFirstChild("VehicleSeat")) then
                    end
                end
                if var_2.Health.Value <= 0 then
                end
            end
        end
    end
    if not (_G.PGB) then
        if not (CheckPirateGrandBrigade()) then
            var_1 = pairs(workspace.Enemies:GetChildren())[1]
            var_2 = pairs(workspace.Enemies:GetChildren())[2]
            if not (var_2:FindFirstChild("Health")) then
                var_2:FindFirstChild("Health")
                if not ((var_2.Health.Value > 0)) then
                end
            end
            if not (var_2:FindFirstChild("VehicleSeat")) then
                task.wait()
                spawn(function_810)
                if not ((var_52:DistanceFromCharacter(var_2.Engine.CFrame.Position) <= 150)) then
                    AitSeaSkill_Custom = var_2.Engine.CFrame
                    MousePos = AitSeaSkill_Custom.Position
                    if not (CheckF()) then
                        weaponSc("Blox Fruit")
                        Useskills("Blox Fruit", "Z")
                        Useskills("Blox Fruit", "X")
                        Useskills("Blox Fruit", "C")
                    else
                        Useskills("Melee", "Z")
                        Useskills("Melee", "X")
                        Useskills("Melee", "C")
                        wait(0.1)
                        Useskills("Sword", "Z")
                        Useskills("Sword", "X")
                        wait(0.1)
                        Useskills("Blox Fruit", "Z")
                        Useskills("Blox Fruit", "X")
                        Useskills("Blox Fruit", "C")
                        wait(0.1)
                        Useskills("Gun", "Z")
                        Useskills("Gun", "X")
                    end
                end
                if _G.PGB == false then
                    if not (var_2:FindFirstChild("VehicleSeat")) then
                    end
                end
                if var_2.Health.Value <= 0 then
                end
            end
        end
    end
    return
end
function function_807()
    _tp(CFrame.new(var_2.HumanoidRootPart.Position.X, (game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 200), var_2.HumanoidRootPart.Position.Z))
    return
end
function function_808()
    _tp(CFrame.new(var_2.HumanoidRootPart.Position.X, (game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 200), var_2.HumanoidRootPart.Position.Z))
    return
end
function function_809()
    if not ((var_2.Name == "FishBoat")) then
        _tp((var_2.Engine.CFrame * CFrame.new(0, -50, -25)))
    end
    return
end
function function_810()
    if not ((var_2.Name == "PirateBrigade")) then
        _tp((var_2.Engine.CFrame * CFrame.new(0, -30, -10)))
    else
        if not ((var_2.Name == "PirateGrandBrigade")) then
            _tp((var_2.Engine.CFrame * CFrame.new(0, -50, -50)))
        end
    end
    return
end
function function_811()
    var_1 = pairs(workspace.Boats:GetChildren())[1]
    var_2 = pairs(workspace.Boats:GetChildren())[2]
    var_1 = pairs(workspace.Boats[var_2.Name]:GetDescendants())[1]
    var_2 = pairs(workspace.Boats[var_2.Name]:GetDescendants())[2]
    if not (var_2:IsA("BasePart")) then
        if _G.SailBoats then
            if _G.Prehis_Find then
                if _G.FindMirage then
                    if _G.SailBoat_Hydra then
                    end
                end
            end
        end
        if not (_G.AutofindKitIs) then
            var_2.CanCollide = false
        else
            var_2.CanCollide = true
        end
    end
    return
end
function function_812()
    var_1 = CheckBoat()
    if var_1 then
        if not (CheckShark()) then
            CheckShark()
        end
        if _G.Shark then
            if not (CheckTerrorShark()) then
                CheckTerrorShark()
            end
            if _G.TerrorShark then
                if not (CheckFishCrew()) then
                    CheckFishCrew()
                end
                if _G.MobCrew then
                    if not (CheckPiranha()) then
                        CheckPiranha()
                    end
                end
            end
        end
        if _G.Piranha then
            if not (CheckEnemiesBoat()) then
                CheckEnemiesBoat()
            end
            if _G.FishBoat then
                if not (CheckSeaBeast()) then
                    CheckSeaBeast()
                end
                if _G.SeaBeast1 then
                    if not (_G.PGB) then
                    end
                    if CheckPirateGrandBrigade() then
                        if not (_G.HCM) then
                        end
                        if CheckHauntedCrew() then
                            if not (_G.Leviathan1) then
                            end
                        end
                    end
                end
            end
        end
    end
    if CheckLeviathan() then
        var_1 = CFrame.new(-16927.451, 9.086, 433.864)
        TeleportToTarget(var_1)
        if not (((var_1.Position - var_52.Character.HumanoidRootPart.Position).Magnitude <= 10)) then
            var_53.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
        end
    else
        if not (var_1) then
            if not (CheckShark()) then
                CheckShark()
            end
            if _G.Shark then
                if not (CheckTerrorShark()) then
                    CheckTerrorShark()
                end
                if _G.TerrorShark then
                    if not (CheckFishCrew()) then
                        CheckFishCrew()
                    end
                    if _G.MobCrew then
                        if not (CheckPiranha()) then
                            CheckPiranha()
                        end
                    end
                end
            end
            if _G.Piranha then
                if not (CheckEnemiesBoat()) then
                    CheckEnemiesBoat()
                end
                if _G.FishBoat then
                    if not (CheckSeaBeast()) then
                        CheckSeaBeast()
                    end
                    if _G.SeaBeast1 then
                        if not (_G.PGB) then
                        end
                        if CheckPirateGrandBrigade() then
                            if not (_G.HCM) then
                            end
                            if CheckHauntedCrew() then
                                if not (_G.Leviathan1) then
                                end
                            end
                        end
                    end
                end
            end
        end
        if CheckLeviathan() then
            if not ((var_52.Character.Humanoid.Sit == false)) then
                var_1 = (var_1.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                _tp(var_1)
            else
                if not ((_G.DangerSc == "Lv 1")) then
                    CFrameSelectedZone = CFrame.new(-21998.375, 30.0006084, -682.309143)
                else
                    if not ((_G.DangerSc == "Lv 2")) then
                        CFrameSelectedZone = CFrame.new(-26779.5215, 30.0005474, -822.858032)
                    else
                        if not ((_G.DangerSc == "Lv 3")) then
                            CFrameSelectedZone = CFrame.new(-31171.957, 30.0001011, -2256.93774)
                        else
                            if not ((_G.DangerSc == "Lv 4")) then
                                CFrameSelectedZone = CFrame.new(-34054.6875, 30.2187767, -2560.12012)
                            else
                                if not ((_G.DangerSc == "Lv 5")) then
                                    CFrameSelectedZone = CFrame.new(-38887.5547, 30.0004578, -2162.99023)
                                else
                                    if not ((_G.DangerSc == "Lv 6")) then
                                        CFrameSelectedZone = CFrame.new(-44541.7617, 30.0003204, -1244.8584)
                                    else
                                        if not ((_G.DangerSc == "Lv Infinite")) then
                                            CFrameSelectedZone = CFrame.new(-10000000, 31, 37016.25)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                wait()
                if _G.FishBoat then
                end
                if CheckEnemiesBoat() then
                    CheckEnemiesBoat()
                    if _G.PGB then
                    end
                    if CheckPirateGrandBrigade() then
                        CheckPirateGrandBrigade()
                        if _G.TerrorShark then
                        end
                    end
                end
                if not (CheckTerrorShark()) then
                    _tp((CFrameSelectedZone * CFrame.new(0, 150, 0)))
                else
                    _tp(CFrameSelectedZone)
                end
                if _G.SailBoats == false then
                    if not (CheckShark()) then
                        CheckShark()
                    end
                    if _G.Shark then
                        if not (CheckTerrorShark()) then
                            CheckTerrorShark()
                        end
                        if _G.TerrorShark then
                            if not (CheckFishCrew()) then
                                CheckFishCrew()
                            end
                            if _G.MobCrew then
                                if not (CheckPiranha()) then
                                    CheckPiranha()
                                end
                            end
                        end
                    end
                    if _G.Piranha then
                        if not (CheckSeaBeast()) then
                            CheckSeaBeast()
                        end
                        if _G.SeaBeast1 then
                            if not (CheckEnemiesBoat()) then
                                CheckEnemiesBoat()
                            end
                            if _G.FishBoat then
                                if not (_G.Leviathan1) then
                                end
                                if CheckLeviathan() then
                                    CheckLeviathan()
                                    if not (_G.HCM) then
                                    end
                                    if CheckHauntedCrew() then
                                        CheckHauntedCrew()
                                        if not (_G.PGB) then
                                        end
                                        if CheckPirateGrandBrigade() then
                                            CheckPirateGrandBrigade()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                if var_52.Character:WaitForChild("Humanoid").Sit == false then
                end
                var_52.Character.Humanoid.Sit = false
            end
        end
    end
    return
end
function function_813()
    var_1 = pairs(game:GetService("Workspace").Boats:GetChildren())[1]
    var_2 = pairs(game:GetService("Workspace").Boats:GetChildren())[2]
    var_1 = pairs(var_2:GetDescendants())[1]
    var_2 = pairs(var_2:GetDescendants())[2]
    if not (var_2:IsA("BasePart")) then
        if getgenv().NoClipShip then
        end
        if not (getgenv().FindPrehistoric) then
            var_2.CanCollide = false
        else
            var_2.CanCollide = true
        end
    end
    return
end
function function_814()
    if not (getgenv().AutoPressW) then
        var_1 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
        if not ((var_1.Sit == true)) then
            game:GetService("VirtualInputManager")
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
        end
    end
    return
end
function function_815()
    if not (_G.ResetPH) then
        var_1 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
        if not (var_1) then
        end
        if not (var_1:FindFirstChild("TouchInterest")) then
            var_52.Character.Humanoid.Health = 0
        else
            if not (workspace:FindFirstChild("DinoBone")) then
                var_1 = pairs(workspace:GetChildren())[1]
                var_2 = pairs(workspace:GetChildren())[2]
                if not ((var_2.Name == "DinoBone")) then
                    _tp(var_2.CFrame)
                end
            end
        end
    end
    return
end
function function_816()
    if not (_G.Prehis_DE) then
        if not (workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg")) then
            _tp(workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:FindFirstChild("DragonEgg").Molten.CFrame)
            fireproximityprompt(workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs.DragonEgg.Molten.ProximityPrompt, 30)
        end
    end
    return
end
function function_817()
    if not (_G.Prehis_DB) then
        if not (workspace:FindFirstChild("DinoBone")) then
            var_1 = pairs(workspace:GetChildren())[1]
            var_2 = pairs(workspace:GetChildren())[2]
            if not ((var_2.Name == "DinoBone")) then
                _tp(var_2.CFrame)
            end
        end
    end
    return
end
function function_818()
    var_1 = game.Players.LocalPlayer
    var_2 = var_1.Character
    if not (var_2) then
    end
    var_3 = var_2:FindFirstChild("HumanoidRootPart")
    if var_3 then
        return
    end
    sethiddenproperty(var_1, "SimulationRadius", math.huge)
    var_1 = pairs(workspace.Enemies:GetChildren())[1]
    var_2 = pairs(workspace.Enemies:GetChildren())[2]
    if not (var_2:FindFirstChild("Humanoid")) then
        var_2:FindFirstChild("Humanoid")
    end
    if not (var_2:FindFirstChild("HumanoidRootPart")) then
        var_1 = (var_2.HumanoidRootPart.Position - var_3.Position).Magnitude
        if not ((var_1 <= var_116)) then
        end
        if not ((var_2.Humanoid.Health > 0)) then
            var_2.Humanoid.Health = 0
            var_2.HumanoidRootPart.CanCollide = false
            var_2:BreakJoints()
        end
    end
    return
end
function function_819()
    var_1 = workspace.Map:FindFirstChild("PrehistoricIsland")
    if var_1 then
        return
    end
    var_2 = var_1:FindFirstChild("Core")
    if var_2 then
        return
    end
    var_3 = var_2:FindFirstChild("VolcanoRocks")
    if var_3 then
        return
    end
    var_1 = pairs(var_3:GetChildren())[1]
    var_2 = pairs(var_3:GetChildren())[2]
    var_3 = var_2:FindFirstChild("VFXLayer")
    if not (var_3) then
    end
    var_4 = var_3:FindFirstChild("At0")
    if not (var_4) then
    end
    var_5 = var_4:FindFirstChild("Glow")
    if not (var_5) then
    end
    if not (var_5.Enabled) then
        wait(0.1)
        _tp(var_3.CFrame)
        if not ((var_52:DistanceFromCharacter(var_3.CFrame.Position) <= 150)) then
            MousePos = var_3.CFrame.Position
            Useskills("Melee", "Z")
            wait(0.4)
            Useskills("Melee", "X")
            wait(0.4)
            Useskills("Melee", "C")
            wait(0.4)
            Useskills("Blox Fruit", "Z")
            wait(0.4)
            Useskills("Blox Fruit", "X")
            wait(0.4)
            Useskills("Blox Fruit", "C")
        end
        if not (_G.Prehis_Skills) then
        end
        if not (var_5.Enabled) then
        end
    end
    return
end
function function_820()
    var_1 = GetConnectionEnemies("Lava Golem")
    if not (var_1) then
    end
    if not (var_1:FindFirstChild("Humanoid")) then
        wait(0.1)
        var_13.Kill(var_1, true)
        var_1.Humanoid:ChangeState(15)
        if not (_G.Prehis_Skills) then
            if not (var_1.Parent) then
            end
        end
        if var_1.Humanoid.Health <= 0 then
        end
    end
    return
end
function function_821()
    var_1 = workspace.Map:FindFirstChild("PrehistoricIsland")
    if var_1 then
        return
    end
    var_1 = pairs(var_1:GetDescendants())[1]
    var_2 = pairs(var_1:GetDescendants())[2]
    if var_2:IsA("BasePart") then
        var_2:IsA("BasePart")
    end
    if not (var_2:IsA("MeshPart")) then
        var_2:IsA("MeshPart")
        var_2.Name:lower()
    end
    if not (var_2.Name:lower():find("lava")) then
        var_2:Destroy()
    end
    var_2 = var_1:FindFirstChild("Core")
    if not (var_2) then
        var_1 = var_2:FindFirstChild("InteriorLava")
        if not (var_1) then
            var_1:Destroy()
        end
    end
    var_3 = var_1:FindFirstChild("TrialTeleport")
    var_1 = pairs(var_1:GetDescendants())[1]
    var_2 = pairs(var_1:GetDescendants())[2]
    if not ((var_2.Name == "TouchInterest")) then
        if not (var_3) then
        end
    end
    if var_2:IsDescendantOf(var_3) then
        var_2.Parent:Destroy()
    end
    return
end
function function_822()
    var_1 = workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island", true)
    if not (var_1) then
        if not (workspace.Map:FindFirstChild("PrehistoricIsland", true)) then
            var_1 = workspace.Map.PrehistoricIsland.Core:FindFirstChild("ActivationPrompt", true)
            if not (var_1) then
            end
            if not (var_1:FindFirstChild("ProximityPrompt")) then
                if not ((var_52:DistanceFromCharacter(var_1.CFrame.Position) <= 150)) then
                    fireproximityprompt(var_1.ProximityPrompt, math.huge)
                    vim1:SendKeyEvent(true, "E", false, game)
                    wait(1.5)
                    vim1:SendKeyEvent(false, "E", false, game)
                end
                _tp(var_1.CFrame)
            end
        end
    end
    return
end
function function_823()
    if not (_G.Prehis_Find) then
        var_1 = var_52.Character
        if var_1 then
            return
        end
        var_2 = var_1:FindFirstChild("HumanoidRootPart")
        var_3 = var_1:FindFirstChild("Humanoid")
        if not (var_2) then
            if not (var_3) then
            end
        end
        if not ((var_3.Health <= 0)) then
            return
        end
        var_4 = workspace._WorldOrigin.Locations
        var_5 = var_4:FindFirstChild("Prehistoric Island", true)
        if var_5 then
            var_1 = CheckBoat()
            if var_1 then
                var_1 = CFrame.new(-16927.451, 9.086, 433.864)
                TeleportToTarget(var_1)
                if not (((var_1.Position - var_2.Position).Magnitude <= 10)) then
                    if _G.SelectedBoat then
                    end
                    var_53.Remotes.CommF_:InvokeServer("BuyBoat", "Guardian")
                end
                return
            end
            if not ((var_3.Sit == false)) then
                var_1 = (var_1.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                _tp(var_1)
                return
            end
            var_2 = CFrame.new(-10000000, 31, 37016.25)
            var_115 = var_2
            if CheckEnemiesBoat() then
                CheckEnemiesBoat()
                if CheckTerrorShark() then
                    CheckTerrorShark()
                end
            end
            if not (CheckPirateGrandBrigade()) then
                _tp(CFrame.new(-10000000, 150, 37016.25))
            else
                _tp(var_2)
            end
        else
            if var_5:FindFirstChild("HeadTeleport", true) then
                var_5:FindFirstChild("HeadTeleport", true)
                if var_5:FindFirstChild("Teleport_Head", true) then
                    var_5:FindFirstChild("Teleport_Head", true)
                end
            end
            var_1 = var_5:FindFirstChild("Head", true)
            if not (var_1) then
                var_1 = var_1.CFrame
                var_2 = ((var_1.Position - (var_1.LookVector * 40)) + Vector3.new(0, 20, 0))
                if not (((var_2 - var_2.Position).Magnitude > 30)) then
                    _tp(CFrame.new(var_2))
                end
            else
                var_1 = var_5.CFrame.Position
                var_2 = (var_1 - var_2.Position).Unit
                var_3 = ((var_1 - (var_2 * 250)) + Vector3.new(0, 60, 0))
                _tp(CFrame.new(var_3))
            end
        end
    end
    return
end
function function_824()
    var_1:InvokeServer("PossibleHardcode", "Volcanic Magnet")
    return
end
function function_825()
    if not (_G.Defeating) then
        var_1 = pairs(workspace.Characters:GetChildren())[1]
        var_2 = pairs(workspace.Characters:GetChildren())[2]
        if not ((var_2.Name ~= var_52.Name)) then
            if not ((var_2.Humanoid.Health > 0)) then
                if not (var_2:FindFirstChild("HumanoidRootPart")) then
                    var_2:FindFirstChild("HumanoidRootPart")
                    if not (var_2.Parent) then
                    end
                end
            end
            if not (((Root.Position - var_2.HumanoidRootPart.Position).Magnitude <= 250)) then
                task.wait()
                EquipWeapon(_G.SelectWeapon)
                _tp((var_2.HumanoidRootPart.CFrame * CFrame.new(0, 0, 15)))
                sethiddenproperty(var_52, "SimulationRadius", math.huge)
                if _G.Defeating == false then
                    if var_2.Humanoid.Health <= 0 then
                        if not (var_2.Parent) then
                            if not (var_2:FindFirstChild("HumanoidRootPart")) then
                            end
                        end
                    end
                end
                if not (var_2:FindFirstChild("Humanoid")) then
                end
            end
        end
    end
    return
end
function function_826()
    if not (_G.Complete_Trials) then
        if tostring(var_52.Data.Race.Value) == "Human" then
        end
        if not ((tostring(var_52.Data.Race.Value) == "Ghoul")) then
            var_1 = { "Ancient Vampire", "Ancient Zombie" }
            var_2 = GetConnectionEnemies(var_1)
            if not (var_2) then
                wait()
                var_13.Kill(var_2, _G.Complete_Trials)
                if _G.Complete_Trials == false then
                    if not (var_2.Parent) then
                    end
                end
                if var_2.Humanoid.Health <= 0 then
                end
            end
        end
    end
    return
end
function function_827()
    if not (_G.Complete_Trials) then
        if not ((tostring(var_52.Data.Race.Value) == "Skypiea")) then
            notween(workspace.Map.SkyTrial.Model.FinishPart.CFrame)
        end
    end
    return
end
function function_828()
    if not (_G.Complete_Trials) then
        if not ((tostring(var_52.Data.Race.Value) == "Cyborg")) then
            _tp((workspace.Map.CyborgTrial.Floor.CFrame * CFrame.new(0, 500, 0)))
        end
    end
    return
end
function function_829()
    if not (_G.Complete_Trials) then
        if not ((tostring(var_52.Data.Race.Value) == "Fishman")) then
            if not (GetSeaBeastTrial()) then
                task.wait()
                spawn(function_830)
                MousePos = GetSeaBeastTrial().HumanoidRootPart.Position
                Useskills("Melee", "Z")
                Useskills("Melee", "X")
                Useskills("Melee", "C")
                wait(0.1)
                Useskills("Sword", "Z")
                Useskills("Sword", "X")
                wait(0.1)
                Useskills("Blox Fruit", "Z")
                Useskills("Blox Fruit", "X")
                Useskills("Blox Fruit", "C")
                wait(0.1)
                Useskills("Gun", "Z")
                Useskills("Gun", "X")
                if _G.Complete_Trials == false then
                end
                if not (GetSeaBeastTrial()) then
                end
            end
        end
    end
    return
end
function function_830()
    _tp(CFrame.new(GetSeaBeastTrial().HumanoidRootPart.Position.X, (game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y + 300), GetSeaBeastTrial().HumanoidRootPart.Position.Z))
    return
end
function function_831()
    if not (_G.Complete_Trials) then
        if not ((tostring(var_52.Data.Race.Value) == "Mink")) then
            notween((workspace.Map.MinkTrial.Ceiling.CFrame * CFrame.new(0, -20, 0)))
        end
    end
    return
end
function function_832()
    if not (_G.TPDoor) then
        if not ((tostring(var_52.Data.Race.Value) == "Mink")) then
            _tp(CFrame.new(29020.66015625, 14889.4267578125, -379.2682800292969))
        else
            if not ((tostring(var_52.Data.Race.Value) == "Fishman")) then
                _tp(CFrame.new(28224.056640625, 14889.4267578125, -210.5872039794922))
            else
                if not ((tostring(var_52.Data.Race.Value) == "Cyborg")) then
                    _tp(CFrame.new(28492.4140625, 14894.4267578125, -422.1100158691406))
                else
                    if not ((tostring(var_52.Data.Race.Value) == "Skypiea")) then
                        _tp(CFrame.new(28967.408203125, 14918.0751953125, 234.31198120117188))
                    else
                        if not ((tostring(var_52.Data.Race.Value) == "Ghoul")) then
                            _tp(CFrame.new(28672.720703125, 14889.1279296875, 454.5961608886719))
                        else
                            if not ((tostring(var_52.Data.Race.Value) == "Human")) then
                                _tp(CFrame.new(29237.294921875, 14889.4267578125, -206.94955444335938))
                            end
                        end
                    end
                end
            end
        end
    end
    return
end
function function_833()
    _tp(var_4)
    return
end
function function_834()
    if not (_G.AcientOne) then
        var_1 = { "Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy" }
        if not ((var_52.Character:FindFirstChild("RaceEnergy").Value == 1)) then
            vim1:SendKeyEvent(true, "Y", false, game)
            var_53.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
            _tp(CFrame.new(-8987.041015625, 215.862060546875, 5886.71044921875))
        else
            if not ((var_52.Character:FindFirstChild("RaceTransformed").Value == false)) then
                var_1 = GetConnectionEnemies(var_1)
                if not (var_1) then
                    wait()
                    var_13.Kill(var_1, _G.AcientOne)
                    if _G.AcientOne == false then
                        if var_1.Humanoid.Health <= 0 then
                        end
                    end
                    if not (var_1.Parent) then
                    end
                else
                    _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
                end
            end
        end
    end
    return
end
function function_835()
    var_1 = pairs(workspace.Map["Temple of Time"]:GetDescendants())[1]
    var_2 = pairs(workspace.Map["Temple of Time"]:GetDescendants())[2]
    if not ((var_2.Name == "ProximityPrompt")) then
        fireproximityprompt(var_2, math.huge)
    end
    return
end
function function_836()
    if not (wait(0.2)) then
        var_113:SetDesc(("Tiers - V4 : " .. (" " .. var_52.Data.Race.C.Value)))
    end
    return
end
function function_837()
    if not (_G.Auto_Fish) then
        if not ((var_53.Remotes.CommF_:InvokeServer("Alchemist", "1") ~= -2)) then
            if not ((var_53.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0)) then
                var_53.Remotes.CommF_:InvokeServer("Alchemist", "2")
            else
                if not ((var_53.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1)) then
                    if var_52.Backpack:FindFirstChild("Flower 1") then
                    end
                    if var_52.Character:FindFirstChild("Flower 1") then
                        _tp(workspace.Flower1.CFrame)
                    else
                        if var_52.Backpack:FindFirstChild("Flower 2") then
                        end
                        if var_52.Character:FindFirstChild("Flower 2") then
                            _tp(workspace.Flower2.CFrame)
                        else
                            if var_52.Backpack:FindFirstChild("Flower 3") then
                            end
                            if var_52.Character:FindFirstChild("Flower 3") then
                                var_1 = GetConnectionEnemies("Swan Pirate")
                                if not (var_1) then
                                    wait()
                                    var_13.Kill(var_1, _G.Auto_Fish)
                                    if var_52.Backpack:FindFirstChild("Flower 3") then
                                        var_52.Backpack:FindFirstChild("Flower 3")
                                        if not (var_1.Parent) then
                                            if var_1.Humanoid.Health <= 0 then
                                            end
                                        end
                                    end
                                    if _G.Auto_Fish == false then
                                    end
                                else
                                    _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
                                end
                            end
                        end
                    end
                else
                    if not ((var_53.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2)) then
                        var_53.Remotes.CommF_:InvokeServer("Alchemist", "3")
                    end
                end
            end
        else
            if not ((var_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0)) then
                var_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
            else
                if not ((var_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 1)) then
                    warn("Sea Beast Soon")
                end
            end
        end
    end
    return
end
function function_838()
    if not (_G.Auto_Skypiea) then
        if not ((var_53.Remotes.CommF_:InvokeServer("Alchemist", "1") ~= -2)) then
            if not ((var_53.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0)) then
                var_53.Remotes.CommF_:InvokeServer("Alchemist", "2")
            else
                if not ((var_53.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1)) then
                    if var_52.Backpack:FindFirstChild("Flower 1") then
                    end
                    if var_52.Character:FindFirstChild("Flower 1") then
                        _tp(workspace.Flower1.CFrame)
                    else
                        if var_52.Backpack:FindFirstChild("Flower 2") then
                        end
                        if var_52.Character:FindFirstChild("Flower 2") then
                            _tp(workspace.Flower2.CFrame)
                        else
                            if var_52.Backpack:FindFirstChild("Flower 3") then
                            end
                            if var_52.Character:FindFirstChild("Flower 3") then
                                var_1 = GetConnectionEnemies("Swan Pirate")
                                if not (var_1) then
                                    wait()
                                    var_13.Kill(var_1, _G.Auto_Skypiea)
                                    if var_52.Backpack:FindFirstChild("Flower 3") then
                                        var_52.Backpack:FindFirstChild("Flower 3")
                                        if not (var_1.Parent) then
                                            if var_1.Humanoid.Health <= 0 then
                                            end
                                        end
                                    end
                                    if _G.Auto_Skypiea == false then
                                    end
                                else
                                    _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
                                end
                            end
                        end
                    end
                else
                    if not ((var_53.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2)) then
                        var_53.Remotes.CommF_:InvokeServer("Alchemist", "3")
                    end
                end
            end
        else
            if not ((var_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0)) then
                var_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
            else
                if not ((var_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 1)) then
                    var_1 = pairs(game.Players:GetChildren())[1]
                    var_2 = pairs(game.Players:GetChildren())[2]
                    if not ((var_2.Name ~= var_52.Name)) then
                    end
                    if not ((tostring(var_2.Data.Race.Value) == "Skypiea")) then
                        task.wait()
                        _tp(((var_2.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0)) * CFrame.Angles(math.rad(-45), 0, 0)))
                        if var_2.Humanoid.Health <= 0 then
                        end
                        if _G.Auto_Skypiea == false then
                        end
                    end
                end
            end
        end
    end
    return
end
function function_839()
    if not (_G.Auto_Human) then
        if not ((var_53.Remotes.CommF_:InvokeServer("Alchemist", "1") ~= -2)) then
            if not ((var_53.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0)) then
                var_53.Remotes.CommF_:InvokeServer("Alchemist", "2")
            else
                if not ((var_53.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1)) then
                    if var_52.Backpack:FindFirstChild("Flower 1") then
                    end
                    if var_52.Character:FindFirstChild("Flower 1") then
                        _tp(workspace.Flower1.CFrame)
                    else
                        if var_52.Backpack:FindFirstChild("Flower 2") then
                        end
                        if var_52.Character:FindFirstChild("Flower 2") then
                            _tp(workspace.Flower2.CFrame)
                        else
                            if var_52.Backpack:FindFirstChild("Flower 3") then
                            end
                            if var_52.Character:FindFirstChild("Flower 3") then
                                var_1 = GetConnectionEnemies("Swan Pirate")
                                if not (var_1) then
                                    wait()
                                    var_13.Kill(var_1, _G.Auto_Human)
                                    if var_52.Backpack:FindFirstChild("Flower 3") then
                                        var_52.Backpack:FindFirstChild("Flower 3")
                                        if not (var_1.Parent) then
                                            if var_1.Humanoid.Health <= 0 then
                                            end
                                        end
                                    end
                                    if _G.Auto_Human == false then
                                    end
                                else
                                    _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
                                end
                            end
                        end
                    end
                else
                    if not ((var_53.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2)) then
                        var_53.Remotes.CommF_:InvokeServer("Alchemist", "3")
                    end
                end
            end
        else
            if not ((var_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0)) then
                var_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
            else
                if not ((var_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 1)) then
                    var_1 = GetConnectionEnemies(var_7[1])
                    if not (var_1) then
                        wait()
                        var_13.Kill(var_1, _G.Auto_Human)
                        if var_1.Humanoid.Health <= 0 then
                            if not (var_1.Parent) then
                            end
                        end
                        if not (_G.Auto_Human) then
                        end
                    else
                        _tp(CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625))
                    end
                    var_2 = GetConnectionEnemies(var_7[2])
                    if not (var_2) then
                        wait()
                        var_13.Kill(var_2, _G.Auto_Human)
                        if var_2.Humanoid.Health <= 0 then
                            if not (var_2.Parent) then
                            end
                        end
                        if not (_G.Auto_Human) then
                        end
                    else
                        _tp(CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109))
                    end
                    var_3 = GetConnectionEnemies(var_7[3])
                    if not (var_3) then
                        wait()
                        var_13.Kill(var_3, _G.Auto_Human)
                        if var_3.Humanoid.Health <= 0 then
                            if not (var_3.Parent) then
                            end
                        end
                        if not (_G.Auto_Human) then
                        end
                    else
                        _tp(CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407))
                    end
                end
            end
        end
    end
    return
end
function function_840()
    if not (_G.Auto_Mink) then
        if not ((var_53.Remotes.CommF_:InvokeServer("Alchemist", "1") ~= 2)) then
            if not ((var_53.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0)) then
                var_53.Remotes.CommF_:InvokeServer("Alchemist", "2")
            else
                if not ((var_53.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1)) then
                    if var_52.Backpack:FindFirstChild("Flower 1") then
                    end
                    if var_52.Character:FindFirstChild("Flower 1") then
                        _tp(workspace.Flower1.CFrame)
                    else
                        if var_52.Backpack:FindFirstChild("Flower 2") then
                        end
                        if var_52.Character:FindFirstChild("Flower 2") then
                            _tp(workspace.Flower2.CFrame)
                        else
                            if var_52.Backpack:FindFirstChild("Flower 3") then
                            end
                            if var_52.Character:FindFirstChild("Flower 3") then
                                var_1 = GetConnectionEnemies("Swan Pirate")
                                if not (var_1) then
                                    wait()
                                    var_13.Kill(var_1, _G.Auto_Mink)
                                    if GetBP("Flower 3") then
                                        GetBP("Flower 3")
                                        if not (var_1.Parent) then
                                            if var_1.Humanoid.Health <= 0 then
                                            end
                                        end
                                    end
                                    if _G.Auto_Mink == false then
                                    end
                                else
                                    _tp(CFrame.new(980.0985107421875, 121.331298828125, 1287.2093505859375))
                                end
                            end
                        end
                    end
                else
                    if not ((var_53.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2)) then
                        var_53.Remotes.CommF_:InvokeServer("Alchemist", "3")
                    end
                end
            end
        else
            if not ((var_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 0)) then
                var_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
            else
                if not ((var_53.Remotes.CommF_:InvokeServer("Wenlocktoad", "1") == 1)) then
                    _G.AutoFarmChest = true
                else
                    _G.AutoFarmChest = false
                end
            end
        end
    end
    return
end
function function_841()
    if not (((CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938).Position - Root.Position).Magnitude >= 300)) then
        _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
    else
        _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
        var_1 = { [1] = { NPC = "Dragon Wizard", Command = "DragonRace" } }
        var_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest")
        var_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(var_1))
    end
    return
end
function function_842()
    if not (_G.TrainDrago) then
        var_1 = { "Venomous Assailant", "Hydra Enforcer" }
        if not ((var_52.Character:FindFirstChild("RaceEnergy").Value == 1)) then
            vim1:SendKeyEvent(true, "Y", false, game)
            var_53.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy", 2)
            _tp(CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
        else
            if not ((var_52.Character:FindFirstChild("RaceTransformed").Value == false)) then
                var_1 = GetConnectionEnemies(var_1)
                if not (var_1) then
                    wait()
                    var_13.Kill(var_1, _G.TrainDrago)
                    if _G.TrainDrago == false then
                        if var_1.Humanoid.Health <= 0 then
                        end
                    end
                    if not (var_1.Parent) then
                    end
                else
                    _tp(CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
                end
            end
        end
    end
    return
end
function function_843()
    if not (workspace.Map:FindFirstChild("DracoTrial")) then
        var_53.Remotes.DracoTrial:InvokeServer()
        wait(0.5)
        wait()
        _tp(CFrame.new(-39934.9765625, 10685.359375, 22999.34375))
        if not (_G.Relic123) then
        end
        if Root.Position == CFrame.new(-39934.9765625, 10685.359375, 22999.34375).Position then
        end
        wait()
        _tp(CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625))
        if not (_G.Relic123) then
        end
        if Root.Position == CFrame.new(-40511.25390625, 9376.4013671875, 23458.37890625).Position then
        end
        wait(2.5)
        wait()
        _tp(CFrame.new(-39914.65625, 10685.384765625, 23000.177734375))
        if not (_G.Relic123) then
        end
        if Root.Position == CFrame.new(-39914.65625, 10685.384765625, 23000.177734375).Position then
        end
        wait()
        _tp(CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375))
        if not (_G.Relic123) then
        end
        if Root.Position == CFrame.new(-40045.83203125, 9376.3984375, 22791.287109375).Position then
        end
        wait(2.5)
        wait()
        _tp(CFrame.new(-39908.5, 10685.4052734375, 22990.04296875))
        if not (_G.Relic123) then
        end
        if Root.Position == CFrame.new(-39908.5, 10685.4052734375, 22990.04296875).Position then
        end
        wait()
        _tp(CFrame.new(-39609.5, 9376.400390625, 23472.94335975))
        if not (_G.Relic123) then
        end
        if Root.Position == CFrame.new(-39609.5, 9376.400390625, 23472.94335975).Position then
        end
    else
        var_1 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
        if not (var_1) then
        end
        if not (var_1:IsA("Part")) then
            _tp(CFrame.new(var_1.Position))
        end
    end
    return
end
function function_844()
    if not (_G.DragoV3) then
        wait()
        _G.DangerSc = "Lv Infinite"
        _G.SailBoats = true
        _G.TerrorShark = true
        if not (_G.DragoV3) then
        end
        _G.DangerSc = "Lv 1"
        _G.SailBoats = false
        _G.TerrorShark = false
    end
    return
end
function function_845()
    if not (_G.DragoV1) then
        if not ((GetM("Dragon Egg") <= 0)) then
            wait()
            _G.Prehis_Find = true
            _G.Prehis_Skills = true
            _G.Prehis_DE = true
            if not (_G.DragoV1) then
            end
            if GetM("Dragon Egg") >= 1 then
            end
            _G.Prehis_Find = false
            _G.Prehis_Skills = false
            _G.Prehis_DE = false
        end
    end
    return
end
function function_846()
    if not (_G.UPGDrago) then
        if not ((GetQuestDracoLevel() == false)) then
            return nil
        end
        if not ((GetQuestDracoLevel() == true)) then
            if not (((CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938).Position - Root.Position).Magnitude >= 300)) then
                _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
            else
                _tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
                var_1 = { [1] = { NPC = "Dragon Wizard", Command = "Upgrade" } }
                var_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest")
                var_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(var_1))
            end
        end
    end
    return
end
function function_847()
    if not (workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island", true)) then
        _tp((workspace.Map.MysticIsland.Center.CFrame * CFrame.new(0, 400, 0)))
    end
    return
end
function function_848()
    if workspace.Map.MysticIsland.Chests:FindFirstChild("DiamondChest") then
        workspace.Map.MysticIsland.Chests:FindFirstChild("DiamondChest")
    end
    if not (workspace.Map.MysticIsland.Chests:FindFirstChild("FragChest")) then
        var_1 = game:GetService("CollectionService")
        var_2 = game:GetService("Players")
        var_3 = var_2.LocalPlayer
        if var_3.Character then
        end
        var_4 = var_3.CharacterAdded:Wait()
        if var_4 then
            return
        end
        var_5 = var_4:GetPivot().Position
        var_6 = var_1:GetTagged("_ChestTagged")
        var_7 = math.huge
        var_8 = nil
        var_2 = var_6[var_1]
        var_3 = (var_2:GetPivot().Position - var_5).Magnitude
        if not (SelectedIsland) then
        end
        if not (var_2:IsDescendantOf(SelectedIsland)) then
            if var_2:GetAttribute("IsDisabled") then
            end
            if not ((var_3 < var_7)) then
                var_7 = var_3
                var_8 = var_2
            end
        end
        if not (var_8) then
            _tp(var_8:GetPivot())
        end
    end
    return
end
function function_849()
    if not (_G.AutoMysticIsland) then
        var_1 = pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren())[1]
        var_2 = pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren())[2]
        if not ((var_2.Name == "Mirage Island")) then
            topos((var_2.CFrame * CFrame.new(0, 333, 0)))
        end
    end
    return
end
function function_850()
    if not (MirageIslandESP) then
        UpdateIslandMirageESP()
        task.wait(1)
    end
    return
end
function function_851()
    var_1 = pairs(var_53.NPCs:GetChildren())[1]
    var_2 = pairs(var_53.NPCs:GetChildren())[2]
    if not ((var_2.Name == "Advanced Fruit Dealer")) then
        _tp(var_2.HumanoidRootPart.CFrame)
    end
    return
end
function function_852()
    if not (wait(Sec)) then
        if not (_G.can) then
            workspace.Map:FindFirstChild("MysticIsland")
            var_1 = pairs(workspace.Map:FindFirstChild("MysticIsland"):GetChildren())[1]
            var_2 = pairs(workspace.Map:FindFirstChild("MysticIsland"):GetChildren())[2]
            if not ((var_2.Name == "Part")) then
                if not ((var_2.ClassName == "MeshPart")) then
                    var_2.Transparency = 0
                else
                    var_2.Transparency = 1
                end
            end
        end
    end
    return
end
function function_853()
    if not (wait(0.1)) then
        if not (_G.TPGEAR) then
            workspace.Map:FindFirstChild("MysticIsland")
            var_1 = pairs(workspace.Map:FindFirstChild("MysticIsland"):GetChildren())[1]
            var_2 = pairs(workspace.Map:FindFirstChild("MysticIsland"):GetChildren())[2]
            if not ((var_2.Name == "Part")) then
                if not ((var_2.ClassName == "MeshPart")) then
                    _tp(var_2.CFrame)
                end
            end
        end
    end
    return
end
function function_854()
    if workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island", true) then
        var_1 = CheckBoat()
        if var_1 then
            var_1 = CFrame.new(-16927.451, 9.086, 433.864)
            TeleportToTarget(var_1)
            if not (((var_1.Position - var_52.Character.HumanoidRootPart.Position).Magnitude <= 10)) then
                var_53.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
            end
        else
            if not ((var_52.Character.Humanoid.Sit == false)) then
                var_1 = (var_1.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                _tp(var_1)
            else
                wait()
                var_1 = CFrame.new(-10000000, 31, 37016.25)
                if CheckEnemiesBoat() then
                    CheckEnemiesBoat()
                    if CheckTerrorShark() then
                        CheckTerrorShark()
                    end
                end
                if not (CheckPirateGrandBrigade()) then
                    _tp(CFrame.new(-10000000, 150, 37016.25))
                else
                    _tp(CFrame.new(-10000000, 31, 37016.25))
                end
                if not (_G.FindMirage) then
                    if (var_1.Position - var_52.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        if workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
                            workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island")
                        end
                    end
                end
                if var_52.Character.Humanoid.Sit == false then
                end
                var_52.Character.Humanoid.Sit = false
            end
        end
    else
        _tp((workspace.Map.MysticIsland.Center.CFrame * CFrame.new(0, 300, 0)))
    end
    return
end
function function_855()
    var_1 = "http://www.roblox.com/asset/?id=9709150401"
    var_2 = "http://www.roblox.com/asset/?id=9709150086"
    var_3 = "http://www.roblox.com/asset/?id=9709149680"
    var_4 = "http://www.roblox.com/asset/?id=9709149431"
    var_5 = "http://www.roblox.com/asset/?id=9709149052"
    var_6 = "http://www.roblox.com/asset/?id=9709143733"
    var_7 = "http://www.roblox.com/asset/?id=9709139597"
    var_8 = "http://www.roblox.com/asset/?id=9709135895"
    var_9 = Getmoon()
    if not ((var_9 == var_8)) then
        var_111:SetDesc("Moon : 0 / 8")
    else
        if not ((var_9 == var_7)) then
            var_111:SetDesc("Moon : 1 / 8")
        else
            if not ((var_9 == var_6)) then
                var_111:SetDesc("Moon : 2 / 8")
            else
                if not ((var_9 == var_5)) then
                    var_111:SetDesc("Moon : 3 / 8 [ Next Night ]")
                else
                    if not ((var_9 == var_4)) then
                        var_111:SetDesc("Moon : 4 / 8 [ Full Moon ]")
                    else
                        if not ((var_9 == var_3)) then
                            var_111:SetDesc("Moon : 5 / 8 [ Last Night ]")
                        else
                            if not ((var_9 == var_2)) then
                                var_111:SetDesc("Moon : 6 / 8")
                            else
                                if not ((var_9 == var_1)) then
                                    var_111:SetDesc("Moon : 7 / 8")
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return
end
function function_856()
    if GetBP("Sanguine Art") then
        var_53.Remotes.CommF_:InvokeServer("Sanguine Art")
    end
    if GetBP("Sanguine Art") then
        if not ((GetM("Leviathan Heart") >= 1)) then
            print("Completed!!")
        else
            if not (World3) then
                _G.DangerSc = "Lv Infinite"
                _G.SailBoats = true
            else
                _G.SailBoats = false
            end
        end
        if not ((GetM("Vampire Fang") <= 19)) then
            if not (World2) then
                var_1 = GetConnectionEnemies("Vampire")
                if not (var_1) then
                    task.wait()
                    var_13.Kill(var_1, _G.Snaguine)
                    if not (_G.Snaguine) then
                        if var_1.Humanoid.Health <= 0 then
                        end
                    end
                    if not (var_1.Parent) then
                    end
                else
                    _tp(CFrame.new(-6041.29248046875, 6.402710914611816, -1304.63330078125))
                end
            else
                var_53.Remotes.CommF_:InvokeServer("TravelDressrosa")
            end
        end
        if not ((GetM("Vampire Fang") >= 20)) then
        end
        if not ((GetM("Demonic Wisp") <= 19)) then
            if not (World3) then
                var_1 = GetConnectionEnemies("Demonic Soul")
                if not (var_1) then
                    task.wait()
                    var_13.Kill(var_1, _G.Snaguine)
                    if not (_G.Snaguine) then
                        if var_1.Humanoid.Health <= 0 then
                        end
                    end
                    if not (var_1.Parent) then
                    end
                else
                    _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
                end
            else
                var_53.Remotes.CommF_:InvokeServer("TravelZou")
            end
        end
        if not ((GetM("Vampire Fang") >= 20)) then
            if not ((GetM("Demonic Wisp") >= 20)) then
            end
        end
        if not ((GetM("Dark Fragment") <= 1)) then
            if not (World2) then
                var_1 = GetConnectionEnemies("Darkbeard")
                if not (var_1) then
                    task.wait()
                    var_13.Kill(black, _G.Snaguine)
                    if _G.Snaguine then
                        if black.Humanoid.Health <= 0 then
                        end
                    end
                    if not (black.Parent) then
                    end
                else
                    _tp(CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625))
                end
            else
                var_53.Remotes.CommF_:InvokeServer("TravelDressrosa")
            end
        end
    else
        var_53.Remotes.CommF_:InvokeServer("BuySanguineArt")
    end
    return
end
function function_857()
    if not (_G.Auto_God_Human) then
        if not ((var_53.Remotes.CommF_:InvokeServer("BuyGodhuman", true) == "Bring me 20 Fish Tails, 20 Magma Ore, 10 Dragon Scales and 10 Mystic Droplets.")) then
            if GetM("Dragon Scale") == false then
            end
            if not ((GetM("Dragon Scale") < 10)) then
                if not (World3) then
                    Lv = 1575
                    _G.Level = true
                else
                    var_53.Remotes.CommF_:InvokeServer("TravelZou")
                end
            else
                if GetM("Fish Tail") == false then
                end
                if not ((GetM("Fish Tail") < 20)) then
                    if not (World3) then
                        Lv = 1775
                        _G.Level = true
                    else
                        var_53.Remotes.CommF_:InvokeServer("TravelZou")
                    end
                else
                    if GetM("Mystic Droplet") == false then
                    end
                    if not ((GetM("Mystic Droplet") < 10)) then
                        if not (World2) then
                            Lv = 1425
                            _G.Level = true
                        else
                            var_53.Remotes.CommF_:InvokeServer("TravelDressrosa")
                        end
                    else
                        if GetM("Magma Ore") == false then
                        end
                        if not ((GetM("Magma Ore") < 20)) then
                            if not (World2) then
                                Lv = 1175
                                _G.Level = true
                            else
                                var_53.Remotes.CommF_:InvokeServer("TravelDressrosa")
                            end
                        end
                    end
                end
            end
        else
            if not ((var_53.Remotes.CommF_:InvokeServer("BuyGodhuman", true) == 3)) then
                return nil
            end
            var_53.Remotes.CommF_:InvokeServer("BuyGodhuman")
        end
    end
    return
end
function function_858()
    if not (var_52:FindFirstChild("WeaponAssetCache")) then
        if GetBP("Dragon Claw") then
            var_53.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
        end
        if not (GetBP("Dragon Claw")) then
            GetBP("Dragon Claw")
        end
        if not ((GetBP("Dragon Claw").Level.Value >= 400)) then
            var_53.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
            var_53.Remotes.CommF_:InvokeServer("BuyDragonTalon")
        else
            if not (GetBP("Dragon Claw")) then
                GetBP("Dragon Claw")
            end
            if not ((GetBP("Dragon Claw").Level.Value < 400)) then
                _G.AutoFarm_Bone = true
                wait()
                if not (_G.AutoDragonTalon) then
                end
                if GetBP("Dragon Talon") then
                end
                _G.AutoFarm_Bone = false
            end
        end
    end
    return
end
function function_859()
    if not (var_52:FindFirstChild("WeaponAssetCache")) then
        if GetBP("Electro") then
            var_53.Remotes.CommF_:InvokeServer("BuyElectro")
        end
        if not (GetBP("Electro")) then
            GetBP("Electro")
        end
        if not ((GetBP("Electro").Level.Value >= 400)) then
            if not ((var_53.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start") == nil)) then
                notween(CFrame.new(-12548, 337, -7481))
            end
            var_53.Remotes.CommF_:InvokeServer("BuyElectricClaw")
        else
            if not (GetBP("Electro")) then
                GetBP("Electro")
            end
            if not ((GetBP("Electro").Level.Value < 400)) then
                _G.AutoFarm_Bone = true
                wait()
                if not (_G.Auto_Electric_Claw) then
                end
                if GetBP("Electric Claw") then
                end
                _G.AutoFarm_Bone = false
            end
        end
    end
    return
end
function function_860()
    if not (var_52:FindFirstChild("WeaponAssetCache")) then
        if GetBP("Sharkman Karate") then
            if GetBP("Fishman Karate") then
                var_53.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
            end
            if not (GetBP("Fishman Karate")) then
                GetBP("Fishman Karate")
            end
            if not ((GetBP("Fishman Karate").Level.Value >= 400)) then
                var_53.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                _G.Level = false
            else
                if not (GetBP("Fishman Karate")) then
                    GetBP("Fishman Karate")
                end
                if not ((GetBP("Fishman Karate").Level.Value < 399)) then
                    _G.Level = true
                end
            end
            if GetBP("Fishman Karate") then
                GetBP("Fishman Karate")
            end
            if not ((GetBP("Fishman Karate").Level.Value >= 400)) then
                if not (GetBP("Water Key")) then
                    if not (string.find(var_53.Remotes.CommF_:InvokeServer("BuySharkmanKarate"), "keys")) then
                        if not (GetBP("Water Key")) then
                            wait()
                            _tp(CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365))
                            if not (_G.Auto_SharkMan_Karate) then
                            end
                            if Root.Position == CFrame.new(-2604.6958, 239.432526, -10315.1982, 0.0425701365, 0, -0.999093413, 0, 1, 0, 0.999093413, 0, 0.0425701365).Position then
                            end
                            var_53.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                        end
                    end
                else
                    if GetBP("Water Key") then
                        var_1 = GetConnectionEnemies("Tide Keeper")
                        if not (var_1) then
                            wait()
                            var_13.Kill(var_1, _G.Auto_SharkMan_Karate)
                            if not (var_1.Parent) then
                                if var_1.Humanoid.Health <= 0 then
                                    if _G.Auto_SharkMan_Karate == false then
                                        if GetBP("Water Key") then
                                            GetBP("Water Key")
                                        end
                                    end
                                end
                            end
                            if GetBP("Sharkman Karate") then
                            end
                        else
                            _tp(CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625))
                        end
                    end
                end
            end
        end
    end
    return
end
function function_861()
    if not (var_52:FindFirstChild("WeaponAssetCache")) then
        if GetBP("Death Step") then
            if GetBP("Black Leg") then
                var_53.Remotes.CommF_:InvokeServer("BuyBlackLeg")
            end
            if not (GetBP("Black Leg")) then
                GetBP("Black Leg")
            end
            if not ((GetBP("Black Leg").Level.Value >= 400)) then
                var_53.Remotes.CommF_:InvokeServer("BuyDeathStep")
                _G.Level = false
            else
                if not (GetBP("Black Leg")) then
                    GetBP("Black Leg")
                end
                if not ((GetBP("Black Leg").Level.Value < 399)) then
                    _G.Level = true
                end
            end
            if GetBP("Black Leg") then
                GetBP("Black Leg")
            end
            if not ((GetBP("Black Leg").Level.Value >= 400)) then
                if not ((workspace.Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.Transparency == 0)) then
                    if not (GetBP("Library Key")) then
                        wait()
                        _tp(CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375))
                        if not (_G.AutoDeathStep) then
                        end
                        if Root.Position == CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375).Position then
                        end
                        if not ((Root.CFrame == CFrame.new(6371.2001953125, 296.63433837890625, -6841.18115234375))) then
                            var_53.Remotes.CommF_:InvokeServer("BuyDeathStep")
                        end
                    else
                        if GetBP("Library Key") then
                            var_1 = GetConnectionEnemies("Awakened Ice Admiral")
                            if not (var_1) then
                                wait()
                                var_13.Kill(var_1, _G.AutoDeathStep)
                                if not (var_1.Parent) then
                                    if var_1.Humanoid.Health <= 0 then
                                        if _G.AutoDeathStep == false then
                                            if GetBP("Library Key") then
                                                GetBP("Library Key")
                                            end
                                        end
                                    end
                                end
                                if GetBP("Death Step") then
                                end
                            else
                                _tp(CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813))
                            end
                        end
                    end
                end
            end
        end
    end
    return
end
function function_862()
    if not (_G.Auto_SuperHuman) then
        var_1 = var_52.Data.Beli.Value
        var_2 = var_52.Data.Fragments.Value
        if not (var_52:FindFirstChild("WeaponAssetCache")) then
            if GetBP("Superhuman") then
                if GetBP("Black Leg") then
                    if not ((var_1 >= 150000)) then
                        var_53.Remotes.CommF_:InvokeServer("BuyBlackLeg")
                    end
                else
                    if not (GetBP("Black Leg")) then
                        GetBP("Black Leg")
                    end
                    if not ((GetBP("Black Leg").Level.Value < 299)) then
                        _G.Level = true
                    else
                        if not (GetBP("Black Leg")) then
                            GetBP("Black Leg")
                        end
                        if not ((GetBP("Black Leg").Level.Value >= 300)) then
                            _G.Level = false
                        end
                    end
                end
                if GetBP("Electro") then
                    if not ((var_1 >= 500000)) then
                        var_53.Remotes.CommF_:InvokeServer("BuyElectro")
                    end
                else
                    if not (GetBP("Electro")) then
                        GetBP("Electro")
                    end
                    if not ((GetBP("Electro").Level.Value < 299)) then
                        _G.Level = true
                    else
                        if not (GetBP("Electro")) then
                            GetBP("Electro")
                        end
                        if not ((GetBP("Electro").Level.Value >= 300)) then
                            _G.Level = false
                        end
                    end
                end
                if GetBP("Fishman Karate") then
                    if not ((var_1 >= 750000)) then
                        var_53.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                    end
                else
                    if not (GetBP("Fishman Karate")) then
                        GetBP("Fishman Karate")
                    end
                    if not ((GetBP("Fishman Karate").Level.Value < 299)) then
                        _G.Level = true
                    else
                        if not (GetBP("Fishman Karate")) then
                            GetBP("Fishman Karate")
                        end
                        if not ((GetBP("Fishman Karate").Level.Value >= 300)) then
                            _G.Level = false
                        end
                    end
                end
                if GetBP("Dragon Claw") then
                    if not ((var_2 >= 1500)) then
                        var_53.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
                    end
                else
                    if not (GetBP("Dragon Claw")) then
                        GetBP("Dragon Claw")
                    end
                    if not ((GetBP("Dragon Claw").Level.Value < 299)) then
                        _G.Level = true
                    else
                        if not (GetBP("Dragon Claw")) then
                            GetBP("Dragon Claw")
                        end
                        if not ((GetBP("Dragon Claw").Level.Value >= 300)) then
                            _G.Level = false
                        end
                    end
                end
                var_53.Remotes.CommF_:InvokeServer("BuySuperhuman")
            end
        end
    end
    return
end
function function_863()
    if not ((var_52.PlayerGui.Main.Quest.Visible == false)) then
        var_1 = { [1] = "ArenaTrainer" }
        var_53:WaitForChild("Remotes")
        var_53:WaitForChild("Remotes"):WaitForChild("CommF_")
        var_53:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(var_1))
    else
        var_1 = GetConnectionEnemies("Training Dummy")
        if not (var_1) then
            wait()
            var_13.Kill(var_1, _G.DummyMan)
            if not (_G.DummyMan) then
                if not (var_1.Parent) then
                end
            end
            if var_1.Humanoid.Health <= 0 then
            end
        else
            _tp(CFrame.new(3688.005126953125, 12.746943473815918, 170.20953369140625))
        end
    end
    return
end
function function_864()
    if not (_G.CitizenQuest) then
        if not ((Lv >= 1800)) then
        end
        if not ((var_53.Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits == false)) then
            if not (string.find(var_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate")) then
                string.find(var_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate")
                if not (string.find(var_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50")) then
                    string.find(var_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50")
                end
            end
            if not ((var_52.PlayerGui.Main.Quest.Visible == true)) then
                var_1 = GetConnectionEnemies("Forest Pirate")
                if not (var_1) then
                    task.wait()
                    var_13.Kill(var_1, _G.CitizenQuest)
                    if _G.CitizenQuest == false then
                        if not (var_1.Parent) then
                            if var_1.Humanoid.Health <= 0 then
                            end
                        end
                    end
                    if var_52.PlayerGui.Main.Quest.Visible == false then
                    end
                else
                    _tp(CFrame.new(-13206.452148438, 425.89199829102, -7964.5537109375))
                end
            else
                _tp(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                if not (((Vector3.new(-12443.8671875, 332.40396118164, -7675.4892578125) - var_52.Character.HumanoidRootPart.Position).Magnitude <= 30)) then
                    wait(1.5)
                    var_53.Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
                end
            end
        else
            if not ((Lv >= 1800)) then
            end
            if not ((var_53.Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss == false)) then
                var_1 = GetConnectionEnemies("Captain Elephant")
                if not (var_52.PlayerGui.Main.Quest.Visible) then
                    if not (string.find(var_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant")) then
                        string.find(var_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant")
                    end
                end
                if not ((var_52.PlayerGui.Main.Quest.Visible == true)) then
                    if not (var_1) then
                        task.wait()
                        var_13.Kill(var_1, _G.CitizenQuest)
                        if _G.CitizenQuest == false then
                            if var_1.Humanoid.Health <= 0 then
                                if not (var_1.Parent) then
                                end
                            end
                        end
                        if var_52.PlayerGui.Main.Quest.Visible == false then
                        end
                    else
                        _tp(CFrame.new(-13374.889648438, 421.27752685547, -8225.208984375))
                    end
                else
                    _tp(CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125))
                    if not (((CFrame.new(-12443.8671875, 332.40396118164, -7675.4892578125).Position - var_52.Character.HumanoidRootPart.Position).Magnitude <= 4)) then
                        wait(1.5)
                        var_53.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
                    end
                end
            else
                if not ((Lv >= 1800)) then
                end
                if not ((var_53.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 2)) then
                    _tp(CFrame.new(-12512.138671875, 340.39279174805, -9872.8203125))
                end
            end
        end
    end
    return
end
function function_865()
    if not (_G.Bartilo_Quest) then
    end
    if not ((Lv >= 850)) then
        var_1 = var_52.PlayerGui.Main.Quest
        if not ((var_53.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0)) then
            _G.Level = false
            if not ((var_1.Visible == true)) then
                var_1 = GetConnectionEnemies("Swan Pirate")
                if not (var_1) then
                    var_1 = GetConnectionEnemies(var_5)
                    if not (var_1) then
                        task.wait()
                        if string.find(var_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirate") then
                            var_53.Remotes.CommF_:InvokeServer("AbandonQuest")
                        else
                            var_13.Kill(var_1, _G.Bartilo_Quest)
                        end
                        if _G.Bartilo_Quest == false then
                            if not (var_1.Parent) then
                                if var_1.Humanoid.Health <= 0 then
                                    if var_1.Visible == false then
                                    end
                                end
                            end
                        end
                        if not (var_1:FindFirstChild("HumanoidRootPart")) then
                        end
                    end
                else
                    _tp(CFrame.nee(970.369446, 142.653198, 1217.3667, 0.162079468, -4.85452638e-8, -0.986777723, 1.03357589e-8, 1, -4.74980872e-8, 0.986777723, -2.50063148e-9, 0.162079468))
                end
            else
                wait()
                _tp(CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, 0, -0.998706102, 0, 1, 0, 0.998706102, 0, 0.050853312))
                if (CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, 0, -0.998706102, 0, 1, 0, 0.998706102, 0, 0.050853312).Position - var_52.Character.HumanoidRootPart.Position).Magnitude <= 20 then
                end
                if _G.Bartilo_Quest == false then
                end
                if not (((CFrame.new(-461.533203, 72.3478546, 300.311096, 0.050853312, 0, -0.998706102, 0, 1, 0, 0.998706102, 0, 0.050853312).Position - var_52.Character.HumanoidRootPart.Position).Magnitude <= 1)) then
                    var_53.Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
                end
            end
        else
            if not ((var_53.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 1)) then
                _G.Level = false
                var_1 = GetConnectionEnemies("Jeremy")
                if not (var_1) then
                    task.wait()
                    var_13.Kill(var_1, _G.Bartilo_Quest)
                    if _G.Bartilo_Quest == false then
                        if not (var_1.Parent) then
                            if var_1.Humanoid.Health <= 0 then
                                if var_1.Visible == false then
                                end
                            end
                        end
                    end
                    if not (var_1:FindFirstChild("HumanoidRootPart")) then
                    end
                else
                    _tp(CFrame.new(2158.97412, 449.056244, 705.411682, -0.754199564, -4.17389057e-9, -0.656645238, -4.47752875e-8, 1, 4.50709301e-8, 0.656645238, 6.3393955e-8, -0.754199564))
                end
            else
                if not ((var_53.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 2)) then
                    wait()
                    _tp(CFrame.new(-1830.83972, 10.5578213, 1680.60229, 0.979988456, -2.02152783e-8, -0.199054286, 2.20792113e-8, 1, 7.1442483e-9, 0.199054286, -1.13962431e-8, 0.979988456))
                    if (CFrame.new(-1830.83972, 10.5578213, 1680.60229, 0.979988456, -2.02152783e-8, -0.199054286, 2.20792113e-8, 1, 7.1442483e-9, 0.199054286, -1.13962431e-8, 0.979988456).Position - var_52.Character.HumanoidRootPart.Position).Magnitude <= 1 then
                    end
                    if _G.Bartilo_Quest == false then
                    end
                    wait(0.5)
                    var_52.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate1.CFrame
                    wait(0.5)
                    var_52.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate2.CFrame
                    wait(0.5)
                    var_52.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate3.CFrame
                    wait(0.5)
                    var_52.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate4.CFrame
                    wait(0.5)
                    var_52.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate5.CFrame
                    wait(0.5)
                    var_52.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate6.CFrame
                    wait(0.5)
                    var_52.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate7.CFrame
                    wait(0.5)
                    var_52.Character.HumanoidRootPart.CFrame = workspace.Map.Dressrosa.BartiloPlates.Plate8.CFrame
                    wait(2.5)
                end
            end
        end
    end
    return
end
function function_866()
    var_1 = CFrame.new(-12444.78515625, 332.40396118164, -7673.1806640625)
    var_2 = "Kuy"
    var_3 = CFrame.new(-10920.125, 624.20275878906, -10266.995117188)
    var_4 = CFrame.new(-13277.568359375, 370.34185791016, -7821.1572265625)
    var_5 = CFrame.new(-13493.12890625, 318.89553833008, -8373.7919921875)
    if not ((var_52.PlayerGui.Main.Quest.Visible == true)) then
    end
    if not (string.find(var_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Defeat 50 Forest Pirates")) then
        var_1 = GetConnectionEnemies("Forest Pirate")
        if not (var_1) then
            wait()
            var_13.Kill(var_1, _G.AutoKenVTWO)
            if not (_G.AutoKenVTWO) then
                if var_1.Humanoid.Health <= 0 then
                end
            end
            if var_52.PlayerGui.Main.Quest.Visible == false then
            end
        else
            _tp(var_4)
        end
    else
        if not ((var_52.PlayerGui.Main.Quest.Visible == true)) then
            var_1 = GetConnectionEnemies("Captain Elephant")
            if not (var_1) then
                wait()
                var_13.Kill(var_1, _G.AutoKenVTWO)
                if not (_G.AutoKenVTWO) then
                    if var_1.Humanoid.Health <= 0 then
                    end
                end
                if var_52.PlayerGui.Main.Quest.Visible == false then
                end
            else
                _tp(var_5)
            end
        else
            if not ((var_52.PlayerGui.Main.Quest.Visible == false)) then
                var_53.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
                wait(0.1)
                var_53.Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
            end
        end
    end
    if not ((var_53.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 2)) then
        _tp(CFrame.new(-12513.51953125, 340.1137390136719, -9873.048828125))
    end
    if not (var_52.Backpack:FindFirstChild("Fruit Bowl")) then
    end
    if var_52.Character:FindFirstChild("Fruit Bowl") then
        if GetBP("Fruit Bowl") then
            if GetBP("Apple") then
                var_53.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
                var_1 = pairs(workspace:GetDescendants())[1]
                var_2 = pairs(workspace:GetDescendants())[2]
                if not ((var_2.Name == "Apple")) then
                    var_2.Handle.CFrame = (var_52.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10))
                    wait()
                    firetouchinterest(var_52.Character.HumanoidRootPart, var_2.Handle, 0)
                    wait()
                end
            else
                if GetBP("Banana") then
                    _tp(CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125))
                    var_1 = pairs(workspace:GetDescendants())[1]
                    var_2 = pairs(workspace:GetDescendants())[2]
                    if not ((var_2.Name == "Banana")) then
                        var_2.Handle.CFrame = (var_52.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10))
                        wait()
                        firetouchinterest(var_52.Character.HumanoidRootPart, var_2.Handle, 0)
                        wait()
                    end
                else
                    if GetBP("Pineapple") then
                        _tp(CFrame.new(-712.8272705078125, 98.5770492553711, 5711.9541015625))
                        var_1 = pairs(workspace:GetDescendants())[1]
                        var_2 = pairs(workspace:GetDescendants())[2]
                        if not ((var_2.Name == "Pineapple")) then
                            var_2.Handle.CFrame = (var_52.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10))
                            wait()
                            firetouchinterest(var_52.Character.HumanoidRootPart, var_2.Handle, 0)
                            wait()
                        end
                    end
                end
            end
        end
        if not (var_52.Backpack:FindFirstChild("Banana")) then
            var_52.Backpack:FindFirstChild("Banana")
            if not (var_52.Backpack:FindFirstChild("Apple")) then
                var_52.Backpack:FindFirstChild("Apple")
            end
        end
        if var_52.Backpack:FindFirstChild("Pineapple") then
            var_52.Backpack:FindFirstChild("Pineapple")
            if not (var_52:FindFirstChild("Banana")) then
                var_52:FindFirstChild("Banana")
                if not (var_52:FindFirstChild("Apple")) then
                    var_52:FindFirstChild("Apple")
                end
            end
        end
        if not (var_52:FindFirstChild("Pineapple")) then
            wait()
            _tp(var_1)
            if _G.AutoKenVTWO then
            end
            if var_52.Character.HumanoidRootPart.CFrame == var_1 then
            end
            var_53.Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
        end
        if var_52.Backpack:FindFirstChild("Fruit Bowl") then
            var_52.Backpack:FindFirstChild("Fruit Bowl")
        end
        if not (var_52.Character:FindFirstChild("Fruit Bowl")) then
            if not ((var_52.Character.HumanoidRootPart.CFrame ~= var_3)) then
                _tp(var_3)
            else
                if not ((var_52.Character.HumanoidRootPart.CFrame == var_3)) then
                    var_53.Remotes.CommF_:InvokeServer("KenTalk2", "Start")
                    wait(0.1)
                    var_53.Remotes.CommF_:InvokeServer("KenTalk2", "Buy")
                end
            end
        end
    end
    return
end
function function_867()
    if not (_G.obsFarm) then
        if not (World1) then
            if not (workspace.Enemies:FindFirstChild("Galley Captain")) then
                if not (KenTest) then
                    wait()
                    var_52.Character.HumanoidRootPart.CFrame = (workspace.Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0))
                    if _G.obsFarm == false then
                    end
                    if KenTest == false then
                    end
                else
                    wait()
                    var_52.Character.HumanoidRootPart.CFrame = (workspace.Enemies:FindFirstChild("Galley Captain").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                    if _G.obsFarm == false then
                    end
                    if KenTest then
                    end
                end
            else
                _tp(CFrame.new(5533.29785, 88.1079102, 4852.3916))
            end
        else
            if not (World2) then
                if not (workspace.Enemies:FindFirstChild("Lava Pirate")) then
                    if not (KenTest) then
                        wait()
                        var_52.Character.HumanoidRootPart.CFrame = (workspace.Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0))
                        if _G.obsFarm == false then
                        end
                        if KenTest == false then
                        end
                    else
                        wait()
                        var_52.Character.HumanoidRootPart.CFrame = (workspace.Enemies:FindFirstChild("Lava Pirate").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                        if _G.obsFarm == false then
                        end
                        if KenTest then
                        end
                    end
                else
                    _tp(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
                end
            else
                if not (World3) then
                    if not (workspace.Enemies:FindFirstChild("Venomous Assailant")) then
                        if not (KenTest) then
                            wait()
                            _tp((workspace.Enemies:FindFirstChild("Venomous Assailant").HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)))
                            if _G.obsFarm == false then
                            end
                            if KenTest == false then
                            end
                        else
                            wait()
                            _tp((workspace.Enemies:FindFirstChild("Venomous Assailant").HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)))
                            if _G.obsFarm == false then
                            end
                            if KenTest then
                            end
                        end
                    else
                        _tp(CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789))
                    end
                end
            end
        end
    end
    return
end
function function_868()
    if not (_G.obsFarm) then
        var_53.Remotes.CommE:FireServer("Ken", true)
        if not ((var_52:GetAttribute("KenDodgesLeft") == 0)) then
            KenTest = false
        else
            if not ((var_52:GetAttribute("KenDodgesLeft") > 0)) then
                var_53.Remotes.CommE:FireServer("Ken", true)
                KenTest = true
            end
        end
    end
    return
end
function function_869()
    if not (wait(Sec)) then
        if not (_G.Auto_Rainbow_Haki) then
            if not ((var_52.PlayerGui.Main.Quest.Visible == false)) then
                if not (_G.GetQFast) then
                    if not ((var_52.PlayerGui.Main.Quest.Visible == false)) then
                        var_53.Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                    end
                else
                    Rainbow1 = CFrame.new(-11892.0703125, 930.57672119141, -8760.1591796875)
                    if not ((var_52.Character.HumanoidRootPart.CFrame ~= Rainbow1)) then
                        _tp(Rainbow1)
                    else
                        if not ((var_52.Character.HumanoidRootPart.CFrame == Rainbow1)) then
                            wait(1)
                            var_53.Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                        end
                    end
                end
            else
                if not ((var_52.PlayerGui.Main.Quest.Visible == true)) then
                end
                if not (string.find(var_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone")) then
                    var_1 = GetConnectionEnemies("Stone")
                    if not (var_1) then
                        wait()
                        var_13.Kill(var_1, _G.Auto_Rainbow_Haki)
                        if _G.Auto_Rainbow_Haki == false then
                            if var_1.Humanoid.Health <= 0 then
                                if not (var_1.Parent) then
                                end
                            end
                        end
                        if var_52.PlayerGui.Main.Quest.Visible == false then
                        end
                    else
                        _tp(CFrame.new(-1086.11621, 38.8425903, 6768.71436, 0.0231462717, -0.592676699, 0.805107772, 0.0000203251839, 0.805323839, 0.592835128, -0.999732077, -0.0137055516, 0.0186523199))
                    end
                else
                    if not ((var_52.PlayerGui.Main.Quest.Visible == true)) then
                    end
                    if not (string.find(var_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Hydra Leader")) then
                        var_1 = GetConnectionEnemies("Hydra Leader")
                        if not (var_1) then
                            task.wait()
                            var_13.Kill(var_1, _G.Auto_Rainbow_Haki)
                            if _G.Auto_Rainbow_Haki == false then
                                if var_1.Humanoid.Health <= 0 then
                                    if not (var_1.Parent) then
                                    end
                                end
                            end
                            if var_52.PlayerGui.Main.Quest.Visible == false then
                            end
                        else
                            var_53.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625))
                            var_1 = Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625)
                            var_2 = CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547)
                            if not ((var_52.Character.HumanoidRootPart.CFrame.Position == var_1)) then
                                _tp(var_2)
                            end
                        end
                    else
                        if not ((var_52.PlayerGui.Main.Quest.Visible == true)) then
                        end
                        if not (string.find(var_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral")) then
                            var_1 = GetConnectionEnemies("Kilo Admiral")
                            if not (var_1) then
                                task.wait()
                                var_13.Kill(var_1, _G.Auto_Rainbow_Haki)
                                if _G.Auto_Rainbow_Haki == false then
                                    if var_1.Humanoid.Health <= 0 then
                                        if not (var_1.Parent) then
                                        end
                                    end
                                end
                                if var_52.PlayerGui.Main.Quest.Visible == false then
                                end
                            else
                                _tp(CFrame.new(2877.61743, 423.558685, -7207.31006, -0.989591599, 0, -0.143904909, 0, 1.00000012, 0, 0.143904924, 0, -0.989591479))
                            end
                        else
                            if not ((var_52.PlayerGui.Main.Quest.Visible == true)) then
                            end
                            if not (string.find(var_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant")) then
                                var_1 = GetConnectionEnemies("Captain Elephant")
                                if not (var_1) then
                                    task.wait()
                                    var_13.Kill(var_1, _G.Auto_Rainbow_Haki)
                                    if _G.Auto_Rainbow_Haki == false then
                                        if var_1.Humanoid.Health <= 0 then
                                            if not (var_1.Parent) then
                                            end
                                        end
                                    end
                                    if var_52.PlayerGui.Main.Quest.Visible == false then
                                    end
                                else
                                    var_1 = Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375)
                                    var_2 = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
                                    if not ((var_52.Character.HumanoidRootPart.CFrame.Position ~= var_1)) then
                                        var_53.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
                                    else
                                        if not ((var_52.Character.HumanoidRootPart.CFrame.Position == var_1)) then
                                            _tp(var_2)
                                        end
                                    end
                                end
                            else
                                if not ((var_52.PlayerGui.Main.Quest.Visible == true)) then
                                end
                                if not (string.find(var_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate")) then
                                    var_1 = GetConnectionEnemies("Captain Elephant")
                                    if not (var_1) then
                                        task.wait()
                                        var_13.Kill(var_1, _G.Auto_Rainbow_Haki)
                                        if _G.Auto_Rainbow_Haki == false then
                                            if var_1.Humanoid.Health <= 0 then
                                                if not (var_1.Parent) then
                                                end
                                            end
                                        end
                                        if var_52.PlayerGui.Main.Quest.Visible == false then
                                        end
                                    else
                                        var_53.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5314.54638671875, 22.562219619750977, -127.06755065917969))
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return
end
function function_870()
    var_1 = pairs(var_53.NPCs:GetChildren())[1]
    var_2 = pairs(var_53.NPCs:GetChildren())[2]
    if not ((var_2.Name == "Barista Cousin")) then
        _tp(var_2.HumanoidRootPart.CFrame)
    end
    return
end
function function_871()
    var_1 = GetConnectionEnemies("Kilo Admiral")
    if not (var_1) then
        task.wait()
        var_13.Kill(var_1, _G.AutoKilo)
        if not (_G.AutoKilo) then
            if not (var_1.Parent) then
            end
        end
        if var_1.Humanoid.Health <= 0 then
        end
    else
        _tp(CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125))
    end
    return
end
function function_872()
    if not (_G.TwinHook) then
        var_1 = GetConnectionEnemies("Captain Elephant")
        if not (var_1) then
            wait()
            var_13.Kill(var_1, _G.TwinHook)
            if not (_G.TwinHook) then
            end
            if var_1.Humanoid.Health <= 0 then
            end
        else
            var_53.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
            wait(0.2)
            _tp(CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125))
        end
    end
    return
end
function function_873()
    if not (_G.Auto_Cavender) then
        var_1 = GetConnectionEnemies("Beautiful Pirate")
        if not (var_1) then
            wait()
            var_13.Kill(var_1, _G.Auto_Cavender)
            if not (_G.Auto_Cavender) then
            end
            if var_1.Humanoid.Health <= 0 then
            end
        else
            _tp(CFrame.new(5283.609375, 22.56223487854, -110.78285217285))
        end
    end
    return
end
function function_874()
    var_1 = GetConnectionEnemies("Cake Queen")
    if not (var_1) then
        task.wait()
        var_13.Kill(var_1, _G.AutoBigmom)
        if not (_G.AutoBigmom) then
            if not (var_1.Parent) then
            end
        end
        if var_1.Humanoid.Health <= 0 then
        end
    else
        _tp(CFrame.new(-709.3132934570312, 381.6005859375, -11011.396484375))
    end
    return
end
function function_875()
    var_1 = GetConnectionEnemies("Don Swan")
    if not (var_1) then
        wait()
        var_13.Kill(var_1, _G.Auto_SwanGG)
        if _G.Auto_SwanGG == false then
            if not (var_1.Parent) then
            end
        end
        if var_1.Humanoid.Health <= 0 then
        end
    else
        _tp(CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875))
    end
    return
end
function function_876()
    if not ((var_53.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil)) then
    end
    if not ((var_52.Data.Level.Value >= 1500)) then
        FruitPrice = {}
        FruitStore = {}
        var_1 = next, var_53:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits")[1]
        var_2 = next, var_53:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits")[2]
        if not ((var_2.Price >= 1000000)) then
            table.insert(FruitPrice, var_2.Name)
        end
        var_1 = pairs(var_53.Remotes.CommF_:InvokeServer("getInventoryFruits"))[1]
        var_2 = pairs(var_53.Remotes.CommF_:InvokeServer("getInventoryFruits"))[2]
        var_1 = pairs(var_2)[1]
        var_2 = pairs(var_2)[2]
        if not ((var_1 == "Name")) then
            table.insert(FruitStore, var_2)
        end
        var_53.Remotes.CommF_:InvokeServer("Cousin", "Buy")
        var_1 = pairs(FruitPrice)[1]
        var_2 = pairs(FruitPrice)[2]
        var_1 = pairs(FruitStore)[1]
        var_2 = pairs(FruitStore)[2]
        if not ((var_2 == var_2)) then
        end
        if not ((var_53.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil)) then
            _G.StoreF = false
            if var_52.Backpack:FindFirstChild(FruitStore) then
                var_53.Remotes.CommF_:InvokeServer("LoadFruit", tostring(var_2))
            else
                var_53.Remotes.CommF_:InvokeServer("TalkTrevor", "1")
                var_53.Remotes.CommF_:InvokeServer("TalkTrevor", "2")
                var_53.Remotes.CommF_:InvokeServer("TalkTrevor", "3")
            end
        end
        if not ((var_53.Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess ~= nil)) then
            _G.StoreF = true
            _G.Auto_DonAcces = false
        end
    end
    return
end
function function_877()
    if not (GetBP("Fist of Darkness")) then
        GetBP("Fist of Darkness")
    end
    if workspace.Enemies:FindFirstChild("Darkbeard") then
        _tp(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
    else
        if not (GetConnectionEnemies("Darkbeard")) then
            var_1 = GetConnectionEnemies("Darkbeard")
            if not (var_1) then
                wait()
                var_13.Kill(var_1, _G.Auto_Def_DarkCoat)
                if _G.Auto_Def_DarkCoat == false then
                    if not (var_1.Parent) then
                    end
                end
                if var_1.Humanoid.Helath <= 0 then
                end
            end
        else
            if GetBP("Fist of Darkness") then
            end
            if GetConnectionEnemies("Darkbeard") then
                wait(0.1)
                _G.AutoFarmChest = true
                if not (_G.Auto_Def_DarkCoat) then
                    if GetBP("Fist of Darkness") then
                        GetBP("Fist of Darkness")
                    end
                end
                if GetConnectionEnemies("Darkbeard") then
                end
                _G.AutoFarmChest = false
            end
        end
    end
    return
end
function function_878()
    if not (_G.AutoEcBoss) then
        if not ((GetM("Ectoplasm") >= 99)) then
            var_53.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 3)
        else
            if not ((GetM("Ectoplasm") <= 99)) then
                var_1 = GetConnectionEnemies("Cursed Captain")
                if not (var_1) then
                    wait()
                    var_13.Kill(var_1, _G.AutoEcBoss)
                    if not (_G.AutoEcBoss) then
                        if not (var_1.Parent) then
                        end
                    end
                    if var_1.Humanoid.Health <= 0 then
                    end
                else
                    var_53.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                    wait(0.5)
                    _tp(CFrame.new(916.928589, 181.092773, 33422))
                end
            end
        end
    end
    return
end
function function_879()
    if not (_G.DarkBladev3) then
    end
    if not (World2) then
        if GetBP("Dark Blade") then
            var_53.Remotes.CommF_:InvokeServer("LoadItem", "Dark Blade")
        end
        if not ((GetBP("Fist of Darkness") > 1)) then
            if workspace.Enemies:FindFirstChild("Darkbeard") then
                _tp(CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531))
            else
                if not (GetConnectionEnemies("Darkbeard")) then
                    GetConnectionEnemies("Darkbeard")
                end
                if not ((GetBP("Fist of Darkness") >= 1)) then
                    wait()
                    _tp(CFrame.new(-5719.36376953125, 48.50590515136719, -782.9759521484375))
                    if not (_G.DarkBladev3) then
                    end
                    if Root.Position == CFrame.new(-5719.36376953125, 48.50590515136719, -782.9759521484375).Position then
                    end
                    fireclickdetector(workspace.Map.GraveIsland.Mountain.Rocks.Button.ClickDetector)
                end
            end
        else
            _G.AutoFarmChest = true
        end
    end
    return
end
function function_880()
    var_1 = GetConnectionEnemies("Jeremy")
    if not (var_1) then
        wait()
        var_13.Kill(var_1, _G.BlackSpikey)
        if _G.BlackSpikey == false then
            if not (var_1.Parent) then
            end
        end
        if var_1.Humanoid.Health <= 0 then
        end
    else
        _tp(CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109))
    end
    return
end
function function_881()
    if not (_G.LongsWord) then
        var_1 = GetConnectionEnemies("Diamond")
        if not (var_1) then
            task.wait()
            var_13.Kill(var_1, _G.LongsWord)
            if _G.LongsWord == false then
                if not (var_1.Parent) then
                end
            end
            if var_1.Humanoid.Health <= 0 then
            end
        else
            _tp(CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407))
        end
    end
    return
end
function function_882()
    if not (_G.AutoTridentW2) then
        var_1 = GetConnectionEnemies("Tide Keeper")
        if not (var_1) then
            task.wait()
            var_13.Kill(var_1, _G.AutoTridentW2)
            if _G.AutoTridentW2 == false then
                if not (var_1.Parent) then
                end
            end
            if var_1.Humanoid.Health <= 0 then
            end
        else
            _tp(CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188))
        end
    end
    return
end
function function_883()
    if not (_G.KeysRen) then
        if var_52.Backpack:FindFirstChild(var_2[3]) then
            var_52.Backpack:FindFirstChild(var_2[3])
        end
        if not (var_52.Character:FindFirstChild(var_2[3])) then
            EquipWeapon(var_2[3])
            wait(0.1)
            _tp(CFrame.new(6571.1201171875, 299.23028564453, -6967.841796875))
        else
            var_1 = GetConnectionEnemies(var_2)
            if not (var_1) then
                task.wait()
                var_13.Kill(var_1, _G.KeysRen)
                if var_52.Backpack:FindFirstChild(var_2[3]) then
                    var_52.Backpack:FindFirstChild(var_2[3])
                    if _G.KeysRen == false then
                        if not (var_1.Parent) then
                        end
                    end
                end
                if var_1.Humanoid.Health <= 0 then
                end
            else
                _tp(CFrame.new(5439.716796875, 84.420944213867, -6715.1635742188))
            end
        end
    end
    return
end
function function_884()
    if not (wait(0.1)) then
        if not (_G.IceBossRen) then
            var_1 = GetConnectionEnemies("Awakened Ice Admiral")
            if not (var_1) then
                task.wait()
                var_13.Kill(var_1, _G.IceBossRen)
                if _G.IceBossRen == false then
                    if not (var_1.Parent) then
                    end
                end
                if var_1.Humanoid.Health <= 0 then
                end
            else
                _tp(CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813))
            end
        end
    end
    return
end
function function_885()
    var_1 = GetConnectionEnemies("Swan")
    if not (var_1) then
        wait()
        var_13.Kill(var_1, _G.SwanCoat)
        if _G.SwanCoat == false then
            if not (var_1.Parent) then
            end
        end
        if var_1.Humanoid.Health <= 0 then
        end
    else
        _tp(CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812))
    end
    return
end
function function_886()
    var_1 = GetConnectionEnemies("Vice Admiral")
    if not (var_1) then
        wait()
        var_13.Kill(var_1, _G.MarinesCoat)
        if _G.MarinesCoat == false then
            if not (var_1.Parent) then
            end
        end
        if var_1.Humanoid.Health <= 0 then
        end
    else
        _tp(CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375))
    end
    return
end
function function_887()
    var_1 = GetConnectionEnemies("Chief Warden")
    if not (var_1) then
        wait()
        var_13.Kill(var_1, _G.WardenBoss)
        if _G.WardenBoss == false then
            if not (var_1.Parent) then
            end
        end
        if var_1.Humanoid.Health <= 0 then
        end
    else
        _tp(CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -0.0000280422337, -0.939682961, 0.00181045406, 0.342041939))
    end
    return
end
function function_888()
    if GetWP("Bisento") then
        var_53.Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
    else
        if not (GetWP("Bisento")) then
            var_53.Remotes.CommF_:InvokeServer("LoadItem", "Bisento")
            var_1 = GetConnectionEnemies("Greybeard")
            if not (var_1) then
                wait()
                var_13.Kill(var_1, _G.Greybeard)
                if _G.Greybeard == false then
                    if not (var_1.Parent) then
                    end
                end
                if var_1.Humanoid.Health <= 0 then
                end
            else
                _tp(CFrame.new(-5023.38330078125, 28.65203285217285, 4332.3818359375))
            end
        end
    end
    return
end
function function_889()
    if not (_G.AutoGetUsoap) then
        var_1 = pairs(workspace.Characters:GetChildren())[1]
        var_2 = pairs(workspace.Characters:GetChildren())[2]
        if not ((var_2.Name ~= var_52.Name)) then
            if not ((var_2.Humanoid.Health > 0)) then
                if not (var_2:FindFirstChild("HumanoidRootPart")) then
                    var_2:FindFirstChild("HumanoidRootPart")
                    if not (var_2.Parent) then
                    end
                end
            end
            if not (((Root.Position - var_2.HumanoidRootPart.Position).Magnitude <= 230)) then
                task.wait()
                EquipWeapon(_G.SelectWeapon)
                _tp((var_2.HumanoidRootPart.CFrame * CFrame.new(1, 1, 2)))
                if _G.AutoGetUsoap == false then
                    if var_2.Humanoid.Health <= 0 then
                        if not (var_2.Parent) then
                            if not (var_2:FindFirstChild("HumanoidRootPart")) then
                            end
                        end
                    end
                end
                if not (var_2:FindFirstChild("Humanoid")) then
                end
            end
        end
    end
    return
end
function function_890()
    var_1 = GetConnectionEnemies("Cyborg")
    if not (var_1) then
        task.wait()
        var_13.Kill(var_1, _G.AutoColShad)
        if _G.AutoColShad == false then
            if not (var_1.Parent) then
            end
        end
        if var_1.Humanoid.Health <= 0 then
        end
    else
        _tp(CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813))
    end
    return
end
function function_891()
    if not (_G.AutoSaber) then
        if not ((var_52.Data.Level.Value >= 200)) then
            if var_52.Backpack:FindFirstChild("Saber") then
            end
        end
    end
    if var_52.Character:FindFirstChild("Saber") then
        if not ((workspace.Map.Jungle.Final.Part.Transparency == 0)) then
            if not ((workspace.Map.Jungle.QuestPlates.Door.Transparency == 0)) then
                if not (((CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-9, -0.928667724, 3.97099491e-8, 1, 1.91679348e-8, 0.928667724, -4.39869794e-8, 0.37091279).Position - var_52.Character.HumanoidRootPart.Position).Magnitude <= 100)) then
                    _tp(var_52.Character.HumanoidRootPart.CFrame)
                    wait(0.5)
                    var_52.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate1.Button.CFrame
                    wait(0.5)
                    var_52.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate2.Button.CFrame
                    wait(0.5)
                    var_52.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate3.Button.CFrame
                    wait(0.5)
                    var_52.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate4.Button.CFrame
                    wait(0.5)
                    var_52.Character.HumanoidRootPart.CFrame = workspace.Map.Jungle.QuestPlates.Plate5.Button.CFrame
                    wait(0.5)
                else
                    _tp(CFrame.new(-1612.55884, 36.9774132, 148.719543, 0.37091279, 3.0717151e-9, -0.928667724, 3.97099491e-8, 1, 1.91679348e-8, 0.928667724, -4.39869794e-8, 0.37091279))
                end
            else
                if not ((workspace.Map.Desert.Burn.Part.Transparency == 0)) then
                    if var_52.Backpack:FindFirstChild("Torch") then
                        var_52.Backpack:FindFirstChild("Torch")
                    end
                    if not (var_52.Character:FindFirstChild("Torch")) then
                        EquipWeapon("Torch")
                        firetouchinterest(var_52.Character.Torch.Handle, workspace.Map.Desert.Burn.Fire, 0)
                        firetouchinterest(var_52.Character.Torch.Handle, workspace.Map.Desert.Burn.Fire, 1)
                        _tp(CFrame.new(1114.61475, 5.04679728, 4350.22803, -0.648466587, -1.28799094e-9, 0.761243105, -5.70652914e-10, 1, 1.20584542e-9, -0.761243105, 3.47544882e-10, -0.648466587))
                    else
                        _tp(CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 0.0000342372805, -0.258850515, 0.965917408))
                    end
                else
                    if not ((var_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan") ~= 0)) then
                        var_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
                        wait(0.5)
                        EquipWeapon("Cup")
                        wait(0.5)
                        var_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", var_52.Character.Cup)
                        wait(Sec)
                        var_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
                    else
                        if not ((var_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == nil)) then
                            var_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                        else
                            if not ((var_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 0)) then
                                if workspace.Enemies:FindFirstChild("Mob Leader") then
                                    workspace.Enemies:FindFirstChild("Mob Leader")
                                end
                                if not (var_53:FindFirstChild("Mob Leader")) then
                                    _tp(CFrame.new(-2967.59521, -4.91089821, 5328.70703, 0.342208564, -0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, -0.939287126, 0.0184739735, 0.342634559))
                                    var_1 = pairs(workspace.Enemies:GetChildren())[1]
                                    var_2 = pairs(workspace.Enemies:GetChildren())[2]
                                    if not ((var_2.Name == "Mob Leader")) then
                                    end
                                    if not (var_13.Alive(var_2)) then
                                        task.wait()
                                        var_13.Kill(var_2, _G.AutoSaber)
                                        if var_2.Humanoid.Health <= 0 then
                                        end
                                        if _G.AutoSaber == false then
                                        end
                                    end
                                end
                            else
                                if not ((var_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1)) then
                                    var_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                                    EquipWeapon("Relic")
                                    _tp(CFrame.new(-1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.66906877e-9, 0.481375456, 2.53851997e-8, 1, -5.79995607e-8, -0.481375456, 6.30572643e-8, 0.876514494))
                                end
                            end
                        end
                    end
                end
            end
        else
            if workspace.Enemies:FindFirstChild("Saber Expert") then
                workspace.Enemies:FindFirstChild("Saber Expert")
            end
            if not (var_53:FindFirstChild("Saber Expert")) then
                var_1 = pairs(workspace.Enemies:GetChildren())[1]
                var_2 = pairs(workspace.Enemies:GetChildren())[2]
                if not ((var_2.Name == "Saber Expert")) then
                end
                if not (var_13.Alive(var_2)) then
                    task.wait()
                    var_13.Kill(var_2, _G.AutoSaber)
                    if var_2.Humanoid.Health <= 0 then
                    end
                    if _G.AutoSaber == false then
                    end
                    if not ((var_2.Humanoid.Health <= 0)) then
                        var_53.Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
                    end
                end
            else
                _tp(CFrame.new(-1401.85046, 29.9773273, 8.81916237, 0.85820812, 8.76083845e-8, 0.513301849, -8.55007443e-8, 1, -2.77243419e-8, -0.513301849, -2.00944328e-8, 0.85820812))
            end
        end
    end
    return
end
function function_892()
    if not (_G.FarmEliteH) then
        var_1 = var_52.PlayerGui.Main.Quest
        var_2 = var_1.Container.QuestTitle.Title.Text
        if var_1.Visible then
            var_1 = var_53.Remotes.CommF_:InvokeServer("EliteHunter")
            if var_1 == nil then
            end
            if not (string.find(var_1, "Cooldown")) then
                var_110()
                return
            end
            task.wait(1)
        else
            var_1 = nil
            var_1 = pairs({ "Diablo", "Urban", "Deandre" })[1]
            var_2 = pairs({ "Diablo", "Urban", "Deandre" })[2]
            if not (string.find(var_2, var_2)) then
                var_1 = var_2
            else
            end
            if not (var_1) then
                var_1 = nil
                var_1 = pairs(var_53:GetChildren())[1]
                var_2 = pairs(var_53:GetChildren())[2]
                if not ((var_2.Name == var_1)) then
                end
                if not (var_2:FindFirstChild("HumanoidRootPart")) then
                    var_1 = var_2
                else
                end
                var_1 = pairs(workspace.Enemies:GetChildren())[1]
                var_2 = pairs(workspace.Enemies:GetChildren())[2]
                if not ((var_2.Name == var_1)) then
                end
                if not (var_13.Alive(var_2)) then
                    var_1 = var_2
                else
                end
                if not (var_1) then
                end
                if not (var_1:FindFirstChild("HumanoidRootPart")) then
                    _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)))
                    wait()
                    var_13.Kill(var_1, _G.FarmEliteH)
                    if not (_G.FarmEliteH) then
                        if not (var_1.Parent) then
                            if var_1.Humanoid.Health <= 0 then
                            end
                        end
                    end
                    if not (var_1.Visible) then
                    end
                else
                    task.wait(5)
                    var_110()
                end
            else
                var_53.Remotes.CommF_:InvokeServer("AbandonQuest")
                task.wait(1)
                var_110()
            end
        end
    end
    return
end
function function_893()
    return game:HttpGet((var_3 .. (var_4 .. ("/servers/Public?sortOrder=Asc&limit=100&cursor=" .. var_6))))
end
function function_894()
    if not (_G.FarmEliteHunt) then
        var_1 = var_52.PlayerGui.Main.Quest
        var_2 = var_1.Container.QuestTitle.Title.Text
        if var_1.Visible then
            var_1 = var_53.Remotes.CommF_:InvokeServer("EliteHunter")
            if var_1 == nil then
            end
            if not (string.find(var_1, "Cooldown")) then
                wait(10)
                return
            end
            task.wait(1)
        else
            var_1 = nil
            var_1 = pairs({ "Diablo", "Urban", "Deandre" })[1]
            var_2 = pairs({ "Diablo", "Urban", "Deandre" })[2]
            if not (string.find(var_2, var_2)) then
                var_1 = var_2
            else
            end
            if not (var_1) then
                var_1 = nil
                var_1 = pairs(var_53:GetChildren())[1]
                var_2 = pairs(var_53:GetChildren())[2]
                if not ((var_2.Name == var_1)) then
                end
                if not (var_2:FindFirstChild("HumanoidRootPart")) then
                    var_1 = var_2
                else
                end
                var_1 = pairs(Enemies:GetChildren())[1]
                var_2 = pairs(Enemies:GetChildren())[2]
                if not ((var_2.Name == var_1)) then
                end
                if not (var_13.Alive(var_2)) then
                    var_1 = var_2
                else
                end
                if not (var_1) then
                end
                if not (var_1:FindFirstChild("HumanoidRootPart")) then
                    _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)))
                    wait()
                    var_13.Kill(var_1, _G.FarmEliteHunt)
                    if not (_G.FarmEliteHunt) then
                        if not (var_1.Parent) then
                            if var_1.Humanoid.Health <= 0 then
                            end
                        end
                    end
                    if not (var_1.Visible) then
                    end
                else
                    wait(5)
                end
            else
                var_53.Remotes.CommF_:InvokeServer("AbandonQuest")
            end
        end
    end
    return
end
function function_895()
    var_108:SetDesc(("Elite Progress : " .. var_53.Remotes.CommF_:InvokeServer("EliteHunter", "Progress")))
    return
end
function function_896()
    return var_1:InvokeServer("Purchase", "MagnetEventGacha26")
end
function function_897()
    return var_1:InvokeServer("Check", "MagnetEventGacha26")
end
function function_898()
    if not (game:GetService("Workspace").Enemies:FindFirstChild(getgenv().SelectMob)) then
        var_1 = pairs(game:GetService("Workspace").Enemies:GetChildren())[1]
        var_2 = pairs(game:GetService("Workspace").Enemies:GetChildren())[2]
        if not ((var_2.Name == getgenv().SelectMob)) then
            if not (var_2:FindFirstChild("Humanoid")) then
                var_2:FindFirstChild("Humanoid")
                if not (var_2:FindFirstChild("HumanoidRootPart")) then
                    var_2:FindFirstChild("HumanoidRootPart")
                end
            end
            if not ((var_2.Humanoid.Health > 0)) then
                game:GetService("RunService").Heartbeat:Wait()
                var_13.Kill(var_2, _G.AutoKillMob)
                if not (_G.AutoKillMob) then
                    if not (var_2.Parent) then
                    end
                end
                if var_2.Humanoid.Health <= 0 then
                end
            end
        end
    end
    return
end
function function_899()
    if not (_G.AutoSaw) then
        var_1 = GetConnectionEnemies("The Saw")
        if not (var_1) then
            task.wait()
            var_13.Kill(var_1, _G.AutoSaw)
            if _G.AutoSaw == false then
            end
            if var_1.Humanoid.Health <= 0 then
            end
        else
            _tp(CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906))
        end
    end
    return
end
function function_900()
    if not (_G.AutoPoleV2) then
        if GetBP("Pole (1st Form)") then
            var_53.Remotes.CommF_:InvokeServer("LoadItem", "Pole (1st Form)")
        end
        if GetBP("Pole (2nd Form)") then
            var_53.Remotes.CommF_:InvokeServer("LoadItem", "Pole (2nd Form)")
        end
        if not (GetBP("Pole (1st Form)")) then
            GetBP("Pole (1st Form)")
        end
        if not ((GetBP("Pole (1st Form)").Level.Value <= 179)) then
            _G.Level = true
        else
            if not (GetBP("Pole (1st Form)")) then
                GetBP("Pole (1st Form)")
            end
            if not ((GetBP("Pole (1st Form)").Level.Value >= 180)) then
                _G.Level = false
            end
        end
        if GetBP("Rumble Fruit") then
            return
        end
        if not (GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("Z")) then
            GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("Z")
            if not (GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("X")) then
                GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("X")
                if not (GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("C")) then
                    GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("C")
                    if not (GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("V")) then
                        GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("V")
                    end
                end
            end
        end
        if not (GetBP("Rumble Fruit").AwakenedMoves:FindFirstChild("F")) then
            _G.SelectChip = nil
            _G.Raiding = false
            _G.Auto_Awakener = false
            if not ((var_52.Data.Fragments.Value >= 5000)) then
                var_53.Remotes.CommF_:InvokeServer("Thunder God", "Talk")
                wait(Sec)
                var_53.Remotes.CommF_:InvokeServer("Thunder God", "Sure")
            end
        else
            if var_53.Remotes.CommF_:InvokeServer("Awakener", "Check") == nil then
            end
            if not ((var_53.Remotes.CommF_:InvokeServer("Awakener", "Check") == 0)) then
                _G.SelectChip = "Rumble"
                var_1 = var_53.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.SelectChip)
                if not (var_1) then
                    var_1:Stop()
                end
                _G.Raiding = true
                _G.Auto_Awakener = true
            end
        end
    end
    return
end
function function_901()
    var_1 = GetConnectionEnemies("Thunder God")
    if not (var_1) then
        task.wait()
        var_13.Kill(var_1, _G.AutoPole)
        if not (_G.AutoPole) then
            if not (var_1.Parent) then
            end
        end
        if var_1.Humanoid.Health <= 0 then
        end
    else
        _tp(CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188))
    end
    return
end
function function_902()
    var_1 = pairs(var_53.NPCs:GetChildren())[1]
    var_2 = pairs(var_53.NPCs:GetChildren())[2]
    if not ((var_2.Name == "Legendary Sword Dealer ")) then
        _tp(var_2.HumanoidRootPart.CFrame)
    end
    return
end
function function_903()
    var_1 = GetConnectionEnemies("Dough King")
    if not (var_1) then
        task.wait()
        var_13.Kill(var_1, _G.AutoAttackDoughKing)
        if not (_G.AutoAttackDoughKing) then
            if not (var_1.Parent) then
            end
        end
        if var_1.Humanoid.Health <= 0 then
        end
    else
        _tp(CFrame.new(-1943.6765, 251.5095, -12337.8809))
    end
    return
end
function function_904()
    if workspace.Map.CakeLoaf:FindFirstChild("RedDoor") then
        if not (GetBP("Red Key")) then
            var_53.Remotes.CommF_:InvokeServer("CakeScientist", "Check")
            var_53.Remotes.CommF_:InvokeServer("RaidsNpc", "Check")
        end
    else
        if not (workspace.Map.CakeLoaf:FindFirstChild("RedDoor")) then
            if not (GetBP("Red Key")) then
                task.wait()
                _tp(CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-8, 0.98883605, 3.60619588e-8, 1, 1.35681812e-8, -0.98883605, 3.36376011e-8, 0.149007782))
                if not (getgenv().AutoDoughKing) then
                end
                if (var_52.Character.HumanoidRootPart.CFrame - CFrame.new(-2681.97998, 64.3921585, -12853.7363, 0.149007782, -1.87902192e-8, 0.98883605, 3.60619588e-8, 1, 1.35681812e-8, -0.98883605, 3.36376011e-8, 0.149007782)).Magnitude <= 5 then
                end
                EquipWeapon("Red Key")
            end
        else
            if not (GetConnectionEnemies("Dough King")) then
                var_1 = GetConnectionEnemies("Dough King")
                if not (var_1) then
                    task.wait()
                    var_13.Kill(var_1, _G.AutoDoughKing)
                    if not (_G.AutoDoughKing) then
                        if not (var_1.Parent) then
                        end
                    end
                    if var_1.Humanoid.Health <= 0 then
                    end
                else
                    _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375))
                end
            end
        end
    end
    if not (GetBP("Sweet Chalice")) then
        var_53.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
        _G.AutoAttackDoughKing = true
    else
        _G.AutoAttackDoughKing = false
    end
    if not (GetBP("God's Chalice")) then
        GetBP("God's Chalice")
    end
    if not ((GetM("Conjured Cocoa") >= 10)) then
        var_53.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
    end
    if not (var_52.Backpack:FindFirstChild("God's Chalice")) then
    end
    if not (var_52.Character:FindFirstChild("God's Chalice")) then
        _G.FarmEliteHunt = true
    else
        _G.FarmEliteHunt = false
    end
    if not ((GetM("Conjured Cocoa") <= 10)) then
        var_1 = GetConnectionEnemies({ "Cocoa Warrior", "Chocolate Bar Battler" })
        if not (var_1) then
            task.wait()
            var_13.Kill(var_1, _G.AutoDoughKing)
            if _G.AutoDoughKing == false then
                if not (var_1.Parent) then
                end
            end
            if var_1.Humanoid.Health <= 0 then
            end
        else
            _tp(CFrame.new(402.7189025878906, 81.06050109863281, -12259.54296875))
        end
    end
    return
end
function function_905()
    if not (_G.CDK_TS) then
        if not ((tostring(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")) ~= "opened")) then
            wait(0.7)
            var_53.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")
            wait(0.3)
            var_53.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
        else
            if not ((var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Finished == nil)) then
                var_53.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
            else
                if not ((var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Finished == false)) then
                    if not ((tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Good) == -3)) then
                        QuestTushita_1 = true
                        QuestTushita_2 = false
                        QuestTushita_3 = false
                        wait()
                        _tp(CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875))
                        if (CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                            if not (_G.CDK_TS) then
                            end
                        end
                        if tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Good) == 1 then
                        end
                        if not (((CFrame.new(-4602.5107421875, 16.446542739868164, -2880.998046875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10)) then
                            wait(0.7)
                            var_53.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"), "Check")
                            wait(0.5)
                            var_53.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                        end
                        wait(1)
                        wait()
                        _tp(CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125))
                        if (CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                            if not (_G.CDK_TS) then
                            end
                        end
                        if tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Good) == 1 then
                        end
                        if not (((CFrame.new(4001.185302734375, 10.089399337768555, -2654.86328125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10)) then
                            wait(0.7)
                            var_53.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"), "Check")
                            wait(0.5)
                            var_53.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                        end
                        wait(1)
                        wait()
                        _tp(CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625))
                        if (CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                            if not (_G.CDK_TS) then
                            end
                        end
                        if tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Good) == 1 then
                        end
                        if not (((CFrame.new(-9530.763671875, 7.245208740234375, -8375.5087890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10)) then
                            wait(0.7)
                            var_53.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"), "Check")
                            wait(0.5)
                            var_53.Remotes.CommF_:InvokeServer("CDKQuest", "BoatQuest", workspace.NPCs:FindFirstChild("Luxury Boat Dealer"))
                        end
                        wait(1)
                    else
                        if not ((tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Good) == -4)) then
                            QuestTushita_1 = false
                            QuestTushita_2 = true
                            QuestTushita_3 = false
                            wait()
                            _G.AutoRaidCastle = true
                            if not (_G.CDK_TS) then
                            end
                            if tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Good) == 2 then
                            end
                            _G.AutoRaidCastle = false
                        else
                            if not ((tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Good) == -5)) then
                                QuestTushita_1 = false
                                QuestTushita_2 = false
                                QuestTushita_3 = true
                                if not (workspace.Enemies:FindFirstChild("Cake Queen")) then
                                    var_1 = pairs(workspace.Enemies:GetChildren())[1]
                                    var_2 = pairs(workspace.Enemies:GetChildren())[2]
                                    if not ((var_2.Name == "Cake Queen")) then
                                        if not (var_2:FindFirstChild("Humanoid")) then
                                            var_2:FindFirstChild("Humanoid")
                                            if not (var_2:FindFirstChild("HumanoidRootPart")) then
                                                var_2:FindFirstChild("HumanoidRootPart")
                                            end
                                        end
                                        if not ((var_2.Humanoid.Health > 0)) then
                                            wait()
                                            var_13.Kill(var_2, _G.CDK_TS)
                                            if not (_G.CDK_TS) then
                                                if not (var_2.Parent) then
                                                    if var_2.Humanoid.Health <= 0 then
                                                    end
                                                end
                                            end
                                            if tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Good) == 3 then
                                            end
                                        end
                                    end
                                else
                                    if not (var_53:FindFirstChild("Cake Queen")) then
                                        var_53:FindFirstChild("Cake Queen")
                                    end
                                    if not ((var_53:FindFirstChild("Cake Queen").Humanoid.Health > 0)) then
                                        _tp((var_53:FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)))
                                    else
                                        if not (((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - workspace.Map.HeavenlyDimension.Spawn.Position).Magnitude <= 1000)) then
                                            var_1 = pairs(workspace.Map.HeavenlyDimension.Exit:GetChildren())[1]
                                            var_2 = pairs(workspace.Map.HeavenlyDimension.Exit:GetChildren())[2]
                                            Ex = var_1
                                            if not ((Ex == 2)) then
                                                wait()
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map.HeavenlyDimension.Exit.CFrame
                                                if not (_G.CDK_TS) then
                                                end
                                                if tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Good) == 3 then
                                                end
                                            end
                                            wait()
                                            wait()
                                            _tp(CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625))
                                            var_1 = pairs(workspace.Map.HeavenlyDimension:GetDescendants())[1]
                                            var_2 = pairs(workspace.Map.HeavenlyDimension:GetDescendants())[2]
                                            if not (var_2:IsA("ProximityPrompt")) then
                                                fireproximityprompt(var_2)
                                            end
                                            if (CFrame.new(-22529.6171875, 5275.77392578125, 3873.5712890625).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5 then
                                            end
                                            wait(2)
                                            _G.DoneT1 = true
                                            if not (_G.CDK_TS) then
                                            end
                                            if _G.DoneT1 then
                                            end
                                            wait()
                                            wait()
                                            _tp(CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875))
                                            var_1 = pairs(workspace.Map.HeavenlyDimension:GetDescendants())[1]
                                            var_2 = pairs(workspace.Map.HeavenlyDimension:GetDescendants())[2]
                                            if not (var_2:IsA("ProximityPrompt")) then
                                                fireproximityprompt(var_2)
                                            end
                                            if (CFrame.new(-22637.291015625, 5281.365234375, 3749.28857421875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5 then
                                            end
                                            wait(2)
                                            _G.DoneT2 = true
                                            if _G.DoneT2 then
                                            end
                                            if _G.CDK_TS == false then
                                            end
                                            wait()
                                            task.wait()
                                            _tp(CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375))
                                            var_1 = pairs(workspace.Map.HeavenlyDimension:GetDescendants())[1]
                                            var_2 = pairs(workspace.Map.HeavenlyDimension:GetDescendants())[2]
                                            if not (var_2:IsA("ProximityPrompt")) then
                                                fireproximityprompt(var_2)
                                            end
                                            if (CFrame.new(-22791.14453125, 5277.16552734375, 3764.570068359375).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 5 then
                                            end
                                            wait(2)
                                            _G.DoneT3 = true
                                            if _G.DoneT3 then
                                            end
                                            if _G.CDK_TS == false then
                                            end
                                            var_1 = pairs(workspace.Enemies:GetChildren())[1]
                                            var_2 = pairs(workspace.Enemies:GetChildren())[2]
                                            if not (((var_2:FindFirstChild("HumanoidRootPart").Position - CFrame.new(-22695.7012, 5270.93652, 3814.42847, 0.11794927, 3.32185834e-8, 0.99301964, -8.73070718e-8, 1, -2.30819008e-8, -0.99301964, -8.3975138e-8, 0.11794927).Position).Magnitude <= 300)) then
                                                if not (var_2:FindFirstChild("HumanoidRootPart")) then
                                                    var_2:FindFirstChild("HumanoidRootPart")
                                                    if not (var_2:FindFirstChild("Humanoid")) then
                                                        var_2:FindFirstChild("Humanoid")
                                                    end
                                                end
                                                if not ((var_2:FindFirstChild("Humanoid").Health > 0)) then
                                                    wait()
                                                    var_13.Kill(var_2, _G.CDK_TS)
                                                    if not (_G.CDK_TS) then
                                                        if var_2.Humanoid.Health <= 0 then
                                                        end
                                                    end
                                                    if not (var_2.Parent) then
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return
end
function function_906()
    if not (_G.CDK_YM) then
        if not ((tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) == -5)) then
            if not (workspace.Map:FindFirstChild("HellDimension")) then
            end
            if not (((Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude > 1000)) then
                var_1 = GetConnectionEnemies("Soul Reaper")
                if not (var_1) then
                    task.wait()
                    _tp(var_1.HumanoidRootPart.CFrame)
                    if var_1.Humanoid.Health <= 0 then
                        if not (_G.CDK_YM) then
                            if not (var_1.Parent) then
                                if tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) == 3 then
                                    if not (workspace.Map:FindFirstChild("HellDimension")) then
                                        workspace.Map:FindFirstChild("HellDimension")
                                    end
                                end
                            end
                        end
                    end
                    if (Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 1000 then
                    end
                else
                    if var_52.Backpack:FindFirstChild("Hallow Essence") then
                        var_52.Backpack:FindFirstChild("Hallow Essence")
                    end
                    if not (var_52.Character:FindFirstChild("Hallow Essence")) then
                        _tp(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
                        task.wait()
                        if (CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125).Position - Root.Position).Magnitude <= 8 then
                        end
                        EquipWeapon("Hallow Essence")
                    else
                        if not (var_53:FindFirstChild("Soul Reaper")) then
                            var_53:FindFirstChild("Soul Reaper")
                        end
                        if not ((var_53:FindFirstChild("Soul Reaper").Humanoid.Health > 0)) then
                            _tp(var_53:FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame)
                        else
                            if not ((var_53.Remotes.CommF_:InvokeServer("Bones", "Check") < 50)) then
                                if workspace.Enemies:FindFirstChild("Soul Reaper") then
                                    if var_53:FindFirstChild("Soul Reaper") then
                                    end
                                end
                            end
                            if workspace.Map:FindFirstChild("HellDimension") then
                                if workspace.Enemies:FindFirstChild("Reborn Skeleton") then
                                    workspace.Enemies:FindFirstChild("Reborn Skeleton")
                                    if workspace.Enemies:FindFirstChild("Living Zombie") then
                                        workspace.Enemies:FindFirstChild("Living Zombie")
                                        if workspace.Enemies:FindFirstChild("Domenic Soul") then
                                            workspace.Enemies:FindFirstChild("Domenic Soul")
                                        end
                                    end
                                end
                                if not (workspace.Enemies:FindFirstChild("Posessed Mummy")) then
                                    var_1 = pairs(workspace.Enemies:GetChildren())[1]
                                    var_2 = pairs(workspace.Enemies:GetChildren())[2]
                                    if var_2.Name == "Reborn Skeleton" then
                                        if var_2.Name == "Living Zombie" then
                                            if var_2.Name == "Demonic Soul" then
                                            end
                                        end
                                    end
                                    if not ((var_2.Name == "Posessed Mummy")) then
                                        if not (var_2:FindFirstChild("HumanoidRootPart")) then
                                            var_2:FindFirstChild("HumanoidRootPart")
                                            if not (var_2:FindFirstChild("Humanoid")) then
                                                var_2:FindFirstChild("Humanoid")
                                            end
                                        end
                                        if not ((var_2:FindFirstChild("Humanoid").Health > 0)) then
                                            task.wait()
                                            var_13.Kill(var_2, _G.CDK_YM)
                                            if not (_G.CDK_YM) then
                                                if var_2.Humanoid.Health <= 0 then
                                                end
                                            end
                                            if not (var_2.Parent) then
                                            end
                                        end
                                    end
                                else
                                    _tp(CFrame.new(-9515.2255859375, 164.0062255859375, 5785.38330078125))
                                end
                            else
                                var_53.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                            end
                        end
                    end
                end
            end
        end
    end
    return
end
function function_907()
    if not (_G.CDK_YM) then
        if not ((tostring(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")) ~= "opened")) then
            var_53.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor")
            var_53.Remotes.CommF_:InvokeServer("CDKQuest", "OpenDoor", true)
        else
            if not ((var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Finished == nil)) then
                var_53.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                var_53.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
            else
                if not ((var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Finished == false)) then
                    if not ((tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) == -3)) then
                        QuestYama_1 = true
                        QuestYama_2 = false
                        QuestYama_3 = false
                        task.wait()
                        if workspace.Enemies:FindFirstChild("Forest Pirate") then
                            _tp(CFrame.new(-13223.521484375, 428.1938171386719, -7766.06787109375))
                        else
                            var_1 = GetConnectionEnemies("Forest Pirate")
                            if not (var_1) then
                                _tp(workspace.Enemies:FindFirstChild("Forest Pirate").HumanoidRootPart.CFrame)
                            end
                        end
                        if tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) == 1 then
                        end
                        if not (_G.CDK_YM) then
                        end
                    else
                        if not ((tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) == -4)) then
                            QuestYama_1 = false
                            QuestYama_2 = true
                            QuestYama_3 = false
                            var_1 = pairs(game:GetService("Players").LocalPlayer.QuestHaze:GetChildren())[1]
                            var_2 = pairs(game:GetService("Players").LocalPlayer.QuestHaze:GetChildren())[2]
                            var_1 = pairs(var_11)[1]
                            var_2 = pairs(var_11)[2]
                            if not (string.find(var_1, var_2.Name)) then
                                string.find(var_1, var_2.Name)
                            end
                            if not ((var_2.Value > 0)) then
                                if not (((var_2.Position - Root.Position).Magnitude <= 1000)) then
                                end
                                if not (workspace.Enemies:FindFirstChild(var_1)) then
                                    var_1 = pairs(workspace.Enemies:GetChildren())[1]
                                    var_2 = pairs(workspace.Enemies:GetChildren())[2]
                                    if not (var_2:FindFirstChild("HumanoidRootPart")) then
                                        var_2:FindFirstChild("HumanoidRootPart")
                                        if not (var_2:FindFirstChild("Humanoid")) then
                                            var_2:FindFirstChild("Humanoid")
                                            if not ((var_2:FindFirstChild("Humanoid").Health > 0)) then
                                            end
                                        end
                                    end
                                    if not (var_2:FindFirstChild("HazeESP")) then
                                        wait()
                                        var_13.Kill(var_2, _G.CDK_YM)
                                        if not (_G.CDK_YM) then
                                            if tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) == 2 then
                                                if not (var_2:FindFirstChild("HazeESP")) then
                                                end
                                            end
                                        end
                                        if var_2.Humanoid.Health <= 0 then
                                        end
                                    end
                                else
                                    _tp(var_2)
                                end
                            end
                        else
                            if not ((tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) == -5)) then
                                QuestYama_1 = false
                                QuestYama_2 = false
                                QuestYama_3 = true
                                if not (workspace.Map:FindFirstChild("HellDimension")) then
                                    if not (((Root.Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 1000)) then
                                        var_1 = pairs(workspace.Map.HellDimension.Exit:GetChildren())[1]
                                        var_2 = pairs(workspace.Map.HellDimension.Exit:GetChildren())[2]
                                        if not ((tonumber(var_1) == 2)) then
                                            task.wait()
                                            Root.CFrame = workspace.Map.HellDimension.Exit.CFrame
                                            if not (_G.CDK_YM) then
                                            end
                                            if tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) == 3 then
                                            end
                                        end
                                        EquipWeapon(_G.SelectWeapon)
                                        if not ((tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) ~= 3)) then
                                            task.wait()
                                            task.wait()
                                            _tp(workspace.Map.HellDimension.Torch1.Particles.CFrame)
                                            var_1 = pairs(workspace.Map.HellDimension:GetDescendants())[1]
                                            var_2 = pairs(workspace.Map.HellDimension:GetDescendants())[2]
                                            if not (var_2:IsA("ProximityPrompt")) then
                                                fireproximityprompt(var_2)
                                            end
                                            if (workspace.Map.HellDimension.Torch1.Particles.Position - Root.Position).Magnitude < 5 then
                                            end
                                            wait(2)
                                            _G.T1Yama = true
                                            if not (_G.CDK_YM) then
                                                if _G.T1Yama then
                                                end
                                            end
                                            if tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) == 3 then
                                            end
                                            task.wait()
                                            task.wait()
                                            _tp(workspace.Map.HellDimension.Torch2.Particles.CFrame)
                                            var_1 = pairs(workspace.Map.HellDimension:GetDescendants())[1]
                                            var_2 = pairs(workspace.Map.HellDimension:GetDescendants())[2]
                                            if not (var_2:IsA("ProximityPrompt")) then
                                                fireproximityprompt(var_2)
                                            end
                                            if (workspace.Map.HellDimension.Torch2.Particles.Position - Root.Position).Magnitude < 5 then
                                            end
                                            wait(2)
                                            _G.T2Yama = true
                                            if _G.T2Yama then
                                                if _G.CDK_YM == false then
                                                end
                                            end
                                            if tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) == 3 then
                                            end
                                            wait()
                                            task.wait()
                                            _tp(workspace.Map.HellDimension.Torch3.Particles.CFrame)
                                            var_1 = pairs(workspace.Map.HellDimension:GetDescendants())[1]
                                            var_2 = pairs(workspace.Map.HellDimension:GetDescendants())[2]
                                            if not (var_2:IsA("ProximityPrompt")) then
                                                fireproximityprompt(var_2)
                                            end
                                            if (workspace.Map.HellDimension.Torch3.Particles.Position - Root.Position).Magnitude < 5 then
                                            end
                                            wait(2)
                                            _G.T3Yama = true
                                            if _G.T3Yama then
                                                if _G.CDK_YM == false then
                                                end
                                            end
                                            if tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) == 3 then
                                            end
                                        end
                                        var_1 = pairs(workspace.Enemies:GetChildren())[1]
                                        var_2 = pairs(workspace.Enemies:GetChildren())[2]
                                        if not (((var_2:FindFirstChild("HumanoidRootPart").Position - workspace.Map.HellDimension.Spawn.Position).Magnitude <= 300)) then
                                            if not (var_2:FindFirstChild("HumanoidRootPart")) then
                                                var_2:FindFirstChild("HumanoidRootPart")
                                                if not (var_2:FindFirstChild("Humanoid")) then
                                                    var_2:FindFirstChild("Humanoid")
                                                end
                                            end
                                            if not ((var_2:FindFirstChild("Humanoid").Health > 0)) then
                                                task.wait()
                                                var_13.Kill(var_2, _G.CDK_YM)
                                                if not (_G.CDK_YM) then
                                                    if var_2.Humanoid.Health <= 0 then
                                                        if not (var_2.Parent) then
                                                        end
                                                    end
                                                end
                                                if tonumber(var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress").Evil) == 3 then
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return
end
function function_908()
    if not (_G.CDK) then
        var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
        var_53.Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
        var_53.Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Boss")
        var_1 = GetConnectionEnemies("Cursed Skeleton Boss")
        if not (var_1) then
            wait()
            if var_52.Character:FindFirstChild("Yama") then
                var_52.Character:FindFirstChild("Yama")
            end
            if not (var_52.Backpack:FindFirstChild("Yama")) then
                EquipWeapon("Yama")
            else
                if var_52.Character:FindFirstChild("Tushita") then
                    var_52.Character:FindFirstChild("Tushita")
                end
                if not (var_52.Backpack:FindFirstChild("Tushita")) then
                    EquipWeapon("Tushita")
                end
            end
            _tp((var_1.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)))
            if not (_G.CDK) then
                if not (var_1.Parent) then
                end
            end
            if var_1.Humanoid.Health <= 0 then
            end
        else
            _tp(CFrame.new(-12318.193359375, 601.9518432617188, -6538.662109375))
            wait(0.5)
            _tp(workspace.Map.Turtle.Cursed.BossDoor.CFrame)
        end
    end
    return
end
function function_909()
    if not (workspace.EmberTemplate:FindFirstChild("Part")) then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.EmberTemplate.Part.CFrame
    end
    return
end
function function_910()
    var_1 = checkQuesta()
    var_2 = nil
    var_3 = nil
    var_4 = nil
    if not ((var_1 == true)) then
    end
    if BackTODoJo() then
        if not ((var_4 == 1)) then
            if var_2 == "Hydra Enforcer" then
            end
            if not ((var_2 == "Venomous Assailant")) then
                wait()
                DragonMobClear(true, var_2, CFrame.new(4620.61572265625, 1002.2954711914062, 399.0868835449219))
                if not (_G.FarmBlazeEM) then
                    if not (var_1) then
                    end
                end
                if BackTODoJo() then
                end
            end
        else
            if not ((var_4 == 2)) then
                if not (workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true)) then
                    wait()
                    spawn(function_911)
                    if not (((workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position - Root.Position).Magnitude <= 200)) then
                        MousePos = workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).Position
                        Useskills("Melee", "Z")
                        Useskills("Melee", "X")
                        Useskills("Melee", "C")
                        wait(0.5)
                        Useskills("Sword", "Z")
                        Useskills("Sword", "X")
                        wait(0.5)
                        Useskills("Blox Fruit", "Z")
                        Useskills("Blox Fruit", "X")
                        Useskills("Blox Fruit", "C")
                        wait(0.5)
                        Useskills("Gun", "Z")
                        Useskills("Gun", "X")
                    end
                    if not (_G.FarmBlazeEM) then
                        if not (var_1) then
                        end
                    end
                    if BackTODoJo() then
                    end
                end
            end
        end
    else
        _tp(CFrame.new(5813, 1208, 884))
        DragonMobClear(false, nil, nil)
    end
    return
end
function function_911()
    _tp((workspace.Map.Waterfall.IslandModel:FindFirstChild("Meshes/bambootree", true).CFrame * CFrame.new(4, 0, 0)))
    return
end
function function_912()
    var_1 = { [1] = { Context = "RequestQuest" } }
    game:GetService("ReplicatedStorage")
    game:GetService("ReplicatedStorage"):WaitForChild("Modules")
    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net")
    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter")
    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter"):InvokeServer(unpack(var_1))
    return
end
function function_913()
    game:GetService("ReplicatedStorage")
    game:GetService("ReplicatedStorage"):WaitForChild("Modules")
    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net")
    game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter")
    var_2 = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/DragonHunter"):InvokeServer(unpack(var_1))
    return
end
function function_914()
    var_1 = { [1] = { NPC = "Dojo Trainer", Command = "RequestQuest" } }
    var_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest")
    var_2 = var_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(var_1))
    var_3 = printBeltName(var_2)
    if not ((debug == false)) then
        if var_2 then
        end
    end
    if var_3 then
        _tp(CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875))
        debug = true
    else
        if not ((debug == true)) then
        end
        if not (((CFrame.new(5865.0234375, 1208.3154296875, 871.15185546875).Position - var_52.Character.HumanoidRootPart.Position).Magnitude <= 50)) then
            if not ((var_3 == "White")) then
                var_1 = GetConnectionEnemies("Skull Slayer")
                if not (var_1) then
                    task.wait()
                    var_13.Kill(var_1, _G.Dojoo)
                    if not (var_2) then
                        if not (_G.Dojoo) then
                        end
                    end
                    if not (var_13.Alive(var_1)) then
                    end
                else
                    _tp(CFrame.new(-16759.58984375, 71.28376770019531, 1595.3399658203125))
                end
            else
                if not ((var_3 == "Yellow")) then
                    task.wait()
                    _G.SeaBeast1 = true
                    _G.TerrorShark = true
                    _G.Shark = true
                    _G.Piranha = true
                    _G.MobCrew = true
                    _G.FishBoat = true
                    _G.SailBoats = true
                    if not (_G.Dojoo) then
                    end
                    if not (var_2) then
                    end
                    _G.SeaBeast1 = false
                    _G.TerrorShark = false
                    _G.Shark = false
                    _G.Piranha = false
                    _G.MobCrew = false
                    _G.FishBoat = false
                    _G.SailBoats = false
                else
                    if not ((var_3 == "Green")) then
                        task.wait()
                        _G.SailBoats = true
                        if not (_G.Dojoo) then
                        end
                        if not (var_2) then
                        end
                        _G.SailBoats = false
                    else
                        if not ((var_3 == "Purple")) then
                            task.wait()
                            _G.FarmEliteHunt = true
                            if not (_G.Dojoo) then
                            end
                            if not (var_2) then
                            end
                            _G.FarmEliteHunt = false
                        else
                            if not ((var_3 == "Red")) then
                                task.wait()
                                _G.SailBoats = true
                                _G.FishBoat = true
                                if not (_G.Dojoo) then
                                end
                                if not (var_2) then
                                end
                                _G.SailBoats = false
                                _G.FishBoat = false
                            else
                                if not ((var_3 == "Black")) then
                                    task.wait()
                                    if workspace.Map:FindFirstChild("PrehistoricIsland") then
                                        workspace.Map:FindFirstChild("PrehistoricIsland")
                                    end
                                    if not (workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island")) then
                                        _G.Prehis_Find = true
                                        if not (workspace.Map.PrehistoricIsland.Core.ActivationPrompt:FindFirstChild("ProximityPrompt", true)) then
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
                                    if not (_G.Dojoo) then
                                    end
                                    if not (var_2) then
                                    end
                                    _G.Prehis_Find = false
                                    _G.Prehis_Skills = false
                                else
                                    if var_3 == "Orange" then
                                    end
                                    if not ((var_3 == "Blue")) then
                                        return _G, _G, _G, _G, _G, _G, _G, _G, _G, nil
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    if var_2 then
        debug = false
        var_1 = { [1] = { NPC = "Dojo Trainer", Command = "ClaimQuest" } }
        var_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest")
        var_53.Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(var_1))
    end
    return
end
function function_915()
    if not (_G.AutoMatSoul) then
    end
    if not ((GetWP("Skull Guitar") == false)) then
        if not ((GetM("Bones") >= 500)) then
            if not ((GetM("Ectoplasm") >= 250)) then
            end
        end
        if not ((GetM("Dark Fragment") >= 1)) then
            var_53.Remotes.CommF_:InvokeServer("soulGuitarBuy", true)
        else
            if not ((GetM("Ectoplasm") <= 250)) then
                if not (_G.AutoMatSoul) then
                end
                if not (World2) then
                    var_1 = { "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer", "Arctic Warrior" }
                    var_2 = GetConnectionEnemies(var_1)
                    if not (var_2) then
                        task.wait()
                        var_13.Kill(var_2, _G.AutoMatSoul)
                        if not (_G.AutoMatSoul) then
                            if not (var_2.Parent) then
                            end
                        end
                        if var_2.Humanoid.Health <= 0 then
                        end
                    else
                        var_53.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                    end
                else
                    var_53.Remotes.CommF_:InvokeServer("TravelDressrosa")
                end
            else
                if not ((GetM("Dark Fragment") < 1)) then
                    if not (_G.AutoMatSoul) then
                    end
                    if not (World2) then
                        var_1 = GetConnectionEnemies("Darkbeard")
                        if not (var_1) then
                            task.wait()
                            var_13.Kill(var_1, _G.AutoMatSoul)
                            if _G.AutoMatSoul then
                            end
                            if var_1.Humanoid.Health <= 0 then
                            end
                        else
                            _tp(CFrame.new(3798.4575195313, 13.826690673828, -3399.806640625))
                        end
                    else
                        var_53.Remotes.CommF_:InvokeServer("TravelDressrosa")
                    end
                    if GetConnectionEnemies("Darkbeard") then
                        Hop()
                    end
                else
                    if not ((GetM("Bones") <= 500)) then
                        if not (_G.AutoMatSoul) then
                        end
                        if not (World3) then
                            var_1 = { "Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy" }
                            var_2 = GetConnectionEnemies(var_1)
                            if not (var_2) then
                                task.wait()
                                var_13.Kill(var_2, _G.AutoMatSoul)
                                if not (_G.AutoMatSoul) then
                                    if var_2.Humanoid.Health <= 0 then
                                        if not (var_2.Parent) then
                                        end
                                    end
                                end
                                if var_2.Humanoid.Health <= 0 then
                                end
                            else
                                _tp(CFrame.new(-9504.8564453125, 172.14292907714844, 6057.259765625))
                            end
                        else
                            var_53.Remotes.CommF_:InvokeServer("TravelZou")
                        end
                    end
                end
            end
        end
    end
    return
end
function function_916()
    if not (_G.Auto_Soul_Guitar) then
        if not (World3) then
            var_53.Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
            var_53.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
            if not ((var_53.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check") == nil)) then
                _tp(CFrame.new(-8655.0166015625, 141.3166961669922, 6160.0224609375))
                var_53.Remotes.CommF_:InvokeServer("gravestoneEvent", 2)
                var_53.Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
            else
                if not ((var_53.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check").Swamp == false)) then
                    Quest1 = true
                    Quest2 = false
                    Quest3 = false
                    Quest4 = false
                    var_1 = GetConnectionEnemies("Living Zombie")
                    if not (var_1) then
                        task.wait()
                        var_13.Kill(var_1, _G.Auto_Soul_Guitar)
                        if not (_G.Auto_Soul_Guitar) then
                            if var_1.Humanoid.Health <= 0 then
                                if not (var_1.Parent) then
                                end
                            end
                        end
                        if workspace.Map["Haunted Castle"].SwampWater.Color ~= Color3.fromRGB(117, 0, 0) then
                        end
                    else
                        _tp(CFrame.new(-10170.7275390625, 138.6524658203125, 5934.26513671875))
                    end
                else
                    if not ((var_53.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check").Gravestones == false)) then
                        Quest1 = false
                        Quest2 = true
                        Quest3 = false
                        Quest4 = false
                        GetFirePlacard("7", "Left")
                        GetFirePlacard("6", "Left")
                        GetFirePlacard("5", "Left")
                        GetFirePlacard("4", "Right")
                        GetFirePlacard("3", "Left")
                        GetFirePlacard("2", "Right")
                        GetFirePlacard("1", "Right")
                    else
                        if not ((var_53.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check").Ghost == false)) then
                            var_53.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost")
                            var_53.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Ghost", true)
                        else
                            if not ((var_53.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check").Trophies == false)) then
                                Quest1 = false
                                Quest2 = false
                                Quest3 = true
                                Quest4 = false
                                _tp(CFrame.new(-9532.8232421875, 6.471667766571045, 6078.068359375))
                                wait()
                                var_1 = getRT(1)
                                var_2 = getT(1)
                                if not (var_1) then
                                end
                                if not (var_2) then
                                    fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector"))
                                end
                                if var_1 == var_2 then
                                end
                                wait()
                                var_1 = getRT(2)
                                var_2 = getT(3)
                                if not (var_1) then
                                end
                                if not (var_2) then
                                    fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment3:FindFirstChild("ClickDetector"))
                                end
                                if var_1 == var_2 then
                                end
                                wait()
                                var_1 = getRT(3)
                                var_2 = getT(4)
                                if not (var_1) then
                                end
                                if not (var_2) then
                                    fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment4:FindFirstChild("ClickDetector"))
                                end
                                if var_1 == var_2 then
                                end
                                wait()
                                var_1 = getRT(4)
                                var_2 = getT(7)
                                if not (var_1) then
                                end
                                if not (var_2) then
                                    fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment7:FindFirstChild("ClickDetector"))
                                end
                                if var_1 == var_2 then
                                end
                                wait()
                                var_1 = getRT(5)
                                var_2 = getT(10)
                                if not (var_1) then
                                end
                                if not (var_2) then
                                    fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment10:FindFirstChild("ClickDetector"))
                                end
                                if var_1 == var_2 then
                                end
                                wait()
                                fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment2:FindFirstChild("ClickDetector"))
                                fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment5:FindFirstChild("ClickDetector"))
                                fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment6:FindFirstChild("ClickDetector"))
                                fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment8:FindFirstChild("ClickDetector"))
                                fireclickdetector(workspace.Map["Haunted Castle"].Tablet.Segment9:FindFirstChild("ClickDetector"))
                                if workspace.Map["Haunted Castle"].Tablet.Segment2.Line.Rotation.Z == 0 then
                                    if workspace.Map["Haunted Castle"].Tablet.Segment5.Line.Rotation.Z == 0 then
                                        if workspace.Map["Haunted Castle"].Tablet.Segment6.Line.Rotation.Z == 0 then
                                            if workspace.Map["Haunted Castle"].Tablet.Segment8.Line.Rotation.Z == 0 then
                                            end
                                        end
                                    end
                                end
                                if workspace.Map["Haunted Castle"].Tablet.Segment9.Line.Rotation.Z == 0 then
                                end
                            else
                                if not ((var_53.Remotes.CommF_:InvokeServer("GuitarPuzzleProgress", "Check").Pipes == false)) then
                                    Quest1 = false
                                    Quest2 = false
                                    Quest3 = false
                                    Quest4 = true
                                    _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
                                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
                                    _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
                                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                                    _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
                                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                                    _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
                                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
                                    _tp(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
                                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                                    fireclickdetector(workspace.Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return
end
function function_917()
    var_1 = GetConnectionEnemies("Living Zombie")
    if not (var_1) then
        var_1.HumanoidRootPart.CFrame = CFrame.new(-10138.3974609375, 138.6524658203125, 5902.89208984375)
        var_1.Head.CanCollide = false
        var_1.Humanoid.Sit = false
        var_1.HumanoidRootPart.CanCollide = false
        var_1.Humanoid.JumpPower = 0
        var_1.Humanoid.WalkSpeed = 0
        if not (var_1.Humanoid:FindFirstChild("Animator")) then
            var_1.Humanoid:FindFirstChild("Animator")
            var_1.Humanoid:FindFirstChild("Animator"):Destroy()
        end
    end
    return
end
function function_918()
    if not ((Quest1 == true)) then
        var_91:SetDesc("Quest Number : Quest1")
    else
        if not ((Quest2 == true)) then
            var_91:SetDesc("Quest Number : Quest2")
        else
            if not ((Quest3 == true)) then
                var_91:SetDesc("Quest Number : Quest3")
            else
                if not ((Quest4 == true)) then
                    var_91:SetDesc("Quest Number : Quest4")
                else
                    if not (GetWP("Skull Guitar")) then
                        var_91:SetDesc("Quest Number : Collect!!")
                    else
                        var_91:SetDesc("Quest Number : No Quest!!")
                    end
                end
            end
        end
    end
    return
end
function function_919()
    if not (_G.Auto_Yama) then
        if not ((var_53.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") < 30)) then
            _G.FarmEliteHunt = true
        else
            if not ((var_53.Remotes.CommF_:InvokeServer("EliteHunter", "Progress") > 30)) then
                _G.FarmEliteHunt = false
                if not (((workspace.Map.Waterfall.SealedKatana.Handle.Position - var_52.Character.HumanoidRootPart.Position).Magnitude >= 20)) then
                    _tp(workspace.Map.Waterfall.SealedKatana.Handle.CFrame)
                    var_1 = GetConnectionEnemies("Ghost")
                    if not (var_1) then
                        wait()
                        var_13.Kill(var_1, _G.Auto_Yama)
                        if var_1.Humanoid.Health <= 0 then
                            if not (var_1.Parent) then
                            end
                        end
                        if not (_G.Auto_Yama) then
                        end
                        fireclickdetector(workspace.Map.Waterfall.SealedKatana.Handle.ClickDetector)
                    end
                end
            end
        end
    end
    return
end
function function_920()
    if not (_G.Auto_Tushita) then
        if not (workspace.Map.Turtle:FindFirstChild("TushitaGate")) then
            if GetBP("Holy Torch") then
                _tp(CFrame.new(5148.03613, 162.352493, 910.548218))
                wait(0.7)
            else
                EquipWeapon("Holy Torch")
                task.wait(1)
                task.wait()
                _tp(CFrame.new(-10752, 417, -9366))
                if not (_G.Auto_Tushita) then
                end
                if (CFrame.new(-10752, 417, -9366).Position - var_52.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                end
                wait(0.7)
                task.wait()
                _tp(CFrame.new(-11672, 334, -9474))
                if not (_G.Auto_Tushita) then
                end
                if (CFrame.new(-11672, 334, -9474).Position - var_52.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                end
                wait(0.7)
                task.wait()
                _tp(CFrame.new(-12132, 521, -10655))
                if not (_G.Auto_Tushita) then
                end
                if (CFrame.new(-12132, 521, -10655).Position - var_52.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                end
                wait(0.7)
                task.wait()
                _tp(CFrame.new(-13336, 486, -6985))
                if not (_G.Auto_Tushita) then
                end
                if (CFrame.new(-13336, 486, -6985).Position - var_52.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                end
                wait(0.7)
                task.wait()
                _tp(CFrame.new(-13489, 332, -7925))
                if not (_G.Auto_Tushita) then
                end
                if (CFrame.new(-13489, 332, -7925).Position - var_52.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                end
            end
        else
            var_1 = GetConnectionEnemies("Longma")
            if not (var_1) then
                task.wait()
                var_13.Kill(var_1, _G.Auto_Tushita)
                if var_1.Humanoid.Health <= 0 then
                    if not (_G.Auto_Tushita) then
                    end
                end
                if not (var_1.Parent) then
                end
            else
                if not (var_53:FindFirstChild("Longma")) then
                    _tp((var_53:FindFirstChild("Longma").HumanoidRootPart.CFrame * CFrame.new(0, 40, 0)))
                end
            end
        end
    end
    return
end
function function_921()
    var_1 = CFrame.new(-5496.17432, 313.768921, -2841.53027, 0.924894512, 7.37058015e-9, 0.380223751, 3.5881019e-8, 1, -1.06665446e-7, -0.380223751, 1.12297109e-7, 0.924894512)
    if not (((CFrame.new(-5539.3115234375, 313.800537109375, -2972.372314453125).Position - Root.Position).Magnitude <= 500)) then
        var_1 = pairs(workspace.Enemies:GetChildren())[1]
        var_2 = pairs(workspace.Enemies:GetChildren())[2]
        if not (var_2:FindFirstChild("HumanoidRootPart")) then
            var_2:FindFirstChild("HumanoidRootPart")
            if not (var_2:FindFirstChild("Humanoid")) then
                var_2:FindFirstChild("Humanoid")
            end
        end
        if not ((var_2.Humanoid.Health > 0)) then
            if not (var_2.Name) then
                if not (((var_2.HumanoidRootPart.Position - Root.Position).Magnitude <= 2000)) then
                    wait()
                    var_13.Kill(var_2, _G.AutoRaidCastle)
                    if not (_G.AutoRaidCastle) then
                        if not (var_2.Parent) then
                            if var_2.Humanoid.Health <= 0 then
                            end
                        end
                    end
                    if not (workspace.Enemies:FindFirstChild(var_2.Name)) then
                    end
                end
            end
        end
    else
        var_1 = { "Galley Pirate", "Galley Captain", "Raider", "Mercenary", "Vampire", "Zombie", "Snow Trooper", "Winter Warrior", "Lab Subordinate", "Horned Warrior", "Magma Ninja", "Lava Pirate", "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer", "Arctic Warrior", "Snow Lurker", "Sea Soldier", "Water Fighter" }
        if not (var_53:FindFirstChild(var_1[var_1])) then
            var_1 = pairs(var_53:GetChildren())[1]
            var_2 = pairs(var_53:GetChildren())[2]
            if not (table.find(var_1, var_2.Name)) then
                _tp(var_1)
            end
        end
    end
    return
end
function function_922()
    if not (_G.AutoFactory) then
        var_1 = GetConnectionEnemies("Core")
        if not (var_1) then
            wait()
            EquipWeapon(_G.SelectWeapon)
            _tp(CFrame.new(448.46756, 199.356781, -441.389252))
            if var_1.Humanoid.Health <= 0 then
            end
            if _G.AutoFactory == false then
            end
        else
            _tp(CFrame.new(448.46756, 199.356781, -441.389252))
        end
    end
    return
end
function function_923()
    var_1 = workspace.Map["Boat Castle"]:FindFirstChild("Summoner")
    if not (var_1) then
    end
    if not (var_1:FindFirstChild("Circle")) then
        var_1:FindFirstChild("Circle")
        var_1 = pairs(var_1:FindFirstChild("Circle"):GetChildren())[1]
        var_2 = pairs(var_1:FindFirstChild("Circle"):GetChildren())[2]
        if not ((var_2.Name == "Part")) then
            var_1 = var_2:FindFirstChild("Part")
            if not ((VaildColor(var_1) == false)) then
                AuraSkin(HakiCalculate(var_2))
                wait()
                _tp(var_2.CFrame)
                if VaildColor(var_1) == true then
                end
                if not (_G.AutoUnHaki) then
                end
            end
        end
    end
    return
end
function function_924()
    if not (_G.AutoRipIngay) then
        var_1 = GetConnectionEnemies("rip_indra")
        if not (GetWP("Dark Dagger")) then
            if GetIn("Valkyrie") then
            end
        end
        if not (var_1) then
            wait()
            var_13.Kill(var_1, _G.AutoRipIngay)
            if not (_G.AutoRipIngay) then
                if not (var_1.Parent) then
                end
            end
            if var_1.Humanoid.Health <= 0 then
            end
        else
            var_53.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743e-8, 0.914313197, -1.90943332e-8, 1, 3.8755779e-8, -0.914313197, -1.76180437e-9, -0.405007899))
            wait(0.1)
            _tp(CFrame.new(-5344.822265625, 423.98541259766, -2725.0930175781))
        end
    end
    return
end
function function_925()
    var_90:InvokeServer("Z", true)
    return
end
function function_926()
    var_12.RFJobsRemoteFunction:InvokeServer("FishingNPC", "SellFish")
    return
end
function function_927()
    var_12.RFJobsRemoteFunction:InvokeServer("FishingNPC", "SellFish")
    return
end
function function_928()
    var_12.RFJobsRemoteFunction:InvokeServer("FishingNPC", "FinishQuest")
    return
end
function function_929()
    var_12.RFJobsRemoteFunction:InvokeServer("FishingNPC", "FinishQuest")
    return
end
function function_930()
    if var_88() then
        var_87:InvokeServer("FishingNPC", "Angler", "AskQuest")
    end
    return
end
function function_931()
    if var_76.Character then
    end
    var_1 = var_76.CharacterAdded:Wait()
    var_2 = var_1:FindFirstChild("HumanoidRootPart")
    if var_2 then
        return
    end
    var_3 = var_1:FindFirstChildOfClass("Tool")
    if not (_G.SelectedRod) then
        if not (var_3) then
        end
    end
    if not ((var_3.Name ~= _G.SelectedRod)) then
        var_1 = var_76.Backpack:FindFirstChild(_G.SelectedRod)
        if not (var_1) then
            var_1.Humanoid:EquipTool(var_1)
            var_3 = var_1
        end
    end
    if not (var_3) then
        var_1 = var_82(var_2.Position)
        var_2 = var_77:FindPartOnRayWithIgnoreList(Ray.new(var_1.Head.Position, (var_2.CFrame.LookVector * var_83)), { var_1, var_77.Characters, var_77.Enemies })
        var_3 = nil
        if not (var_3) then
        end
        var_4 = Vector3.new(var_3.X, math.max(var_3.Y, var_1), var_3.Z)
        var_5 = var_3:GetAttribute("State")
        var_6 = var_3:GetAttribute("ServerState")
        if not (var_4) then
            if var_5 == "ReeledIn" then
            end
        end
        if not ((var_6 == "ReeledIn")) then
            var_80:InvokeServer("StartCasting")
            task.wait()
            var_80:InvokeServer("CastLineAtLocation", var_4, 100, true)
        else
            if not ((var_6 == "Biting")) then
                var_80:InvokeServer("Catching", true)
                task.wait(0.1)
                var_80:InvokeServer("Catch", 1)
            end
        end
    end
    return
end
function function_932()
    var_12.RFCraft:InvokeServer("Craft", _G.SelectedBait, {})
    return
end
function function_933()
    var_12.RFCraft:InvokeServer("Craft", _G.SelectedBait, {})
    return
end
function function_934()
    var_12.RFCraft:InvokeServer("Craft", _G.SelectedBait, {})
    return
end
function function_935()
    game:GetService("RunService").Stepped:Connect(function_936)
    return
end
function function_936()
    if not (getgenv().NoClip) then
        var_1 = pairs(game.Players.LocalPlayer.Character:GetDescendants())[1]
        var_2 = pairs(game.Players.LocalPlayer.Character:GetDescendants())[2]
        if var_2:IsA("BasePart") then
            var_2:IsA("BasePart")
        end
        if not (var_2:IsA("Part")) then
            var_2.CanCollide = false
        end
    end
    return
end
function function_937()
    if not (getgenv().HopServerAdmin) then
        var_1 = pairs(game.Players:GetPlayers())[1]
        var_2 = pairs(game.Players:GetPlayers())[2]
        var_3 = { "red_game43", "rip_indra", "Axiore", "Polkster", "wenlocktoad", "Daigrock", "toilamvidamme", "oofficialnoobie", "Uzoth", "Azarth", "arlthmetic", "Death_King", "Lunoven", "TheGreateAced", "rip_fud", "drip_mama", "layandikit12", "Hingoi" }
        if not (table.find(var_3, var_2.Name)) then
            Hop()
        end
    end
    return
end
function function_938()
    var_1:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    var_1:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    return
end
function function_939()
    var_1 = game.ReplicatedStorage.Remotes.CommF_
    var_2 = workspace.Enemies
    var_3 = workspace.Map.CakeLoaf:FindFirstChild("BigMirror")
    if var_3 then
        return
    end
    if not (var_2:FindFirstChild("Cake Prince")) then
        return
    end
    if not ((var_3.Other.Transparency == 0)) then
        return
    end
    var_1:InvokeServer("CakePrinceSpawner", true)
    return
end
function function_940()
    if not (RemoveDamage) then
        var_53.Assets.GUI.DamageCounter.Enabled = false
        var_52.PlayerGui.Notifications.Enabled = false
    else
        var_53.Assets.GUI.DamageCounter.Enabled = true
        var_52.PlayerGui.Notifications.Enabled = true
    end
    return
end
function function_941()
    if not (RDeath) then
        if not (var_53.Effect.Container:FindFirstChild("Death")) then
            var_53.Effect.Container.Death:Destroy()
        end
        if not (var_53.Effect.Container:FindFirstChild("Respawn")) then
            var_53.Effect.Container.Respawn:Destroy()
        end
    end
    return
end
function function_942()
    var_1 = pairs(workspace._WorldOrigin:GetChildren())[1]
    var_2 = pairs(workspace._WorldOrigin:GetChildren())[2]
    if not (table.find(var_74, var_2.Name)) then
        var_2:Destroy()
    end
    return
end
function function_943()
    if not (_G.Safemode) then
        var_1 = ((var_52.Character.Humanoid.Health / var_52.Character.Humanoid.MaxHealth) * 100)
        if not ((var_1 < Num_self)) then
            shouldTween = true
            _tp((Root.CFrame * CFrame.new(0, 500, 0)))
        else
            shouldTween = false
        end
    end
    return
end
function function_944()
    if not (_G.RaceClickAutov4) then
        if not (var_52.Character:FindFirstChild("RaceEnergy")) then
            if not ((var_52.Character:FindFirstChild("RaceEnergy").Value == 1)) then
                Useskills("nil", "Y")
            end
        end
    end
    return
end
function function_945()
    if not (_G.RaceClickAutov3) then
        var_53.Remotes.CommE:FireServer("ActivateAbility")
        wait(30)
        if not (_G.RaceClickAutov3) then
        end
    end
    return
end
function function_946()
    game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
    return
end
function function_947()
    if not (Boud) then
        var_1 = { "HasBuso", "Buso" }
        if var_52.Character:FindFirstChild(var_1[1]) then
            var_53.Remotes.CommF_:InvokeServer(var_1[2])
        end
    end
    return
end
function function_948()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
    return
end
function function_949()
    if _G.HopTimer then
        _G.HopTimer = tick()
    end
    if not (((tick() - _G.HopTimer) >= _G.HopDelay)) then
        _G.HopTimer = tick()
        if not (syn) then
        end
        if not (syn.queue_on_teleport) then
            syn.queue_on_teleport("loadstring(game:HttpGet('https://pastefy.app/iiFOhcot/raw'))()")
        end
        game:GetService("TeleportService")
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
    return
end
function function_950()
    if not (_G.FarmMastery_S) then
        if not ((SelectIsland == "Cake")) then
            var_1 = next, var_53.Remotes.CommF_:InvokeServer("getInventory")[1]
            var_2 = next, var_53.Remotes.CommF_:InvokeServer("getInventory")[2]
            if not ((type(var_2) == "table")) then
                if not ((var_2.Type == "Sword")) then
                    SwordName = var_2.Name
                    if tonumber(var_2.Mastery) >= 1 then
                    end
                    if not ((tonumber(var_2.Mastery) <= 599)) then
                        var_1 = GetConnectionEnemies(var_9)
                        if not (GetBP(SwordName)) then
                            if not (var_1) then
                                wait()
                                var_13.Sword(var_1, _G.FarmMastery_S)
                                if _G.FarmMastery_S == false then
                                    if not (var_1.Parent) then
                                    end
                                end
                                if var_1.Humanoid.Health <= 0 then
                                end
                            else
                                _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375))
                            end
                        else
                            var_53.Remotes.CommF_:InvokeServer("LoadItem", SwordName)
                        end
                    else
                        if not ((tonumber(var_2.Mastery) >= 600)) then
                            if not (GetBP(SwordName)) then
                                return nil
                            end
                            var_53.Remotes.CommF_:InvokeServer("LoadItem", SwordName)
                        end
                    end
                else
                end
            end
        else
            if not ((SelectIsland == "Bone")) then
                var_1 = next, var_53.Remotes.CommF_:InvokeServer("getInventory")[1]
                var_2 = next, var_53.Remotes.CommF_:InvokeServer("getInventory")[2]
                if not ((type(var_2) == "table")) then
                    if not ((var_2.Type == "Sword")) then
                        SwordName = var_2.Name
                        if tonumber(var_2.Mastery) >= 1 then
                        end
                        if not ((tonumber(var_2.Mastery) <= 599)) then
                            var_1 = GetConnectionEnemies(var_10)
                            if not (GetBP(SwordName)) then
                                if not (var_1) then
                                    wait()
                                    var_13.Sword(var_1, _G.FarmMastery_S)
                                    if _G.FarmMastery_S == false then
                                        if not (var_1.Parent) then
                                        end
                                    end
                                    if var_1.Humanoid.Health <= 0 then
                                    end
                                else
                                    _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
                                end
                            else
                                var_53.Remotes.CommF_:InvokeServer("LoadItem", SwordName)
                            end
                        else
                            if not ((tonumber(var_2.Mastery) >= 600)) then
                                if not (GetBP(SwordName)) then
                                    return nil
                                end
                                var_53.Remotes.CommF_:InvokeServer("LoadItem", SwordName)
                            end
                        end
                    else
                    end
                end
            end
        end
    end
    return
end
function function_951()
    if not ((SelectIsland == "Cake")) then
        var_1 = GetConnectionEnemies(var_9)
        if not (var_1) then
            HealthM = ((var_1.Humanoid.MaxHealth * 70) / 100)
            wait()
            MousePos = var_1.HumanoidRootPart.Position
            var_13.Masgun(var_1, _G.FarmMastery_G)
            var_1 = var_53:FindFirstChild("Modules")
            var_2 = var_1:FindFirstChild("Net")
            var_3 = var_2:FindFirstChild("RE/ShootGunEvent")
            if not ((var_52.Character:FindFirstChildOfClass("Tool").ToolTip ~= "Gun")) then
                return
            end
            if not (var_52.Character:FindFirstChildOfClass("Tool")) then
                var_52.Character:FindFirstChildOfClass("Tool")
            end
            if not ((var_52.Character:FindFirstChildOfClass("Tool").Name == "Skull Guitar")) then
                SoulGuitar = true
                var_52.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer("TAP", MousePos)
                if not (_G.FarmMastery_G) then
                    vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                    wait(0.05)
                    vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                    wait(0.05)
                end
            else
                if not (var_52.Character:FindFirstChildOfClass("Tool")) then
                    var_52.Character:FindFirstChildOfClass("Tool")
                end
                if not ((var_52.Character:FindFirstChildOfClass("Tool").Name ~= "Skull Guitar")) then
                    SoulGuitar = false
                    var_3:FireServer(MousePos, { var_1.HumanoidRootPart })
                    if not (_G.FarmMastery_G) then
                        vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                        wait(0.05)
                        vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                        wait(0.05)
                    end
                end
            end
            if _G.FarmMastery_G == false then
                if var_1.Humanoid.Health <= 0 then
                end
            end
            if not (var_1.Parent) then
            end
            SoulGuitar = false
        else
            _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375))
        end
    else
        if not ((SelectIsland == "Bone")) then
            var_1 = GetConnectionEnemies(var_10)
            if not (var_1) then
                HealthM = ((var_1.Humanoid.MaxHealth * 70) / 100)
                wait()
                MousePos = var_1.HumanoidRootPart.Position
                var_13.Masgun(var_1, _G.FarmMastery_G)
                var_1 = var_53:FindFirstChild("Modules")
                var_2 = var_1:FindFirstChild("Net")
                var_3 = var_2:FindFirstChild("RE/ShootGunEvent")
                if not ((var_52.Character:FindFirstChildOfClass("Tool").ToolTip ~= "Gun")) then
                    return
                end
                if not (var_52.Character:FindFirstChildOfClass("Tool")) then
                    var_52.Character:FindFirstChildOfClass("Tool")
                end
                if not ((var_52.Character:FindFirstChildOfClass("Tool").Name == "Skull Guitar")) then
                    SoulGuitar = true
                    var_52.Character:FindFirstChildOfClass("Tool").RemoteEvent:FireServer("TAP", MousePos)
                    if not (_G.FarmMastery_G) then
                        vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                        wait(0.05)
                        vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                        wait(0.05)
                    end
                else
                    if not (var_52.Character:FindFirstChildOfClass("Tool")) then
                        var_52.Character:FindFirstChildOfClass("Tool")
                    end
                    if not ((var_52.Character:FindFirstChildOfClass("Tool").Name ~= "Skull Guitar")) then
                        SoulGuitar = false
                        var_3:FireServer(MousePos, { var_1.HumanoidRootPart })
                        if not (_G.FarmMastery_G) then
                            vim1:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                            wait(0.05)
                            vim1:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                            wait(0.05)
                        end
                    end
                end
                if _G.FarmMastery_G == false then
                    if var_1.Humanoid.Health <= 0 then
                    end
                end
                if not (var_1.Parent) then
                end
                SoulGuitar = false
            else
                _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
            end
        end
    end
    return
end
function function_952()
    if not ((SelectIsland == "Cake")) then
        var_1 = GetConnectionEnemies(var_9)
        if not (var_1) then
            HealthM = ((var_1.Humanoid.MaxHealth * 70) / 100)
            wait()
            MousePos = var_1.HumanoidRootPart.Position
            var_13.Mas(var_1, _G.FarmMastery_Dev)
            if _G.FarmMastery_Dev == false then
                if var_1.Humanoid.Health <= 0 then
                end
            end
            if not (var_1.Parent) then
            end
        else
            _tp(CFrame.new(-1943.676513671875, 251.5095672607422, -12337.880859375))
        end
    else
        if not ((SelectIsland == "Bone")) then
            var_1 = GetConnectionEnemies(var_10)
            if not (var_1) then
                HealthM = ((var_1.Humanoid.MaxHealth * 70) / 100)
                wait()
                MousePos = var_1.HumanoidRootPart.Position
                var_13.Mas(var_1, _G.FarmMastery_Dev)
                if _G.FarmMastery_Dev == false then
                    if var_1.Humanoid.Health <= 0 then
                    end
                end
                if not (var_1.Parent) then
                end
            else
                _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
            end
        end
    end
    return
end
function function_953()
    pcall(function_954)
    return
end
function function_954()
    if _G.FarmMastery_Dev then
        if _G.FarmMastery_G then
        end
    end
    if not (_G.FarmMastery_S) then
        var_1 = pairs(var_52.PlayerGui.Notifications:GetChildren())[1]
        var_2 = pairs(var_52.PlayerGui.Notifications:GetChildren())[2]
        if not ((var_2.Name == "NotificationTemplate")) then
            if not (string.find(var_2.Text, "Skill locked!")) then
                var_2:Destroy()
            end
        end
    end
    return
end
function function_955()
    var_1 = game.Players.LocalPlayer
    if not (var_1.Character) then
    end
    if var_1.Character:FindFirstChild("HumanoidRootPart") then
        return
    end
    var_2 = var_1.Character.HumanoidRootPart
    var_3 = nil
    var_4 = nil
    var_1 = pairs(workspace.Enemies:GetChildren())[1]
    var_2 = pairs(workspace.Enemies:GetChildren())[2]
    if not (var_2:FindFirstChild("HumanoidRootPart")) then
        var_2:FindFirstChild("HumanoidRootPart")
        if not (var_2:FindFirstChild("Humanoid")) then
            var_2:FindFirstChild("Humanoid")
        end
    end
    if not ((var_2.Humanoid.Health > 0)) then
        if not (table.find(BossList, var_2.Name)) then
            var_1 = (var_2.Position - var_2.HumanoidRootPart.Position).Magnitude
            if not ((var_1 < var_4)) then
                var_3 = var_2
                var_4 = var_1
            end
        end
    end
    if not (var_3) then
    end
    if not (var_3:FindFirstChild("HumanoidRootPart")) then
        var_1 = var_3.HumanoidRootPart
        var_2 = var_3.Humanoid
        task.wait(0.1)
        if _G.AutoFarmAllBoss then
        else
            var_1 = (var_1.CFrame * CFrame.new(0, 5, 0))
            if not (((var_2.Position - var_1.Position).Magnitude > 100)) then
                var_1.Character:PivotTo(var_1)
            else
                _tp(var_1)
            end
            if not (var_13) then
            end
            if not ((typeof(var_13.Kill) == "function")) then
                var_13.Kill(var_3, true)
            end
            if not (var_3.Parent) then
                if var_2.Health <= 0 then
                end
            end
            if not (_G.AutoFarmAllBoss) then
            end
        end
    end
    return
end
function function_956()
    if not (wait(Sec)) then
        if not (_G.FarmBoss) then
            pcall(function_957)
        end
    end
    return
end
function function_957()
    if not ((QuestBeta()[2] ~= nil)) then
    end
    var_1 = (QuestBeta()[3] ~= nil)
    var_2 = var_52.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
    if not (_G.AcceptQuestBoss) then
    end
    if not (var_1) then
        if string.find(var_2, QuestBeta()[0]) then
            var_53.Remotes.CommF_:InvokeServer("AbandonQuest")
        end
        if not ((var_52.PlayerGui.Main.Quest.Visible == false)) then
            _tp(QuestBeta()[5])
            if not (((Root.Position - QuestBeta()[5].Position).Magnitude <= 5)) then
                var_53.Remotes.CommF_:InvokeServer("StartQuest", QuestBeta()[3], QuestBeta()[2])
            end
        else
            if not ((var_52.PlayerGui.Main.Quest.Visible == true)) then
                if not (workspace.Enemies:FindFirstChild(QuestBeta()[1])) then
                    var_1 = pairs(workspace.Enemies:GetChildren())[1]
                    var_2 = pairs(workspace.Enemies:GetChildren())[2]
                    if not (var_13.Alive(var_2)) then
                        var_13.Alive(var_2)
                    end
                    if not ((var_2.Name == QuestBeta()[1])) then
                        if not (string.find(var_2, QuestBeta()[0])) then
                            wait()
                            var_13.Kill(var_2, _G.FarmBoss)
                            if not (_G.FarmBoss) then
                                if var_2.Humanoid.Health <= 0 then
                                    if not (var_2.Parent) then
                                    end
                                end
                            end
                            if var_52.PlayerGui.Main.Quest.Visible == false then
                            end
                        else
                            var_53.Remotes.CommF_:InvokeServer("AbandonQuest")
                        end
                    end
                else
                    _tp(QuestBeta()[4])
                    if not (var_53:FindFirstChild(QuestBeta()[1])) then
                        _tp((var_53:FindFirstChild(QuestBeta()[1]).HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)))
                    end
                end
            end
        end
    else
        if not (workspace.Enemies:FindFirstChild(QuestBeta()[1])) then
            var_1 = pairs(workspace.Enemies:GetChildren())[1]
            var_2 = pairs(workspace.Enemies:GetChildren())[2]
            if not (var_13.Alive(var_2)) then
                var_13.Alive(var_2)
            end
            if not ((var_2.Name == QuestBeta()[1])) then
                wait()
                var_13.Kill(var_2, _G.FarmBoss)
                if not (_G.FarmBoss) then
                    if var_2.Humanoid.Health <= 0 then
                    end
                end
                if not (var_2.Parent) then
                end
            end
        else
            _tp(QuestBeta()[4])
            if not (var_53:FindFirstChild(QuestBeta()[1])) then
                _tp((var_53:FindFirstChild(QuestBeta()[1]).HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)))
            end
        end
    end
    return
end
function function_958()
    if not (_G.AutoEctoplasm) then
        var_1 = { "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer", "Arctic Warrior" }
        var_2 = GetConnectionEnemies(var_1)
        if not (var_13.Alive(var_2)) then
            wait()
            var_13.Kill(var_2, _G.AutoEctoplasm)
            if not (_G.AutoEctoplasm) then
                if not (var_2.Parent) then
                end
            end
            if var_2.Humanoid.Health <= 0 then
            end
        else
            var_53.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
        end
    end
    return
end
function function_959(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    if not (var_1:FindFirstChild("Humanoid")) then
        var_1:FindFirstChild("Humanoid")
        if not (var_1:FindFirstChild("HumanoidRootPart")) then
            var_1:FindFirstChild("HumanoidRootPart")
        end
    end
    if not ((var_1.Humanoid.Health > 0)) then
        if not ((var_1.Name == var_2)) then
            wait()
            var_13.Kill(var_1, getgenv().AutoMaterial)
            if not (getgenv().AutoMaterial) then
                if not (var_1.Parent) then
                end
            end
            if var_1.Humanoid.Health <= 0 then
            end
        end
    end
    return
end
function function_960()
    var_1 = pairs(game:GetService("Workspace")._WorldOrigin.EnemySpawns:GetChildren())[1]
    var_2 = pairs(game:GetService("Workspace")._WorldOrigin.EnemySpawns:GetChildren())[2]
    var_1 = ipairs(MMon)[1]
    var_2 = ipairs(MMon)[2]
    if not (string.find(var_2.Name, var_2)) then
        if not (((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - var_2.Position).Magnitude >= 10)) then
            _tp((var_2.CFrame * Pos))
        end
    end
    return
end
function function_961()
    if not (getgenv().SelectMaterial) then
        MaterialMon(getgenv().SelectMaterial)
        _tp(MPos)
    end
    var_1 = ipairs(MMon)[1]
    var_2 = ipairs(MMon)[2]
    var_1 = pairs(workspace.Enemies:GetChildren())[1]
    var_2 = pairs(workspace.Enemies:GetChildren())[2]
    var_1(var_2, var_2)
    var_2()
    return
end
function function_962()
    if not (var_52) then
        if not (var_52.Character) then
            if not (var_52.Character:FindFirstChild("HumanoidRootPart")) then
                var_52.Character:FindFirstChild("HumanoidRootPart")
                if not (var_52.Character:FindFirstChild("Humanoid")) then
                    var_52.Character:FindFirstChild("Humanoid")
                end
            end
        end
    end
    if var_52.Character.Humanoid.Health > 0 then
        return
    end
    var_1 = ipairs(var_68)[1]
    var_2 = ipairs(var_68)[2]
    if _G.FarmPhaBinh then
    else
        _tp(var_2)
        var_3 = false
        var_4 = tick()
        if not (((tick() - var_4) < 12)) then
            if var_3 then
            end
        end
        if not (_G.FarmPhaBinh) then
            if not (var_52.Character) then
            end
            var_1 = var_52.Character:FindFirstChild("HumanoidRootPart")
            if var_1 then
            else
                var_2 = (var_1.Position - var_2.Position).Magnitude
                if not ((var_2 <= 3)) then
                    var_3 = true
                else
                    wait(0.1)
                end
            end
        end
        if not (_G.FarmPhaBinh) then
        end
        if not (var_3) then
            var_67("Melee")
            var_67("Sword")
            var_67("Gun")
        end
    end
    return
end
function function_963()
    var_66(var_2)
    return
end
function function_964()
    if not (var_52) then
        if not (var_52.Character) then
            if not (var_52.Character:FindFirstChild("HumanoidRootPart")) then
                var_52.Character:FindFirstChild("HumanoidRootPart")
                if not (var_52.Character:FindFirstChild("Humanoid")) then
                    var_52.Character:FindFirstChild("Humanoid")
                end
            end
        end
    end
    if var_52.Character.Humanoid.Health > 0 then
        return
    end
    var_1 = ipairs(var_65)[1]
    var_2 = ipairs(var_65)[2]
    if _G.FarmPhaBinh then
    else
        _tp(var_2)
        var_3 = false
        var_4 = tick()
        if not (((tick() - var_4) < 12)) then
            if var_3 then
            end
        end
        if not (_G.FarmPhaBinh) then
            if not (var_52.Character) then
            end
            var_1 = var_52.Character:FindFirstChild("HumanoidRootPart")
            if var_1 then
            else
                var_2 = (var_1.Position - var_2.Position).Magnitude
                if not ((var_2 <= 3)) then
                    var_3 = true
                else
                    wait(0.1)
                end
            end
        end
        if not (_G.FarmPhaBinh) then
        end
        if not (var_3) then
            var_64("Melee")
            var_64("Sword")
            var_64("Gun")
        end
    end
    return
end
function function_965()
    var_63(var_2)
    return
end
function function_966()
    var_1 = string.match(var_53.Remotes.CommF_:InvokeServer("CakePrinceSpawner"), "%d+")
    if not (var_1) then
        if 500 - tonumber(var_1) then
        end
        var_61:SetDesc(("Killed : " .. 0))
    end
    return
end
function function_967()
    if not (wait(1)) then
        if not (workspace.Enemies:FindFirstChild("Tyrant of the Skies")) then
            var_60:SetDesc("â")
        else
            var_60:SetDesc("â")
        end
    end
    return
end
function function_968()
    var_1 = GetConnectionEnemies("Dough King")
    if not (var_1) then
        task.wait()
        var_13.Kill(var_1, _G.AutoHop_Dough)
        if not (_G.AutoHop_Dough) then
            if not (var_1.Parent) then
            end
        end
        if var_1.Humanoid.Health <= 0 then
        end
    else
        _tp(CFrame.new(-1943.6765, 251.5095, -12337.8809))
        task.wait(2)
        var_1 = GetConnectionEnemies("Dough King")
        if var_1 then
        end
        if not (_G.AutoHop_Dough) then
            var_58()
        end
    end
    return
end
function function_969()
    var_1 = game:GetService("HttpService")
    var_2 = {}
    var_3 = game:HttpGet(("https://games.roblox.com/v1/games/" .. (game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")))
    var_4 = var_1:JSONDecode(var_3)
    var_1 = pairs(var_4.data)[1]
    var_2 = pairs(var_4.data)[2]
    if not ((var_2.playing < var_2.maxPlayers)) then
        table.insert(var_2, var_2.id)
    end
    if not ((#(var_2) > 0)) then
        game:GetService("TeleportService")
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, var_2[math.random(1, #(var_2))], game.Players.LocalPlayer)
    end
    return
end
function function_970()
    var_1 = game:GetService("CollectionService")
    var_2 = game:GetService("Players")
    var_3 = var_2.LocalPlayer
    if var_3.Character then
    end
    var_4 = var_3.CharacterAdded:Wait()
    if var_4 then
        return
    end
    var_5 = var_4:GetPivot().Position
    var_6 = var_1:GetTagged("_ChestTagged")
    var_7 = math.huge
    var_8 = nil
    var_2 = var_6[var_1]
    var_3 = (var_2:GetPivot().Position - var_5).Magnitude
    if not (SelectedIsland) then
    end
    if not (var_2:IsDescendantOf(SelectedIsland)) then
        if var_2:GetAttribute("IsDisabled") then
        end
        if not ((var_3 < var_7)) then
            var_7 = var_3
            var_8 = var_2
        end
    end
    if not (var_8) then
        _tp(var_8:GetPivot())
    end
    return
end
function function_971()
    if not (_G.Auto_Random_Bone) then
        task.wait()
        var_53.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
        if not (_G.Auto_Random_Bone) then
        end
    end
    return
end
function function_972()
    var_1 = GetConnectionEnemies("Soul Reaper")
    if not (var_1) then
        task.wait()
        var_13.Kill(var_1, _G.AutoHytHallow)
        if var_1.Humanoid.Health <= 0 then
        end
        if _G.AutoHytHallow == false then
        end
    else
        if GetBP("Hallow Essence") then
            task.wait(0.1)
            var_53.Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
            if _G.AutoHytHallow == false then
            end
            if GetBP("Hallow Essence") then
            end
        else
            wait(0.1)
            _tp(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
            if _G.AutoHytHallow == false then
            end
            if var_52.Character.HumanoidRootPart.CFrame == CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125) then
            end
            EquipWeapon("Hallow Essence")
        end
    end
    return
end
function function_973()
    var_57:SetDesc(("Bones : " .. GetM("Bones")))
    return
end
function function_974()
    if not (var_52.Character) then
    end
    var_1 = var_52.Character:FindFirstChild("HumanoidRootPart")
    if var_1 then
        return
    end
    var_2 = workspace:FindFirstChild("Enemies")
    if not (var_2) then
    end
    var_3 = var_2:FindFirstChild("Tyrant of the Skies")
    if not (var_3) then
        if not (var_3:FindFirstChild("Humanoid")) then
            var_3:FindFirstChild("Humanoid")
            if not ((var_3.Humanoid.Health > 0)) then
            end
        end
    end
    if not (var_3:FindFirstChild("HumanoidRootPart")) then
        if Sec then
        end
        task.wait(0.05)
        if not (GetFarmStandCFrame) then
        end
        var_1 = GetFarmStandCFrame(var_3)
        if not (var_1) then
            _tp(var_1)
        else
            if not (FarmOffset) then
            end
            if not (FarmOffset.Weapon) then
                _tp((var_3.HumanoidRootPart.CFrame * FarmOffset.Weapon))
            end
        end
        var_13.Kill(var_3, _G.FarmTyrant)
        if not (_G.FarmTyrant) then
            if not (_G.StartFarm) then
                if not (var_3.Parent) then
                end
            end
        end
        if var_3.Humanoid.Health <= 0 then
        end
        return
    end
    if not (((var_1.Position - var_1).Magnitude > 300)) then
        _tp(CFrame.new(var_1))
        task.wait(0.3)
        return
    end
    if not (GetConnectionEnemies) then
    end
    var_4 = GetConnectionEnemies(var_2)
    if not (var_4) then
    end
    if not (var_4:FindFirstChild("HumanoidRootPart")) then
        if Sec then
        end
        task.wait(0.05)
        if not (GetFarmStandCFrame) then
        end
        var_1 = GetFarmStandCFrame(var_4)
        if not (var_1) then
            _tp(var_1)
        else
            if not (FarmOffset) then
            end
            if not (FarmOffset.Weapon) then
                _tp((var_4.HumanoidRootPart.CFrame * FarmOffset.Weapon))
            end
        end
        var_13.Kill(var_4, _G.FarmTyrant)
        if not (_G.FarmTyrant) then
            if not (_G.StartFarm) then
                if not (var_4.Parent) then
                end
            end
        end
        if var_4.Humanoid.Health <= 0 then
        end
    else
        _tp(CFrame.new(var_1))
    end
    return
end
function function_975()
    if not (var_52.Character) then
    end
    var_1 = var_52.Character:FindFirstChild("HumanoidRootPart")
    if var_1 then
        return
    end
    if not (var_52.PlayerGui:FindFirstChild("Main")) then
        var_52.PlayerGui:FindFirstChild("Main")
    end
    var_2 = var_52.PlayerGui.Main:FindFirstChild("Quest")
    var_3 = workspace:FindFirstChild("Enemies")
    if not (_G.AcceptQuestC) then
        if not (var_2) then
        end
    end
    if var_2.Visible then
        if not (((var_2.Position - var_1.Position).Magnitude > 15)) then
            _tp(var_2)
            task.wait(0.2)
            return
        end
        pcall(function_976)
        task.wait(0.3)
        return
    end
    if not (var_3) then
    end
    var_4 = var_3:FindFirstChild("Cake Prince")
    if not (var_4) then
        if not (var_4:FindFirstChild("HumanoidRootPart")) then
            var_4:FindFirstChild("HumanoidRootPart")
            if not (var_4:FindFirstChild("Humanoid")) then
                var_4:FindFirstChild("Humanoid")
            end
        end
    end
    if not ((var_4.Humanoid.Health > 0)) then
        if Sec then
        end
        task.wait(0.05)
        if not (GetFarmStandCFrame) then
        end
        var_1 = GetFarmStandCFrame(var_4)
        if not (var_1) then
            _tp(var_1)
        else
            if not (FarmOffset) then
            end
            if not (FarmOffset.Weapon) then
                _tp((var_4.HumanoidRootPart.CFrame * FarmOffset.Weapon))
            end
        end
        if not ((typeof(var_13) == "table")) then
            if var_13.Kill2 then
            end
            var_1 = var_13.Kill
            var_1(var_4, _G.Auto_Cake_Prince)
        end
        if not (_G.Auto_Cake_Prince) then
            if not (_G.StartFarm) then
                if not (var_4.Parent) then
                end
            end
        end
        if var_4.Humanoid.Health <= 0 then
        end
        return
    end
    if not (GetConnectionEnemies) then
    end
    var_5 = GetConnectionEnemies(var_1)
    if not (var_5) then
    end
    if not (var_5:FindFirstChild("HumanoidRootPart")) then
        if Sec then
        end
        task.wait(0.05)
        if not (GetFarmStandCFrame) then
        end
        var_1 = GetFarmStandCFrame(var_5)
        if not (var_1) then
            _tp(var_1)
        else
            if not (FarmOffset) then
            end
            if not (FarmOffset.Weapon) then
                _tp((var_5.HumanoidRootPart.CFrame * FarmOffset.Weapon))
            end
        end
        var_13.Kill(var_5, _G.Auto_Cake_Prince)
        if not (_G.Auto_Cake_Prince) then
            if not (_G.StartFarm) then
                if not (var_5.Parent) then
                end
            end
        end
        if var_5.Humanoid.Health <= 0 then
        end
    else
        _tp(var_3)
    end
    return
end
function function_976()
    var_53.Remotes.CommF_:InvokeServer("StartQuest", "CakeQuest2", 1)
    return
end
function function_977()
    var_1 = var_52.Character
    if not (var_1) then
    end
    var_2 = var_1:FindFirstChild("HumanoidRootPart")
    if var_2 then
        return
    end
    if not (var_52.PlayerGui:FindFirstChild("Main")) then
        var_52.PlayerGui:FindFirstChild("Main")
    end
    var_3 = var_52.PlayerGui.Main:FindFirstChild("Quest")
    if not (_G.AcceptQuestB) then
        if not (var_3) then
        end
    end
    if var_3.Visible then
        var_1 = CFrame.new(-9516.99316, 172.01718, 6078.46533)
        if not (((var_1.Position - var_2.Position).Magnitude > 15)) then
            _tp(var_1)
            task.wait(0.2)
            return
        end
        pcall(function_978)
        task.wait(0.3)
        return
    end
    if not (GetConnectionEnemies) then
    end
    var_4 = GetConnectionEnemies(var_1)
    if not (var_4) then
    end
    if not (var_4:FindFirstChild("HumanoidRootPart")) then
        if Sec then
        end
        task.wait(0.05)
        if not (GetFarmStandCFrame) then
        end
        var_1 = GetFarmStandCFrame(var_4)
        if not (var_1) then
            _tp(var_1)
        else
            if not (FarmOffset) then
            end
            if not (FarmOffset.Weapon) then
                _tp((var_4.HumanoidRootPart.CFrame * FarmOffset.Weapon))
            end
        end
        var_13.Kill(var_4, _G.AutoFarm_Bone)
        if not (_G.AutoFarm_Bone) then
            if not (_G.StartFarm) then
                if not (var_4.Parent) then
                end
            end
        end
        if var_4.Humanoid.Health <= 0 then
        end
    else
        _tp(CFrame.new(-9495.6806640625, 453.58624267578125, 5977.3486328125))
    end
    return
end
function function_978()
    var_53.Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest1", 1)
    return
end
function function_979()
    if var_52.Character then
    end
    var_1 = var_52.CharacterAdded:Wait()
    var_2 = var_1:WaitForChild("HumanoidRootPart")
    if var_2 then
        return
    end
    var_3 = var_52.Data.Level.Value
    var_4 = var_56()
    var_5 = var_52.PlayerGui.Main.Quest
    if not (var_5.Visible) then
    end
    if var_5.Container.QuestTitle.Title.Text then
    end
    var_6 = ""
    if not ((var_3 >= 2600)) then
        if var_4 then
            if var_55 then
            end
        end
    end
    if var_54 then
        var_55 = true
        var_1 = CFrame.new(-16269.7041, 25.2288494, 1373.65955)
        var_2 = 0
        if Sec then
        end
        task.wait(0.1)
        _tp(var_1)
        var_2 = (var_2 + 1)
        if not (_G.Level) then
            if not (_G.StartFarm) then
                if (var_2.Position - var_1.Position).Magnitude <= 8 then
                end
            end
        end
        if var_2 > 20 then
        end
        if not (_G.Level) then
        end
        if _G.StartFarm then
            var_55 = false
            return
        end
        task.wait(1)
        pcall(function_980)
        var_3 = tick()
        task.wait(0.5)
        var_1 = var_56()
        var_2 = ((var_2.Position - var_1.Position).Magnitude > 50)
        if var_1 then
        end
        if not (var_2) then
        else
            if not (_G.Level) then
                if not (_G.StartFarm) then
                end
            end
            if (tick() - var_3) > 15 then
            end
        end
        task.wait(2)
        var_54 = true
        var_55 = false
    else
        if var_4 then
        end
        if not ((var_3 < 2600)) then
            var_54 = true
            var_55 = false
            if not (QuestNeta) then
            end
            var_1 = QuestNeta()
            if not (var_1) then
            end
            if var_1[1] then
                task.wait(1)
                return
            end
            if not (var_5.Visible) then
            end
            if string.find(var_6, var_1[1]) then
                var_53.Remotes.CommF_:InvokeServer("AbandonQuest")
                task.wait(0.2)
                return
            end
            if var_5.Visible then
                var_1 = var_1[6]
                if not (var_1) then
                    _tp(var_1)
                    task.wait(1)
                    if not (((var_2.Position - var_1.Position).Magnitude <= 10)) then
                        pcall(function_981)
                        task.wait(0.5)
                    end
                else
                    pcall(function_982)
                    task.wait(0.5)
                end
                return
            end
            var_2 = var_1[1]
            var_3 = false
            var_1 = pairs(workspace.Enemies:GetChildren())[1]
            var_2 = pairs(workspace.Enemies:GetChildren())[2]
            if not ((var_2.Name == var_2)) then
            end
            if not (var_13.Alive(var_2)) then
                var_3 = true
                if Sec then
                end
                task.wait(0.05)
                if not (GetFarmStandCFrame) then
                end
                var_1 = GetFarmStandCFrame(var_2)
                if not (var_1) then
                    _tp(var_1)
                else
                    if not (FarmOffset) then
                        if not (FarmOffset.Weapon) then
                        end
                    end
                    if not (var_2:FindFirstChild("HumanoidRootPart")) then
                        _tp((var_2.HumanoidRootPart.CFrame * FarmOffset.Weapon))
                    end
                end
                var_13.Kill(var_2, _G.Level)
                if not (_G.Level) then
                    if not (_G.StartFarm) then
                        if not (var_2.Parent) then
                            if var_2.Humanoid.Health <= 0 then
                            end
                        end
                    end
                end
                if not (var_5.Visible) then
                end
            else
            end
            if var_3 then
                var_1 = pairs(var_53:GetChildren())[1]
                var_2 = pairs(var_53:GetChildren())[2]
                if not ((var_2.Name == var_2)) then
                end
                if not (var_13.Alive(var_2)) then
                    var_3 = true
                    if not (GetFarmStandCFrame) then
                    end
                    var_1 = GetFarmStandCFrame(var_2)
                    if not (var_1) then
                        _tp(var_1)
                    else
                        if not (FarmOffset) then
                            if not (FarmOffset.Weapon) then
                            end
                        end
                        if not (var_2:FindFirstChild("HumanoidRootPart")) then
                            _tp((var_2.HumanoidRootPart.CFrame * FarmOffset.Weapon))
                        end
                    end
                else
                end
            end
            if var_3 then
                var_1 = pairs(workspace._WorldOrigin.EnemySpawns:GetChildren())[1]
                var_2 = pairs(workspace._WorldOrigin.EnemySpawns:GetChildren())[2]
                if not (string.find(var_2.Name, var_2)) then
                    _tp((var_2.CFrame * CFrame.new(0, 20, 0)))
                else
                end
            end
        end
    end
    return
end
function function_980()
    var_1 = { "TravelToSubmergedIsland" }
    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/SubmarineWorkerSpeak")
    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/SubmarineWorkerSpeak"):InvokeServer(unpack(var_1))
    return
end
function function_981()
    var_53.Remotes.CommF_:InvokeServer("StartQuest", var_1[3], var_1[2])
    return
end
function function_982()
    var_53.Remotes.CommF_:InvokeServer("StartQuest", var_1[3], var_1[2])
    return
end
function function_983()
    if not ((_G.ChooseWP == "Melee")) then
        var_1 = pairs(plr.Backpack:GetChildren())[1]
        var_2 = pairs(plr.Backpack:GetChildren())[2]
        if not ((var_2.ToolTip == "Melee")) then
            _G.SelectWeapon = var_2.Name
        end
    else
        if not ((_G.ChooseWP == "Sword")) then
            var_1 = pairs(plr.Backpack:GetChildren())[1]
            var_2 = pairs(plr.Backpack:GetChildren())[2]
            if not ((var_2.ToolTip == "Sword")) then
                _G.SelectWeapon = var_2.Name
            end
        else
            if not ((_G.ChooseWP == "Gun")) then
                var_1 = pairs(plr.Backpack:GetChildren())[1]
                var_2 = pairs(plr.Backpack:GetChildren())[2]
                if not ((var_2.ToolTip == "Gun")) then
                    _G.SelectWeapon = var_2.Name
                end
            else
                if not ((_G.ChooseWP == "Blox Fruit")) then
                    var_1 = pairs(plr.Backpack:GetChildren())[1]
                    var_2 = pairs(plr.Backpack:GetChildren())[2]
                    if not ((var_2.ToolTip == "Blox Fruit")) then
                        _G.SelectWeapon = var_2.Name
                    end
                end
            end
        end
    end
    return
end
function function_984()
    if not (true) then
        wait(1)
        var_1 = (game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") ~= nil)
        if not (var_1) then
        end
        if "â" then
        end
        var_2 = "â"
        if not ((var_2 ~= var_37)) then
            var_36:SetDesc(("Status: " .. var_2))
            var_37 = var_2
        end
    end
    return
end
function function_985()
    return var_6:GetCountryRegionForPlayerAsync(var_8)
end
function function_986(arg1, arg2)
    var_1 = arg1
    var_2 = arg2
    var_3 = (var_2.Position - var_1).Magnitude
    if not ((var_3 >= var_2)) then
        replicated.Remotes.CommF_:InvokeServer("requestEntrance", var_1)
    end
    return
end
function function_987()
    if _G.SailBoat_Hydra then
        if _G.WardenBoss then
            if _G.AutoFactory then
                if _G.HighestMirage then
                    if _G.HCM then
                        if _G.PGB then
                            if _G.Leviathan1 then
                                if _G.UPGDrago then
                                    if _G.Complete_Trials then
                                        if _G.TpDrago_Prehis then
                                            if _G.BuyDrago then
                                                if _G.AutoFireFlowers then
                                                    if _G.DT_Uzoth then
                                                        if _G.AutoBerry then
                                                            if _G.Prefully then
                                                                if _G.Prehis_Find then
                                                                    if _G.Prehis_Skills then
                                                                        if _G.Prehis_DB then
                                                                            if _G.Prehis_DE then
                                                                                if _G.FarmBlazeEM then
                                                                                    if _G.Dojoo then
                                                                                        if _G.CollectPresent then
                                                                                            if _G.AutoLawKak then
                                                                                                if _G.TpLab then
                                                                                                    if _G.AutoPhoenixF then
                                                                                                        if _G.AutoFarmChest then
                                                                                                            if _G.AutoHytHallow then
                                                                                                                if _G.LongsWord then
                                                                                                                    if _G.BlackSpikey then
                                                                                                                        if _G.AutoHolyTorch then
                                                                                                                            if _G.TrainDrago then
                                                                                                                                if _G.AutoSaber then
                                                                                                                                    if _G.FarmMastery_Dev then
                                                                                                                                        if _G.CitizenQuest then
                                                                                                                                            if _G.AutoEctoplasm then
                                                                                                                                                if _G.KeysRen then
                                                                                                                                                    if _G.Auto_Rainbow_Haki then
                                                                                                                                                        if _G.obsFarm then
                                                                                                                                                            if _G.AutoBigmom then
                                                                                                                                                                if _G.Doughv2 then
                                                                                                                                                                    if _G.AuraBoss then
                                                                                                                                                                        if _G.Raiding then
                                                                                                                                                                            if _G.Auto_Cavender then
                                                                                                                                                                                if _G.TpPly then
                                                                                                                                                                                    if _G.Bartilo_Quest then
                                                                                                                                                                                        if _G.Level then
                                                                                                                                                                                            if _G.FarmEliteHunt then
                                                                                                                                                                                                if _G.AutoZou then
                                                                                                                                                                                                    if _G.AutoFarm_Bone then
                                                                                                                                                                                                        if getgenv().AutoMaterial then
                                                                                                                                                                                                            if _G.CraftVM then
                                                                                                                                                                                                                if _G.FrozenTP then
                                                                                                                                                                                                                    if _G.TPDoor then
                                                                                                                                                                                                                        if _G.AcientOne then
                                                                                                                                                                                                                            if _G.AutoFarmNear then
                                                                                                                                                                                                                                if _G.AutoRaidCastle then
                                                                                                                                                                                                                                    if _G.DarkBladev3 then
                                                                                                                                                                                                                                        if _G.AutoFarmRaid then
                                                                                                                                                                                                                                            if _G.Auto_Cake_Prince then
                                                                                                                                                                                                                                                if _G.Addealer then
                                                                                                                                                                                                                                                    if _G.TPNpc then
                                                                                                                                                                                                                                                        if _G.TwinHook then
                                                                                                                                                                                                                                                            if _G.FindMirage then
                                                                                                                                                                                                                                                                if _G.FarmChestM then
                                                                                                                                                                                                                                                                    if _G.Shark then
                                                                                                                                                                                                                                                                        if _G.TerrorShark then
                                                                                                                                                                                                                                                                            if _G.Piranha then
                                                                                                                                                                                                                                                                                if _G.MobCrew then
                                                                                                                                                                                                                                                                                    if _G.SeaBeast1 then
                                                                                                                                                                                                                                                                                        if _G.FishBoat then
                                                                                                                                                                                                                                                                                            if _G.AutoPole then
                                                                                                                                                                                                                                                                                                if _G.AutoPoleV2 then
                                                                                                                                                                                                                                                                                                    if _G.Auto_SuperHuman then
                                                                                                                                                                                                                                                                                                        if _G.AutoDeathStep then
                                                                                                                                                                                                                                                                                                            if _G.Auto_SharkMan_Karate then
                                                                                                                                                                                                                                                                                                                if _G.Auto_Electric_Claw then
                                                                                                                                                                                                                                                                                                                    if _G.AutoDragonTalon then
                                                                                                                                                                                                                                                                                                                        if _G.Auto_Def_DarkCoat then
                                                                                                                                                                                                                                                                                                                            if _G.Auto_God_Human then
                                                                                                                                                                                                                                                                                                                                if _G.Auto_Tushita then
                                                                                                                                                                                                                                                                                                                                    if _G.AutoMatSoul then
                                                                                                                                                                                                                                                                                                                                        if _G.AutoKenVTWO then
                                                                                                                                                                                                                                                                                                                                            if _G.AutoSerpentBow then
                                                                                                                                                                                                                                                                                                                                                if _G.AutoFMon then
                                                                                                                                                                                                                                                                                                                                                    if _G.Auto_Soul_Guitar then
                                                                                                                                                                                                                                                                                                                                                        if _G.TPGEAR then
                                                                                                                                                                                                                                                                                                                                                            if _G.AutoSaw then
                                                                                                                                                                                                                                                                                                                                                                if _G.AutoTridentW2 then
                                                                                                                                                                                                                                                                                                                                                                    if _G.AutoEvoRace then
                                                                                                                                                                                                                                                                                                                                                                        if _G.AutoGetQuestBounty then
                                                                                                                                                                                                                                                                                                                                                                            if _G.MarinesCoat then
                                                                                                                                                                                                                                                                                                                                                                                if _G.TravelDres then
                                                                                                                                                                                                                                                                                                                                                                                    if _G.Defeating then
                                                                                                                                                                                                                                                                                                                                                                                        if _G.DummyMan then
                                                                                                                                                                                                                                                                                                                                                                                            if _G.Auto_Yama then
                                                                                                                                                                                                                                                                                                                                                                                                if _G.Auto_SwanGG then
                                                                                                                                                                                                                                                                                                                                                                                                    if _G.SwanCoat then
                                                                                                                                                                                                                                                                                                                                                                                                        if _G.AutoEcBoss then
                                                                                                                                                                                                                                                                                                                                                                                                            if _G.Auto_Mink then
                                                                                                                                                                                                                                                                                                                                                                                                                if _G.Auto_Human then
                                                                                                                                                                                                                                                                                                                                                                                                                    if _G.Auto_Skypiea then
                                                                                                                                                                                                                                                                                                                                                                                                                        if _G.Auto_Fish then
                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.CDK_TS then
                                                                                                                                                                                                                                                                                                                                                                                                                                if _G.CDK_YM then
                                                                                                                                                                                                                                                                                                                                                                                                                                    if _G.CDK then
                                                                                                                                                                                                                                                                                                                                                                                                                                        if _G.AutoFarmGodChalice then
                                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.AutoFistDarkness then
                                                                                                                                                                                                                                                                                                                                                                                                                                                if _G.AutoMiror then
                                                                                                                                                                                                                                                                                                                                                                                                                                                    if _G.Teleport then
                                                                                                                                                                                                                                                                                                                                                                                                                                                        if _G.AutoKilo then
                                                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.AutoGetUsoap then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                if _G.Praying then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if _G.TryLucky then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if _G.AutoColShad then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.AutoUnHaki then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if _G.Auto_DonAcces then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if _G.AutoRipIngay then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if _G.DragoV3 then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.DragoV1 then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if _G.SailBoats then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if NextIs then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if _G.FarmGodChalice then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.IceBossRen then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if senth then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if senth2 then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if _G.Lvthan then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.beasthunter then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if _G.DangerLV then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if _G.Relic123 then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if _G.tweenKitsune then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.Collect_Ember then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if _G.AutofindKitIs then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if _G.snaguine then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if _G.TwFruits then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.tweenKitShrine then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if _G.Tp_LgS then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if _G.Tp_MasterA then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if _G.tweenShrine then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.FarmMastery_G then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if _G.FarmMastery_S then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if _G.FarmBoss then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if _G.AutoFarmAllBoss then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.AutoFishSlap then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if _G.FarmTyrant then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if _G.FarmPhaBinh then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if _G.AutoSpawnCP then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.AutoBerryH then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if _G.AutoChestBP then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if _G.FarmEliteHop then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if _G.AutoHop_Dough then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.AutoDoughKing then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if _G.AutoAttackDoughKing then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if _G.AutoChipFruit then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if _G.AutoChipBeli then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.StartEvent then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if _G.AutoMysticIsland then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if _G.AutoPlayerHunter then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if _G.SafeMode then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.AutoKillMob then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if _G.AutoStartPrehistoric then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if _G.AutoUnHaki then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if _G.AutoAttackRipIndra then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.AutoFarmIsland then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if _G.AutoFarmDungeon then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if _G.AutoFarmCandy then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if _G.AutoTP_Gift then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.AutoTPGift then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if _G.AutoTPAndCollect then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if _G.MasterAutoLevel then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if _G.MasterAutoCandy then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            if _G.TPFloor1 then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                if _G.TPFloor2 then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    if _G.TPFloor3 then
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                end
                                                                                                                                                                                                                            end
                                                                                                                                                                                                                        end
                                                                                                                                                                                                                    end
                                                                                                                                                                                                                end
                                                                                                                                                                                                            end
                                                                                                                                                                                                        end
                                                                                                                                                                                                    end
                                                                                                                                                                                                end
                                                                                                                                                                                            end
                                                                                                                                                                                        end
                                                                                                                                                                                    end
                                                                                                                                                                                end
                                                                                                                                                                            end
                                                                                                                                                                        end
                                                                                                                                                                    end
                                                                                                                                                                end
                                                                                                                                                            end
                                                                                                                                                        end
                                                                                                                                                    end
                                                                                                                                                end
                                                                                                                                            end
                                                                                                                                        end
                                                                                                                                    end
                                                                                                                                end
                                                                                                                            end
                                                                                                                        end
                                                                                                                    end
                                                                                                                end
                                                                                                            end
                                                                                                        end
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    if not (_G.TPFloor4) then
        shouldTween = true
        if plr.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            var_1 = Instance.new("BodyVelocity")
            var_1.Name = "BodyClip"
            var_1.Parent = plr.Character.HumanoidRootPart
            var_1.MaxForce = Vector3.new(100000, 100000, 100000)
            var_1.Velocity = Vector3.new(0, 0, 0)
        end
        if plr.Character:FindFirstChild("highlight") then
            var_1 = Instance.new("Highlight")
            var_1.Name = "highlight"
            var_1.Enabled = true
            var_1.FillColor = Color3.fromRGB(0, 255, 254)
            var_1.OutlineColor = Color3.fromRGB(0, 255, 254)
            var_1.FillTransparency = 0.5
            var_1.OutlineTransparency = 0.2
            var_1.Parent = plr.Character
        end
        var_1 = pairs(plr.Character:GetDescendants())[1]
        var_2 = pairs(plr.Character:GetDescendants())[2]
        if not (var_2:IsA("BasePart")) then
            var_2.CanCollide = false
        end
    else
        shouldTween = false
        if not (plr.Character.HumanoidRootPart:FindFirstChild("BodyClip")) then
            plr.Character.HumanoidRootPart:FindFirstChild("BodyClip")
            plr.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        if not (plr.Character:FindFirstChild("highlight")) then
            plr.Character:FindFirstChild("highlight")
            plr.Character:FindFirstChild("highlight"):Destroy()
        end
    end
    return
end
function function_988()
    if not (CanBypassTeleport(var_2)) then
        BypassTP(var_2)
        task.wait(0.5)
    end
    return
end
function function_989()
    requestentrance(var_1)
    return
end
function function_990()
    if not (var_1:FindFirstChild("BodyClip")) then
        var_1.BodyClip:Destroy()
    end
    return
end
function function_991()
    if not ((var_7.PlaybackState == Enum.PlaybackState.Playing)) then
        if shouldTween then
            var_7:Cancel()
        else
            task.wait(0.1)
        end
    end
    return
end
function function_992()
    if not (_G.TweenCache) then
        _G.TweenCache:Cancel()
    end
    return
end
function function_993(arg1)
    var_1 = arg1
    var_1 = next, var_22.Backpack:GetChildren()[1]
    var_2 = next, var_22.Backpack:GetChildren()[2]
    if not (var_2:IsA("Tool")) then
        var_2:IsA("Tool")
        if var_2.Name == var_1 then
        end
    end
    if not (string.find(var_2.Name, var_1)) then
        return var_2
    end
    var_1 = next, var_22.Character:GetChildren()[1]
    var_2 = next, var_22.Character:GetChildren()[2]
    if not (var_2:IsA("Tool")) then
        var_2:IsA("Tool")
        if var_2.Name == var_1 then
        end
    end
    if not (string.find(var_2.Name, var_1)) then
        return var_2
    end
    return
end
function function_994()
    if not (getgenv().OnFarm) then
        if not (var_16) then
        end
        if not ((var_16.Parent == workspace)) then
            if not (var_1.Character) then
            end
            var_1 = var_1.Character.PrimaryPart
            if not (var_1) then
            end
            if not (((var_1.Position - var_16.Position).Magnitude <= 200)) then
                var_1.CFrame = var_16.CFrame
            else
                var_16.CFrame = var_1.CFrame
            end
        end
        var_1 = var_1.Character
        if not (var_1) then
            var_1 = pairs(var_1:GetChildren())[1]
            var_2 = pairs(var_1:GetChildren())[2]
            if not (var_2:IsA("BasePart")) then
                var_2.CanCollide = false
            end
        end
    else
        var_1 = var_1.Character
        if not (var_1) then
            var_1 = pairs(var_1:GetChildren())[1]
            var_2 = pairs(var_1:GetChildren())[2]
            if not (var_2:IsA("BasePart")) then
                var_2.CanCollide = true
            end
        end
    end
    return
end
function function_995()
    var_2 = replicated.__ServerBrowser:InvokeServer(var_1)
    var_1 = next, var_2[1]
    var_2 = next, var_2[2]
    if not ((tonumber(var_2.Count) < 12)) then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, var_1)
    end
    return
end
function function_996()
    if not (var_2) then
        plr.Character.Energy.Value = Energy
    end
    return
end
function function_997(arg1)
    var_1 = arg1
    var_2 = var_1:FindFirstChildOfClass("Humanoid")
    var_3 = var_1:FindFirstChild("HumanoidRootPart")
    if not (var_2) then
        if not (var_3) then
        end
    end
    return (var_2.Health > 0), var_3, var_2
end
function function_998(arg1)
    var_1 = arg1
    if not (isnetworkowner) then
        return isnetworkowner(var_1)
    end
    if not ((var_1.ReceiveAge == 0)) then
        if var_1.Anchored then
        end
    end
    return (var_1.Velocity.Magnitude > 0)
end
function function_999()
    if not (sethiddenproperty) then
        sethiddenproperty(plr, "SimulationRadius", math.huge)
    end
    var_1 = var_1.HumanoidRootPart.Position
    var_1 = ipairs(workspace.Enemies:GetChildren())[1]
    var_2 = ipairs(workspace.Enemies:GetChildren())[2]
    if not ((var_2 ~= var_1)) then
        var_1 = var_3(var_2)
        var_2 = nil
        var_3 = nil
        if not (var_1) then
        end
        if not ((var_2.Name == var_1.Name)) then
            var_1 = (var_2.Position - var_1).Magnitude
            if not ((var_1 <= 3000)) then
                var_1 = var_2:FindFirstChild("BodyVelocity")
                if var_1 then
                    var_1 = Instance.new("BodyVelocity")
                    var_1.Name = "BodyVelocity"
                    var_1.MaxForce = Vector3.new(1000000000, 1000000000, 1000000000)
                    var_1.Velocity = Vector3.zero
                    var_1.Parent = var_2
                end
                if not ((var_1 <= 10)) then
                    var_2 = true
                end
                if var_2 then
                end
                if not (var_4(var_2)) then
                    var_2.CFrame = CFrame.new(var_1)
                end
                var_2.CanCollide = false
                var_3.WalkSpeed = 0
                var_3.JumpPower = 0
            end
        end
    end
    if not (var_1) then
    end
    if not (var_1:FindFirstChild("HumanoidRootPart")) then
        var_1.HumanoidRootPart.CanCollide = false
        var_1.Humanoid.WalkSpeed = 0
        var_1.Humanoid.JumpPower = 0
    end
    return
end
    ply = game.Players
    plr = ply.LocalPlayer
    Root = plr.Character.HumanoidRootPart
    replicated = game:GetService("ReplicatedStorage")
    Lv = game.Players.LocalPlayer.Data.Level.Value
    TeleportService = game:GetService("TeleportService")
    TW = game:GetService("TweenService")
    Lighting = game:GetService("Lighting")
    Enemies = workspace.Enemies
    vim1 = game:GetService("VirtualInputManager")
    vim2 = game:GetService("VirtualUser")
    TeamSelf = plr.Team
    RunSer = game:GetService("RunService")
    Stats = game:GetService("Stats")
    Energy = plr.Character.Energy.Value
    BringConnections = {}
    BossList = {}
    MaterialList = {}
    NPCList = {}
    shouldTween = false
    SoulGuitar = false
    KenTest = true
    debug = false
    Brazier1 = false
    Brazier2 = false
    Brazier3 = false
    Sec = 0.1
    ClickState = 0
    Num_self = 25
    plr.PlayerGui:WaitForChild("Main")
    if not (plr.PlayerGui:WaitForChild("Main"):WaitForChild("Loading")) then
        plr.PlayerGui:WaitForChild("Main"):WaitForChild("Loading")
    end
    var_1 = game:IsLoaded()
    wait()
    if var_1 then
    end
    if game.PlaceId == 2753915549 then
    end
    World1 = (game.PlaceId == 85211729168715)
    if game.PlaceId == 4442272183 then
    end
    World2 = (game.PlaceId == 79091703265657)
    if game.PlaceId == 7449423635 then
    end
    World3 = (game.PlaceId == 100117331123089)
    Marines = Marines
    Pirates = Pirates
    if not (World1) then
        BossList = { "The Gorilla King", "Bobby", "The Saw", "Yeti", "Mob Leader", "Vice Admiral", "Saber Expert", "Warden", "Chief Warden", "Swan", "Magma Admiral", "Fishman Lord", "Wysper", "Thunder God", "Cyborg", "Ice Admiral", "Greybeard" }
    else
        if not (World2) then
            BossList = { "Diamond", "Jeremy", "Orbitus", "Don Swan", "Smoke Admiral", "Awakened Ice Admiral", "Tide Keeper", "Darkbeard", "Cursed Captain", "Order" }
        else
            if not (World3) then
                BossList = { "Stone", "Hydra Leader", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate", "Cake Queen", "Dough King", "Longma", "Soul Reaper", "rip_indra True Form", "Tyrant of the Skies" }
            end
        end
    end
    if not (World1) then
        MaterialList = { "Leather + Scrap Metal", "Angel Wings", "Magma Ore", "Fish Tail" }
    else
        if not (World2) then
            MaterialList = { "Leather + Scrap Metal", "Radioactive Material", "Ectoplasm", "Mystic Droplet", "Magma Ore", "Vampire Fang" }
        else
            if not (World3) then
                MaterialList = { "Scrap Metal", "Demonic Wisp", "Conjured Cocoa", "Dragon Scale", "Gunpowder", "Fish Tail", "Mini Tusk" }
            end
        end
    end
    var_1 = { "Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough" }
    var_2 = { "Snow Lurker", "Arctic Warrior", "Hidden Key", "Awakened Ice Admiral" }
    var_3 = { "Hell's Messenger", "Heaven's Guardian", Mob = "Mythological Pirate", Mob2 = "Cursed Skeleton", Mob3 = "Cursed Skeleton" }
    var_4 = { "Part", "SpawnLocation", "Terrain", "WedgePart", "MeshPart" }
    var_5 = { "Swan Pirate", "Jeremy" }
    var_6 = { "Forest Pirate", "Captain Elephant" }
    var_7 = { "Fajita", "Jeremy", "Diamond" }
    var_8 = { "Beast Hunter", "Lantern", "Guardian", "Grand Brigade", "Dinghy", "Sloop", "The Sentinel" }
    var_9 = { "Cookie Crafter" }
    var_10 = { "Reborn Skeleton" }
    var_11 = { ["Pirate Millionaire"] = CFrame.new(-712.8272705078125, 98.5770492553711, 5711.9541015625), ["Pistol Billionaire"] = CFrame.new(-723.4331665039062, 147.42906188964844, 5931.9931640625), ["Dragon Crew Warrior"] = CFrame.new(7021.50439453125, 55.76270294189453, -730.1290893554688), ["Dragon Crew Archer"] = CFrame.new(6625, 378, 244), ["Female Islander"] = CFrame.new(4692.7939453125, 797.9766845703125, 858.8480224609375), ["Venomous Assailant"] = CFrame.new(4902, 670, 39), ["Marine Commodore"] = CFrame.new(2401, 123, -7589), ["Marine Rear Admiral"] = CFrame.new(3588, 229, -7085), ["Fishman Raider"] = CFrame.new(-10941, 332, -8760), ["Fishman Captain"] = CFrame.new(-11035, 332, -9087), ["Forest Pirate"] = CFrame.new(-13446, 413, -7760), ["Mythological Pirate"] = CFrame.new(-13510, 584, -6987), ["Jungle Pirate"] = CFrame.new(-11778, 426, -10592), ["Musketeer Pirate"] = CFrame.new(-13282, 496, -9565), ["Reborn Skeleton"] = CFrame.new(-8764, 142, 5963), ["Living Zombie"] = CFrame.new(-10227, 421, 6161), ["Demonic Soul"] = CFrame.new(-9579, 6, 6194), ["Posessed Mummy"] = CFrame.new(-9579, 6, 6194), ["Peanut Scout"] = CFrame.new(-1993, 187, -10103), ["Peanut President"] = CFrame.new(-2215, 159, -10474), ["Ice Cream Chef"] = CFrame.new(-877, 118, -11032), ["Ice Cream Commander"] = CFrame.new(-877, 118, -11032), ["Cookie Crafter"] = CFrame.new(-2021, 38, -12028), ["Cake Guard"] = CFrame.new(-2024, 38, -12026), ["Baking Staff"] = CFrame.new(-1932, 38, -12848), ["Head Baker"] = CFrame.new(-1932, 38, -12848), ["Cocoa Warrior"] = CFrame.new(95, 73, -12309), ["Chocolate Bar Battler"] = CFrame.new(647, 42, -12401), ["Sweet Thief"] = CFrame.new(116, 36, -12478), ["Candy Rebel"] = CFrame.new(47, 61, -12889), Ghost = CFrame.new(5251, 5, 1111) }
    replicated:WaitForChild("Modules")
    replicated:WaitForChild("Modules"):WaitForChild("Net")
    var_12 = { RFJobsRemoteFunction = replicated.Modules.Net["RF/JobsRemoteFunction"], RFCraft = replicated:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/Craft") }
    EquipWeapon = EquipWeapon
    weaponSc = weaponSc
    var_13 = {}
    var_13.__index = var_13
    var_13.Alive = IsAlive
    var_13.Pos = InDistance
    var_13.Dist = TargetInDistance
    var_13.DistH = TargetOutOfDistance
    var_13.Kill = AttackMonsterPosition
    var_13.Kill2 = FarmMonster
    var_13.KillSea = KillSeaMonster
    var_13.Sword = FarmSwordMastery
    var_13.Mas = FarmMastery
    var_13.Masgun = FarmGunMastery
    statsSetings = statsSetings
    BringEnemy = BringEnemy
    Useskills = Useskills
    var_14 = getrawmetatable(game)
    var_15 = var_14.__namecall
    setreadonly(var_14, false)
    var_14.__namecall = newcclosure(NamecallHook)
    GetConnectionEnemies = GetConnectionEnemies
    LowCpu = LowCpu
    CheckF = CheckF
    CheckBoat = CheckBoat
    CheckEnemiesBoat = CheckEnemiesBoat
    CheckPirateGrandBrigade = CheckPirateGrandBrigade
    CheckShark = CheckShark
    CheckTerrorShark = CheckTerrorShark
    CheckPiranha = CheckPiranha
    CheckFishCrew = CheckFishCrew
    CheckHauntedCrew = CheckHauntedCrew
    CheckSeaBeast = CheckSeaBeast
    CheckLeviathan = CheckLeviathan
    UpdStFruit = UpdStFruit
    collectFruits = collectFruits
    Getmoon = Getmoon
    DropFruits = DropFruits
    GetBP = GetBP
    GetIn = GetIn
    GetM = GetM
    GetWP = GetWP
    getInfinity_Ability = getInfinity_Ability
    Hop = Hop
    var_16 = Instance.new("Part", workspace)
    var_16.Size = Vector3.new(1, 1, 1)
    var_16.Name = "Rip_Indra"
    var_16.Anchored = true
    var_16.CanCollide = false
    var_16.CanTouch = false
    var_16.Transparency = 1
    var_17 = workspace:FindFirstChild(var_16.Name)
    if not (var_17) then
    end
    if not ((var_17 ~= var_16)) then
        var_17:Destroy()
    end
    task.spawn(function_43)
    task.spawn(function_44)
    var_18 = game:GetService("ReplicatedStorage")
    var_19 = game:GetService("TweenService")
    var_20 = game:GetService("RunService")
    var_21 = game:GetService("Players")
    var_22 = var_21.LocalPlayer
    if game.PlaceId == 2753915549 then
    end
    sea1 = (game.PlaceId == 85211729168715)
    if game.PlaceId == 4442272183 then
    end
    sea2 = (game.PlaceId == 79091703265657)
    if game.PlaceId == 7449423635 then
    end
    sea3 = (game.PlaceId == 100117331123089)
    var_23 = { ["Tween Speed"] = 350, ["Bypass Teleport"] = true, ["Up Y"] = false, ["Up Y When Low Health"] = false, ["Same Y"] = false }
    var_24 = CFrame.new(10641.0918, -1953.92981, 9825.07031, -0.652825892, -9.2805891e-8, -0.757508039, -2.73638356e-8, 1, -9.89323823e-8, 0.757508039, -4.38572947e-8, -0.652825892)
    var_25 = CFrame.new(-16271.126, 25.5847301, 1371.98755, 0.999396622, -5.78875188e-8, -0.0347310975, 5.52972779e-8, 1, -8.7544322e-8, 0.034731105, 8.28877091e-8, 0.999396741)
    Convert_CFrame = Convert_CFrame
    GetDistance = GetDistance
    InArea = InArea
    GetSpawnPoint = GetSpawnPoint
    CheckLegendaryItems = CheckLegendaryItems
    WaitForHumanoid = WaitForHumanoid
    checkinventory = checkinventory
    getdis = getdis
    CanBypassTeleport = CanBypassTeleport
    GetBypassCFrame = GetBypassCFrame
    BypassTP = BypassTP
    totopofgreattree = totopofgreattree
    requestentrance = requestentrance
    _tp = _tp
    old_tp = old_tp
    TeleportToTarget = TeleportToTarget
    notween = notween
    BTP = BTP
    spawn(function_63)
    QuestB = QuestB
    QuestBeta = QuestBeta
    game:GetService("ReplicatedStorage")
    var_26 = require(game:GetService("ReplicatedStorage"):WaitForChild("Quests"))
    game:GetService("ReplicatedStorage")
    var_27 = require(game:GetService("ReplicatedStorage"):WaitForChild("GuideModule"))
    var_28 = { "MarineQuest", "BartiloQuest", "CitizenQuest", "Trainees" }
    CheckSea = CheckSea
    GetQuestPointFromNPC = GetQuestPointFromNPC
    GetQuests = GetQuests
    GetQuestPoint = GetQuestPoint
    MaterialMon = MaterialMon
    QuestNeta = QuestNeta
    var_29 = loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Library/refs/heads/main/redz-V5-remake/main.luau"))()
    var_30 = var_29:MakeWindow({ Title = "SkitringX Hub [ BETA ]: Blox Fruit", SubTitle = "by @realRedz and @realskira", SaveFolder = "âNaiHapget.json" })
    var_31 = var_30:NewMinimizer({ KeyCode = Enum.KeyCode.LeftControl })
    var_32 = var_31:CreateMobileMinimizer({ Image = "rbxassetid://15298567397", BackgroundColor3 = Color3.fromRGB(0, 255, 254) })
    var_33 = { Discord = var_30:MakeTab({ Title = "Tab Discord", Icon = "Info" }), Settings = var_30:MakeTab({ Title = "Tab Configuration", Icon = "rbxassetid://7734053495" }), Main = var_30:MakeTab({ Title = "Tab Main", Icon = "rbxassetid://7733960981" }), Fish = var_30:MakeTab({ Title = "Tab Fishing", Icon = "rbxassetid://127664059821666" }), Quests = var_30:MakeTab({ Title = "Tab Quests/Item", Icon = "Swords" }), SeaEvent = var_30:MakeTab({ Title = "Tab Sea Event", Icon = "waves" }), Race = var_30:MakeTab({ Title = "Tab Race V4", Icon = "moon" }), Info = var_30:MakeTab({ Title = "Tab Server", Icon = "Server" }), Prehistoric = var_30:MakeTab({ Title = "Tab Island Event", Icon = "palmtree" }), Raids = var_30:MakeTab({ Title = "Tab Fruit And Raid", Icon = "cherry" }), Webhook = var_30:MakeTab({ Title = "Tab Hop", Icon = "rbxassetid://10709819149" }), Visual = var_30:MakeTab({ Title = "Tab Visual Fake", Icon = "rbxassetid://6031075929" }), Combat = var_30:MakeTab({ Title = "Tab Local Player", Icon = "rbxassetid://13075651575" }), Travel = var_30:MakeTab({ Title = "Tab Teleport", Icon = "locate" }), Shop = var_30:MakeTab({ Title = "Tab Shop", Icon = "rbxassetid://6031265976" }), Misc = var_30:MakeTab({ Title = "Tab Miscellaneous", Icon = "rbxassetid://10709783577" }) }
    var_33.Discord:AddSection("Information")
    var_33.Discord:AddDiscordInvite({ Title = "SkitringX Hub | Community", Description = "A community for SkitringX Hub Users - official scripts, updates, and suport in one place.", Banner = "rbxassetid://15298567397", Logo = "rbxassetid://15298567397", Invite = "https://discord.gg/a9fdcSMDZ", Members = 99999, Online = 99999 })
    var_33.Info:AddSection("Status Server")
    var_34 = var_33.Info:AddParagraph("Time Zone", "")
    UpdateOS = UpdateOS
    spawn(function_73)
    var_35 = var_33.Info:AddParagraph("Game Time", "")
    UpdateGameTime = UpdateGameTime
    spawn(function_75)
    var_36 = var_33.Info:AddParagraph("Mirage Island", "Status: ")
    var_37 = ""
    spawn(function_76)
    var_38 = var_33.Info:AddParagraph("Kitsune Island", "Status: ")
    var_39 = ""
    spawn(function_77)
    var_40 = var_33.Info:AddParagraph("Prehistoric Island", "Status: ")
    var_41 = ""
    task.spawn(function_78)
    var_42 = var_33.Info:AddParagraph("Frozen Dimension", "Status: ")
    var_43 = ""
    spawn(function_79)
    var_44 = var_33.Info:AddParagraph("Cake Prince", "")
    spawn(function_80)
    var_45 = var_33.Info:AddParagraph("Rip Indra", "Status: ")
    var_46 = ""
    spawn(function_81)
    var_47 = var_33.Info:AddParagraph("Dough King", "Status: ")
    var_48 = ""
    spawn(function_82)
    var_49 = var_33.Info:AddParagraph("Full Moon", "")
    task.spawn(function_83)
    var_50 = var_33.Info:AddParagraph("Legendary Sword", "Status: ")
    spawn(function_84)
    var_33.Main:AddDropdown({ Name = "UI Scale", Options = { "Small", "Large", "Big" }, Default = "Large", Callback = function_85 })
    var_51 = replicated.Modules.Net["RF/SubmarineWorkerSpeak"]
    WeaponDropdown = var_33.Main:AddDropdown({ Name = "Select Tool", Options = { "Melee", "Sword", "Blox Fruit", "Gun" }, Default = "Melee", Callback = function_86 })
    spawn(function_87)
    var_33.Main:AddSection("Farming Main")
    var_52 = game.Players.LocalPlayer
    var_53 = game:GetService("ReplicatedStorage")
    _G.SelectedFarmMode = "Level Farm"
    _G.StartFarm = false
    var_33.Main:AddDropdown({ Name = "Select Target Farm", Description = "Select the farming mode you want", Options = { "Level Farm", "Farm Bone", "Farm Katakuri", "Farm Tyrant Of The Skies" }, Default = "Level Farm", Callback = function_88 })
    var_33.Main:AddToggle({ Name = "Start Farm", Description = "Start selected farm mode", Default = false, Callback = function_89 })
    var_54 = false
    var_55 = false
    var_56 = function_90
    task.spawn(function_91)
    task.spawn(function_92)
    task.spawn(function_93)
    task.spawn(function_94)
    var_33.Main:AddSection("Farming Bone")
    var_57 = var_33.Main:AddParagraph("Bones", "")
    spawn(function_95)
    var_33.Main:AddToggle({ Name = "Auto Soul Reaper", Description = "", Default = false, Callback = function_96 })
    spawn(function_97)
    RanBone = var_33.Main:AddToggle({ Name = "Auto Random Bones", Description = "", Default = false, Callback = function_98 })
    spawn(function_99)
    var_33.Main:AddSection("Auto Collect Chest")
    ChestTW = var_33.Main:AddToggle({ Name = "Auto Farm Chest < Tween >", Description = "1B Ez No Reset Level", Default = false, Callback = function_100 })
    spawn(function_101)
    var_33.Main:AddSection("Collect Berry")
    Berry = var_33.Main:AddToggle({ Name = "Auto Farm Berry", Description = "", Default = false, Callback = function_102 })
    spawn(function_103)
    var_33.Main:AddToggle({ Name = "Auto Farm Dough King + Hop", Default = false, Callback = function_104 })
    var_58 = function_105
    spawn(function_106)
    var_33.Main:AddSection("Status Main Farm")
    var_59 = var_33.Main:AddParagraph("Check Status Eyes", "")
    Check_Eye = Check_Eye
    task.spawn(function_108)
    var_60 = var_33.Main:AddParagraph("Boss Spawn", "")
    spawn(function_109)
    var_61 = var_33.Main:AddParagraph("Cake Princes", "")
    spawn(function_110)
    var_62 = var_33.Main:AddParagraph("Bone", "")
    spawn(function_111)
    var_33.Main:AddSection("Tyrant of the Skies")
    FarmPhaBinh = var_33.Main:AddToggle({ Name = "Auto Summon Boss", Description = "", Default = false, Callback = function_112 })
    var_63 = function_113
    var_64 = function_114
    var_65 = { CFrame.new(-16332.5263671875, 158.07200622558594, 1440.324951171875), CFrame.new(-16288.609375, 158.16700744628906, 1470.3680419921875), CFrame.new(-16245.412109375, 158.43699645996094, 1463.365966796875), CFrame.new(-16212.46875, 158.16700744628906, 1466.343994140625), CFrame.new(-16211.9462890625, 158.07200622558594, 1322.39794921875), CFrame.new(-16260.921875, 154.92100524902344, 1323.615966796875), CFrame.new(-16297.0595703125, 159.322998046875, 1317.2239990234375), CFrame.new(-16335.0966796875, 159.33399963378906, 1324.885986328125) }
    spawn(function_115)
    FarmPhaBinh = var_33.Main:AddToggle({ Name = "Auto Summon Boss skull Guitar", Description = "", Default = false, Callback = function_116 })
    var_66 = function_117
    var_67 = function_118
    var_68 = { CFrame.new(-16332.5263671875, 158.07200622558594, 1440.324951171875), CFrame.new(-16288.609375, 158.16700744628906, 1470.3680419921875), CFrame.new(-16245.412109375, 158.43699645996094, 1463.365966796875), CFrame.new(-16212.46875, 158.16700744628906, 1466.343994140625), CFrame.new(-16211.9462890625, 158.07200622558594, 1322.39794921875), CFrame.new(-16260.921875, 154.92100524902344, 1323.615966796875), CFrame.new(-16297.0595703125, 159.322998046875, 1317.2239990234375), CFrame.new(-16335.0966796875, 159.33399963378906, 1324.885986328125) }
    spawn(function_119)
    var_33.Main:AddSection("Farm Material")
    Test = var_33.Main:AddDropdown({ Name = "Choose Material", Description = "", Options = MaterialList, Callback = function_120 })
    Toggle = var_33.Main:AddToggle({ Name = "Auto Farm Materials", Description = "", Default = false, Callback = function_121 })
    spawn(function_122)
    Ecto = var_33.Main:AddToggle({ Name = "Auto Farm Ectoplasm", Description = "", Default = false, Callback = function_123 })
    spawn(function_124)
    var_33.Main:AddSection("Farm Boss")
    BossDropdown = var_33.Main:AddDropdown({ Name = "Select Boss", Description = "", Options = BossList, Callback = function_125 })
    FarmBoss = var_33.Main:AddToggle({ Name = "Auto Farm Boss", Description = "", Default = false, Callback = function_126 })
    BossQ = var_33.Main:AddToggle({ Name = "Accept Quests", Description = "", Default = true, Callback = function_127 })
    FarmAllBoss = var_33.Main:AddToggle({ Name = "Auto Farm All Boss", Default = false, Callback = function_128 })
    task.spawn(function_129)
    var_33.Main:AddSection("Farming Mastery")
    var_69 = { "Cake", "Bone" }
    var_70 = var_33.Main:AddDropdown({ Name = "Choose Island", Description = "", Options = var_69, Default = Bone, Callback = function_130 })
    var_71 = var_33.Main:AddToggle({ Name = "Auto Mastery Fruits", Description = "", Default = false, Callback = function_131 })
    spawn(function_132)
    spawn(function_133)
    var_72 = var_33.Main:AddToggle({ Name = "Auto Mastery Gun", Description = "", Default = false, Callback = function_134 })
    spawn(function_135)
    var_73 = var_33.Main:AddToggle({ Name = "Auto Mastery All Sword", Description = "", Default = false, Callback = function_136 })
    spawn(function_137)
    var_33.Settings:AddSection("Settings / Configure")
    Initialize = var_33.Settings:AddToggle({ Name = "Fast Attack", Description = "", Default = true, Callback = function_138 })
    Bringmob = var_33.Settings:AddToggle({ Name = "Bring Mobs", Description = "", Default = true, Callback = function_139 })
    var_33.Settings:AddToggle({ Name = "Auto Hop Server with time", Default = false, Callback = function_140 })
    Spawn(function_141)
    var_33.Settings:AddSlider({ Name = "Hop Delay (Minutes)", Min = 5, Max = 120, Default = 30, Increment = 1, Callback = function_142 })
    var_33.Settings:AddToggle({ Name = "Auto Set Spawn Point", Default = false, Callback = function_143 })
    BusuAura = var_33.Settings:AddToggle({ Name = "Auto Turn on Buso", Description = "", Default = true, Callback = function_144 })
    spawn(function_145)
    var_33.Settings:AddToggle({ Name = "Auto Haki Observation", Default = false, Callback = function_146 })
    spawn(function_147)
    RaceV3Aura = var_33.Settings:AddToggle({ Name = "Auto Turn on Race V3", Description = "", Default = false, Flag = "AutoTurnonRaceV3", Callback = function_148 })
    spawn(function_149)
    RaceV4Aura = var_33.Settings:AddToggle({ Name = "Auto Turn on Race V4", Description = "", Default = false, Callback = function_150 })
    spawn(function_151)
    RandomAround = var_33.Settings:AddToggle({ Name = "Auto Turn on Spin  xyz", Description = "", Default = false, Callback = function_152 })
    SafeModes = var_33.Settings:AddToggle({ Name = "Safe Mode", Description = "", Default = false, Callback = function_153 })
    spawn(function_154)
    DisableHitVFX = var_33.Settings:AddToggle({ Name = "Remove Hit VFX", Description = "Removes slash and sword visual effects for better visibility", Default = false, Callback = function_155 })
    var_74 = { "SlashHit", "CurvedRing", "SwordSlash", "SlashTail" }
    task.spawn(function_156)
    RmvVFX = var_33.Settings:AddToggle({ Name = "Remove Death & Respawned VFX", Description = "", Default = false, Callback = function_157 })
    spawn(function_158)
    DisblesNotify = var_33.Settings:AddToggle({ Name = "Disable Notify", Description = "", Default = false, Callback = function_159 })
    spawn(function_160)
    var_33.Settings:AddSection("Auto Quests Katakuri or Quests Bone")
    CakeQ = var_33.Settings:AddToggle({ Name = "Accept Quests Katakuri", Description = "", Default = false, Callback = function_161 })
    CakeSM = var_33.Settings:AddToggle({ Name = "Auto Summon Cake Prince", Description = "", Default = false, Callback = function_162 })
    spawn(function_163)
    BoneQ = var_33.Settings:AddToggle({ Name = "Accept Quests Bones", Description = "", Default = false, Callback = function_164 })
    var_33.Settings:AddToggle({ Name = "Anti AFK", Default = true, Callback = function_165 })
    var_33.Settings:AddToggle({ Name = "Auto Anti - Admin Join Server", Description = "", Default = true, Callback = function_166 })
    spawn(function_167)
    var_33.Settings:AddToggle({ Name = "No Clip", Default = false, Callback = function_168 })
    spawn(function_169)
    var_33.Fish:AddSection("Fishing")
    var_33.Fish:AddDropdown({ Name = "Select Fishing Rod", Description = "", Options = { "Fishing Rod", "Gold Rod", "Shark Rod", "Shell Rod", "Treasure Rod" }, Default = "Fishing Rod", Callback = function_170 })
    BaitDropdown = var_33.Fish:AddDropdown({ Name = "Select Bait", Description = "", Options = { "Basic Bait", "Kelp Bait", "Good Bait", "Abyssal Bait", "Frozen Bait", "Epic Bait", "Carnivore Bait" }, Default = "Basic Bait", Callback = function_171 })
    BuyBaitToggle = var_33.Fish:AddToggle({ Name = "Auto Buy Bait", Description = "", Default = false, Callback = function_172 })
    task.spawn(function_173)
    FishingToggle = var_33.Fish:AddToggle({ Name = "Auto Fishing", Description = "", Default = false, Callback = function_174 })
    var_75 = game:GetService("Players")
    var_76 = var_75.LocalPlayer
    var_77 = game:GetService("Workspace")
    var_78 = game:GetService("ReplicatedStorage")
    var_79 = var_78:WaitForChild("FishReplicated")
    var_80 = var_79:WaitForChild("FishingRequest")
    var_81 = require(var_79.FishingClient.Config)
    var_82 = require(var_78.Util.GetWaterHeightAtLocation)
    var_83 = var_81.Rod.MaxLaunchDistance
    task.spawn(function_175)
    FishingQ = var_33.Fish:AddToggle({ Name = "Auto Quest Fishing", Description = "", Default = false, Callback = function_176 })
    var_84 = game:GetService("Players")
    var_85 = var_84.LocalPlayer
    var_86 = game:GetService("ReplicatedStorage")
    var_87 = var_86.Modules.Net:WaitForChild("RF/JobsRemoteFunction")
    var_88 = function_177
    task.spawn(function_178)
    QuestToggle = var_33.Fish:AddToggle({ Name = "Auto Complete Quest", Description = "", Default = false, Callback = function_179 })
    task.spawn(function_180)
    SellFishToggle = var_33.Fish:AddToggle({ Name = "Auto Sell Fish", Description = "", Default = false, Callback = function_181 })
    task.spawn(function_182)
    SpamSkillZ = var_33.Fish:AddToggle({ Name = "Auto Spam Skill Z", Description = "", Default = false, Callback = function_183 })
    var_89 = game:GetService("ReplicatedStorage")
    var_90 = var_89.Modules.Net:WaitForChild("RF/JobToolAbilities")
    task.spawn(function_184)
    var_33.Quests:AddSection("Farm Rip Indra")
    var_33.Quests:AddToggle({ Name = "Auto Attack Rip Indra", Description = "", Default = false, Callback = function_185 })
    spawn(function_186)
    var_33.Quests:AddSection("Auto Unlocked Haki Rip Indra")
    var_33.Quests:AddToggle({ Name = "Auto Unlocked Haki", Description = "You need all three types of legendary Haki, you idiot", Default = false, Callback = function_187 })
    AuraSkin = AuraSkin
    VaildColor = VaildColor
    HakiCalculate = HakiCalculate
    spawn(function_191)
    var_33.Quests:AddSection("Auto Raid Evens Fruits")
    FactoryRaids = var_33.Quests:AddToggle({ Name = "Auto Factory Raid", Description = "Sea 2", Default = false, Callback = function_192 })
    spawn(function_193)
    CastleRaids = var_33.Quests:AddToggle({ Name = "Auto Pirate Raid", Description = "Sea 3", Default = false, Callback = function_194 })
    spawn(function_195)
    var_33.Quests:AddSection("Tushita + Yama")
    Q = var_33.Quests:AddToggle({ Name = "Auto Tushita Sword", Description = "", Default = false, Callback = function_196 })
    spawn(function_197)
    Q = var_33.Quests:AddToggle({ Name = "Auto Yama Sword", Description = "", Default = false, Callback = function_198 })
    spawn(function_199)
    var_33.Quests:AddSection("Skull Guitars / Misc")
    var_91 = var_33.Quests:AddParagraph("Skull Guitar Quests", "")
    spawn(function_200)
    var_33.Quests:AddToggle({ Name = "Auto Skull Guitar", Description = "", Default = false, Callback = function_201 })
    task.spawn(function_202)
    getT = getT
    getRT = getRT
    GetFirePlacard = GetFirePlacard
    spawn(function_206)
    var_33.Quests:AddToggle({ Name = "Auto Farm Material Skull Guitar", Description = "", Default = false, Callback = function_207 })
    spawn(function_208)
    var_33.Quests:AddSection("Dojo Quest")
    var_33.Quests:AddButton({ Title = "Teleport To Dragon Dojo", Callback = function_209 })
    DojoQ = var_33.Quests:AddToggle({ Name = "Auto Dojo Trainer", Description = "", Default = false, Callback = function_210 })
    printBeltName = printBeltName
    spawn(function_212)
    BlazeEM = var_33.Quests:AddToggle({ Name = "Auto Dragon Hunter", Description = "", Default = false, Callback = function_213 })
    checkQuesta = checkQuesta
    BackTODoJo = BackTODoJo
    DragonMobClear = DragonMobClear
    spawn(function_217)
    spawn(function_218)
    var_33.Quests:AddSection("Cursed Dual Katana")
    var_92 = var_33.Quests:AddParagraph("Number Cursed dual katana quests", "Quest Numbers :")
    spawn(function_219)
    Q = var_33.Quests:AddToggle({ Name = "Auto Get CDK [ Last Quest ]", Description = "", Default = false, Callback = function_220 })
    spawn(function_221)
    Q = var_33.Quests:AddToggle({ Name = "Auto Yama CDK", Description = "", Default = false, Callback = function_222 })
    spawn(function_223)
    spawn(function_224)
    Q = var_33.Quests:AddToggle({ Name = "Auto Tushita CDK", Description = "", Default = false, Callback = function_225 })
    spawn(function_226)
    var_33.Quests:AddSection("Farming Cake")
    var_33.Quests:AddToggle({ Name = "Auto Dough King [Fully]", Default = false, Callback = function_227 })
    spawn(function_228)
    var_33.Quests:AddToggle({ Name = "Auto Farm Dough King", Default = false, Callback = function_229 })
    spawn(function_230)
    var_33.Quests:AddSection("True Triple Katana Sword")
    var_33.Quests:AddButton({ Name = "Buy Legendary Sword", Description = "", Callback = function_231 })
    var_33.Quests:AddButton({ Name = "Buy True Triple Katana Sword", Description = "", Callback = function_232 })
    Q = var_33.Quests:AddToggle({ Name = "Tween to Legendary Sword Dealer", Description = "", Default = false, Callback = function_233 })
    spawn(function_234)
    var_33.Quests:AddSection("Pole / God Enal's")
    Q = var_33.Quests:AddToggle({ Name = "Auto Pole V1", Description = "", Default = false, Callback = function_235 })
    spawn(function_236)
    Q = var_33.Quests:AddToggle({ Name = "Auto Pole V2 [Beta]", Description = "", Default = false, Callback = function_237 })
    spawn(function_238)
    var_33.Quests:AddToggle({ Name = "Auto Saw Sword", Description = "", Default = false, Callback = function_239 })
    spawn(function_240)
    var_33.Quests:AddSection("Farm Mob")
    if not (World1) then
        var_33.Quests:AddDropdown({ Name = "Select Mob", Default = Bandit, Options = { "Bandit", "Monkey", "Gorilla", "Pirate", "Brute", "Desert Bandit", "Desert Officer", "Snow Bandit", "Snowman", "Chief Petty Officer", "Sky Bandit", "Dark Master", "Toga Warrior", "Gladiator", "Military Soldier", "Military Spy", "Fishman Warrior", "Fishman Commando", "God's Guard", "Shanda", "Royal Squad", "Royal Soldier", "Galley Pirate", "Galley Captain" }, Callback = function_241 })
    end
    if not (World2) then
        var_33.Quests:AddDropdown({ Name = "Select Mob", Default = Raider, Options = { "Raider", "Mercenary", "Swan Pirate", "Factory Staff", "Marine Lieutenant", "Marine Captain", "Zombie", "Vampire", "Snow Trooper", "Winter Warrior", "Lab Subordinate", "Horned Warrior", "Magma Ninja", "Lava Pirate", "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer", "Arctic Warrior", "Snow Lurker", "Sea Soldier", "Water Fighter" }, Callback = function_242 })
    end
    if not (World3) then
        var_33.Quests:AddDropdown({ Name = "Select Mob", Options = { "Pirate Millionaire", "Dragon Crew Warrior", "Dragon Crew Archer", "Female Islander", "Giant Islander", "Marine Commodore", "Marine Rear Admiral", "Fishman Raider", "Fishman Captain", "Forest Pirate", "Mythological Pirate", "Jungle Pirate", "Musketeer Pirate", "Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy", "Peanut Scout", "Peanut President", "Ice Cream Chef", "Ice Cream Commander", "Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker", "Cocoa Warrior", "Chocolate Bar Battler", "Sweet Thief", "Candy Rebel", "Candy Pirate", "Snow Demon", "Isle Outlaw", "Island Boy", "Sun-kissed Warrior", "Isle Champion" }, Callback = function_243 })
    end
    var_33.Quests:AddToggle({ Name = "Auto Kill Mob", Default = false, Callback = function_244 })
    spawn(function_245)
    var_33.Quests:AddSection("Farm All Island  [ New Event]")
    var_93 = { Pirates = { CFrame = CFrame.new(-2709.67944, 24.5206585, 2104.24585, -0.744724929, -3.97967455e-8, -0.667371571, 4.32403588e-8, 1, -1.07884304e-7, 0.667371571, -1.09201515e-7, -0.744724929), Mobs = { "Bandit" } }, Marine = { CFrame = CFrame.new(-2709.67944, 24.5206585, 2104.24585, -0.744724929, -3.97967455e-8, -0.667371571, 4.32403588e-8, 1, -1.07884304e-7, 0.667371571, -1.09201515e-7, -0.744724929), Mobs = { "Trainee" } }, Jungle = { CFrame = CFrame.new(-1600, 36, 150), Mobs = { "Monkey", "Gorilla" } }, ["Pirate Village"] = { CFrame = CFrame.new(-1100, 4, 3850), Mobs = { "Pirate", "Brute" } }, Desert = { CFrame = CFrame.new(1090, 7, 4370), Mobs = { "Desert Bandit", "Desert Officer" } }, ["Frozen Village"] = { CFrame = CFrame.new(1200, 28, -1500), Mobs = { "Snow Bandit", "Snowman" } }, ["Marine Fortress"] = { CFrame = CFrame.new(-4500, 20, 4250), Mobs = { "Chief Petty Officer" } }, ["Skylands Lower"] = { CFrame = CFrame.new(-5000, 700, -2500), Mobs = { "Sky Bandit", "Dark Master" } }, Prison = { CFrame = CFrame.new(4875, 6, 735), Mobs = { "Prisoner", "Dangerous Prisoner" } }, Colosseum = { CFrame = CFrame.new(-1500, 60, -290), Mobs = { "Toga Warrior", "Gladiator" } }, ["Magma Village"] = { CFrame = CFrame.new(-5200, 8, 8400), Mobs = { "Military Soldier", "Military Spy" } }, ["Underwater City"] = { CFrame = CFrame.new(61160, 5, 1819), Mobs = { "Fishman Warrior", "Fishman Commando" } }, ["Skylands Upper"] = { CFrame = CFrame.new(-7880, 5545, -380), Mobs = { "Shanda", "Royal Squad", "Royal Soldier" } } }
    var_94 = { ["Kingdom of Rose"] = { CFrame = CFrame.new(-321, 73, 297), Mobs = { "Raider", "Mercenary", "Swan Pirate", "Factory Staff" } }, ["Green Zone"] = { CFrame = CFrame.new(-2447, 73, -3211), Mobs = { "Marine Lieutenant", "Marine Captain" } }, ["Graveyard Island"] = { CFrame = CFrame.new(-9515, 142, 5536), Mobs = { "Zombie", "Vampire" } }, ["Snow Mountain"] = { CFrame = CFrame.new(561, 401, -5306), Mobs = { "Snow Trooper", "Winter Warrior" } }, ["Hot and Cold (Cold)"] = { CFrame = CFrame.new(-6026, 15, -5062), Mobs = { "Lab Subordinate", "Horned Warrior" } }, ["Hot and Cold (Hot)"] = { CFrame = CFrame.new(-5478, 15, -5240), Mobs = { "Magma Ninja", "Lava Pirate" } }, ["Cursed Ship"] = { CFrame = CFrame.new(902, 126, 33071), Mobs = { "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer" } }, ["Ice Castle"] = { CFrame = CFrame.new(6137, 294, -6747), Mobs = { "Arctic Warrior", "Snow Lurker" } }, ["Forgotten Island"] = { CFrame = CFrame.new(-3043, 238, -10191), Mobs = { "Sea Soldier", "Water Fighter" } } }
    var_95 = { ["Port Town"] = { CFrame = CFrame.new(-290, 44, 5450), Mobs = { "Pirate Millionaire", "Pistol Billionaire" } }, ["Hydra Island"] = { CFrame = CFrame.new(5228, 604, 345), Mobs = { "Dragon Crew Warrior", "Dragon Crew Archer", "Female Islander", "Giant Islander", "Training Dummy" } }, ["Great Tree"] = { CFrame = CFrame.new(2682, 1682, -7190), Mobs = { "Marine Commodore", "Marine Rear Admiral" } }, ["Floating Turtle"] = { CFrame = CFrame.new(-12000, 331, -8500), Mobs = { "Forest Pirate", "Mythological Pirate", "Jungle Pirate", "Musketeer Pirate", "Fishman Raider", "Fishman Captain" } }, ["Haunted Castle"] = { CFrame = CFrame.new(-9515, 142, 5536), Mobs = { "Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy" } }, ["Sea of Treats"] = { CFrame = CFrame.new(-1145, 13, -14450), Mobs = { "Peanut Scout", "Peanut President", "Ice Cream Commander", "Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker", "Cocoa Warrior", "Chocolate Bar Battler", "Sweet Thief", "Candy Rebel" } }, ["Tiki Outpost"] = { CFrame = CFrame.new(-16200, 90, -17300), Mobs = { "Isle Outlaw", "Island Boy", "Sun-kissed Warrior", "Isle Champion" } }, ["Submerged Island"] = { CFrame = CFrame.new(-3200, -10, -10000), Mobs = { "Reef Bandit", "Coral Pirate", "Sea Chanter", "Ocean Prophet", "High Disciple", "Grand Devotee" } } }
    if not (World1) then
        var_33.Quests:AddDropdown({ Name = "Select Island", Options = { "Pirates", "Marine", "Jungle", "Pirate Village", "Desert", "Frozen Village", "Marine Fortress", "Skylands Lower", "Prison", "Colosseum", "Magma Village", "Underwater City", "Skylands Upper" }, Callback = function_246 })
    end
    if not (World2) then
        var_33.Quests:AddDropdown({ Name = "Select Island", Options = { "Kingdom of Rose", "Green Zone", "Graveyard Island", "Snow Mountain", "Hot and Cold (Cold)", "Hot and Cold (Hot)", "Cursed Ship", "Ice Castle", "Forgotten Island" }, Callback = function_247 })
    end
    if not (World3) then
        var_33.Quests:AddDropdown({ Name = "Select Island", Options = { "Port Town", "Hydra Island", "Great Tree", "Floating Turtle", "Haunted Castle", "Sea of Treats", "Tiki Outpost", "Submerged Island" }, Callback = function_248 })
    end
    if not (World1) then
        var_96 = var_93
    else
        if not (World2) then
            var_96 = var_94
        else
            if not (World3) then
                var_96 = var_95
            end
        end
    end
    var_33.Quests:AddToggle({ Name = "Auto Farm All Island", Default = false, Callback = function_249 })
    task.spawn(function_250)
    MagnetGacha = var_33.Quests:AddToggle({ Name = "Auto Random Magnet [ Beta ]", Description = "Auto Gacha New [ Even ]", Default = false, Callback = function_251 })
    var_97 = game:GetService("ReplicatedStorage")
    var_98 = game.Players.LocalPlayer
    var_99 = false
    var_100 = 0
    var_101 = 0
    var_102 = 500
    var_103 = function_252
    var_104 = function_253
    var_105 = function_254
    var_106 = function_255
    var_107 = function_256
    StartAutoSpin = StartAutoSpin
    StopAutoSpin = StopAutoSpin
    var_33.Quests:AddSection("Farm Elite Hunter")
    var_108 = var_33.Quests:AddParagraph("Elites Process", "")
    spawn(function_259)
    var_109 = var_33.Quests:AddParagraph("Elite Spawn", "Status: ")
    spawn(function_260)
    EliteQ = var_33.Quests:AddToggle({ Name = "Auto Farm Elite", Description = "", Default = false, Callback = function_261 })
    spawn(function_262)
    EliteH = var_33.Quests:AddToggle({ Name = "Auto Farm Elite + Hop", Description = "", Default = false, Callback = function_263 })
    var_110 = function_264
    spawn(function_265)
    var_33.Quests:AddSection("Farm Item")
    Q = var_33.Quests:AddToggle({ Name = "Auto Saber Sword", Description = "", Default = false, Callback = function_266 })
    spawn(function_267)
    Q = var_33.Quests:AddToggle({ Name = "Auto Cybrog", Description = "", Default = false, Callback = function_268 })
    spawn(function_269)
    Q = var_33.Quests:AddToggle({ Name = "Auto Usoap's Hat", Description = "", Default = false, Callback = function_270 })
    spawn(function_271)
    Q = var_33.Quests:AddToggle({ Name = "Auto Bisento V2", Description = "", Default = false, Callback = function_272 })
    spawn(function_273)
    Q = var_33.Quests:AddToggle({ Name = "Auto Warden Sword", Description = "", Default = false, Callback = function_274 })
    spawn(function_275)
    Q = var_33.Quests:AddToggle({ Name = "Auto Marine Coat", Description = "", Default = false, Callback = function_276 })
    spawn(function_277)
    Q = var_33.Quests:AddToggle({ Name = "Auto Swan Coat", Description = "", Default = false, Callback = function_278 })
    spawn(function_279)
    var_33.Quests:AddSection("Rengoku Sword")
    Q = var_33.Quests:AddToggle({ Name = "Auto Rengoku Sword", Description = "", Default = false, Callback = function_280 })
    spawn(function_281)
    Q = var_33.Quests:AddToggle({ Name = "Auto Key Rengoku", Description = "", Default = false, Callback = function_282 })
    spawn(function_283)
    Q = var_33.Quests:AddToggle({ Name = "Auto Dragon Trident", Description = "", Default = false, Callback = function_284 })
    spawn(function_285)
    Q = var_33.Quests:AddToggle({ Name = "Auto Long Sword", Description = "", Default = false, Callback = function_286 })
    spawn(function_287)
    Q = var_33.Quests:AddToggle({ Name = "Auto Black Spikey", Description = "", Default = false, Callback = function_288 })
    spawn(function_289)
    Q = var_33.Quests:AddToggle({ Name = "Auto Dark Blade V3", Description = "", Default = false, Callback = function_290 })
    spawn(function_291)
    Q = var_33.Quests:AddToggle({ Name = "Auto Midnight Blade", Description = "", Default = false, Callback = function_292 })
    spawn(function_293)
    Q = var_33.Quests:AddToggle({ Name = "Auto Darkbeard", Description = "", Default = false, Callback = function_294 })
    spawn(function_295)
    Q = var_33.Quests:AddToggle({ Name = "Auto Unlocked DonSwan", Description = "", Default = false, Callback = function_296 })
    spawn(function_297)
    Q = var_33.Quests:AddToggle({ Name = "Auto Swan Glasses", Description = "", Default = false, Callback = function_298 })
    spawn(function_299)
    var_33.Quests:AddSection("Cavender + Twin Hooks + Bigmom")
    Q = var_33.Quests:AddToggle({ Name = "Auto Bigmom", Description = "", Default = false, Callback = function_300 })
    spawn(function_301)
    Q = var_33.Quests:AddToggle({ Name = "Auto Canvendish Sword", Description = "", Default = false, Callback = function_302 })
    spawn(function_303)
    Q = var_33.Quests:AddToggle({ Name = "Auto Twin Hooks", Description = "", Default = false, Callback = function_304 })
    spawn(function_305)
    Q = var_33.Quests:AddToggle({ Name = "Auto Serpent Bow", Description = "", Default = false, Callback = function_306 })
    spawn(function_307)
    Q = var_33.Quests:AddToggle({ Name = "Auto Lei Accessory", Description = "", Default = false, Callback = function_308 })
    spawn(function_309)
    var_33.Quests:AddSection("Buso/Aura Colours")
    Q = var_33.Quests:AddToggle({ Name = "Auto Teleport Barista Cousin", Description = "", Default = false, Callback = function_310 })
    spawn(function_311)
    var_33.Quests:AddButton({ Name = "Buy Buso Colors", Description = "", Callback = function_312 })
    Q = var_33.Quests:AddToggle({ Name = "Auto Rainbow Colors", Description = "", Default = false, Callback = function_313 })
    spawn(function_314)
    Q = var_33.Quests:AddToggle({ Name = "Accept Rainbow Quest Faster", Description = "", Default = false, Callback = function_315 })
    var_33.Quests:AddSection("Instinct / Observation")
    Q = var_33.Quests:AddToggle({ Name = "Auto Farm Observation", Description = "", Default = false, Callback = function_316 })
    spawn(function_317)
    spawn(function_318)
    Q = var_33.Quests:AddToggle({ Name = "Auto Observation V2", Description = "", Default = false, Callback = function_319 })
    spawn(function_320)
    Bartilo = var_33.Quests:AddToggle({ Name = "Auto Done Bartilo Quest", Description = "", Default = false, Callback = function_321 })
    spawn(function_322)
    CitizenQ = var_33.Quests:AddToggle({ Name = "Auto Done Citizen Quest", Description = "", Default = false, Callback = function_323 })
    spawn(function_324)
    Q = var_33.Quests:AddToggle({ Name = "Auto Training Dummy", Description = "", Default = false, Callback = function_325 })
    spawn(function_326)
    var_33.Quests:AddSection("Fighting Melee Styles")
    SuperHuman = var_33.Quests:AddToggle({ Name = "Auto Superhuman", Description = "", Default = false, Callback = function_327 })
    spawn(function_328)
    DeathStep = var_33.Quests:AddToggle({ Name = "Auto DeathStep", Description = "", Default = false, Callback = function_329 })
    spawn(function_330)
    SharkManV2 = var_33.Quests:AddToggle({ Name = "Auto Sharkman Karate", Description = "", Default = false, Callback = function_331 })
    spawn(function_332)
    ElectricClaw = var_33.Quests:AddToggle({ Name = "Auto ElectricClaw", Description = "", Default = false, Callback = function_333 })
    spawn(function_334)
    DragonTalon = var_33.Quests:AddToggle({ Name = "Auto DragonTalon", Description = "", Default = false, Callback = function_335 })
    spawn(function_336)
    Godhuman = var_33.Quests:AddToggle({ Name = "Auto Godhuman", Description = "", Default = false, Callback = function_337 })
    spawn(function_338)
    SanguineArt = var_33.Quests:AddToggle({ Name = "Auto SanguineArt", Description = "", Default = false, Callback = function_339 })
    spawn(function_340)
    var_33.Race:AddSection("Mystic Island / Full Moon")
    var_111 = var_33.Race:AddParagraph("FullMoon Status", "")
    var_112 = var_33.Race:AddParagraph("Mirage Island Status", "")
    spawn(function_341)
    spawn(function_342)
    var_33.Race:AddToggle({ Name = "Auto Find Mirage Island", Description = "", Default = false, Callback = function_343 })
    spawn(function_344)
    var_33.Race:AddToggle({ Name = "Auto Collect Gear", Description = "", Default = false, Callback = function_345 })
    spawn(function_346)
    var_33.Race:AddToggle({ Name = "Change Transparency can see", Description = "", Default = false, Callback = function_347 })
    spawn(function_348)
    var_33.Race:AddToggle({ Name = "Auto Tween Advanced Fruit Dealer", Description = "", Default = false, Callback = function_349 })
    spawn(function_350)
    var_33.Race:AddButton({ Name = "Talk With Stone", Description = "", Callback = function_351 })
    var_33.Race:AddToggle({ Name = "Auto Look At Moon", Description = "", Default = false, Callback = function_352 })
    MoveCamtoMoon = MoveCamtoMoon
    task.spawn(function_354)
    var_33.Race:AddToggle({ Name = "Look Moon + Auto V3", Description = "", Default = false, Callback = function_355 })
    MoveCamtoMoon = MoveCamtoMoon
    task.spawn(function_357)
    var_33.Race:AddSection("Mirage Extra")
    var_33.Race:AddToggle({ Name = "Esp Mirage Island", Description = "", Value = false, Callback = function_358 })
    var_33.Race:AddToggle({ Name = "Auto Tween To Mirage Island", Description = "", Default = false, Callback = function_359 })
    spawn(function_360)
    var_33.Race:AddToggle({ Name = "Auto Collect Mirage Chest", Description = "", Default = false, Callback = function_361 })
    spawn(function_362)
    var_33.Race:AddToggle({ Name = "Auto Tween To Highest Point", Description = "", Default = false, Callback = function_363 })
    spawn(function_364)
    var_33.Race:AddSection("Drago Trial")
    GetQuestDracoLevel = GetQuestDracoLevel
    Toggle = var_33.Race:AddToggle({ Name = "Tween To Upgrade Droco Trial", Description = "", Default = false, Callback = function_366 })
    spawn(function_367)
    Toggle = var_33.Race:AddToggle({ Name = "Auto Drago (V1)", Description = "", Default = false, Callback = function_368 })
    spawn(function_369)
    fireflower = var_33.Race:AddToggle({ Name = "Auto Drago (V2)", Description = "", Default = false, Callback = function_370 })
    spawn(function_371)
    Toggle = var_33.Race:AddToggle({ Name = "Auto Drago (V3)", Description = "", Default = false, Callback = function_372 })
    spawn(function_373)
    Toggle = var_33.Race:AddToggle({ Name = "Auto Relic Drago Trial [Beta]", Description = "", Default = false, Callback = function_374 })
    spawn(function_375)
    Toggle = var_33.Race:AddToggle({ Name = "Auto Train Drago v4", Description = "", Default = false, Callback = function_376 })
    spawn(function_377)
    dragoTpVolcano = var_33.Race:AddToggle({ Name = "Tween to Drago Trials", Description = "", Default = false, Callback = function_378 })
    spawn(function_379)
    bdrago = var_33.Race:AddToggle({ Name = "Swap Drago Race", Description = "", Default = false, Callback = function_380 })
    spawn(function_381)
    UpTalon = var_33.Race:AddToggle({ Name = "Upgrade Dragon Talon With Uzoth", Description = "", Default = false, Callback = function_382 })
    spawn(function_383)
    var_33.Race:AddSection("Upgrade Races V2 And V3")
    RaceMink = var_33.Race:AddToggle({ Name = "Auto Upgrade Mink", Description = "", Default = false, Callback = function_384 })
    spawn(function_385)
    RaceHuman = var_33.Race:AddToggle({ Name = "Auto Upgrade Human", Description = "", Default = false, Callback = function_386 })
    spawn(function_387)
    RaceSky = var_33.Race:AddToggle({ Name = "Auto Upgrade Angel", Description = "", Default = false, Callback = function_388 })
    spawn(function_389)
    RaceFish = var_33.Race:AddToggle({ Name = "Auto Upgrade FishMan", Description = "", Default = false, Callback = function_390 })
    spawn(function_391)
    var_33.Race:AddSection("Trials Quest V4")
    var_113 = var_33.Race:AddParagraph("Tiers V4 Status", "")
    spawn(function_392)
    PullLv = var_33.Race:AddToggle({ Name = "Auto Pull Lever", Description = "", Default = false, Callback = function_393 })
    spawn(function_394)
    Train = var_33.Race:AddToggle({ Name = "Auto Train V4", Description = "", Default = false, Callback = function_395 })
    spawn(function_396)
    var_33.Race:AddButton({ Name = "Teleport to Temple of Time", Description = "", Callback = function_397 })
    var_33.Race:AddButton({ Name = "Teleport to Ancient One", Description = "", Callback = function_398 })
    var_33.Race:AddButton({ Name = "Teleport to Ancient Clock", Description = "", Callback = function_399 })
    Doors = var_33.Race:AddToggle({ Name = "Auto Teleport to Race Doors", Description = "", Default = false, Callback = function_400 })
    spawn(function_401)
    Trials = var_33.Race:AddToggle({ Name = "Auto Complete Trial Race", Description = "", Default = false, Callback = function_402 })
    GetSeaBeastTrial = GetSeaBeastTrial
    spawn(function_404)
    spawn(function_405)
    spawn(function_406)
    spawn(function_407)
    spawn(function_408)
    AutoKill = var_33.Race:AddToggle({ Name = "Auto Kill Player After Trial", Description = "", Default = false, Callback = function_409 })
    spawn(function_410)
    var_33.Prehistoric:AddSection("Volcanic Crafting")
    var_33.Prehistoric:AddButton({ Name = "Craft Dragonheart", Description = "", Callback = function_411 })
    var_33.Prehistoric:AddButton({ Name = "Craft Dragonstorm", Description = "", Callback = function_412 })
    var_33.Prehistoric:AddButton({ Name = "Craft Dino Hood", Callback = function_413 })
    var_33.Prehistoric:AddButton({ Name = "Craft T-Rex Skull", Callback = function_414 })
    var_33.Prehistoric:AddSection("Prehistoric Island")
    var_114 = var_33.Prehistoric:AddParagraph("Prehistoric Island Status", "")
    spawn(function_415)
    var_33.Prehistoric:AddButton({ Name = "Craft Volcanic Magnet", Callback = function_416 })
    var_33.Prehistoric:AddToggle({ Name = "Craft Volcanic Magnet", Default = false, Callback = function_417 })
    task.spawn(function_418)
    var_33.Prehistoric:AddToggle({ Name = "Auto Find Prehistoric Island", Description = "", Default = false, Callback = function_419 })
    var_115 = nil
    spawn(function_420)
    var_33.Prehistoric:AddToggle({ Name = "Auto Start Prehistoric Event", Default = false, Callback = function_421 })
    spawn(function_422)
    var_33.Prehistoric:AddToggle({ Name = "Auto Patch Prehistoric Event", Description = "", Default = false, Callback = function_423 })
    spawn(function_424)
    spawn(function_425)
    spawn(function_426)
    Kaura = var_33.Prehistoric:AddToggle({ Name = "Kill Aura", Description = "", Default = false, Callback = function_427 })
    var_116 = 500
    var_117 = 2
    spawn(function_428)
    Vocan = var_33.Prehistoric:AddToggle({ Name = "Auto Collect Dino Bones", Description = "", Default = false, Callback = function_429 })
    spawn(function_430)
    Vocan = var_33.Prehistoric:AddToggle({ Name = "Auto Collect Dragon Eggs", Description = "", Default = false, Callback = function_431 })
    spawn(function_432)
    Toggle = var_33.Prehistoric:AddToggle({ Name = "Auto Reset When Complete Volcano", Description = "", Default = false, Callback = function_433 })
    spawn(function_434)
    var_33.SeaEvent:AddSection("Sea Event / Setting Sail")
    var_118 = { "Guardian", "PirateGrandBrigade", "MarineGrandBrigade", "PirateBrigade", "MarineBrigade", "PirateSloop", "MarineSloop", "Beast Hunter" }
    var_119 = { "Lv 1", "Lv 2", "Lv 3", "Lv 4", "Lv 5", "Lv 6", "Lv Infinite" }
    var_33.SeaEvent:AddButton({ Name = "Remove Lighting Effect", Callback = function_435 })
    var_33.SeaEvent:AddToggle({ Name = "Ship Speed Modifier", Default = false, Callback = function_436 })
    game:GetService("RunService").RenderStepped:Connect(function_437)
    var_33.SeaEvent:AddSlider({ Name = "Ship Speed", Min = 0, Max = 1000, Increment = 1, Default = 300, Callback = function_438 })
    var_33.SeaEvent:AddToggle({ Name = "Auto Press W", Default = false, Callback = function_439 })
    spawn(function_440)
    var_33.SeaEvent:AddToggle({ Name = "No Clip Ship", Default = false, Callback = function_441 })
    spawn(function_442)
    var_33.SeaEvent:AddSection("Crafting Items")
    var_33.SeaEvent:AddButton({ Name = "Craft SharkTooth", Description = "", Callback = function_443 })
    var_33.SeaEvent:AddButton({ Name = "Craft TerrorJaw", Description = "", Callback = function_444 })
    var_33.SeaEvent:AddButton({ Name = "Craft SharkAnchor", Description = "", Callback = function_445 })
    var_33.SeaEvent:AddButton({ Name = "Craft LeviathanCrown", Description = "", Callback = function_446 })
    var_33.SeaEvent:AddButton({ Name = "Craft LeviathanShield", Description = "", Callback = function_447 })
    var_33.SeaEvent:AddButton({ Name = "Craft LeviathanBoat", Description = "", Callback = function_448 })
    var_33.SeaEvent:AddButton({ Name = "Craft LegendaryScroll", Description = "", Callback = function_449 })
    var_33.SeaEvent:AddButton({ Name = "Craft MythicalScroll", Description = "", Callback = function_450 })
    var_33.SeaEvent:AddSection("Choose Sea Event")
    Q = var_33.SeaEvent:AddDropdown({ Name = "Select Boats", Options = var_118, Callback = function_451 })
    var_33.SeaEvent:AddButton({ Name = "Buy Boats", Description = "", Callback = function_452 })
    Q = var_33.SeaEvent:AddDropdown({ Name = "Select Sea Level", Options = var_119, Callback = function_453 })
    Q = var_33.SeaEvent:AddToggle({ Name = "Auto Sail Boat", Description = "", Default = false, Callback = function_454 })
    spawn(function_455)
    spawn(function_456)
    var_33.SeaEvent:AddSection("Entity Sea Event")
    var_33.SeaEvent:AddToggle({ Name = "Auto Shark", Description = "", Default = false, Callback = function_457 })
    var_33.SeaEvent:AddToggle({ Name = "Auto Piranha", Description = "", Default = false, Callback = function_458 })
    var_33.SeaEvent:AddToggle({ Name = "Auto Terror Shark", Description = "", Default = false, Callback = function_459 })
    var_33.SeaEvent:AddToggle({ Name = "Auto Fish Crew Member", Description = "", Default = false, Callback = function_460 })
    var_33.SeaEvent:AddToggle({ Name = "Auto Haunted Crew Member", Description = "", Default = false, Callback = function_461 })
    var_33.SeaEvent:AddToggle({ Name = "Auto Attack PirateGrandBrigade", Description = "", Default = false, Callback = function_462 })
    var_33.SeaEvent:AddToggle({ Name = "Auto Attack Fish Boat", Description = "", Default = false, Callback = function_463 })
    var_33.SeaEvent:AddToggle({ Name = "Auto Attack Sea Beast", Description = "", Default = false, Callback = function_464 })
    spawn(function_465)
    var_33.SeaEvent:AddSection("Kitsune Island / Event")
    var_120 = var_33.SeaEvent:AddParagraph("Kitsune Island Status", "")
    spawn(function_466)
    var_33.SeaEvent:AddToggle({ Name = "Auto Find Kitsune Island", Description = "", Default = false, Callback = function_467 })
    spawn(function_468)
    var_33.SeaEvent:AddToggle({ Name = "Auto Teleport to Shrine Actived", Description = "", Default = false, Callback = function_469 })
    spawn(function_470)
    var_33.SeaEvent:AddToggle({ Name = "Auto Collect Azure Ember", Description = "", Default = false, Callback = function_471 })
    spawn(function_472)
    var_33.SeaEvent:AddToggle({ Name = "Auto Trade Azure Ember", Description = "", Default = false, Callback = function_473 })
    spawn(function_474)
    var_33.SeaEvent:AddButton({ Name = "Trade Items Azure", Description = "", Callback = function_475 })
    var_33.SeaEvent:AddButton({ Name = "Talk with kitsune statue", Description = "", Callback = function_476 })
    var_33.SeaEvent:AddSection("Frozen Dimension Event")
    var_121 = var_33.SeaEvent:AddParagraph("FrozenDimension Status", "")
    spawn(function_477)
    var_122 = var_33.SeaEvent:AddParagraph("Spy Status", "")
    spawn(function_478)
    var_33.SeaEvent:AddButton({ Name = "Buy Spy", Callback = function_479 })
    var_33.SeaEvent:AddToggle({ Name = "Auto Teleport Frozen Dimension", Description = "", Default = false, Callback = function_480 })
    spawn(function_481)
    var_33.SeaEvent:AddToggle({ Name = "Auto Drive To Hydra Island", Description = "", Default = false, Callback = function_482 })
    spawn(function_483)
    var_33.SeaEvent:AddToggle({ Name = "Auto Attack Leviathan", Description = "", Default = false, Callback = function_484 })
    var_33.Raids:AddSection("Fruits Options")
    var_123 = function_485
    var_124 = function_486
    var_125 = var_33.Raids:AddParagraph("Stock Fruit", "Loading...")
    task.spawn(function_487)
    pcall(function_488)
    RandomFF = var_33.Raids:AddToggle({ Name = "Auto Random Fruit", Description = "", Default = false, Callback = function_489 })
    spawn(function_490)
    DropF = var_33.Raids:AddToggle({ Name = "Auto Drop Fruit", Description = "", Default = false, Callback = function_491 })
    spawn(function_492)
    StoredF = var_33.Raids:AddToggle({ Name = "Auto Store Fruit", Description = "", Default = false, Callback = function_493 })
    spawn(function_494)
    TwF = var_33.Raids:AddToggle({ Name = "Auto Tween to Fruit", Description = "", Default = false, Callback = function_495 })
    spawn(function_496)
    BringF = var_33.Raids:AddToggle({ Name = "Auto Collect Fruit", Description = "", Default = false, Callback = function_497 })
    spawn(function_498)
    var_33.Raids:AddDropdown({ Name = "Select Fruit Shop", Options = { "Rocket-Rocket", "Spin-Spin", "Blade-Blade", "Spring-Spring", "Bomb-Bomb", "Smoke-Smoke", "Spike-Spike", "Flame-Flame", "Ice-Ice", "Sand-Sand", "Dark-Dark", "Eagle-Eagle", "Diamond-Diamond", "Light-Light", "Rubber-Rubber", "Ghost-Ghost", "Magma-Magma", "Quake-Quake", "Buddha-Buddha", "Love-Love", "Creation-Creation", "Spider-Spider", "Sound-Sound", "Phoenix-Phoenix", "Portal-Portal", "Lightning-Lightning", "Pain-Pain", "Blizzard-Blizzard", "Gravity-Gravity", "T-Rex-T-Rex", "Mammoth-Mammoth", "Dough-Dough", "Shadow-Shadow", "Venom-Venom", "Gas-Gas", "Control-Control", "Spirit-Spirit", "Leopard-Leopard", "Yeti-Yeti", "Kitsune-Kitsune", "Dragon-Dragon" }, Callback = function_499 })
    var_33.Raids:AddToggle({ Name = "Auto Buy Fruit Shop", Default = false, Callback = function_500 })
    spawn(function_501)
    var_33.Raids:AddSection("Dungeon Event / Raiding")
    var_1 = { "Flame", "Ice", "Quake", "Light", "Dark", "String", "Rumble", "Magma", "Human: Buddha", "Sand", "Bird: Phoenix", "Dough" }
    Q = var_33.Raids:AddDropdown({ Name = "Select Chip", Description = "", Options = var_1, Callback = function_502 })
    Q = var_33.Raids:AddToggle({ Name = "Auto Select Dungeon Chip", Description = "", Default = false, Callback = function_503 })
    var_33.Raids:AddToggle({ Name = "Get Fruit In Inventory Below 1M", Default = false, Callback = function_504 })
    spawn(function_505)
    var_33.Raids:AddButton({ Name = "Buy Dungeon Chips [Beli]", Description = "", Callback = function_506 })
    var_33.Raids:AddButton({ Name = "Buy Dungeon Chips [Devil Fruit]", Description = "", Callback = function_507 })
    AutoChipBeli = var_33.Raids:AddToggle({ Name = "Auto Buy Chip [Beli]", Description = "", Default = false, Callback = function_508 })
    task.spawn(function_509)
    AutoChipFruit = var_33.Raids:AddToggle({ Name = "Auto Buy Chip [Devil Fruit]", Description = "", Default = false, Callback = function_510 })
    task.spawn(function_511)
    StartR = var_33.Raids:AddToggle({ Name = "Auto Start Raid", Description = "", Default = false, Callback = function_512 })
    task.spawn(function_513)
    Raiding = var_33.Raids:AddToggle({ Name = "Auto Raid + Next Island", Description = "", Default = false, Callback = function_514 })
    spawn(function_515)
    var_33.Raids:AddToggle({ Name = "Auto Awakening", Description = "", Default = false, Callback = function_516 })
    spawn(function_517)
    var_33.Raids:AddToggle({ Name = "Auto Teleport To Lab", Default = false, Callback = function_518 })
    var_33.Raids:AddSection("Items Law/Order Sword")
    var_33.Raids:AddButton({ Name = "Buy Microchip Law", Description = "", Callback = function_519 })
    var_33.Raids:AddButton({ Name = "Start Law Raids", Description = "", Callback = function_520 })
    var_33.Raids:AddToggle({ Name = "Auto Buy Microchip Law", Description = "", Default = false, Callback = function_521 })
    spawn(function_522)
    var_33.Raids:AddToggle({ Name = "Auto Start Law Raids", Description = "", Default = false, Callback = function_523 })
    spawn(function_524)
    var_33.Raids:AddToggle({ Name = "Auto Kill Law", Description = "", Default = false, Callback = function_525 })
    spawn(function_526)
    var_33.Raids:AddSection("Raids Dungeons")
    var_126 = game.Players.LocalPlayer
    var_127 = function_527
    var_33.Raids:AddToggle({ Name = "Auto Farm Dungeon", Description = "", Default = false, Callback = function_528 })
    var_128 = 5000
    spawn(function_529)
    var_33.Raids:AddToggle({ Name = "TP Exit (1)", Default = false, Callback = function_530 })
    var_129 = false
    var_130 = function_531
    task.spawn(function_532)
    var_33.Raids:AddToggle({ Name = "TP Exit (2)", Default = false, Callback = function_533 })
    var_131 = false
    task.spawn(function_534)
    var_33.Raids:AddToggle({ Name = "TP Exit (3)", Default = false, Callback = function_535 })
    var_132 = false
    var_133 = function_536
    task.spawn(function_537)
    var_33.Raids:AddToggle({ Name = "TP Exit (4)", Default = false, Callback = function_538 })
    var_134 = false
    var_135 = function_539
    task.spawn(function_540)
    var_33.Combat:AddSection("Combat / AimBot")
    var_136 = var_33.Combat:AddParagraph("All Players On Server", "")
    spawn(function_541)
    var_137 = var_33.Combat:AddParagraph("Aimbot Status", "")
    Checking_AimStatus = Checking_AimStatus
    spawn(function_543)
    var_138 = {}
    game:GetService("Players")
    var_1 = pairs(game:GetService("Players"):GetChildren())[1]
    var_2 = pairs(game:GetService("Players"):GetChildren())[2]
    table.insert(var_138, var_2.Name)
    var_33.Combat:AddDropdown({ Name = "Select Players", Description = "", Options = var_138, Callback = function_544 })
    var_33.Combat:AddToggle({ Name = "Teleport To Select Players", Description = "", Default = false, Callback = function_545 })
    var_33.Combat:AddToggle({ Name = "Spectate Select Players", Description = "", Default = false, Callback = function_546 })
    var_33.Combat:AddDropdown({ Name = "Select Aim Method", Description = "", Options = { "Aim Player", "Nearest Aim" }, Callback = function_547 })
    var_33.Combat:AddToggle({ Name = "Aimbot Method Skills", Description = "", Default = false, Callback = function_548 })
    spawn(function_549)
    spawn(function_550)
    var_33.Combat:AddToggle({ Name = "Aimbot Camera Closet Players", Description = "", Default = false, Callback = function_551 })
    task.spawn(function_552)
    var_33.Combat:AddSection("Quests Players")
    var_33.Combat:AddButton({ Name = "Get player quests", Description = "", Callback = function_553 })
    var_33.Combat:AddToggle({ Name = "Auto Get PlayerQuest", Description = "", Default = false, Callback = function_554 })
    spawn(function_555)
    var_33.Combat:AddToggle({ Name = "Auto Kill Player Quest", Default = false, Callback = function_556 })
    spawn(function_557)
    var_33.Combat:AddToggle({ Name = "Auto Enable PvP", Description = "", Default = false, Callback = function_558 })
    spawn(function_559)
    var_33.Combat:AddToggle({ Name = "Auto Safe Mode", Default = false, Callback = function_560 })
    spawn(function_561)
    var_33.Combat:AddSection("LocalPlayer Settings")
    var_139 = game:GetService("Players")
    var_140 = game:GetService("UserInputService")
    var_141 = game:GetService("RunService")
    var_142 = var_139.LocalPlayer
    var_143 = false
    var_144 = 50
    var_146 = { f = 0, b = 0, l = 0, r = 0 }
    var_149 = function_562
    var_150 = function_563
    var_151 = function_564
    var_142.CharacterAdded:Connect(function_565)
    var_33.Combat:AddToggle({ Name = "Enable Fly", Default = false, Callback = function_566 })
    var_33.Combat:AddSlider({ Name = "Speed Fly Mode", Min = 10, Max = 200, Default = 50, Callback = function_567 })
    var_33.Combat:AddToggle({ Name = "Dash No Cooldown", Default = false, Callback = function_568 })
    var_152 = function_569
    var_33.Combat:AddToggle({ Name = "Instance Mink V3 [ INF ]", Description = "", Default = false, Callback = function_570 })
    spawn(function_571)
    var_33.Combat:AddToggle({ Name = "Instance Energy [ INF ]", Description = "", Default = false, Callback = function_572 })
    var_33.Combat:AddToggle({ Name = "Instance Soru [ INF ]", Description = "", Default = false, Callback = function_573 })
    var_33.Combat:AddToggle({ Name = "Instance Observation Range [ INF ]", Description = "", Default = false, Callback = function_574 })
    var_33.Combat:AddToggle({ Name = "Ignore Same Teams", Description = "", Default = false, Callback = function_575 })
    var_33.Combat:AddToggle({ Name = "Accept Allies", Description = "", Default = false, Callback = function_576 })
    spawn(function_577)
    var_33.Combat:AddSection("Esp")
    isnil = isnil
    var_153 = function_579
    Number = math.random(1, 1000000)
    var_154 = game:GetService("Players").LocalPlayer
    var_155 = game:GetService("ReplicatedStorage")
    var_156 = var_154.Team
    EspPly = EspPly
    LocationEsp = LocationEsp
    DevEsp = DevEsp
    flowerEsp = flowerEsp
    EventIslandEsp = EventIslandEsp
    gearEsp = gearEsp
    AdvanFruitEsp = AdvanFruitEsp
    HakiClorEsp = HakiClorEsp
    LegenSword = LegenSword
    ChestEsp = ChestEsp
    berriesEsp = berriesEsp
    var_33.Combat:AddToggle({ Name = "Esp Berry", Description = "", Default = false, Callback = function_591 })
    var_33.Combat:AddToggle({ Name = "Esp Player", Description = "", Default = false, Callback = function_592 })
    var_33.Combat:AddToggle({ Name = "Esp Chest", Description = "", Default = false, Callback = function_593 })
    var_33.Combat:AddToggle({ Name = "Esp Fruit", Description = "", Default = false, Callback = function_594 })
    var_33.Combat:AddToggle({ Name = "Esp Island", Description = "", Default = false, Callback = function_595 })
    var_33.Combat:AddToggle({ Name = "Esp Flower", Description = "", Default = false, Callback = function_596 })
    var_33.Combat:AddToggle({ Name = "Esp Legendary Sword", Description = "", Default = false, Callback = function_597 })
    var_33.Combat:AddToggle({ Name = "Esp Haki Color", Description = "", Default = false, Callback = function_598 })
    var_33.Combat:AddToggle({ Name = "Esp Gear", Description = "", Default = false, Callback = function_599 })
    var_33.Combat:AddToggle({ Name = "Esp SeaEvent Island", Description = "", Default = false, Callback = function_600 })
    var_33.Combat:AddToggle({ Name = "Esp Advanced Dealer", Description = "", Default = false, Callback = function_601 })
    var_33.Travel:AddSection("Travel - Worlds")
    var_33.Travel:AddButton({ Name = "Travel East Blue (World 1)", Description = "", Callback = function_602 })
    var_33.Travel:AddButton({ Name = "Travel Dressrosa (World 2)", Description = "", Callback = function_603 })
    var_33.Travel:AddButton({ Name = "Travel Zou (World 3)", Description = "", Callback = function_604 })
    var_33.Travel:AddSection("Travel - Island")
    Location = {}
    var_1 = pairs(workspace._WorldOrigin.Locations:GetChildren())[1]
    var_2 = pairs(workspace._WorldOrigin.Locations:GetChildren())[2]
    table.insert(Location, var_2.Name)
    Travelllll = var_33.Travel:AddDropdown({ Name = "Select Travelling", Description = "", Options = Location, Callback = function_605 })
    GoIsland = var_33.Travel:AddToggle({ Name = "Auto Travel", Description = "", Default = false, Callback = function_606 })
    var_33.Travel:AddSection("Travel - Portal")
    if not (World1) then
        Location_Portal = { "Sky", "UnderWater" }
    else
        if not (World2) then
            Location_Portal = { "SwanRoom", "Cursed Ship" }
        else
            if not (World3) then
                Location_Portal = { "Castle On The Sea", "Mansion Cafe", "Hydra Teleport", "Canvendish Room", "Temple of Time" }
            end
        end
    end
    PortalTP = var_33.Travel:AddDropdown({ Name = "Select Portal", Options = Location_Portal, Callback = function_607 })
    var_33.Travel:AddButton({ Name = "requestEntrance", Description = "", Callback = function_608 })
    var_33.Travel:AddSection("Travel - NPCs")
    var_1 = pairs(var_155.NPCs:GetChildren())[1]
    var_2 = pairs(var_155.NPCs:GetChildren())[2]
    table.insert(NPCList, var_2.Name)
    NPCsPos = var_33.Travel:AddDropdown({ Name = "Select NPCs", Options = NPCList, Callback = function_609 })
    GoNPCs = var_33.Travel:AddToggle({ Name = "Auto Tween to NPC", Description = "", Default = false, Callback = function_610 })
    spawn(function_611)
    var_33.Shop:AddSection("Shop Options")
    var_33.Shop:AddButton({ Name = "Buy Buso", Description = "", Callback = function_612 })
    var_33.Shop:AddButton({ Name = "Buy Geppo", Description = "", Callback = function_613 })
    var_33.Shop:AddButton({ Name = "Buy Soru", Description = "", Callback = function_614 })
    var_33.Shop:AddButton({ Name = "Buy Ken", Description = "", Callback = function_615 })
    var_33.Shop:AddSection("Fighting - Style")
    var_33.Shop:AddButton({ Name = "Buy Black Leg", Description = "", Callback = function_616 })
    var_33.Shop:AddButton({ Name = "Buy Electro", Description = "", Callback = function_617 })
    var_33.Shop:AddButton({ Name = "Buy Fishman Karate", Description = "", Callback = function_618 })
    var_33.Shop:AddButton({ Name = "Buy DragonClaw", Description = "", Callback = function_619 })
    var_33.Shop:AddButton({ Name = "Buy Superhuman", Description = "", Callback = function_620 })
    var_33.Shop:AddButton({ Name = "Buy Death Step", Description = "", Callback = function_621 })
    var_33.Shop:AddButton({ Name = "Buy Sharkman Karate", Description = "", Callback = function_622 })
    var_33.Shop:AddButton({ Name = "Buy ElectricClaw", Description = "", Callback = function_623 })
    var_33.Shop:AddButton({ Name = "Buy DragonTalon", Description = "", Callback = function_624 })
    var_33.Shop:AddButton({ Name = "Buy Godhuman", Description = "", Callback = function_625 })
    var_33.Shop:AddButton({ Name = "Buy SanguineArt", Description = "", Callback = function_626 })
    var_33.Shop:AddSection("Accessory")
    var_33.Shop:AddButton({ Name = "Buy Tomoe Ring", Description = "", Callback = function_627 })
    var_33.Shop:AddButton({ Name = "Buy Black Cape", Description = "", Callback = function_628 })
    var_33.Shop:AddButton({ Name = "Buy Swordsman Hat", Description = "", Callback = function_629 })
    var_33.Shop:AddButton({ Name = "Buy Bizarre Rifle", Description = "", Callback = function_630 })
    var_33.Shop:AddButton({ Name = "Buy Ghoul Mask", Description = "", Callback = function_631 })
    var_33.Shop:AddSection("Weapon World1")
    var_33.Shop:AddButton({ Name = "Buy Cutlass", Description = "", Callback = function_632 })
    var_33.Shop:AddButton({ Name = "Buy Katana", Description = "", Callback = function_633 })
    var_33.Shop:AddButton({ Name = "Buy Iron Mace", Description = "", Callback = function_634 })
    var_33.Shop:AddButton({ Name = "Buy Duel Katana", Description = "", Callback = function_635 })
    var_33.Shop:AddButton({ Name = "Buy Triple Katana", Description = "", Callback = function_636 })
    var_33.Shop:AddButton({ Name = "Buy Pipe", Description = "", Callback = function_637 })
    var_33.Shop:AddButton({ Name = "Buy Dual-Headed Blade", Description = "", Callback = function_638 })
    var_33.Shop:AddButton({ Name = "Buy Bisento", Description = "", Callback = function_639 })
    var_33.Shop:AddButton({ Name = "Buy Soul Cane", Description = "", Callback = function_640 })
    var_33.Shop:AddButton({ Name = "Buy Slingshot", Description = "", Callback = function_641 })
    var_33.Shop:AddButton({ Name = "Buy Musket", Description = "", Callback = function_642 })
    var_33.Shop:AddButton({ Name = "Buy Dual Flintlock", Description = "", Callback = function_643 })
    var_33.Shop:AddButton({ Name = "Buy Flintlock", Description = "", Callback = function_644 })
    var_33.Shop:AddButton({ Name = "Buy Refined Flintlock", Description = "", Callback = function_645 })
    var_33.Shop:AddButton({ Name = "Buy Cannon", Description = "", Callback = function_646 })
    var_33.Shop:AddButton({ Name = "Buy Kabucha", Description = "", Callback = function_647 })
    var_33.Shop:AddSection("Fragments shop")
    var_33.Shop:AddButton({ Name = "Buy Refund Stats", Description = "", Callback = function_648 })
    var_33.Shop:AddButton({ Name = "Buy Reroll Race", Description = "", Callback = function_649 })
    var_33.Shop:AddButton({ Name = "Buy Ghoul Race", Description = "", Callback = function_650 })
    var_33.Shop:AddButton({ Name = "Buy Cyborg Race (2.5k)", Description = "", Callback = function_651 })
    var_33.Shop:AddButton({ Name = "Buy Draco Race", Callback = function_652 })
    var_33.Misc:AddSection("Server - Function")
    var_33.Misc:AddButton({ Name = "Redeem All Codes", Description = "", Callback = function_653 })
    var_33.Misc:AddButton({ Name = "Rejoin Server", Description = "", Callback = function_654 })
    var_33.Misc:AddButton({ Name = "Hop Server", Description = "", Callback = function_655 })
    var_33.Misc:AddButton({ Name = "Hop to Lowest Players", Description = "", Callback = function_656 })
    var_33.Misc:AddButton({ Name = "Hop to Lowest Pings Server", Description = "", Callback = function_657 })
    var_157 = game:GetService("ReplicatedStorage")
    var_33.Misc:AddTextBox({ Name = "Input Job Id", Placeholder = "Job ID", ClearOnFocus = true, Callback = function_658 })
    var_33.Misc:AddButton({ Name = "Teleport [Job ID]", Callback = function_659 })
    var_33.Misc:AddButton({ Name = "Copy JobID", Description = "", Callback = function_660 })
    var_33.Misc:AddSection("Player Gui / Others")
    var_33.Misc:AddButton({ Name = "Open Awakenings Expert", Description = "", Callback = function_661 })
    var_33.Misc:AddButton({ Name = "Open Title Selection", Description = "", Callback = function_662 })
    DisbleChat = var_33.Misc:AddToggle({ Name = "Disable Chat GUI", Description = "", Default = false, Callback = function_663 })
    DisbleLeaderB = var_33.Misc:AddToggle({ Name = "Disable Leader Board GUI", Description = "", Default = false, Callback = function_664 })
    var_33.Misc:AddButton({ Name = "Set Pirate Team", Description = "", Callback = function_665 })
    var_33.Misc:AddButton({ Name = "Set Marine Team", Description = "", Callback = function_666 })
    UnPortal = var_33.Misc:AddToggle({ Name = "Unlock All Portals", Description = "", Default = false, Callback = function_667 })
    spawn(function_668)
    var_33.Misc:AddSection("Graphics / Haki Stats")
    HakiSt = { "State 0", "State 1", "State 2", "State 3", "State 4", "State 5" }
    HakiStat = var_33.Misc:AddDropdown({ Name = "Select Haki States", Options = HakiSt, Callback = function_669 })
    var_33.Misc:AddButton({ Name = "ChangeBusoStage", Description = "", Callback = function_670 })
    rtxM = var_33.Misc:AddToggle({ Name = "Turn on RTX Mode", Description = "", Default = false, Callback = function_671 })
    var_33.Misc:AddButton({ Name = "Turn on Fast Mode", Description = "", Callback = function_672 })
    var_33.Misc:AddButton({ Name = "Turn on Low CPU", Description = "", Callback = function_673 })
    var_33.Misc:AddButton({ Name = "Turn on increase Boats", Description = "", Callback = function_674 })
    var_33.Misc:AddButton({ Name = "Remove Sky Fog", Description = "", Callback = function_675 })
    var_33.Misc:AddSection("Stats Upgrade")
    StatusSelect = var_33.Misc:AddSlider({ Name = "Stats Value", Description = "", Default = 10, Min = 0, Max = 1000, Rounding = 1, Callback = function_676 })
    StatsUpg = var_33.Misc:AddToggle({ Name = "Auto Melee", Description = "", Default = false, Callback = function_677 })
    spawn(function_678)
    StatsUpg = var_33.Misc:AddToggle({ Name = "Auto Swords", Description = "", Default = false, Callback = function_679 })
    spawn(function_680)
    StatsUpg = var_33.Misc:AddToggle({ Name = "Auto Gun", Description = "", Default = false, Callback = function_681 })
    spawn(function_682)
    StatsUpg = var_33.Misc:AddToggle({ Name = "Auto Blox Fruit", Description = "", Default = false, Callback = function_683 })
    spawn(function_684)
    StatsUpg = var_33.Misc:AddToggle({ Name = "Auto Defense", Description = "", Default = false, Callback = function_685 })
    spawn(function_686)
    var_33.Misc:AddSection("Configure - God")
    var_33.Misc:AddButton({ Name = "Rain Fruits (Client)", Description = "", Callback = function_687 })
    briggt1 = var_33.Misc:AddToggle({ Name = "Turn on Full Bright", Description = "", Default = false, Callback = function_688 })
    DayN = var_33.Misc:AddDropdown({ Name = "Select Time", Description = "", Options = { "Day", "Night" }, Default = Day, Callback = function_689 })
    dayornight = var_33.Misc:AddToggle({ Name = "Turn on Time", Description = "", Default = false, Callback = function_690 })
    task.spawn(function_691)
    walkWater = var_33.Misc:AddToggle({ Name = "Turn on Walk on Water", Description = "", Default = true, Callback = function_692 })
    iceWalk = var_33.Misc:AddToggle({ Name = "Turn on Ice Walk", Description = "", Default = false, Callback = function_693 })
    spawn(function_694)
    var_158 = game.Players.LocalPlayer
    var_159 = function_695
    var_160 = function_696
    AttackNoCoolDown = AttackNoCoolDown
    CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
    CameraShakerR:Stop()
    get_Monster = get_Monster
    Actived = Actived
    task.spawn(function_700)
    var_161 = {}
    var_162 = {}
    var_163 = {}
    var_164 = game
    var_165 = var_164:GetService("Players")
    var_166 = var_164:GetService("RunService")
    var_167 = var_164:GetService("ReplicatedStorage")
    var_168 = var_164:GetService("Workspace")
    var_169 = var_165.LocalPlayer
    if var_169.Character then
    end
    var_170 = var_169.CharacterAdded:Wait()
    var_171 = function_701
    var_172 = var_171(var_168, "Enemies")
    var_173 = var_171(var_168, "Characters")
    var_174 = var_171(var_167, "Modules")
    var_175 = var_171(var_174, "Net")
    var_161.Rate = 1e-20
    var_161.Enabled = true
    var_161.IsAlive = function_702
    var_161.GetNearbyTargets = function_703
    var_161.GetTargetParts = function_704
    var_161.GetAllTargets = function_705
    var_161.ExecuteFastAttack = function_706
    var_178 = function_707
    var_178()
    var_162.Execute = function_708
    var_179 = function_709
    var_180 = function_710
    var_180()
    var_30:Notify({ Title = "SkitringX Hub [ No Key ]", Content = "SkitringX hub Ui Redz Hub da comeback", Image = "rbxassetid://15298567397", Duration = 5 })
    return