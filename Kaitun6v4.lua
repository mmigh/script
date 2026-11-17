getgenv().UserConfig = (type(getgenv().UserConfig) == "table" and getgenv().UserConfig) or {}
if tostring(getgenv().UserConfig.ConfigId or "") == "" and tostring(getgenv().UserConfig.ConfigName or "") == "" then
    getgenv().UserConfig.ConfigId = ""
end
local v1 = getgenv().Webhook
local v2 = ((((syn and syn.request) or http_request) or request) or (http and http.request))
local function v3(v4, v5)
    if (((type(v2) ~= "function") or (type(v4) ~= "string")) or (v4 == "")) then
        return false
    end
    local v6, v7 = pcall(function()
        return v2({ Url = v4, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = game:GetService("HttpService"):JSONEncode(v5) })
    end)
    local v8 = ((v6 and (type(v7) == "table")) and tonumber((v7.StatusCode or v7.Status)))
    if (((not v8) or (v8 < 200)) or (v8 >= 300)) then
        warn(("[Vape Hub] Progress webhook failed (HTTP " .. (tostring((v8 or "unavailable")) .. ")")))
        return false
    end
    return true
end
do
    local v9 = getgenv()
    local v10 = 4
    local v11 = v9.VapeHunterCapeController
    if ((not v11) or (v11.Version ~= v10)) then
        if v11 then
            v11.equipped = false
        end
        local v12 = { Version = v10, equipped = false, nextInventory = 0, nextEquip = 0 }
        local v13 = {
            ["Pilot Helmet"] = 130,
            ["Hunter Cape (Black)"] = 80,
            ["Hunter Cape (Green)"] = 80,
            ["Hunter Cape (Red)"] = 80,
            ["Bandanna (Black)"] = 80,
            ["Bandanna (Green)"] = 80,
            ["Bandanna (Red)"] = 80,
            ["Dojo Belt (Black)"] = 80,
            ["Headband (Black)"] = 70,
            ["Dojo Belt (Red)"] = 60,
            ["Headband (Red)"] = 60,
            ["Jaw Shield"] = 50,
            ["Pretty Helmet"] = 50,
            ["Shark Tooth Necklace"] = 50,
            ["Tooth Necklace"] = 50,
            ["Dino Hood"] = 50,
            ["Easter Bunny Cape"] = 50,
            ["Frosty Helmet"] = 50,
            ["Dojo Belt (Purple)"] = 40,
            ["Headband (Purple)"] = 40,
            ["Ghoul Mask"] = 35,
            ["Dojo Belt (Blue)"] = 30,
            ["Headband (Blue)"] = 30,
            ["Santa Hat"] = 30,
            ["Kitsune Ribbon"] = 30,
            ["Divine Cloak"] = 30,
            ["Oni Helmet"] = 30,
            ["Swan Glasses"] = 25,
            ["Feathered Visage"] = 25,
            ["Dojo Belt (Green)"] = 20,
            ["Headband (Green)"] = 20,
            ["Elf Hat"] = 20,
            ["Peppermint Helmet"] = 20,
            ["Pumpkin Mask"] = 20,
            ["Red Ribbon"] = 20,
            ["Cool Shades"] = 17.5,
            ["Dojo Belt (Yellow)"] = 15,
            ["Dojo Belt (Orange)"] = 15,
            ["Headband (Yellow)"] = 15,
            ["Headband (Orange)"] = 15,
            ["Cupid's Top Hat"] = 14,
            ["Romantic Bouquet"] = 14,
            ["Dojo Belt (White)"] = 10,
            ["Headband (White)"] = 10
        }
        local v14, v15 = {}, v13
        for v16 in pairs(v13) do
            table.insert(v14, v16)
        end
        table.sort(v14, function(v17, v18)
            if (v13[v17] == v13[v18]) then
                local v19, v20 = v17:find("Hunter Cape", 1, true), v18:find("Hunter Cape", 1, true)
                if ((v19 ~= nil) ~= (v20 ~= nil)) then
                    return (v19 ~= nil)
                end
                return (v17 < v18)
            end
            return ((v13[v17] or 0) > (v13[v18] or 0))
        end)
        v12.Bonuses = v13
        local v21, v22, v23
        v9.VapeHunterCapeController = v12
        v9.VapeHunterTweenSpeed = function(v24)
            return ((v12.equipped and 325) or v24)
        end
        local function v25(v26)
            local v27 = game:GetService("ReplicatedStorage")
            local v28 = v27:FindFirstChild("ItemReplicationService")
            local v29 = v27:FindFirstChild("ItemConfig")
            if (((not v28) or (not v29)) or (not v28:FindFirstChild("KEYS"))) then
                return nil
            end
            v21 = (v21 or require(v28))
            v22 = (v22 or require(v28.KEYS))
            v23 = (v23 or require(v29))
            if (v21.IsInitialized == false) then
                return nil
            end
            local v30, v31 = pcall(function()
                return v21:GetItems(v22.QUANTITY)
            end)
            if (((not v30) or (type(v31) ~= "table")) or (next(v31) == nil)) then
                local v32 = (v21._UserCache or v21.UserCache)
                local v33 = (v32 and v32[v26.UserId])
                if v33 then
                    v31 = v33:GetItems(v22.QUANTITY)
                end
            end
            if (type(v31) ~= "table") then
                return nil
            end
            local v34 = {}
            for v35, v36 in pairs(v31) do
                if (v36.ItemId and ((tonumber(v36.Value) or 0) > 0)) then
                    local v37, v38 = pcall(function()
                        return v23.match(v36.ItemId):unwrap()
                    end)
                    if (v37 and v38) then
                        local v39, v40 = (v38.Index or {}), (v38.Display or {})
                        for v41, v42 in pairs({ v39.DebugLabel, v39.StorageKey, v40.Name }) do
                            if (type(v42) == "string") then
                                local v43 = v42:gsub("%s*%[.-%]%s*$", "")
                                if v15[v43] then
                                    v34[v43] = v36
                                end
                            end
                        end
                    end
                end
            end
            for v44, v45 in ipairs(v14) do
                if v34[v45] then
                    return v45, v34[v45]
                end
            end
            return nil
        end
        local function v46()
            local v47 = game:GetService("Players").LocalPlayer
            local v48 = (v47 and v47.Character)
            local v49 = (v48 and v48:FindFirstChildOfClass("Humanoid"))
            v12.equipped = false
            if ((not v49) or (v49.Health <= 0)) then
                return
            end
            local v50
            for v51, v52 in ipairs(v48:GetChildren()) do
                if ((v15[v52.Name] and (not v52:IsA("Tool"))) or (v52:IsA("StringValue") and v15[v52.Value])) then
                    local v53 = ((v15[v52.Name] and v52.Name) or v52.Value)
                    if ((not v50) or ((v13[v53] or 0) > (v13[v50] or 0))) then
                        v50 = v53
                    end
                end
            end
            local v54 = v47:FindFirstChild("Data")
            local v55 = (v54 and v54:FindFirstChild("Accessory"))
            if ((v55 and v55:IsA("StringValue")) and v15[v55.Value]) then
                v50 = v55.Value
            end
            local v56 = game:GetService("ReplicatedStorage")
            local v57 = v56:FindFirstChild("ItemReplicationService")
            local v58 = v56:FindFirstChild("ItemConfig")
            if ((v57 and v58) and v57:FindFirstChild("KEYS")) then
                v21 = (v21 or require(v57))
                v22 = (v22 or require(v57.KEYS))
                v23 = (v23 or require(v58))
                if (v21.IsInitialized ~= false) then
                    local v59 = (v21._UserCache or v21.UserCache)
                    local v60 = (v59 and v59[v47.UserId])
                    local v61 = ((v60 and v60:GetItems(v22.IS_EQUIPPED)) or v21:GetItems(v22.IS_EQUIPPED))
                    for v62, v63 in pairs((v61 or {})) do
                        if (v63.Value == true) then
                            local v64, v65 = pcall(function()
                                return v23.match(v63.ItemId):unwrap()
                            end)
                            local v66 = (((v64 and v65) and v65.Index) and v65.Index.StorageKey)
                            if ((v66 and v15[v66]) and ((not v50) or ((v13[v66] or 0) > (v13[v50] or 0)))) then
                                v50 = v66
                            end
                        end
                    end
                end
            end
            v12.equipped = (v50 ~= nil)
            v12.Accessory = v50
            v12.MovementBonus = ((v50 and v13[v50]) or 0)
            v12.LastError = nil
            if (os.clock() < v12.nextEquip) then
                return
            end
            local v67 = v47:FindFirstChild("Backpack")
            for v68, v69 in ipairs(v14) do
                local v70 = ((v67 and v67:FindFirstChild(v69)) or v48:FindFirstChild(v69))
                if ((v70 and v70:IsA("Tool")) and ((not v50) or ((v13[v69] or 0) > (v13[v50] or 0)))) then
                    v12.nextEquip = (os.clock() + 3)
                    v49:EquipTool(v70)
                    return
                end
            end
            if (os.clock() < v12.nextInventory) then
                return
            end
            v12.nextInventory = (os.clock() + 5)
            local v71, v72 = v25(v47)
            if ((v9.VapeHunterCapeController ~= v12) or (v47.Character ~= v48)) then
                return
            end
            v12.OwnedCape = v71
            if ((not v71) or (v50 and ((v13[v71] or 0) <= (v13[v50] or 0)))) then
                return
            end
            local v73 = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
            local v74 = (v73 and v73:FindFirstChild("CommF_"))
            if (not v74) then
                return
            end
            v12.nextEquip = (os.clock() + 3)
            local v75 = (v72 and v72.NetworkedUID)
            v12.OwnedUID = v75
            v12.LastEquipResult = v74:InvokeServer("LoadItem", (v75 or v71))
        end
        task.spawn(function()
            local v76 = ((setthreadidentity or setidentity) or set_thread_identity)
            if v76 then
                pcall(v76, 2)
            end
            while (v9.VapeHunterCapeController == v12) do
                local v77, v78 = pcall(v46)
                if (not v77) then
                    v12.equipped = false
                    v12.LastError = tostring(v78)
                end
                task.wait(1)
            end
        end)
    end
    getgenv().K4_TOOL_API = (getgenv().K4_TOOL_API or "https://kurinian-hub.xyz/api/k4")
    getgenv().HopApiKey = "92b62b279e2d9869c739467fcfb54d01e5f35253c3f8e659cc4eaead65cf46de"
    getgenv().HopApiBaseUrl = "https://memaybeo.kurinian-hub.xyz"
    K4_PrepareStartup = function()
        local v79 = getgenv()
        local v80 = game:GetService("Players")
        local v81 = game:GetService("ReplicatedStorage")
        local v82 = game:GetService("HttpService")
        local function v83(v84, v85, v86, v87)
            local v88, v89 = tick(), (-math.huge)
            while ((tick() - v88) < v85) do
                local v90, v91 = pcall(v86)
                if (v90 and v91) then
                    return v91
                end
                if ((tick() - v89) >= 10) then
                    warn(("[K4 startup] Waiting for " .. v84))
                    v89 = tick()
                end
                if v87 then
                    pcall(v87)
                end
                task.wait(0.25)
            end
            error(("[K4 startup] Timed out waiting for " .. v84))
        end
        local function v92(v93, v94)
            local v95, v96, v97 = false, false, nil
            local v98 = task.spawn(function()
                v96, v97 = pcall(v93)
                v95 = true
            end)
            local v99 = tick()
            while ((not v95) and ((tick() - v99) < v94)) do
                task.wait(0.1)
            end
            if (not v95) then
                pcall(task.cancel, v98)
                error("Request timed out")
            end
            if (not v96) then
                error(tostring(v97))
            end
            return v97
        end
        v83("game and JobId", 120, function()
            return (game:IsLoaded() and (tostring((game.JobId or "")) ~= ""))
        end)
        local v100 = v83("LocalPlayer", 120, function()
            return v80.LocalPlayer
        end)
        local v102 = v83("CommF_", 120, function()
            local v101 = v81:FindFirstChild("Remotes")
            return (v101 and v101:FindFirstChild("CommF_"))
        end)
        local v103 = (-math.huge)
        v83("PlayerGui, Data and living character", 120, function()
            local v104, v105 = v100:FindFirstChild("PlayerGui"), v100:FindFirstChild("Data")
            local v106 = v100.Character
            local v107 = (v106 and v106:FindFirstChildOfClass("Humanoid"))
            local v108 = (v105 and v105:FindFirstChild("Race"))
            if ((((((((not v104) or (not v108)) or (tostring((v108.Value or "")) == "")) or (not v105:FindFirstChild("Fragments"))) or (not v105:FindFirstChild("Level"))) or (not v107)) or (v107.Health <= 0)) or (not v106:FindFirstChild("HumanoidRootPart"))) then
                return false
            end
            local v109 = v104:FindFirstChild("LoadingScreen")
            if v109 then
                local v110, v111 = true, true
                pcall(function()
                    v110 = v109.Enabled
                end)
                pcall(function()
                    v111 = v109.Visible
                end)
                if ((v110 ~= false) and (v111 ~= false)) then
                    return false
                end
            end
            return true
        end, function()
            if ((not v100.Team) and ((tick() - v103) >= 5)) then
                v103 = tick()
                local v112 = ((v79.UserConfig or v79.Config) or {})
                v92(function()
                    v102:InvokeServer("SetTeam", (((v112.Team == "Pirates") and "Pirates") or "Marines"))
                end, 3)
            end
        end)
        local v115 = v83("UserConfig.ConfigId or Config.ConfigId", 30, function()
            for v113, v114 in ipairs({ (v79.UserConfig or false), (v79.Config or false) }) do
                if ((type(v114) == "table") and (tostring(((v114.ConfigId or v114.ConfigName) or "")) ~= "")) then
                    return v114
                end
            end
            if (tostring((v79.K4_CONFIG or "")) ~= "") then
                return ((v79.UserConfig or v79.Config) or {})
            end
            v79.K4_CONFIG = ""
            return ((v79.UserConfig or v79.Config) or {})
        end)
        local v116 = (((type(v79.UserConfig) == "table") and tonumber(v79.UserConfig.FPS)) or nil)
        local v117 = {}
        for v118, v119 in pairs(v115) do
            v117[v118] = v119
        end
        local v120 = ((v116 or tonumber(v115.FPS)) or 15)
        if (((v120 ~= v120) or (v120 < 0)) or (v120 == math.huge)) then
            v120 = 15
        end
        v117.FPS = v120
        v79.UserConfig = v117
        if (type(setfpscap) == "function") then
            pcall(setfpscap, v120)
        end
        local v120_cid = tostring(v115.ConfigId or "")
        if v120_cid == "" then
            v120_cid = tostring(v115.ConfigName or "")
        end
        if v120_cid == "" then
            v120_cid = tostring(v79.K4_CONFIG or "")
        end
        if v120_cid == "" then
            v120_cid = ""
        end
        v79.K4_CONFIG = v120_cid
        local v121, v122
        local v123 = tostring(v79.K4_TOOL_API):gsub("/api/k4/?$", "")
        for v124 = 1, 5 do
            local v131, v132 = pcall(function()
                local v125 = (v123 .. ("/api/kaitunv4?configId=" .. v82:UrlEncode(v79.K4_CONFIG)))
                local v126 = ((((syn and syn.request) or http_request) or request) or (http and http.request))
                local v127
                if (type(v126) == "function") then
                    local v128 = v92(function()
                        return v126({ Url = v125, Method = "GET", Timeout = 8 })
                    end, 8)
                    local v129 = (tonumber((((v128.StatusCode or v128.status) or v128.Status) or 0)) or 0)
                    assert(((v129 >= 200) and (v129 < 300)), ("Config API HTTP " .. tostring(v129)))
                    v127 = (v128.Body or v128.body)
                else
                    v127 = v92(function()
                        return game:HttpGet(v125)
                    end, 8)
                end
                local v130 = v82:JSONDecode(v127)
                assert((((type(v130) == "table") and (v130.success ~= false)) and (type(v130.config) == "table")), "Config not found")
                assert(((v130.config.helpUsers == nil) or (type(v130.config.helpUsers) == "table")), "Invalid Help Users")
                return v130.config
            end)
            if v131 then
                v121 = v132
                break
            end
            v122 = tostring(v132)
            warn(("[K4 startup] Config attempt " .. (v124 .. ("/5 failed: " .. v122))))
            if (v124 < 5) then
                task.wait(1)
            end
        end
        assert(v121, ("[K4 startup] Cannot resolve MAIN/HELP: " .. tostring(v122)))
        v79.K4_API_CFG = v121
        local v133 = false
        for v134, v135 in pairs((v121.helpUsers or {})) do
            if (string.lower(tostring(v135)) == string.lower(v100.Name)) then
                v133 = true
                break
            end
        end
        Main_Acc, Help_Acc = (not v133), v133
        if v121.targetTier then
            local v136 = tonumber(tostring(v121.targetTier):match("%d+"))
            if v136 then
                v79.Config = (v79.Config or {})
                v79.Config.Tier = v136
            end
        end
        warn(("[K4 startup] " .. (v100.Name .. (" | " .. (v79.K4_CONFIG .. (" | " .. ((v133 and "HELP") or "MAIN")))))))
    end
    K4_ConfigId = function()
        return tostring((getgenv().K4_CONFIG or ""))
    end
    local v137 = getgenv().K4_STARTUP
    if ((type(v137) == "table") and ((v137.jobId == tostring(game.JobId)) or (v137.jobId == ""))) then
        local v138 = ((type(v137.thread) == "thread") and (coroutine.status(v137.thread) ~= "dead"))
        if ((v137.phase == "running") or ((v137.phase == "starting") and v138)) then
            warn("[K4 startup] Already running or starting in this server")
            return
        end
    end
    local v139 = { jobId = tostring(game.JobId), phase = "starting", thread = coroutine.running() }
    getgenv().K4_STARTUP = v139
    local v2722, v2723 = xpcall(function()
        K4_PrepareStartup()
        v139.jobId = tostring(game.JobId)
        do
            local v140 = game:GetService("Players")
            local v141 = game:GetService("HttpService")
            local v142 = v140.LocalPlayer:WaitForChild("Data"):WaitForChild("Race")
            local v143 = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_")
            local v144 = { race = "", at = 0, value = nil, busy = false }
            K4_ReadRaceLevel = function(v145)
                local v146 = tostring(v142.Value)
                if (((not v145) and (v144.race == v146)) and ((tick() - v144.at) < 1)) then
                    return v144.value
                end
                if v144.busy then
                    return (((v144.race == v146) and v144.value) or nil)
                end
                v144.busy = true
                local v147, v148 = false, nil
                local v151 = task.spawn(function()
                    local v149, v150 = pcall(function()
                        return v143:InvokeServer("getRaceLevel")
                    end)
                    if v149 then
                        v148 = tonumber(v150)
                    end
                    v147 = true
                end)
                local v152 = tick()
                while ((not v147) and ((tick() - v152) < 5)) do
                    task.wait(0.1)
                end
                if (not v147) then
                    pcall(task.cancel, v151)
                end
                v144.busy = false
                if (tostring(v142.Value) ~= v146) then
                    return nil
                end
                if (v148 and (v148 >= 1)) then
                    v144 = { race = v146, at = tick(), value = v148 }
                    return v148
                end
                v144 = { race = v146, at = tick(), value = nil }
                return nil
            end
            K4_QueueRaceUpgradeResume = function()
                if (getgenv().K4_RACE_RESUME_JOB == tostring(game.JobId)) then
                    return
                end
                local v153 = ((queue_on_teleport or queueonteleport) or (syn and syn.queue_on_teleport))
                if (type(v153) ~= "function") then
                    warn("[K4 V2/V3] Executor needs auto-execute Kaitun loader after teleport")
                    return
                end
                local v156, v157 = pcall(function()
                    local v154 = v141:JSONEncode(((getgenv().UserConfig or getgenv().Config) or {}))
                    local v155 = tostring((getgenv().KurinianKey or ""))
                    v153(("repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer\n" .. ("Scripts_Type = 'KaitunV4'\ngetgenv().KurinianKey = " .. (string.format("%q", v155) .. ("\ngetgenv().Config = game:GetService('HttpService'):JSONDecode(" .. (string.format("%q", v154) .. (")" .. ("\ngetgenv().UserConfig = getgenv().Config\n" .. ("getgenv().HopApiKey = " .. (string.format("%q", tostring((getgenv().HopApiKey or ""))) .. ("\n" .. ("getgenv().HopApiBaseUrl = " .. (string.format("%q", tostring((getgenv().HopApiBaseUrl or "https://memaybeo.kurinian-hub.xyz"))) .. ("\n" .. "loadstring(game:HttpGet('https://bot.kurinian-hub.xyz/files/v2/loaders/KaitunV4.lua?v=' .. os.time()))()"))))))))))))))
                end)
                if v156 then
                    getgenv().K4_RACE_RESUME_JOB = tostring(game.JobId)
                else
                    warn(("[K4 V2/V3] Cannot queue loader: " .. tostring(v157)))
                end
            end
            K4_RunRaceUpgradePrerequisite = function()
                if ((not Main_Acc) or Help_Acc) then
                    return false
                end
                local v158 = K4_ReadRaceLevel(false)
                while (not v158) do
                    warn("[K4 V2/V3] Waiting for getRaceLevel before entering V4")
                    task.wait(1)
                    v158 = K4_ReadRaceLevel(true)
                end
                if (v158 >= 3) then
                    if ((game.PlaceId ~= 7449423635) and (game.PlaceId ~= 100117331123089)) then
                        K4_QueueRaceUpgradeResume()
                    end
                    return false
                end
                local v159 = getgenv().K4RaceUpgrade
                if ((v159 and v159.active) and (v159.jobId == tostring(game.JobId))) then
                    return true
                end
                v159 = { active = true, jobId = tostring(game.JobId), level = v158, detail = "Preparing V2/V3" }
                getgenv().K4RaceUpgrade = v159
                K4_QueueRaceUpgradeResume()
                pcall(function()
                    if K4TyrantFarmController then
                        K4TyrantFarmController.Stop()
                    end
                end)
                pcall(function()
                    if K4_CancelTrialMovement then
                        K4_CancelTrialMovement()
                    end
                end)
                local v160 = tostring(getgenv().K4_TOOL_API):gsub("/api/k4/?$", "")
                local v161 = ((((syn and syn.request) or http_request) or request) or (http and http.request))
                local function v162(v163, v164)
                    if (type(v161) ~= "function") then
                        return false
                    end
                    local v165, v166 = pcall(function()
                        return v161({ Url = (v160 .. v163), Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = v141:JSONEncode(v164) })
                    end)
                    local v167 = (((v165 and v166) and tonumber(((v166.StatusCode or v166.status) or 0))) or 0)
                    return ((v167 >= 200) and (v167 < 300))
                end
                local function v168()
                    local v169 = tostring(v140.LocalPlayer.Data.Race.Value)
                    local v170 = v162("/api/k4/match", {
                        username = v140.LocalPlayer.Name,
                        role = "upgear",
                        config_name = K4_ConfigId(),
                        race = v169,
                        race_level = v159.level,
                        upgrading_race = true,
                        training = true,
                        queue_ready = false,
                        trial_active = false,
                        job_id = tostring(game.JobId),
                        place_id = game.PlaceId,
                        task_status = v159.detail
                    })
                    v162(("/api/mainaccount/" .. v140.LocalPlayer.Name), {
                        jobid = tostring(game.JobId),
                        placeid = tostring(game.PlaceId),
                        players = {},
                        count = 0,
                        fullmoon = false,
                        trialStatus = (((v159.level < 2) and "upgrading_v2") or "upgrading_v3")
                    })
                    return v170
                end
                while (not v168()) do
                    warn("[K4 V2/V3] Retrying web heartbeat to release trial turn")
                    task.wait(1)
                end
                task.spawn(function()
                    while v159.active do
                        pcall(v168)
                        task.wait(1)
                    end
                end)
                task.spawn(function()
                    while v159.active do
                        local v171 = K4_ReadRaceLevel(true)
                        if v171 then
                            v159.level = v171
                        end
                        task.wait(1)
                    end
                end)
                local v172 = ((game.PlaceId == 4442272183) or (game.PlaceId == 79091703265657))
                if (not v172) then
                    v159.detail = "V2/V3: travelling to Sea 2"
                    while true do
                        pcall(function()
                            v143:InvokeServer("TravelDressrosa")
                        end)
                        task.wait(5)
                    end
                end
                local v173, v174 = pcall(K4_RunV2V3Automation, v159)
                if (not v173) then
                    v159.detail = ("V2/V3 controller error: " .. tostring(v174))
                    warn(("[K4 V2/V3] " .. tostring(v174)))
                end
                while true do
                    if (v159.level >= 3) then
                        pcall(function()
                            v143:InvokeServer("TravelZou")
                        end)
                    end
                    task.wait(5)
                end
            end
        end
        K4_RunV2V3Automation = function(v175)
            local v176 = game:GetService("Players")
            local v177 = v176.LocalPlayer
            local v178 = game:GetService("ReplicatedStorage")
            local v179 = v178:WaitForChild("Remotes"):WaitForChild("CommF_")
            local v180 = game:GetService("TweenService")
            local v181 = game:GetService("VirtualInputManager")
            local v182 = game:GetService("CollectionService")
            local v183 = tostring(v177.Data.Race.Value)
            local v184 = {
                Human = true,
                Mink = true,
                Fishman = true,
                Skypiea = true,
                Ghoul = true,
                Cyborg = true
            }
            local v185, v186, v187
            local v188, v189, v190 = {}, {}, {}
            local v191, v192, v193 = 0, 1, (-math.huge)
            local v194, v195, v196 = (-math.huge), (-math.huge), (-math.huge)
            local v197, v198
            local function v199(v200)
                v175.detail = v200
                if (type(status) == "function") then
                    status(v200)
                end
            end
            local function v201(v202)
                v202 = (v202 or v177.Character)
                if (not v202) then
                    return nil
                end
                local v203 = v202:FindFirstChild("HumanoidRootPart")
                local v204 = v202:FindFirstChildOfClass("Humanoid")
                if ((v203 and v204) and (v204.Health > 0)) then
                    return v203, v204
                end
                return nil
            end
            local function v205()
                if v185 then
                    pcall(function()
                        v185:Cancel()
                    end)
                end
                v185, v186, v187 = nil, nil, nil
            end
            local function v206(v207, v208)
                local v209, v210 = v201()
                if (not v209) then
                    return false
                end
                local v211 = (v208 or v209)
                if (not v208) then
                    v210.Sit = false
                end
                local v212 = v209:FindFirstChild("K4RaceUpgradeFlight")
                if ((not v208) and (not v212)) then
                    v212 = Instance.new("BodyVelocity")
                    v212.Name = "K4RaceUpgradeFlight"
                    v212.MaxForce = Vector3.new(0, math.huge, 0)
                    v212.Velocity = Vector3.zero
                    v212.Parent = v209
                elseif (v208 and v212) then
                    v212:Destroy()
                end
                for v213, v214 in ipairs(v177.Character:GetDescendants()) do
                    if v214:IsA("BasePart") then
                        v214.CanCollide = false
                    end
                end
                local v215 = Vector3.new((-6496.89795), 89.0350037, (-116.509003))
                local v216 = Vector3.new(924.639771, 125.397652, 32844.3906)
                if ((not v208) and ((v211.Position - v207.Position).Magnitude > 8000)) then
                    local v217 = ((v211.Position - v216).Magnitude < 3000)
                    local v218 = ((v207.Position - v216).Magnitude < 3000)
                    if (v217 ~= v218) then
                        v207 = CFrame.new(((v217 and v216) or v215))
                    end
                end
                local v219 = (v211.Position - v207.Position).Magnitude
                if (v219 < 8) then
                    v205()
                    return true
                end
                if (((((v211 ~= v186) or (not v187)) or ((v187 - v207.Position).Magnitude > 12)) or (not v185)) or (v185.PlaybackState ~= Enum.PlaybackState.Playing)) then
                    v205()
                    v186, v187 = v211, v207.Position
                    v185 = v180:Create(v211, TweenInfo.new((v219 / getgenv().VapeHunterTweenSpeed(185)), Enum.EasingStyle.Linear), { CFrame = v207 })
                    v185:Play()
                end
                return (v219 < 25)
            end
            local function v220(v221)
                local _, v223 = v201()
                if (not v223) then
                    return nil
                end
                for v224, v225 in ipairs({ v177.Character, v177.Backpack }) do
                    for v226, v227 in ipairs(v225:GetChildren()) do
                        if (v227:IsA("Tool") and (v227.ToolTip == v221)) then
                            if (v227.Parent ~= v177.Character) then
                                v223:EquipTool(v227)
                            end
                            return v227
                        end
                    end
                end
            end
            local function v228(v229)
                if ((tick() - v194) < 0.8) then
                    return
                end
                local v230 = v220(v229)
                if (not v230) then
                    return
                end
                v194 = tick()
                for v231, v232 in ipairs({ "Z", "X", "C" }) do
                    pcall(function()
                        v181:SendKeyEvent(true, v232, false, game)
                        task.wait(0.05)
                        v181:SendKeyEvent(false, v232, false, game)
                    end)
                end
            end
            local function v233(v234)
                local v235 = v201()
                local v236 = (v234 and v234:FindFirstChild("HumanoidRootPart"))
                if (((not v235) or (not v236)) or ((v235.Position - v236.Position).Magnitude > 65)) then
                    return
                end
                v220("Melee")
                pcall(function()
                    if (not v177.Character:FindFirstChild("HasBuso")) then
                        v179:InvokeServer("Buso")
                    end
                    if ((not v197) or (not v198)) then
                        local v237 = require(v178.Modules.Net)
                        v197 = v237:RemoteEvent("RegisterAttack", true)
                        v198 = v237:RemoteEvent("RegisterHit", true)
                    end
                    v197:FireServer(0)
                    v198:FireServer((v234:FindFirstChild("Head") or v236), { { v234, v236 }, v234 }, nil, "078da341")
                end)
                pcall(function()
                    game:GetService("VirtualUser"):ClickButton1(Vector2.new())
                end)
            end
            local function v238(v239)
                local v240 = workspace:FindFirstChild("Enemies")
                for v241, v242 in ipairs({ v240, v178 }) do
                    if v242 then
                        for v243, v244 in ipairs(v242:GetChildren()) do
                            if (v244:IsA("Model") and ((v244.Name == v239) or (v244.Name:sub(1, (#v239 + 2)) == (v239 .. " [")))) then
                                if v201(v244) then
                                    return v244, (v242 == v240)
                                end
                            end
                        end
                    end
                end
                return nil, false
            end
            local function v245(v246, v247)
                local v248, v249 = v238(v246)
                if v248 then
                    local v250 = v201(v248)
                    v206((v250.CFrame * CFrame.new(0, 25, 0)))
                    if v249 then
                        v233(v248)
                    end
                    return v248, v249
                end
                if v247 then
                    v206(v247)
                end
            end
            local function v251()
                if ((tick() - v193) < 30) then
                    return
                end
                v193 = tick()
                K4_QueueRaceUpgradeResume()
                local v252 = game:HttpGetAsync(("https://games.roblox.com/v1/games/" .. (game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")))
                local v253 = game:GetService("HttpService"):JSONDecode(v252)
                for v254, v255 in ipairs((v253.data or {})) do
                    if ((v255.id ~= game.JobId) and (v255.playing < math.min((v255.maxPlayers or 12), 10))) then
                        v205()
                        v178:WaitForChild("__ServerBrowser"):InvokeServer("teleport", v255.id)
                        return
                    end
                end
            end
            local function v256(v257)
                return (v177.Backpack:FindFirstChild(v257) or (v177.Character and v177.Character:FindFirstChild(v257)))
            end
            local v258 = CFrame.new(980.099, 121.331, 1287.209)
            local function v259()
                local v260 = tonumber(v179:InvokeServer("BartiloQuestProgress", "Bartilo"))
                if (not v260) then
                    v199("V2: waiting for Bartilo progress")
                    return
                end
                if (v260 < 3) then
                    v199(("V2: Bartilo quest " .. tostring(v260)))
                    if (v260 == 0) then
                        local v261 = v177.PlayerGui:FindFirstChild("Main")
                        local v262 = (v261 and v261:FindFirstChild("Quest"))
                        if ((not v262) or (not v262.Visible)) then
                            v179:InvokeServer("StartQuest", "BartiloQuest", 1)
                        end
                        v245("Swan Pirate", v258)
                    elseif (v260 == 1) then
                        v245("Jeremy", CFrame.new(2316, 449, 787))
                    elseif (v260 == 2) then
                        local v263 = {
                            CFrame.new((-1836), 11, 1714),
                            CFrame.new((-1850.5), 13.2, 1750.9),
                            CFrame.new((-1858.9), 19.4, 1712),
                            CFrame.new((-1803.9), 16.6, 1750.9),
                            CFrame.new((-1858.6), 16.9, 1724.8),
                            CFrame.new((-1869.5), 16, 1681),
                            CFrame.new((-1800.1), 15.2, 1681),
                            CFrame.new((-1820.5), 12, 1730)
                        }
                        if v206(v263[v192]) then
                            v192 = ((v192 % #v263) + 1)
                            task.wait(0.5)
                        end
                    end
                    return
                end
                local v264 = tonumber(v179:InvokeServer("Alchemist", "1"))
                if (v264 == 0) then
                    v199("V2: accepting Alchemist flower quest")
                    v179:InvokeServer("Alchemist", "2")
                elseif (v264 == 1) then
                    for v265, v266 in ipairs({ "Flower 1", "Flower 2" }) do
                        if (not v256(v266)) then
                            local v267 = (workspace:FindFirstChild(v266) or workspace:FindFirstChild(v266:gsub(" ", "")))
                            if (v267 and (not v267:IsA("BasePart"))) then
                                v267 = v267:FindFirstChildWhichIsA("BasePart")
                            end
                            if (v267 and (v267.Transparency < 0.9)) then
                                v199(("V2: collecting " .. v266))
                                if v206((v267.CFrame * CFrame.new(0, 1, 0))) then
                                    local v268 = v201()
                                    pcall(function()
                                        local _fti = (firetouchinterest :: any)
                                        _fti(v268, v267, 0)
                                        _fti(v268, v267, 1)
                                    end)
                                end
                                return
                            end
                        end
                    end
                    if (not v256("Flower 3")) then
                        v199("V2: Swan Pirates for Flower 3")
                        v245("Swan Pirate", v258)
                    elseif (v256("Flower 1") and v256("Flower 2")) then
                        v199("V2: submitting three flowers")
                        if v206(CFrame.new(556.9, 38.3, 8.7)) then
                            v179:InvokeServer("Alchemist", "3")
                        end
                    else
                        v199("V2: waiting for remaining day/night flower")
                    end
                elseif (v264 == 2) then
                    v199("V2: submitting Alchemist quest")
                    if v206(CFrame.new(556.9, 38.3, 8.7)) then
                        v179:InvokeServer("Alchemist", "3")
                    end
                end
            end
            local v269 = { { name = "Orbitus", pos = CFrame.new((-2172.74), 103.32, (-4015.03)) }, { name = "Jeremy", pos = CFrame.new(2006.93, 448.96, 853.98) }, { name = "Diamond", pos = CFrame.new((-1576.72), 198.59, 13.72) } }
            local function v270()
                for v271, v272 in ipairs(v269) do
                    if (not v188[v272.name]) then
                        v199(("Human V3: " .. v272.name))
                        local v273, v274 = v245(v272.name, v272.pos)
                        if (v273 and v274) then
                            local v275 = v273:FindFirstChildOfClass("Humanoid")
                            local v276 = v273:FindFirstChild("HumanoidRootPart")
                            while (((v275 and (v275.Health > 0)) and v273.Parent) and (v175.level < 3)) do
                                if ((not v201()) or (tostring(v177.Data.Race.Value) ~= v183)) then
                                    return
                                end
                                if ((not v276) or (not v276.Parent)) then
                                    break
                                end
                                v206((v276.CFrame * CFrame.new(0, 25, 0)))
                                v233(v273)
                                task.wait(0.15)
                            end
                            if (v275 and (v275.Health <= 0)) then
                                v188[v272.name] = true
                            end
                        elseif (not v273) then
                            v251()
                        end
                        return
                    end
                end
                v179:InvokeServer("Wenlocktoad", "3")
            end
            local function v277()
                local v278 = v201()
                local v279, v280 = nil, math.huge
                for v281, v282 in ipairs(v182:GetTagged("_ChestTagged")) do
                    if ((v282:IsA("BasePart") and v282.Parent) and v282.CanTouch) then
                        local v283 = (v278.Position - v282.Position).Magnitude
                        if (v283 < v280) then
                            v279, v280 = v282, v283
                        end
                    end
                end
                v199(("Mink V3: chests " .. (tostring(v191) .. "/30")))
                if v279 then
                    local v284 = v177.Data.Beli.Value
                    if v206((v279.CFrame * CFrame.new(0, 3, 0))) then
                        pcall(function()
                            local _fti = (firetouchinterest :: any)
                            _fti(v278, v279, 0)
                            _fti(v278, v279, 1)
                        end)
                        task.wait(1)
                        if (v177.Data.Beli.Value > v284) then
                            v191 = (v191 + 1)
                        end
                    end
                else
                    v251()
                end
                if (v191 >= 30) then
                    v179:InvokeServer("Wenlocktoad", "3")
                end
            end
            local function v285()
                local v286 = workspace:FindFirstChild("SeaBeasts")
                for v287, v288 in ipairs(((v286 and v286:GetChildren()) or {})) do
                    local v289, v290 = v288:FindFirstChild("Health"), v288:FindFirstChild("HumanoidRootPart")
                    if ((v290 and v289) and (v289.Value > 0)) then
                        v199("Fishman V3: Sea Beast")
                        v206((v290.CFrame * CFrame.new(0, 200, 0)))
                        local v291 = v201()
                        if ((v291.Position - v290.Position).Magnitude < 500) then
                            for v292, v293 in ipairs({ "Blox Fruit", "Melee", "Sword", "Gun" }) do
                                v228(v293)
                                task.wait(0.8)
                            end
                        end
                        return
                    end
                end
                local v294 = workspace:FindFirstChild("Boats")
                for v295, v296 in ipairs(((v294 and v294:GetChildren()) or {})) do
                    local v297, v298 = v296:FindFirstChild("Owner"), v296:FindFirstChild("VehicleSeat", true)
                    if ((v297 and (tostring(v297.Value) == v177.Name)) and v298) then
                        v199("Fishman V3: sailing for Sea Beast")
                        local _, v300 = v201()
                        if (v300.SeatPart ~= v298) then
                            if v206((v298.CFrame * CFrame.new(0, 1, 0))) then
                                v298:Sit(v300)
                            end
                        else
                            v206(CFrame.new((-10000000), 81, 37016.25), v298)
                        end
                        return
                    end
                end
                v199("Fishman V3: buying boat")
                if v206(CFrame.new((-110.271713), 9.76438141, 2956.36841)) then
                    v179:InvokeServer("BuyBoat", "MarineBrigade")
                end
            end
            local function v301()
                if ((tick() - v195) > 5) then
                    v179:InvokeServer("EnablePvp")
                    v195 = tick()
                end
                local v302
                for v303, v304 in ipairs(v176:GetPlayers()) do
                    local v305 = v304.Character
                    local v306 = v201(v305)
                    local v307 = v304:FindFirstChild("Data")
                    if (((((((((((v304 ~= v177) and v305) and v306) and v307) and (not v189[v304.UserId])) and ((v190[v304.UserId] or 0) < tick())) and (not v305:FindFirstChild("NoPvP"))) and (not v305:FindFirstChild("SafeZone"))) and (v304:GetAttribute("PvpDisabled") ~= true)) and (math.abs((v177.Data.Level.Value - v307.Level.Value)) <= (((v183 == "Skypiea") and 200) or 500))) and ((v183 ~= "Skypiea") or (v307.Race.Value == "Skypiea"))) then
                        v302 = v304
                        break
                    end
                end
                if (not v302) then
                    v199((v183 .. " V3: finding eligible player"))
                    v251()
                    return
                end
                v199((v183 .. (" V3: " .. v302.Name)))
                local v308 = v302.Character
                local v309, v310 = v201(v308)
                local v311, v312 = v310.Health, tick()
                while (((v309.Parent and (v310.Health > 0)) and (v302.Character == v308)) and (v175.level < 3)) do
                    if ((not v201()) or (tostring(v177.Data.Race.Value) ~= v183)) then
                        return
                    end
                    v206((v309.CFrame * CFrame.new(0, 5, 2)))
                    v233(v308)
                    v228("Melee")
                    if (v310.Health < v311) then
                        v311, v312 = v310.Health, tick()
                    end
                    if ((tick() - v312) > 10) then
                        v190[v302.UserId] = (tick() + 30)
                        break
                    end
                    task.wait(0.15)
                end
                if (v310.Health <= 0) then
                    v189[v302.UserId] = true
                end
                v179:InvokeServer("Wenlocktoad", "3")
            end
            local function v313()
                v199("Cyborg V3: submitting fruit")
                for v314, v315 in ipairs({ v177.Character, v177.Backpack }) do
                    for v316, v317 in ipairs(v315:GetChildren()) do
                        if (v317:IsA("Tool") and (v317:FindFirstChild("EatRemote", true) or v317.Name:find("Fruit"))) then
                            local _, v319 = v201()
                            v319:EquipTool(v317)
                            task.wait(0.5)
                            v179:InvokeServer("Wenlocktoad", "3")
                            return
                        end
                    end
                end
                if ((tick() - v196) < 5) then
                    return
                end
                v196 = tick()
                local v320, v321
                pcall(function()
                    local v322 = {}
                    for v323, v324 in pairs((v179:InvokeServer("GetFruits", false) or {})) do
                        v322[v324.Name] = tonumber(v324.Price)
                    end
                    local v325 = v178:WaitForChild("ItemReplicationService", 5)
                    local v326 = require(v325)
                    local v327 = require(v325.KEYS)
                    local v328 = require(v178:WaitForChild("ItemConfig", 5))
                    for v329, v330 in pairs((v326:GetItems(v327.QUANTITY) or {})) do
                        if (v330.Value and (v330.Value > 0)) then
                            local v331 = v328.match(v330.ItemId):unwrap()
                            if (v331.Display and (v331.Display.Category == "Blox Fruit")) then
                                local v332 = ((v331.Index and v331.Index.StorageKey) or v331.Display.Name)
                                local v333 = v322[v332]
                                if (v333 and ((not v321) or (v333 < v321))) then
                                    v320, v321 = v332, v333
                                end
                            end
                        end
                    end
                end)
                if v320 then
                    v179:InvokeServer("LoadFruit", v320)
                elseif v206(CFrame.new((-422.202271), 72.4190063, 386.306335)) then
                    v179:InvokeServer("Cousin", "Buy")
                end
            end
            while (v175.active and (tostring(v177.Data.Race.Value) == v183)) do
                local v334 = K4_ReadRaceLevel(false)
                if v334 then
                    v175.level = v334
                end
                if (v334 and (v334 >= 3)) then
                    break
                end
                local v336, v337 = pcall(function()
                    if (not v201()) then
                        v199("V2/V3: waiting for character")
                        return
                    end
                    if (not v184[v183]) then
                        v199(("V2/V3: quest unavailable for " .. v183))
                        return
                    end
                    if (v334 == 1) then
                        v259()
                    elseif (v334 == 2) then
                        local v335 = tonumber(v179:InvokeServer("Wenlocktoad", "1"))
                        if (v335 == 0) then
                            v199((v183 .. " V3: accepting quest"))
                            v179:InvokeServer("Wenlocktoad", "2")
                            v188, v189, v191 = {}, {}, 0
                        elseif (v335 == 2) then
                            v179:InvokeServer("Wenlocktoad", "3")
                        elseif (v335 == 1) then
                            if (v183 == "Human") then
                                v270()
                            elseif (v183 == "Mink") then
                                v277()
                            elseif (v183 == "Fishman") then
                                v285()
                            elseif ((v183 == "Skypiea") or (v183 == "Ghoul")) then
                                v301()
                            elseif (v183 == "Cyborg") then
                                v313()
                            end
                        end
                    end
                end)
                if (not v336) then
                    v199(("V2/V3 retry: " .. tostring(v337)))
                    warn(v175.detail)
                end
                task.wait(0.2)
            end
            v205()
            local v338 = v201()
            local v339 = (v338 and v338:FindFirstChild("K4RaceUpgradeFlight"))
            if v339 then
                v339:Destroy()
            end
            while v175.active do
                v199("V2/V3 finished - returning to Sea 3 for V4")
                K4_QueueRaceUpgradeResume()
                pcall(function()
                    v179:InvokeServer("TravelZou")
                end)
                task.wait(5)
            end
        end
        if K4_RunRaceUpgradePrerequisite() then
            return
        end
        do
            local v340 = tonumber(game.PlaceId)
            if ((v340 ~= 7449423635) and (v340 ~= 100117331123089)) then
                K4_QueueRaceUpgradeResume()
                while true do
                    warn("[K4 startup] Travelling to Sea 3 before initializing V4")
                    pcall(function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                    end)
                    task.wait(5)
                end
            end
            local v341 = (getgenv().UserConfig or getgenv().Config)
            getgenv().Config = {
                Main = Main_Acc,
                Help = Help_Acc,
                ConfigId = tostring((getgenv().K4_CONFIG or "")),
                Team = "Marines",
                ["Farm Fragments"] = { autoraid = false, autotyrant = true },
                Gear = "A-B-B",
                ChangeBestGear = true,
                CaptureGear = false,
                ["V3 Door Distance"] = 150,
                ["V3 File Folder"] = "KaitunV4Sync",
                ["V3 Countdown"] = 6,
                ["V3 File Poll"] = 0.1,
                ["V3 Ready Freshness"] = 2,
                ["V3 Require Different Races"] = true,
                ["V3 Fire Count"] = 1,
                ["V3 Fire Interval"] = 0.05,
                ["V3 Fire Window"] = 6,
                ["V3 Door Open Timeout"] = 10,
                ["V3 Respawn Countdown"] = 2,
                ["Pair Temple Timeout"] = 35,
                ["Pair Sticky Until Trial Complete"] = true,
                ["Pair Release After Trial"] = true,
                ["Pair Requeue Delay"] = 3,
                ["Pair Force Temple Interval"] = 0.8,
                ["Full Moon API"] = "https://memaybeo.kurinian-hub.xyz/api/bloxfruit/fullmoon",
                ["Full Moon Max Candidate Players"] = 8,
                ["Full Moon API Poll"] = 0.5,
                ["Full Moon Max Age Seconds"] = 180,
                ["Full Moon Lead Seconds"] = 360,
                ["Moon Hub Teleport Cooldown"] = 2,
                ["Moon Hub Teleport Timeout"] = 8,
                ["Moon Hub Retry Delay"] = 1.5,
                ["Dead Hub Blacklist Seconds"] = 1800,
                ["Match Fast Poll"] = 0.25,
                ["Match Normal Poll"] = 0.75,
                ["Match Request Timeout"] = 2,
                ["Help Search Full Moon Priority"] = true,
                ["Help Training"] = false,
                ["Allow Sea3 Cross Place"] = true,
                ["Main Leave After Trial"] = true,
                ["Defer Moon Hop During Trial"] = true,
                ["Waiting Main Training"] = true,
                ["Training Hop Low Player"] = true,
                ["Training Hop Fallback Random"] = false,
                ["Training Hop Max Players"] = 8,
                ["Training Server Scan Pages"] = 100,
                ["Training Server Cache Seconds"] = 60,
                ["Training Server Page Delay"] = 0.02,
                ["Tween Speed"] = 185,
                ["Training Move Arrival Distance"] = 120,
                ["Training TP Bypass"] = false,
                ["Training TP Bypass Distance"] = 2000,
                ["Training TP Bypass Attempts"] = 8,
                ["Training No Damage Timeout"] = 60,
                ["Enable Training No Damage Hop"] = false,
                ["Training No Damage Emergency Scan Pages"] = 25,
                ["Training No Damage Hop Watchdog"] = 20,
                ["Training No Damage Random Fallback"] = true,
                ["Lock Help V4 Progress"] = true,
                ["Help Auto Swap Gear"] = true,
                ["Help Gear Swap Interval"] = 2,
                ["Help Reset Delay"] = 0,
                ["Main Gear Claim Retry"] = 0.75,
                ["Training Islands"] = (getgenv().UserConfig and getgenv().UserConfig["Training Islands"])
            }
            do
                local v342 = v341
                if (type(v342) == "table") then
                    for v343, v344 in ipairs({
                        "Hop",
                        "CaptureGear",
                        "Gear",
                        "ChangeBestGear",
                        "ChangeRaceUp",
                        "Webhook",
                        "ConfigName",
                        "ConfigId",
                        "FPS",
                        "Training",
                        "Tier",
                        "TargetTier",
                        "targetTier",
                        "tierLock",
                        "tierlock",
                        "Help Change Race",
                        "Help Change Race Allowed",
                        "Help Change Race Max Rolls",
                        "HopMethod"
                    }) do
                        if ((v342[v344] ~= nil) and (((((getgenv().Config[v344] == nil) or (v344 == "CaptureGear")) or (v344 == "Gear")) or (v344 == "ChangeBestGear")) or (v344 == "Hop"))) then
                            getgenv().Config[v344] = v342[v344]
                        end
                    end
                end
                if (type(getgenv().UserConfig) == "table") then
                    for v345, v346 in ipairs({
                        "Hop",
                        "CaptureGear",
                        "Gear",
                        "ChangeBestGear",
                        "ChangeRaceUp",
                        "Webhook",
                        "ConfigName",
                        "ConfigId",
                        "FPS",
                        "Training",
                        "Tier",
                        "TargetTier",
                        "targetTier",
                        "tierLock",
                        "tierlock",
                        "Help Change Race",
                        "Help Change Race Allowed",
                        "Help Change Race Max Rolls",
                        "HopMethod"
                    }) do
                        if ((getgenv().UserConfig[v346] ~= nil) and (((((getgenv().Config[v346] == nil) or (v346 == "CaptureGear")) or (v346 == "Gear")) or (v346 == "ChangeBestGear")) or (v346 == "Hop"))) then
                            getgenv().Config[v346] = getgenv().UserConfig[v346]
                        end
                    end
                end
                v341 = nil
                if (getgenv().Config and (getgenv().Config.Tier == nil)) then
                    if ((type(getgenv().Config.Webhook) == "table") and (getgenv().Config.Webhook.Tier ~= nil)) then
                        getgenv().Config.Tier = getgenv().Config.Webhook.Tier
                    end
                end
                local v347 = game:GetService("HttpService")
                local v348 = game:GetService("Players")
                local v349 = game:GetService("ReplicatedStorage")
                local v350 = game:GetService("RunService")
                local v351 = game:GetService("Workspace")
                local v352 = game:GetService("VirtualInputManager")
                local v353 = game:GetService("TweenService")
                local v354 = game:GetService("TeleportService")
                do
                    local v357 = tick()
                    local v358 = workspace:WaitForChild("Map")
                    while (not v358:FindFirstChild("Temple of Time")) do
                        local v359 = v349:FindFirstChild("MapStash")
                        local v360 = (v359 and v359:FindFirstChild("Temple of Time"))
                        if v360 then
                            v360.Parent = v358
                            break
                        end
                        assert(((tick() - v357) < 60), "[K4 startup] Temple of Time did not load")
                        task.wait(0.25)
                    end
                    local v361 = v348.LocalPlayer
                    local v362 = v348.LocalPlayer
                    local v363 = v349:WaitForChild("Modules")
                    local v364 = v363:WaitForChild("Net")
                    v364:WaitForChild("RE/RegisterAttack")
                    v364:WaitForChild("RE/RegisterHit")
                    v364:WaitForChild("RE/ShootGunEvent")
                    v349:WaitForChild("Remotes"):WaitForChild("Validator2")
                    local v369 = v349:WaitForChild("Remotes"):WaitForChild("CommF_")
                    _K4SafeActivateButton = function(v370)
                        if ((not v370) or (not v370:IsA("GuiButton"))) then
                            return false
                        end
                        if (type(firesignal) == "function") then
                            local v371 = pcall(function()
                                firesignal(v370.Activated)
                            end)
                            if v371 then
                                return true
                            end
                        end
                        local v376 = pcall(function()
                            local v372 = v370.AbsolutePosition
                            local v373 = v370.AbsoluteSize
                            local v374 = (v372.X + (v373.X / 2))
                            local v375 = (v372.Y + (v373.Y / 2))
                            v352:SendMouseButtonEvent(v374, v375, 0, true, game, 1)
                            task.wait(0.05)
                            v352:SendMouseButtonEvent(v374, v375, 0, false, game, 1)
                        end)
                        return v376
                    end
                    local v377 = (getgenv().Config or {})
                    local v378 = ((v377.Team or getgenv().Team) or "Marines")
                    v378 = tostring(v378)
                    if (v378 == "Pirate") then
                        v378 = "Pirates"
                    end
                    if ((v378 ~= "Marines") and (v378 ~= "Pirates")) then
                        v378 = "Marines"
                    end
                    repeat
                        pcall(function()
                            v369:InvokeServer("SetTeam", v378)
                        end)
                        task.wait(1)
                    until (v361.Team and (v361.Team.Name == v378))
                    if (workspace:GetAttribute("MAP") and (workspace:GetAttribute("MAP") ~= "Sea3")) then
                        v349.Remotes.CommF_:InvokeServer("TravelZou")
                    end
                    if (not isfile("cache_iron.json")) then
                        writefile("cache_iron.json", "{}")
                    end
                    local v379, v380 = pcall(function()
                        return v347:JSONDecode(readfile("cache_iron.json"))
                    end)
                    if (not v379) then
                        v380 = {}
                    end
                    v380[game.JobId] = math.floor(tick())
                    writefile("cache_iron.json", v347:JSONEncode(v380))
                    getgenv().TyrantConfig = (getgenv().TyrantConfig or {})
                    for v381, v382 in pairs({
                        Team = "Marines",
                        Weapon = "Dragon Talon",
                        AutoBuyDragonTalon = true,
                        AutoBuso = true,
                        TweenSpeed = 200,
                        FarmHeight = 18,
                        BossHeight = 25,
                        AttackDistance = 105,
                        AttackDelay = 0.03,
                        BringMobs = true,
                        UseSkillsForVases = true,
                        VaseSkillKeys = { "Z", "X", "C" },
                        VaseSkillHoldTime = 0.12,
                        VaseSkillReleaseDelay = 0.45,
                        VaseSkillRetryDelay = 0.18,
                        VaseTargetTimeout = 45,
                        BringMobInterval = 0.15,
                        BringDistance = 1500,
                        BringTweenSpeed = 200,
                        TyrantScanInterval = 0.15
                    }) do
                        if (getgenv().TyrantConfig[v381] == nil) then
                            getgenv().TyrantConfig[v381] = v382
                        end
                    end
                    getgenv().TyrantConfig.VaseSkillKeys = { "Z", "X", "C" }
                    TyrantConfig = getgenv().TyrantConfig
                    if (not getgenv().Config) then
                        getgenv().Config = {
                            Main = false,
                            Help = false,
                            Team = "Marines",
                            ChangeBestGear = true,
                            CaptureGear = false,
                            Gear = "A-B-B",
                            ["Farm Fragments"] = { autoraid = false, autotyrant = true },
                            ["V3 Door Distance"] = 150,
                            ["V3 File Folder"] = "KaitunV4Sync",
                            ["V3 Countdown"] = 6,
                            ["V3 File Poll"] = 0.1,
                            ["V3 Ready Freshness"] = 2,
                            ["V3 Require Different Races"] = true,
                            ["V3 Fire Count"] = 1,
                            ["V3 Fire Interval"] = 0.05,
                            ["V3 Fire Window"] = 6,
                            ["V3 Door Open Timeout"] = 10,
                            ["V3 Respawn Countdown"] = 2,
                            ["Pair Temple Timeout"] = 35,
                            ["Pair Sticky Until Trial Complete"] = true,
                            ["Pair Release After Trial"] = true,
                            ["Pair Requeue Delay"] = 3,
                            ["Pair Force Temple Interval"] = 0.8,
                            ["Full Moon API"] = (tostring((getgenv().K4_TOOL_API or "http://127.0.0.1:20425")) .. "/fullmoon"),
                            ["Full Moon Max Candidate Players"] = 7,
                            ["Full Moon API Poll"] = 0.5,
                            ["Full Moon Lead Seconds"] = 180,
                            ["Moon Hub Teleport Cooldown"] = 2,
                            ["Moon Hub Teleport Timeout"] = 8,
                            ["Moon Hub Retry Delay"] = 1.5,
                            ["Dead Hub Blacklist Seconds"] = 1800,
                            ["Match Fast Poll"] = 0.25,
                            ["Match Normal Poll"] = 0.75,
                            ["Match Request Timeout"] = 2,
                            ["Help Search Full Moon Priority"] = true,
                            ["Help Training"] = false,
                            ["Allow Sea3 Cross Place"] = true,
                            ["Main Leave After Trial"] = true,
                            ["Defer Moon Hop During Trial"] = true,
                            ["Training Hop Low Player"] = true,
                            ["Training Hop Fallback Random"] = false,
                            ["Training Hop Max Players"] = 8,
                            ["Training Server Scan Pages"] = 100,
                            ["Training Server Cache Seconds"] = 60,
                            ["Training Server Page Delay"] = 0.02,
                            ["Tween Speed"] = 200,
                            ["Training Move Arrival Distance"] = 120,
                            ["Training TP Bypass"] = false,
                            ["Training TP Bypass Distance"] = 2000,
                            ["Training TP Bypass Attempts"] = 8,
                            ["Training No Damage Timeout"] = 60,
                            ["Enable Training No Damage Hop"] = false,
                            ["Training No Damage Emergency Scan Pages"] = 25,
                            ["Training No Damage Hop Watchdog"] = 20,
                            ["Training No Damage Random Fallback"] = true,
                            ["Lock Help V4 Progress"] = true,
                            ["Help Auto Swap Gear"] = true,
                            ["Help Gear Swap Interval"] = 2,
                            ["Help Reset Delay"] = 0,
                            ["Main Gear Claim Retry"] = 0.75,
                            ["Training Islands"] = { "Tiki Outpost", "Ice Cream Island", "Haunted Castle", "Peanut Island" }
                        }
                    end
                    do
                        local v383 = getgenv().Config
                        local v384 = (getgenv().UserConfig or {})
                        if (type(v384["Farm Fragments"]) == "table") then
                            for v385, v386 in pairs(v384["Farm Fragments"]) do
                                v383["Farm Fragments"][v385] = v386
                            end
                        end
                        if (v383["Farm Fragments"].CakePrince == nil) then
                            v383["Farm Fragments"].CakePrince = true
                        end
                        v383["Farm Fragments"].MinFragments = (tonumber(v383["Farm Fragments"].MinFragments) or 5000)
                        local v387 = tostring((v383.HopMethod or "FullMoon")):lower()
                        v383.HopMethod = (((v387 == "nearmoon") and "NearMoon") or "FullMoon")
                        v383.Hop = (((tostring((v383.Hop or "API")):lower() == "roblox") and "Roblox") or "API")
                        v383["Full Moon API"] = (tostring((getgenv().HopApiBaseUrl or "https://memaybeo.kurinian-hub.xyz")):gsub("/+$", "") .. ("/api/bloxfruit/" .. (((v383.HopMethod == "NearMoon") and "nearmoon") or "fullmoon")))
                        do
                            local v388, v389 = loadstring("do\n    local env = getgenv()\n    local old = env.K4FPSBoost\n    if old then\n        old.alive = false\n        for _, connection in ipairs(old.connections or {}) do pcall(function() connection:Disconnect() end) end\n        if old.blur then pcall(function() old.blur:Destroy() end) end\n    end\n    local user = env.UserConfig or {}\n    local enabled = user.BoostFPS ~= false and user[\"FPS Boost\"] ~= false\n    local state = {enabled = enabled, alive = true, connections = {}, processed = 0, dropped = 0}\n    env.K4FPSBoost = state\n    if enabled then\n        local world = game:GetService(\"Workspace\")\n        local lighting = game:GetService(\"Lighting\")\n        local queue, head, tail = {}, 1, 0\n        local whiteMap = user[\"FPS Boost White Map\"] ~= false\n        local white = Color3.fromRGB(235, 235, 235)\n        local protected = setmetatable({}, {__mode = \"k\"})\n        local function keepVisual(object)\n            if protected[object] ~= nil then return protected[object] end\n            local ancestor = object\n            while ancestor and ancestor ~= world and ancestor ~= lighting do\n                local name = string.lower(ancestor.Name)\n                if name:find(\"trial\", 1, true) or name:find(\"temple\", 1, true)\n                    or name:find(\"gear\", 1, true) or name:find(\"lever\", 1, true)\n                    or name:find(\"moon\", 1, true) then\n                    protected[object] = true\n                    return true\n                end\n                ancestor = ancestor.Parent\n            end\n            protected[object] = false\n            return false\n        end\n        local function tune(object)\n            if not object or not object.Parent then return end\n            pcall(function()\n                if object == state.blur or object:IsA(\"Sky\") or keepVisual(object) then return end\n                if object:IsA(\"BasePart\") then\n                    object.CastShadow = false\n                    local map = world:FindFirstChild(\"Map\")\n                    if map and object:IsDescendantOf(map) then\n                        object.Material = Enum.Material.SmoothPlastic\n                        object.MaterialVariant = \"\"\n                        object.Reflectance = 0\n                        if whiteMap then object.Color = white end\n                        if object:IsA(\"MeshPart\") then\n                            object.TextureID = \"\"\n                            object.RenderFidelity = Enum.RenderFidelity.Performance\n                        end\n                    end\n                elseif object:IsA(\"Decal\") or object:IsA(\"Texture\") then\n                    object.Transparency = 1\n                    object.Texture = \"\"\n                elseif object:IsA(\"SpecialMesh\") then\n                    object.TextureId = \"\"\n                elseif object:IsA(\"SurfaceAppearance\") then\n                    object:Destroy()\n                elseif object:IsA(\"Shirt\") then\n                    object.ShirtTemplate = \"\"\n                elseif object:IsA(\"Pants\") then\n                    object.PantsTemplate = \"\"\n                elseif object:IsA(\"ShirtGraphic\") then\n                    object.Graphic = \"\"\n                elseif object:IsA(\"ParticleEmitter\") or object:IsA(\"Trail\") or object:IsA(\"Beam\")\n                    or object:IsA(\"Smoke\") or object:IsA(\"Fire\") or object:IsA(\"Sparkles\")\n                    or object:IsA(\"PostEffect\") or object:IsA(\"Clouds\") or object:IsA(\"Light\") then\n                    object.Enabled = false\n                elseif object:IsA(\"Atmosphere\") then\n                    object.Density = 0\n                    object.Haze = 0\n                    object.Glare = 0\n                elseif object:IsA(\"Explosion\") then\n                    object.Visible = false\n                end\n            end)\n            state.processed = state.processed + 1\n        end\n        local function enqueue(object)\n            if tail - head >= 1000 then state.dropped = state.dropped + 1; return end\n            tail = tail + 1; queue[tail] = object\n        end\n        pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)\n        pcall(function() lighting.GlobalShadows = false; lighting.EnvironmentDiffuseScale = 0; lighting.EnvironmentSpecularScale = 0 end)\n        pcall(function() world.Terrain.WaterWaveSize = 0; world.Terrain.WaterWaveSpeed = 0; world.Terrain.WaterReflectance = 0 end)\n        for _, object in ipairs(lighting:GetChildren()) do tune(object) end\n        -- Optional visual blur; this does not reduce the render resolution.\n        if user[\"Ultra Blur\"] == true then\n            pcall(function()\n                local size = tonumber(user[\"Ultra Blur Size\"]) or 56\n                if size ~= size then size = 56 end\n                local blur = Instance.new(\"BlurEffect\")\n                state.blur = blur\n                blur.Name = \"K4UltraBlur\"\n                blur.Size = math.max(0, math.min(56, size))\n                blur.Enabled = true\n                blur.Parent = lighting\n            end)\n        end\n        table.insert(state.connections, world.DescendantAdded:Connect(enqueue))\n        table.insert(state.connections, lighting.ChildAdded:Connect(enqueue))\n        task.spawn(function()\n            for i, object in ipairs(world:GetDescendants()) do\n                if not state.alive then return end\n                tune(object)\n                if i % 80 == 0 then task.wait(0.03) end\n            end\n        end)\n        task.spawn(function()\n            while state.alive do\n                task.wait(0.1)\n                for _ = 1, 30 do\n                    if head > tail then break end\n                    local object = queue[head]; queue[head] = nil; head = head + 1\n                    tune(object)\n                end\n                if head > tail then head, tail = 1, 0 end\n            end\n        end)\n    end\nend\n    ", "@K4Graphics")
                            if v388 then
                                local v390, v391 = pcall(v388)
                                if (not v390) then
                                    warn(("[K4 FPS Boost] " .. tostring(v391)))
                                end
                            else
                                warn(("[K4 FPS Boost] " .. tostring(v389)))
                            end
                            local v392 = {
                                Ghoul = "B-B-A",
                                Cyborg = "A-B-B",
                                Mink = "B-B-A",
                                Skypiea = "B-B-A",
                                Human = "B-A-A",
                                Fishman = "B-A-A"
                            }
                            if ((type(getgenv().Config.Gear) ~= "string") or (#getgenv().Config.Gear ~= 5)) then
                                getgenv().Config.Gear = "A-B-B"
                            end
                            local v393 = (getgenv().Config.Main == true)
                            local v394 = (getgenv().Config.Help == true)
                            if (v393 and v394) then
                                warn("[K4] Config Main=true and Help=true detected. Help mode has priority; this account will NOT buy/claim/upgrade V4 gear.")
                            end
                            local v395 = (v394 == true)
                            local v396 = ((v393 == true) and (not v395))
                            local v397 = ((v396 and v361.Name) or "")
                            local v399 = {}
                            if v395 then
                                getgenv().Config.Main = false
                                getgenv().Config.Help = true
                                getgenv().Config.ChangeBestGear = false
                                getgenv().Config["Help Training"] = false
                            end
                            local function v400()
                                return ((((v396 == true) and (v395 ~= true)) and (getgenv().Config.Main == true)) and (getgenv().Config.Help ~= true))
                            end
                            getgenv().Config.Team = (((getgenv().Config.Team and ((getgenv().Config.Team == "Marines") or (getgenv().Config.Team == "Pirates"))) and getgenv().Config.Team) or "Marines")
                            thuaaa = function()
                                if v361.Team then
                                    return
                                end
                                if ((getgenv().Team == "Marines") or (not getgenv().Team)) then
                                    v349.Remotes.CommF_:InvokeServer("SetTeam", "Marines")
                                elseif (getgenv().Team == "Pirates") then
                                    v349.Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
                                end
                            end
                            if ((getgenv().Team == "Marines") or (not getgenv().Team)) then
                                thuaaa()
                            elseif (getgenv().Team == "Pirates") then
                                thuaaa()
                            end
                            task.spawn(function()
                                while task.wait(0.2) do
                                    local v401 = v361.Character
                                    local v402 = (v401 and v401:FindFirstChild("HumanoidRootPart"))
                                    if v402 then
                                        local v403 = v402:FindFirstChild("BodyClip")
                                        if (not v403) then
                                            v403 = Instance.new("BodyVelocity")
                                            v403.Name = "BodyClip"
                                            v403.Parent = v402
                                            v403.MaxForce = Vector3.new(100000, 100000, 100000)
                                        end
                                        v403.Velocity = Vector3.new(0, 0, 0)
                                    end
                                end
                            end)
                            do
                                local _K4F = {}
                                if (not v361.Team) then
                                    pcall(function()
                                        v369:InvokeServer("SetTeam", v378)
                                    end)
                                    task.wait(0.5)
                                end
                                if (not v361.Team) then
                                    pcall(function()
                                        for v404, v405 in ipairs(v361.PlayerGui:GetChildren()) do
                                            local v406 = v405:FindFirstChild("ChooseTeam")
                                            local v407 = (v406 and v406:FindFirstChild("Container"))
                                            local v408 = (v407 and v407:FindFirstChild(v378))
                                            local v409 = (v408 and v408:FindFirstChild("Frame"))
                                            local v410 = (v409 and v409:FindFirstChild("TextButton"))
                                            if v410 then
                                                _K4SafeActivateButton(v410)
                                                break
                                            end
                                        end
                                    end)
                                end
                                local v411 = {}
                                repeat
                                    task.wait()
                                until (game:IsLoaded() and v361)
                                local v412 = v361
                                local v413 = (v412.Character or v412.CharacterAdded:Wait())
                                v413:WaitForChild("HumanoidRootPart")
                                v411.eq = function(v415)
                                    local v416 = v412.Character
                                    local v417 = (v416 and v416:FindFirstChildOfClass("Humanoid"))
                                    local v418 = v412:FindFirstChild("Backpack")
                                    if (not (((v416 and v417) and (v417.Health > 0)) and v418)) then
                                        return false
                                    end
                                    local v419 = v416:FindFirstChildWhichIsA("Tool")
                                    if (v419 and (v419.ToolTip == ((_G.USESWORD and "Sword") or "Melee"))) then
                                        return true
                                    end
                                    if (os.clock() < (v415._NextEquip or 0)) then
                                        return false
                                    end
                                    v415._NextEquip = (os.clock() + 0.25)
                                    for v420, v421 in pairs(v418:GetChildren()) do
                                        if ((v421:IsA("Tool") and (v421.ToolTip == "Melee")) and (not _G.USESWORD)) then
                                            local v422 = pcall(function()
                                                v417:EquipTool(v421)
                                            end)
                                            if v422 then
                                                return true
                                            end
                                        elseif ((v421:IsA("Tool") and (v421.ToolTip == "Sword")) and _G.USESWORD) then
                                            local v423 = pcall(function()
                                                v417:EquipTool(v421)
                                            end)
                                            if v423 then
                                                return true
                                            end
                                        end
                                    end
                                    return false
                                end
                                v411.haki = function(v424)
                                    local v425 = v412.Character
                                    local v426 = (v425 and v425:FindFirstChildOfClass("Humanoid"))
                                    if (not ((v425 and v426) and (v426.Health > 0))) then
                                        return false
                                    end
                                    if (not v425:FindFirstChild("HasBuso")) then
                                        if (v424._BusoBusy or (os.clock() < (v424._NextBuso or 0))) then
                                            return false
                                        end
                                        v424._NextBuso = (os.clock() + 2)
                                        v424._BusoBusy = true
                                        task.spawn(function()
                                            pcall(function()
                                                v349.Remotes.CommF_:InvokeServer("Buso")
                                            end)
                                            v424._BusoBusy = false
                                        end)
                                    end
                                    return true
                                end
                                local v427 = nil
                                local v428 = nil
                                local v429 = nil
                                local v430 = { Busy = false, NextTry = 0 }
                                getgenv().K4_SubmergedTravel = v430
                                K4_IsSubmergedPosition = function(v431)
                                    return ((v431.Y < (-500)) and ((v431 - Vector3.new(11256, (-2138), 9888)).Magnitude < 6500))
                                end
                                K4_SubmergedRoute = function(v432, v433)
                                    if v430.Busy then
                                        return nil
                                    end
                                    local v434 = ((v412:GetAttribute("ExactLocation") == "Submerged Island") or K4_IsSubmergedPosition(v433.Position))
                                    local v435 = K4_IsSubmergedPosition(v432.Position)
                                    if (v434 == v435) then
                                        return v432
                                    end
                                    local v436 = (v434 and (not v435))
                                    local v437 = ((v436 and CFrame.new(11426, (-2155), 9732)) or CFrame.new((-16269.1016), 29.5177539, 1372.3204))
                                    v430.Destination = v432.Position
                                    if ((v433.Position - v437.Position).Magnitude > 15) then
                                        v430.Stage = ((v436 and "Moving to Submerged submarine") or "Moving to Tiki submarine")
                                        return v437
                                    end
                                    if v427 then
                                        pcall(function()
                                            v427:Cancel()
                                        end)
                                    end
                                    if (v430.Busy or (os.clock() < v430.NextTry)) then
                                        return nil
                                    end
                                    v430.Busy = true
                                    v430.NextTry = (os.clock() + 5)
                                    v430.Stage = ((v436 and "Leaving Submerged Island") or "Entering Submerged Island")
                                    task.spawn(function()
                                        local v440, v441 = pcall(function()
                                            local v438 = ((v436 and "RF/SubmarineTransportation") or "RF/SubmarineWorkerSpeak")
                                            local v439 = v364:FindFirstChild(v438)
                                            if (not v439) then
                                                error(("Submarine remote unavailable: " .. v438))
                                            end
                                            if v436 then
                                                return v439:InvokeServer("InitiateTeleport", "Tiki Outpost")
                                            end
                                            return v439:InvokeServer("TravelToSubmergedIsland")
                                        end)
                                        v430.LastResult = tostring(v441)
                                        if v440 then
                                            local v442 = os.clock()
                                            repeat
                                                task.wait(0.25)
                                                local v443 = v412.Character
                                                local v444 = (v443 and v443:FindFirstChild("HumanoidRootPart"))
                                                if v444 then
                                                    local v445 = ((v412:GetAttribute("ExactLocation") == "Submerged Island") or K4_IsSubmergedPosition(v444.Position))
                                                    if (v445 == v435) then
                                                        v430.Stage = "Submarine travel confirmed"
                                                        break
                                                    end
                                                end
                                            until ((os.clock() - v442) >= 10)
                                            if (v430.Stage ~= "Submarine travel confirmed") then
                                                v430.Stage = "Submarine arrival not confirmed; retrying"
                                            end
                                        else
                                            v430.Stage = "Submarine request failed"
                                            v430.LastError = tostring(v441)
                                        end
                                        v430.Busy = false
                                    end)
                                    return nil
                                end
                                v411.topos = function(v446, v447, v448, v449)
                                    if (typeof(v447) ~= "CFrame") then
                                        return nil
                                    end
                                    local v450 = v412.Character
                                    local v451 = (v450 and v450:FindFirstChild("HumanoidRootPart"))
                                    local v452 = (v450 and v450:FindFirstChildOfClass("Humanoid"))
                                    if (not (v451 and v452)) then
                                        return nil
                                    end
                                    v447 = K4_SubmergedRoute(v447, v451)
                                    if (not v447) then
                                        return nil
                                    end
                                    if (not v448) then
                                        pcall(function()
                                            v452.Sit = false
                                        end)
                                    end
                                    if (v427 and v428) then
                                        local v453 = false
                                        pcall(function()
                                            v453 = (v427.PlaybackState == Enum.PlaybackState.Playing)
                                        end)
                                        if (((v453 and (v429 == v451)) and (v451.Parent ~= nil)) and ((v428.Position - v447.Position).Magnitude <= 10)) then
                                            return v427
                                        end
                                    end
                                    if v427 then
                                        pcall(function()
                                            v427:Cancel()
                                        end)
                                        pcall(function()
                                            v427:Destroy()
                                        end)
                                        v427 = nil
                                        v428 = nil
                                        v429 = nil
                                    end
                                    local v454 = (v451.Position - v447.Position).Magnitude
                                    local v455 = getgenv().VapeHunterTweenSpeed(math.max(50, ((tonumber(v449) or tonumber(getgenv().Config["Tween Speed"])) or 190)))
                                    local v456 = math.clamp((v454 / v455), 0.05, 600)
                                    local v457 = v353:Create(v451, TweenInfo.new(v456, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), { CFrame = v447 })
                                    v427 = v457
                                    v428 = v447
                                    v429 = v451
                                    local v458
                                    v458 = v457.Completed:Connect(function()
                                        if v458 then
                                            v458:Disconnect()
                                        end
                                        if (v427 == v457) then
                                            v427 = nil
                                            v428 = nil
                                            v429 = nil
                                        end
                                        pcall(function()
                                            v457:Destroy()
                                        end)
                                    end)
                                    v457:Play()
                                    return v457
                                end
                                K4_CancelTrialMovement = function()
                                    if v427 then
                                        pcall(function()
                                            v427:Cancel()
                                        end)
                                        pcall(function()
                                            v427:Destroy()
                                        end)
                                        v427 = nil
                                        v428 = nil
                                        v429 = nil
                                    end
                                    local v459 = v348.LocalPlayer.Character
                                    local v460 = (v459 and v459:FindFirstChild("HumanoidRootPart"))
                                    if v460 then
                                        pcall(function()
                                            v460.AssemblyLinearVelocity = Vector3.zero
                                            v460.AssemblyAngularVelocity = Vector3.zero
                                        end)
                                    end
                                end
                                _G.K4TrainingTravel = (_G.K4TrainingTravel or { active = false, target = nil, startedAt = 0 })
                                K4_SmoothTrainingTravel = function(v461, v462, v463)
                                    if (typeof(v461) ~= "CFrame") then
                                        return false, "invalid_target"
                                    end
                                    local v464 = _G.K4TrainingTravel
                                    local v465 = 0
                                    v464.active = true
                                    v464.target = v461
                                    v464.startedAt = tick()
                                    while v464.active do
                                        if (type(v463) == "function") then
                                            local v466, v467 = pcall(v463)
                                            if (v466 and (v467 == true)) then
                                                v464.active = false
                                                pcall(K4_CancelTrialMovement)
                                                return false, "stopped"
                                            end
                                        end
                                        local v468 = v348.LocalPlayer.Character
                                        local v469 = (v468 and v468:FindFirstChildOfClass("Humanoid"))
                                        local v470 = (v468 and v468:FindFirstChild("HumanoidRootPart"))
                                        if (((not v469) or (not v470)) or (v469.Health <= 0)) then
                                            v464.active = false
                                            pcall(K4_CancelTrialMovement)
                                            return false, "dead"
                                        end
                                        pcall(function()
                                            v411:topos(v461, false)
                                        end)
                                        local v471 = (v470.Position - v461.Position).Magnitude
                                        if (v471 <= 15) then
                                            v464.active = false
                                            return true, "arrived"
                                        end
                                        if (((tick() - v465) >= 1.2) and (type(status) == "function")) then
                                            status((tostring((v462 or "Account")) .. (" flying to training | " .. (tostring(math.floor(v471)) .. " studs"))))
                                            v465 = tick()
                                        end
                                        task.wait()
                                    end
                                    return false, "cancelled"
                                end
                                local v472 = { Built = false, Spawns = {}, Locations = {} }
                                function _K4F.v473(v474)
                                    if (not v474) then
                                        return nil
                                    end
                                    if v474:IsA("BasePart") then
                                        return v474.Position
                                    end
                                    if v474:IsA("Attachment") then
                                        return v474.WorldPosition
                                    end
                                    local v475, v476 = pcall(function()
                                        return v474:GetPivot()
                                    end)
                                    if (v475 and (typeof(v476) == "CFrame")) then
                                        return v476.Position
                                    end
                                    local v477, v478 = pcall(function()
                                        return v474:GetModelCFrame()
                                    end)
                                    if (v477 and (typeof(v478) == "CFrame")) then
                                        return v478.Position
                                    end
                                    return nil
                                end
                                function _K4F.v479()
                                    return (getgenv().Config["Training TP Bypass"] == false)
                                end
                                function _K4F.v480(v481)
                                    if (v472.Built and (not v481)) then
                                        return true
                                    end
                                    local v482 = workspace:FindFirstChild("_WorldOrigin")
                                    local v483 = (v482 and v482:FindFirstChild("PlayerSpawns"))
                                    local v484 = (v482 and v482:FindFirstChild("Locations"))
                                    if ((not v483) or (not v484)) then
                                        return false
                                    end
                                    local v485 = {}
                                    local v486 = {}
                                    for v487, v488 in ipairs(v483:GetChildren()) do
                                        local v489 = v488:GetChildren()
                                        if (#v489 == 0) then
                                            v489 = { v488 }
                                        end
                                        for v490, v491 in ipairs(v489) do
                                            local v492 = _K4F.v473(v491)
                                            if v492 then
                                                v485[(#v485 + 1)] = { Name = v491.Name, Position = v492 }
                                            end
                                        end
                                    end
                                    for v493, v494 in ipairs(v484:GetChildren()) do
                                        local v495 = _K4F.v473(v494)
                                        if v495 then
                                            local v496 = nil
                                            pcall(function()
                                                local v497 = v494:FindFirstChild("Mesh")
                                                if (v497 and v497.Scale) then
                                                    v496 = ((v497.Scale.X * v494.Size.X) / 2)
                                                elseif v494:IsA("BasePart") then
                                                    v496 = (v494.Size.X / 2)
                                                end
                                            end)
                                            v496 = math.max((tonumber(v496) or 0), 1)
                                            v486[(#v486 + 1)] = { Name = v494.Name, Position = v495, Radius = v496 }
                                        end
                                    end
                                    if ((#v485 == 0) or (#v486 == 0)) then
                                        return false
                                    end
                                    local v498 = {}
                                    for v499, v500 in ipairs(v485) do
                                        local v501 = false
                                        for v502, v503 in ipairs(v486) do
                                            if ((v500.Position - v503.Position).Magnitude <= v503.Radius) then
                                                v501 = true
                                                break
                                            end
                                        end
                                        if v501 then
                                            v498[(#v498 + 1)] = v500
                                        end
                                    end
                                    if (#v498 == 0) then
                                        return false
                                    end
                                    v472.Spawns = v498
                                    v472.Locations = v486
                                    v472.Built = true
                                    return true
                                end
                                task.spawn(function()
                                    if (not v362.Character) then
                                        v362.CharacterAdded:Wait()
                                    end
                                    for v504 = 1, 40 do
                                        if _K4F.v480(true) then
                                            return
                                        end
                                        task.wait(0.5)
                                    end
                                end)
                                function _K4F.v505(v506)
                                    if (not v506) then
                                        return
                                    end
                                    local v507 = v506:FindFirstChild("LastSpawnPoint")
                                    if v507 then
                                        pcall(function()
                                            v507.Disabled = false
                                        end)
                                    end
                                end
                                function _K4F.v508(v509, v510)
                                    if ((typeof(v509) ~= "CFrame") or _K4F.v479()) then
                                        return false, "blocked"
                                    end
                                    local v511 = v362.Character
                                    local v512 = (v511 and v511:FindFirstChildOfClass("Humanoid"))
                                    local v513 = (v511 and v511:FindFirstChild("HumanoidRootPart"))
                                    if ((((not v511) or (not v512)) or (not v513)) or (v512.Health <= 0)) then
                                        return false, "character"
                                    end
                                    local v514 = v509.Position
                                    local v515 = (v513.Position - v514).Magnitude
                                    local v516 = math.max(500, (tonumber(getgenv().Config["Training TP Bypass Distance"]) or 2000))
                                    if (v515 < v516) then
                                        return false, "near"
                                    end
                                    if (type(v510) == "function") then
                                        local v517, v518 = pcall(v510)
                                        if (v517 and (v518 == true)) then
                                            return false, "stopped"
                                        end
                                    end
                                    if (not _K4F.v480(false)) then
                                        return false, "spawn_data"
                                    end
                                    local v519 = {}
                                    for v520, v521 in ipairs(v472.Spawns) do
                                        local v522 = (v521.Position - v514).Magnitude
                                        local v523 = (v521.Position - v513.Position).Magnitude
                                        if (((v522 + 300) < v515) and (v523 >= 300)) then
                                            v519[(#v519 + 1)] = { Name = v521.Name, Position = v521.Position, DistanceToTarget = v522 }
                                        end
                                    end
                                    if (#v519 == 0) then
                                        return false, "no_spawn"
                                    end
                                    table.sort(v519, function(v524, v525)
                                        if (v524.DistanceToTarget == v525.DistanceToTarget) then
                                            return (v524.Name < v525.Name)
                                        end
                                        return (v524.DistanceToTarget < v525.DistanceToTarget)
                                    end)
                                    local v526 = v511:FindFirstChild("LastSpawnPoint")
                                    if v526 then
                                        pcall(function()
                                            v526.Disabled = true
                                        end)
                                    end
                                    pcall(K4_CancelTrialMovement)
                                    for v527, v528 in ipairs(v519) do
                                        if (type(v510) == "function") then
                                            local v529, v530 = pcall(v510)
                                            if (v529 and (v530 == true)) then
                                                _K4F.v505(v511)
                                                return false, "stopped"
                                            end
                                        end
                                        local v531 = pcall(function()
                                            v369:InvokeServer("SetLastSpawnPoint", v528.Name)
                                        end)
                                        if v531 then
                                            local v532 = false
                                            local v533 = (tick() + 1.2)
                                            repeat
                                                local v534 = v362:FindFirstChild("Data")
                                                local v535 = (v534 and v534:FindFirstChild("LastSpawnPoint"))
                                                if (v535 and (tostring(v535.Value) == tostring(v528.Name))) then
                                                    v532 = true
                                                    break
                                                end
                                                task.wait(0.05)
                                            until (tick() >= v533)
                                            if v532 then
                                                if ((type(K4_MainScriptResetBlocked) == "function") and K4_MainScriptResetBlocked()) then
                                                    return false, "trial_active"
                                                end
                                                pcall(function()
                                                    v512.Health = 0
                                                end)
                                                local v536 = v511
                                                local v537 = (tick() + 8)
                                                local v538 = nil
                                                local v539 = nil
                                                local v540 = nil
                                                repeat
                                                    task.wait(0.1)
                                                    v538 = v362.Character
                                                    v539 = (v538 and v538:FindFirstChildOfClass("Humanoid"))
                                                    v540 = (v538 and v538:FindFirstChild("HumanoidRootPart"))
                                                until (((((v538 and (v538 ~= v536)) and v539) and (v539.Health > 0)) and v540) or (tick() >= v537))
                                                task.wait(0.3)
                                                _K4F.v505(v538)
                                                if ((v540 and v539) and (v539.Health > 0)) then
                                                    local v541 = (v540.Position - v514).Magnitude
                                                    if (v541 < (v515 - 200)) then
                                                        return true, "bypassed"
                                                    end
                                                end
                                                return false, "respawn_no_progress"
                                            end
                                        end
                                    end
                                    _K4F.v505(v511)
                                    return false, "set_spawn_failed"
                                end
                                K4_TrainingTPBypassToIsland = function(v542, v543, v544, v545)
                                    if (typeof(v542) ~= "CFrame") then
                                        return false, "invalid_target"
                                    end
                                    if (getgenv().Config["Training TP Bypass"] == false) then
                                        return false, "disabled"
                                    end
                                    if _K4F.v479() then
                                        return false, "blocked"
                                    end
                                    local v546 = math.clamp(math.floor((tonumber(getgenv().Config["Training TP Bypass Attempts"]) or 8)), 1, 8)
                                    local v547 = false
                                    local v548 = "not_needed"
                                    for v549 = 1, v546 do
                                        local v550 = v362.Character
                                        local v551 = (v550 and v550:FindFirstChildOfClass("Humanoid"))
                                        local v552 = (v550 and v550:FindFirstChild("HumanoidRootPart"))
                                        if (((not v551) or (not v552)) or (v551.Health <= 0)) then
                                            return v547, "character"
                                        end
                                        local v553 = (v552.Position - v542.Position).Magnitude
                                        local v554 = math.max(500, (tonumber(getgenv().Config["Training TP Bypass Distance"]) or 2000))
                                        if (v553 < v554) then
                                            break
                                        end
                                        if (type(status) == "function") then
                                            status((tostring((v544 or "Account")) .. (" TP Bypass to [" .. (tostring((v543 or "Training")) .. ("] | " .. (tostring(math.floor(v553)) .. " studs"))))))
                                        end
                                        local v555, v556 = _K4F.v508(v542, v545)
                                        v548 = (v556 or v548)
                                        if (not v555) then
                                            break
                                        end
                                        v547 = true
                                        if (type(v545) == "function") then
                                            local v557, v558 = pcall(v545)
                                            if (v557 and (v558 == true)) then
                                                return v547, "stopped"
                                            end
                                        end
                                    end
                                    return v547, v548
                                end
                                v411.join = function(v559, v560)
                                    v560 = (((v560 and ((v560 == "Marines") or (v560 == "Pirates"))) and v560) or "Marines")
                                    pcall(function()
                                        v369:InvokeServer("SetTeam", v560)
                                    end)
                                    if (v412.Team and (v412.Team.Name == v560)) then
                                        return true
                                    end
                                    pcall(function()
                                        for v561, v562 in ipairs(v412.PlayerGui:GetChildren()) do
                                            local v563 = v562:FindFirstChild("ChooseTeam")
                                            local v564 = (v563 and v563:FindFirstChild("Container"))
                                            local v565 = (v564 and v564:FindFirstChild(v560))
                                            local v566 = (v565 and v565:FindFirstChild("Frame"))
                                            local v567 = (v566 and v566:FindFirstChild("TextButton"))
                                            if v567 then
                                                _K4SafeActivateButton(v567)
                                                break
                                            end
                                        end
                                    end)
                                    return ((v412.Team and (v412.Team.Name == v560)) or false)
                                end
                                v411.tele = function(v568, v569)
                                    if v569 then
                                        v349.__ServerBrowser:InvokeServer("teleport", v569)
                                    else
                                        v349.__ServerBrowser:InvokeServer("teleport", game.JobId)
                                    end
                                end
                                v411.noclip = function(v570, v571)
                                    local v572 = (((type(v571) == "function") and v571) or loadstring(v571))
                                    if (type(v572) ~= "function") then
                                        return
                                    end
                                    task.spawn(function()
                                        while task.wait(0.2) do
                                            if (v572() and (not v412.Character.Humanoid.Sit)) then
                                                if (not v412.Character.HumanoidRootPart:FindFirstChild("BodyClip")) then
                                                    local v573 = Instance.new("BodyVelocity")
                                                    v573.Name = "BodyClip"
                                                    v573.Parent = v412.Character.HumanoidRootPart
                                                    v573.MaxForce = Vector3.new(100000, 100000, 100000)
                                                    v573.Velocity = Vector3.new(0, 0, 0)
                                                end
                                                for v574, v575 in pairs(v412.Character:GetDescendants()) do
                                                    if v575:IsA("BasePart") then
                                                        v575.CanCollide = false
                                                    end
                                                end
                                            else
                                                pcall(function()
                                                    v412.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
                                                end)
                                            end
                                        end
                                    end)
                                end
                                v411.getdis = function(v576, v577, v578)
                                    v578 = (v578 or v412.Character.HumanoidRootPart.CFrame)
                                    return (v577.Position - v578.Position).Magnitude
                                end
                                v412.Idled:connect(function()
                                    game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                                    task.wait(1)
                                    game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                                end)
                                local v580 = {}
                                getdoor = function(v581)
                                    v581 = (v581 or v412.Data.Race.Value)
                                    local v582 = v580[v581]
                                    if (v582 and v582.Parent) then
                                        return v582
                                    end
                                    local v583 = workspace:FindFirstChild("Map")
                                    local v584 = (v583 and v583:FindFirstChild("Temple of Time"))
                                    if (not v584) then
                                        return nil
                                    end
                                    local v585 = v584:FindFirstChild((v581 .. "Corridor"))
                                    if (not v585) then
                                        return nil
                                    end
                                    local v586 = v585:FindFirstChild("Door")
                                    if (not v586) then
                                        return nil
                                    end
                                    local v587 = v586:FindFirstChild("Entrance")
                                    if v587 then
                                        v580[v581] = v587
                                    end
                                    return v587
                                end
                                getdis = function(...)
                                    return v411:getdis(...)
                                end
                                local v590 = function(v588)
                                    pcall(function()
                                        local v589 = ((v396 and (type(K4_MainScriptResetBlocked) == "function")) and K4_MainScriptResetBlocked())
                                        if (((not v589) and (getdis(v588) > 2500)) and (getdis(CFrame.new(28310.0234, 14895.1123, 109.456741)) < 1500)) then
                                            v412.Character.Humanoid.Health = 0
                                        end
                                    end)
                                    return v411:topos(v588)
                                end
                                local v591 = {
                                    CFrame.new(28692.3477, 14887.5605, (-53.7669983)),
                                    CFrame.new(28782.7246, 14898.9902, (-59.6069946)),
                                    CFrame.new(28700.875, 14888.2598, (-154.110992)),
                                    CFrame.new(28795.7715, 14888.2598, (-112.917999)),
                                    CFrame.new(28658.4551, 14888.2598, (-121.372009)),
                                    CFrame.new(28742.4688, 14887.5596, (-18.2120056))
                                }
                                isplrshouldkill = function(v592)
                                    if (((v592.Character and v592.Character:FindFirstChild("HumanoidRootPart")) and v592.Character:FindFirstChild("Humanoid")) and (v592.Character.Humanoid.Health > 0)) then
                                        for v593, v594 in pairs(v591) do
                                            if (getdis(v592.Character.HumanoidRootPart.CFrame, v594) < 5) then
                                                return true
                                            end
                                        end
                                    end
                                    return false
                                end
                                local v595 = {
                                    Human = "Last Resort",
                                    Mink = "Agility",
                                    Fishman = "Water Body",
                                    Skypiea = "Heavenly Blood",
                                    Ghoul = "Heightened Senses",
                                    Cyborg = "Energy Core"
                                }
                                local v596 = {
                                    Human = workspace._WorldOrigin.Locations:WaitForChild("Trial of Strength"),
                                    Mink = workspace._WorldOrigin.Locations:WaitForChild("Trial of Speed"),
                                    Fishman = workspace._WorldOrigin.Locations:WaitForChild("Trial of Water"),
                                    Skypiea = workspace._WorldOrigin.Locations:WaitForChild("Trial of the King"),
                                    Ghoul = workspace._WorldOrigin.Locations:WaitForChild("Trial of Carnage"),
                                    Cyborg = workspace._WorldOrigin.Locations:WaitForChild("Trial of the Machine")
                                }
                                _G.playersinserver = {}
                                updateplayers = function()
                                    if (not _G.playersinserver) then
                                        _G.playersinserver = {}
                                    end
                                    local v597 = {}
                                    for v598, v599 in pairs(game.Players:GetChildren()) do
                                        v597[v599] = {
                                            Race = v599.Data.Race.Value,
                                            Door = (function()
                                            local v600, v601 = pcall(function()
                                                return workspace.Map["Temple of Time"]:WaitForChild((v599.Data.Race.Value .. "Corridor")):WaitForChild("Door"):WaitForChild("Entrance")
                                            end)
                                            if v600 then
                                                return v601
                                            end
                                            return nil
                                        end)()
                                        }
                                    end
                                    _G.playersinserver = v597
                                end
                                isshouldturnonability = function()
                                    local v602 = 0
                                    for v603, v604 in pairs(workspace.Characters:GetChildren()) do
                                        if ((v604.Name ~= v412.Name) and v604:FindFirstChild("HumanoidRootPart")) then
                                            local v605 = game.Players:FindFirstChild(v604.Name).Data.Race.Value
                                            local v606 = workspace.Map["Temple of Time"]:FindFirstChild((v605 .. "Corridor"))
                                            local v607 = (v606 and v606:FindFirstChild("Door"))
                                            v607 = (v607 and v607:FindFirstChild("Entrance"))
                                            local v608 = v595[v605]
                                            if ((v607 and v608) and (getdis(v607.CFrame, v604.HumanoidRootPart.CFrame) < 10)) then
                                                if v604.HumanoidRootPart:FindFirstChild(v608) then
                                                    v602 = (v602 + 1)
                                                end
                                            end
                                        end
                                    end
                                    return (v602 >= 2)
                                end
                                local v609 = false
                                talktoonggianaodo = function()
                                    if v609 then
                                        return
                                    end
                                    v609 = true
                                    repeat
                                        task.wait()
                                        v349.Remotes.CommF_:InvokeServer("RaceV4Progress", "Teleport")
                                        v590(CFrame.new(3028, 2281, (-7325)))
                                    until (v411:getdis(CFrame.new(28286.35546875, 14896.5078125, 102.62469482422)) <= 15)
                                    v609 = false
                                end
                                getBlueGear = function()
                                    if (not game.Workspace.Map:FindFirstChild("MysticIsland")) then
                                        return nil
                                    end
                                    for v610, v611 in pairs(game.Workspace.Map.MysticIsland:GetChildren()) do
                                        if (v611:IsA("MeshPart") and (v611.MeshId == "rbxassetid://10153114969")) then
                                            return v611
                                        end
                                    end
                                end
                                isnight = function()
                                    local v612 = game.Lighting.ClockTime
                                    if ((v612 >= 16) or (v612 < 5)) then
                                        return true
                                    end
                                    return false
                                end
                                K4_TryTrialKillAura = function(v613)
                                    if ((not v613) or (not v613.Parent)) then
                                        return false
                                    end
                                    local v614 = v613:FindFirstChild("HumanoidRootPart")
                                    local v615 = v613:FindFirstChild("Humanoid")
                                    if ((((not v614) or (not v614.Parent)) or (not v615)) or (v615.Health <= 0)) then
                                        return false
                                    end
                                    if (type(isnetworkowner) ~= "function") then
                                        return false
                                    end
                                    local v616, v617 = pcall(isnetworkowner, v614)
                                    if ((not v616) or (v617 ~= true)) then
                                        return false
                                    end
                                    return pcall(function()
                                        v614.CanCollide = false
                                        v615.Health = 0
                                    end)
                                end
                                isfullmoon = function()
                                    if (type(_K4MoonHubFullMoonNight) == "function") then
                                        return _K4MoonHubFullMoonNight()
                                    end
                                    return (game:GetService("Lighting"):GetAttribute("MoonPhase") == 5)
                                end
                                v411:noclip("return true")
                                getmob1 = function(v618)
                                    local v619 = {}
                                    for v620, v621 in pairs(workspace.Enemies:GetChildren()) do
                                        if (((v621:FindFirstChild("HumanoidRootPart") and v621:FindFirstChild("Humanoid")) and (v621.Humanoid.Health > 0)) and (getdis(v621.HumanoidRootPart.CFrame, v618) < 1000)) then
                                            table.insert(v619, v621)
                                        end
                                    end
                                    return v619
                                end
                                checkmob_ = function(v622)
                                    return (((v622 and v622:FindFirstChild("HumanoidRootPart")) and v622:FindFirstChild("Humanoid")) and (v622.Humanoid.Health > 0))
                                end
                                noideaforname = function(v623)
                                    if v399[v623.Name] then
                                        return false
                                    end
                                    return true
                                end
                                getplayers = function(v624)
                                    local v625 = {}
                                    for v626, v627 in pairs(game.Players:GetPlayers()) do
                                        if ((v627 ~= v412) and v627.Character) then
                                            if v624 then
                                                if ((v627.Character:FindFirstChild("Humanoid") and v627.Character:FindFirstChild("HumanoidRootPart")) and (v627.Character.Humanoid.Health > 0)) then
                                                    for v628, v629 in pairs(v591) do
                                                        if (getdis(v627.Character.HumanoidRootPart.CFrame, v629) < 10) then
                                                            v625[v627.Character] = true
                                                        end
                                                    end
                                                end
                                            else
                                                if ((v627 ~= game.Players:FindFirstChild(v397)) and noideaforname(v627)) then
                                                    if ((v627.Character:FindFirstChild("Humanoid") and v627.Character:FindFirstChild("HumanoidRootPart")) and (v627.Character.Humanoid.Health > 0)) then
                                                        for v630, v631 in pairs(v591) do
                                                            if (getdis(v627.Character.HumanoidRootPart.CFrame, v631) < 10) then
                                                                v625[v627.Character] = true
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                    return v625
                                end
                                checkbackpack = function(v632)
                                    return (v412.Backpack:FindFirstChild(v632) or v412.Character:FindFirstChild(v632))
                                end
                                local v633 = { at = 0, data = nil, busy = false }
                                local v634 = 0.75
                                function _K4F.v635()
                                    local v636 = "Unknown"
                                    pcall(function()
                                        v636 = tostring(v348.LocalPlayer.Data.Race.Value)
                                    end)
                                    return v636
                                end
                                function _K4F.v637(v638)
                                    if v395 then
                                        return false
                                    end
                                    if (((tostring(v638) ~= "Check") and (type(v400) == "function")) and (not v400())) then
                                        return false
                                    end
                                    return v369:InvokeServer("UpgradeRace", v638)
                                end
                                function _K4F.v639()
                                    v633.at = 0
                                    v633.data = nil
                                end
                                function _K4F.v640()
                                    local v641, v642 = pcall(function()
                                        return v369:InvokeServer("RaceV4Progress", "Check")
                                    end)
                                    if v641 then
                                        return tonumber(v642)
                                    end
                                    return nil
                                end
                                _G.K4TempleProbe = (_G.K4TempleProbe or {})
                                do
                                    local v643 = _G.K4TempleProbe
                                    v643.job = tostring((v643.job or ""))
                                    v643.tries = (tonumber(v643.tries) or 0)
                                    v643.firstAt = (tonumber(v643.firstAt) or 0)
                                    v643.lastAt = (tonumber(v643.lastAt) or 0)
                                    v643.lastRet = tostring((v643.lastRet or ""))
                                    v643.lastType = tostring((v643.lastType or ""))
                                    v643.progress = (tonumber(v643.progress) or (-1))
                                    v643.dist = (tonumber(v643.dist) or (-1))
                                    v643.y = (tonumber(v643.y) or 0)
                                end
                                function _K4F.v644(v645)
                                    local v646 = typeof(v645)
                                    if (v646 == "table") then
                                        local v647, v648 = pcall(function()
                                            return v347:JSONEncode(v645)
                                        end)
                                        return ((v647 and string.sub(tostring(v648), 1, 160)) or "table")
                                    end
                                    return string.sub(tostring(v645), 1, 160)
                                end
                                _K4TempleTeleportProbe = function(v649, v650)
                                    local v651 = _G.K4TempleProbe
                                    local v652 = tostring(game.JobId)
                                    if (v651.job ~= v652) then
                                        v651.job = v652
                                        v651.tries = 0
                                        v651.firstAt = 0
                                        v651.lastRet = ""
                                        v651.lastType = ""
                                        v651.progress = (-1)
                                    end
                                    v651.tries = (v651.tries + 1)
                                    if (v651.firstAt <= 0) then
                                        v651.firstAt = tick()
                                    end
                                    v651.lastAt = tick()
                                    v651.dist = (math.floor(((tonumber(v649) or (-1)) * 10)) / 10)
                                    v651.y = math.floor((tonumber(v650) or 0))
                                    if ((v651.tries == 1) or ((v651.tries % 10) == 0)) then
                                        v651.progress = (tonumber(_K4F.v640()) or (-1))
                                    end
                                    local v653, v654 = pcall(function()
                                        return v369:InvokeServer("RaceV4Progress", "Teleport")
                                    end)
                                    v651.lastType = ((v653 and typeof(v654)) or "pcall_error")
                                    v651.lastRet = _K4F.v644(v654)
                                    return v653, v654
                                end
                                _G.K4TempleEnter = (_G.K4TempleEnter or {})
                                local v655 = Vector3.new(28310.0234, 14895.1123, 109.456741)
                                local v656 = { "teleport", "prompt", "teleport" }
                                function _K4F.v657(v658)
                                    return ((v658.Position.Y >= 14000) and ((v658.Position - v655).Magnitude < 3000))
                                end
                                function _K4F.v659(v660, v661)
                                    if (type(fireproximityprompt) ~= "function") then
                                        return false, "no_fireproximityprompt"
                                    end
                                    local v662 = OverlapParams.new()
                                    v662.FilterType = Enum.RaycastFilterType.Exclude
                                    v662.FilterDescendantsInstances = { v661 }
                                    local v663, v664
                                    for v665, v666 in ipairs(workspace:GetPartBoundsInRadius(v660.Position, 25, v662)) do
                                        local v667 = v666:FindFirstChildWhichIsA("ProximityPrompt", true)
                                        if ((v667 and v667.Enabled) and (v667.ActionText == "Interact")) then
                                            local v668 = (v666.Position - v660.Position).Magnitude
                                            if ((not v664) or (v668 < v664)) then
                                                v663, v664 = v667, v668
                                            end
                                        end
                                    end
                                    if (not v663) then
                                        return false, "no_prompt"
                                    end
                                    pcall(fireproximityprompt, v663)
                                    return true, v663:GetFullName()
                                end
                                K4_TempleStuckNearTree = function(v669)
                                    local v670 = _G.K4TempleEnter
                                    if ((v669 > 10) and (v669 <= 40)) then
                                        v670.nearSince = (v670.nearSince or tick())
                                        return ((tick() - v670.nearSince) > 5)
                                    end
                                    v670.nearSince = nil
                                    return false
                                end
                                K4_TryEnterTemple = function(v671, v672)
                                    local v673 = _G.K4TempleEnter
                                    local v674 = tostring(game.JobId)
                                    if ((v673.job ~= v674) or ((tick() - (v673.lastAt or 0)) > 90)) then
                                        v673.job, v673.attempts, v673.firedAt = v674, 0, 0
                                    end
                                    v673.lastAt = tick()
                                    local v675 = v348.LocalPlayer.Character
                                    local v676 = (v675 and v675:FindFirstChildOfClass("Humanoid"))
                                    local v677 = (v675 and v675:FindFirstChild("HumanoidRootPart"))
                                    if (not ((v676 and v677) and (v676.Health > 0))) then
                                        return false
                                    end
                                    if _K4F.v657(v677) then
                                        v673.attempts = 0
                                        return true
                                    end
                                    if ((tick() - (v673.firedAt or 0)) < 2) then
                                        return false
                                    end
                                    v673.firedAt = tick()
                                    v673.attempts = ((v673.attempts or 0) + 1)
                                    pcall(function()
                                        if v676.Sit then
                                            v676.Sit = false
                                        end
                                        v677.AssemblyLinearVelocity = Vector3.zero
                                    end)
                                    local v678 = _G.K4TempleProbe
                                    local v679 = v656[(((v673.attempts - 1) % #v656) + 1)]
                                    if (v679 == "prompt") then
                                        local v680, v681 = _K4F.v659(v677, v675)
                                        v678.prompt = tostring(v681)
                                        if (not v680) then
                                            v679 = "teleport"
                                        end
                                    end
                                    if (v679 == "teleport") then
                                        pcall(_K4TempleTeleportProbe, v671, v672)
                                    end
                                    v678.method = v679
                                    v678.attempts = v673.attempts
                                    return true
                                end
                                K4_GetTargetTier = function()
                                    if (type(getgenv().Config) == "table") then
                                        local v682 = tonumber(((getgenv().Config.Tier or getgenv().Config.tierLock) or getgenv().Config.tierlock))
                                        if (v682 and (v682 > 0)) then
                                            return v682
                                        end
                                        if tonumber(getgenv().Config.TargetTier) then
                                            return tonumber(getgenv().Config.TargetTier)
                                        end
                                        if tonumber(getgenv().Config.targetTier) then
                                            return tonumber(getgenv().Config.targetTier)
                                        end
                                        if ((type(getgenv().Config.targetTier) == "string") and tonumber(getgenv().Config.targetTier:match("%d+"))) then
                                            return tonumber(getgenv().Config.targetTier:match("%d+"))
                                        end
                                        if ((type(getgenv().Config.Webhook) == "table") and tonumber(getgenv().Config.Webhook.Tier)) then
                                            return tonumber(getgenv().Config.Webhook.Tier)
                                        end
                                    end
                                    if (type(getgenv().UserConfig) == "table") then
                                        local v683 = tonumber(((getgenv().UserConfig.Tier or getgenv().UserConfig.tierLock) or getgenv().UserConfig.tierlock))
                                        if (v683 and (v683 > 0)) then
                                            return v683
                                        end
                                        if tonumber(getgenv().UserConfig.TargetTier) then
                                            return tonumber(getgenv().UserConfig.TargetTier)
                                        end
                                        if tonumber(getgenv().UserConfig.targetTier) then
                                            return tonumber(getgenv().UserConfig.targetTier)
                                        end
                                        if ((type(getgenv().UserConfig.targetTier) == "string") and tonumber(getgenv().UserConfig.targetTier:match("%d+"))) then
                                            return tonumber(getgenv().UserConfig.targetTier:match("%d+"))
                                        end
                                        if ((type(getgenv().UserConfig.Webhook) == "table") and tonumber(getgenv().UserConfig.Webhook.Tier)) then
                                            return tonumber(getgenv().UserConfig.Webhook.Tier)
                                        end
                                    end
                                    local v684 = getgenv().K4_API_CFG
                                    if (type(v684) == "table") then
                                        if (v684.targetTier and tonumber(tostring(v684.targetTier):match("%d+"))) then
                                            return tonumber(tostring(v684.targetTier):match("%d+"))
                                        end
                                        if tonumber((v684.tier or v684.Tier)) then
                                            return tonumber((v684.tier or v684.Tier))
                                        end
                                        if ((type(v684.webhook) == "table") and tonumber((v684.webhook.tier or v684.webhook.Tier))) then
                                            return tonumber((v684.webhook.tier or v684.webhook.Tier))
                                        end
                                    end
                                    return nil
                                end
                                K4_ReadV4Status = function(v685)
                                    if v396 then
                                        local v686 = K4_ReadRaceLevel(false)
                                        if ((not v686) or (v686 < 3)) then
                                            return {
                                                key = "race_upgrade_required",
                                                label = "V2/V3 REQUIRED",
                                                detail = "Upgrade the current race to V3 before V4",
                                                canTrial = false,
                                                needsTraining = false,
                                                needsPurchase = false,
                                                complete = false
                                            }
                                        end
                                    end
                                    if (((not v685) and v633.data) and ((tick() - v633.at) < v634)) then
                                        return v633.data
                                    end
                                    local v687 = {
                                        key = "unknown",
                                        label = "UNKNOWN",
                                        detail = "Unable to read Race V4 status",
                                        code = nil,
                                        progress = nil,
                                        cost = 0,
                                        canTrial = false,
                                        needsTraining = false,
                                        needsPurchase = false,
                                        complete = false,
                                        remainingTraining = nil,
                                        completedTraining = nil,
                                        gear = nil,
                                        race = _K4F.v635(),
                                        energy = 0,
                                        transformed = false
                                    }
                                    local v688 = v348.LocalPlayer.Character
                                    if (not v688) then
                                        v687.key = "waiting_character"
                                        v687.label = "WAITING CHARACTER"
                                        v687.detail = "Waiting for character to load"
                                        v633.at = tick()
                                        v633.data = v687
                                        return v687
                                    end
                                    local v689 = v688:FindFirstChild("RaceEnergy")
                                    local v690 = v688:FindFirstChild("RaceTransformed")
                                    if v689 then
                                        v687.energy = (tonumber(v689.Value) or 0)
                                    end
                                    if v690 then
                                        v687.transformed = (v690.Value == true)
                                    end
                                    if (not v690) then
                                        local v691 = _K4F.v640()
                                        local v692 = v595[v687.race]
                                        local v693 = (v692 and (checkbackpack(v692) ~= nil))
                                        v687.progress = v691
                                        if (v691 == nil) then
                                            v687.key = "check_failed"
                                            v687.label = "V4 CHECK FAILED"
                                            v687.detail = "RaceV4Progress Check returned no valid status"
                                        elseif (v693 and (v691 >= 4)) then
                                            v687.key = "first_trial_ready"
                                            v687.label = "FIRST TRIAL READY"
                                            v687.detail = "V3 is ready; waiting for Full Moon trial"
                                            v687.canTrial = true
                                        elseif (v691 == 0) then
                                            v687.key = "v4_quest_not_started"
                                            v687.label = "V4 QUEST NOT STARTED"
                                            v687.detail = "Defeat rip_indra and begin the Race V4 quest"
                                        elseif (v691 == 1) then
                                            v687.key = "v4_quest_begin"
                                            v687.label = "BEGIN V4 QUEST"
                                            v687.detail = "Talk to Sealed King to begin the Great Tree step"
                                        elseif (v691 == 2) then
                                            v687.key = "go_great_tree"
                                            v687.label = "GO TO GREAT TREE"
                                            v687.detail = "Use the Great Tree entrance to reach Temple of Time"
                                        elseif (v691 == 3) then
                                            v687.key = "continue_v4_quest"
                                            v687.label = "CONTINUE V4 QUEST"
                                            v687.detail = "Return to Sealed King and continue the quest"
                                        else
                                            v687.key = "starting_v4"
                                            v687.label = "STARTING V4 PROCESS"
                                            v687.detail = "Completing the Race V4 prerequisite steps"
                                        end
                                        v633.at = tick()
                                        v633.data = v687
                                        return v687
                                    end
                                    local v694, v695, v696, v697 = pcall(function()
                                        return _K4F.v637("Check")
                                    end)
                                    if (not v694) then
                                        v687.key = "check_failed"
                                        v687.label = "V4 CHECK FAILED"
                                        v687.detail = "UpgradeRace Check remote failed"
                                        v633.at = tick()
                                        v633.data = v687
                                        return v687
                                    end
                                    v695 = tonumber(v695)
                                    v696 = tonumber(v696)
                                    v697 = (tonumber(v697) or 0)
                                    v687.code = v695
                                    v687.progress = v696
                                    v687.cost = v697
                                    if (v695 == 0) then
                                        v687.key = "trial_ready"
                                        v687.label = "READY FOR TRIAL"
                                        v687.detail = "Training requirement completed"
                                        v687.canTrial = true
                                        v687.gear = v696
                                    elseif (v695 == 1) then
                                        v687.key = "training_stage_1"
                                        v687.label = "TRAINING REQUIRED"
                                        v687.detail = "Train Race V4 energy before the next upgrade"
                                        v687.needsTraining = true
                                    elseif (v695 == 2) then
                                        v687.key = "buy_gear_1"
                                        v687.label = "BUY NEXT GEAR"
                                        v687.detail = "First Race V4 gear upgrade is available"
                                        v687.needsPurchase = true
                                    elseif (v695 == 3) then
                                        v687.key = "training_stage_2"
                                        v687.label = "TRAINING REQUIRED"
                                        v687.detail = "Train again to improve transformation duration"
                                        v687.needsTraining = true
                                    elseif (v695 == 4) then
                                        v687.key = "buy_duration_upgrade"
                                        v687.label = "BUY DURATION UPGRADE"
                                        v687.detail = "Transformation limit upgrade is available"
                                        v687.needsPurchase = true
                                    elseif (v695 == 5) then
                                        v687.key = "completed"
                                        v687.label = "RACE V4 COMPLETED"
                                        v687.detail = "All Race V4 upgrades are complete"
                                        v687.complete = true
                                    elseif (v695 == 6) then
                                        local v698 = math.clamp(((v696 or 2) - 2), 0, 3)
                                        local v699 = math.max(0, (3 - v698))
                                        v687.key = "three_session_training"
                                        v687.label = (((v699 > 0) and "TRAINING REQUIRED") or "TRAINING CHECKING")
                                        v687.completedTraining = v698
                                        v687.remainingTraining = v699
                                        v687.detail = ("Additional sessions: " .. (tostring(v698) .. "/3 completed"))
                                        v687.needsTraining = (v699 > 0)
                                    elseif (v695 == 7) then
                                        v687.key = "buy_next_upgrade"
                                        v687.label = "BUY NEXT UPGRADE"
                                        v687.detail = "The next Race V4 upgrade is available"
                                        v687.needsPurchase = true
                                    elseif (v695 == 8) then
                                        local v700 = 0
                                        pcall(function()
                                            v700 = (tonumber(game.Players.LocalPlayer.Data.Race.C.Value) or 0)
                                        end)
                                        local v701 = K4_GetTargetTier()
                                        if ((v701 and (v701 > 0)) and (v701 <= 5)) then
                                            v687.key = "tier_locked"
                                            v687.label = ("TIER " .. (tostring(v700) .. " LOCKED"))
                                            v687.detail = ("Config.Tier " .. (tostring(v701) .. " dat duoc - Khong train mastery 10 nua!"))
                                            v687.completedTraining = math.clamp((v696 or 0), 0, 10)
                                            v687.remainingTraining = 0
                                            v687.needsTraining = false
                                            v687.complete = true
                                        elseif (v701 and (v701 > 5)) then
                                            local v702 = math.clamp((v701 - 5), 1, 10)
                                            local v703 = math.max(0, (v702 - (v696 or 0)))
                                            v687.key = "mastery_training"
                                            v687.label = (((v703 > 0) and "MASTERY TRAINING") or "TIER LOCKED")
                                            v687.remainingTraining = v703
                                            v687.completedTraining = math.clamp((v696 or 0), 0, v702)
                                            v687.detail = (((v703 > 0) and (tostring(v703) .. (" mastery training sessions remaining (" .. (tostring((v696 or 0)) .. ("/" .. (tostring(v702) .. ")")))))) or ("Config.Tier " .. (tostring(v701) .. " lock dat duoc!")))
                                            v687.needsTraining = (v703 > 0)
                                            v687.complete = (v703 <= 0)
                                        else
                                            local v704 = math.max(0, (10 - (v696 or 0)))
                                            v687.key = "mastery_training"
                                            v687.label = (((v704 > 0) and "MASTERY TRAINING") or "MASTERY COMPLETE")
                                            v687.remainingTraining = v704
                                            v687.completedTraining = math.clamp((v696 or 0), 0, 10)
                                            v687.detail = (((v704 > 0) and (tostring(v704) .. " mastery training sessions remaining")) or "All optional mastery sessions are complete")
                                            v687.needsTraining = (v704 > 0)
                                            v687.complete = (v704 <= 0)
                                        end
                                    elseif (v695 == 9) then
                                        v687.key = "special_race_path"
                                        v687.label = "SPECIAL RACE PATH"
                                        v687.detail = "This race uses a different V4 upgrade path"
                                    else
                                        v687.key = "not_ready"
                                        v687.label = "NOT TRIAL READY"
                                        v687.detail = ("Unknown UpgradeRace state: " .. tostring(v695))
                                    end
                                    local v705 = 0
                                    pcall(function()
                                        v705 = (tonumber(game.Players.LocalPlayer.Data.Race.C.Value) or 0)
                                    end)
                                    local v706 = K4_GetTargetTier()
                                    if (((v706 and (v706 > 0)) and (v705 >= v706)) and (not v687.needsPurchase)) then
                                        v687.key = "tier_locked"
                                        v687.label = ("TIER " .. (tostring(v705) .. " LOCKED"))
                                        v687.detail = ("Tier lock dat duoc (" .. (tostring(v705) .. ("/" .. (tostring(v706) .. ") - V4 Complete"))))
                                        v687.complete = true
                                        v687.needsTraining = false
                                        v687.canTrial = false
                                    end
                                    v633.at = tick()
                                    v633.data = v687
                                    return v687
                                end
                                getV4Status = function(v707)
                                    if (((not v707) and v633.data) and ((tick() - (v633.at or 0)) < v634)) then
                                        return v633.data
                                    end
                                    if v633.busy then
                                        return (v633.data or {
                                            key = "checking",
                                            label = "CHECKING V4",
                                            detail = "Waiting for V4 status",
                                            canTrial = false,
                                            needsTraining = false,
                                            needsPurchase = false,
                                            complete = false
                                        })
                                    end
                                    v633.busy = true
                                    local v708, v709, v710 = false, false, nil
                                    local v711 = task.spawn(function()
                                        v709, v710 = pcall(K4_ReadV4Status, v707)
                                        v708 = true
                                    end)
                                    local v712 = tick()
                                    while ((not v708) and ((tick() - v712) < 6)) do
                                        task.wait(0.05)
                                    end
                                    if (not v708) then
                                        pcall(task.cancel, v711)
                                    end
                                    v633.busy = false
                                    if (v708 and v709) then
                                        return v710
                                    end
                                    v633.data = (v633.data or {
                                        key = "check_failed",
                                        label = "V4 CHECK FAILED",
                                        detail = "Retrying V4 status",
                                        canTrial = false,
                                        needsTraining = false,
                                        needsPurchase = false,
                                        complete = false
                                    })
                                    v633.at = tick()
                                    return v633.data
                                end
                                do
                                    local v713 = { at = (-math.huge), ok = false, value = false, busy = false }
                                    K4_CheckTempleDoorCached = function()
                                        if (v713.busy or ((tick() - v713.at) < 1)) then
                                            return v713.ok, v713.value
                                        end
                                        v713.at, v713.busy = tick(), true
                                        v713.ok, v713.value = pcall(function()
                                            return v349.Remotes.CommF_:InvokeServer("CheckTempleDoor")
                                        end)
                                        v713.busy = false
                                        return v713.ok, v713.value
                                    end
                                end
                                getdialogoftemple = function()
                                    return getV4Status(true).detail
                                end
                                trialable = function(v714)
                                    local v715 = getV4Status((v714 == true))
                                    if v715.canTrial then
                                        return true, v715.gear
                                    end
                                    if v715.complete then
                                        return false, "completed"
                                    end
                                    if v715.needsPurchase then
                                        if ((type(v400) == "function") and (not v400())) then
                                            return false, ((v395 and "helper_upgrade_locked") or "v4_buy_disabled")
                                        end
                                        local v716 = 0
                                        pcall(function()
                                            v716 = (tonumber(v348.LocalPlayer.Data.Fragments.Value) or 0)
                                        end)
                                        if ((v715.cost > 0) and (v716 >= v715.cost)) then
                                            local v717, v718 = pcall(function()
                                                return _K4F.v637("Buy")
                                            end)
                                            _K4F.v639()
                                            if (v717 and v718) then
                                                return false, "upgrade_bought"
                                            end
                                            return false, "buy_failed"
                                        end
                                        return false, "raiding"
                                    end
                                    if v715.needsTraining then
                                        return false, (v715.remainingTraining or "training")
                                    end
                                    return false, v715.key
                                end
                                local v719 = {
                                    AttackDistance = 120,
                                    AttackMobs = true,
                                    AttackPlayers = true,
                                    AttackDelay = 0.03,
                                    AttackCooldown = 0,
                                    AutoClickEnabled = true,
                                    BringMobs = true,
                                    BringDistance = 350,
                                    BringRadius = 350,
                                    BringCooldown = 0.15,
                                    BringLockTimeout = 10,
                                    BringMaxMobs = 4,
                                    MaxTargets = 3,
                                    PreGrabDistance = 150
                                }
                                getgenv().K4_AttackConfig = v719
                                do
                                    local v720 = game:GetService("Players")
                                    local v721 = game:GetService("ReplicatedStorage")
                                    local v722 = game:GetService("Workspace")
                                    local v723 = game:GetService("CollectionService")
                                    local v724 = v720.LocalPlayer
                                    local v725 = v721:WaitForChild("Modules"):WaitForChild("Net")
                                    local v726 = v725:WaitForChild("RE/RegisterAttack")
                                    local v727 = v725:WaitForChild("RE/RegisterHit")
                                    local v728 = {
                                        Enabled = true,
                                        CurrentTarget = nil,
                                        ForcedDistance = nil,
                                        LastAttack = 0,
                                        LastBring = 0,
                                        RemoteAttack = nil,
                                        RemoteId = nil,
                                        AttackSeed = nil,
                                        BringWorkers = setmetatable({}, { __mode = "k" }),
                                        BringAnchors = setmetatable({}, { __mode = "k" }),
                                        IgnoreUntil = setmetatable({}, { __mode = "k" })
                                    }
                                    local function v729()
                                        local v730 = v724.Character
                                        local v731 = (v730 and v730:FindFirstChildOfClass("Humanoid"))
                                        local v732 = (v730 and v730:FindFirstChild("HumanoidRootPart"))
                                        return v730, v731, v732
                                    end
                                    local function v733(v734)
                                        if ((typeof(v734) ~= "Instance") or (not v734.Parent)) then
                                            return false
                                        end
                                        local v735 = v734:FindFirstChildOfClass("Humanoid")
                                        local v736 = (v734:FindFirstChild("HumanoidRootPart") or v734.PrimaryPart)
                                        return (((v735 ~= nil) and (v736 ~= nil)) and (v735.Health > 0))
                                    end
                                    local function v737(v738)
                                        return (v738 and (v738:FindFirstChild("HumanoidRootPart") or v738.PrimaryPart))
                                    end
                                    local function v739(v740)
                                        if (not v740) then
                                            return nil
                                        end
                                        local v741 = (((((v740:FindFirstChild("Head") or v740:FindFirstChild("UpperTorso")) or v740:FindFirstChild("Torso")) or v740:FindFirstChild("ModelHitbox")) or v740:FindFirstChild("HumanoidRootPart")) or v740:FindFirstChildWhichIsA("BasePart"))
                                        return (((v741 and v741:IsA("BasePart")) and v741) or nil)
                                    end
                                    local function v742(v743)
                                        if (not v743) then
                                            return false
                                        end
                                        local v744 = v722:FindFirstChild("Enemies")
                                        if (v744 and (v743.Parent == v744)) then
                                            return true
                                        end
                                        local v745 = v722:FindFirstChild("_WorldOrigin")
                                        local v746 = (v745 and v745:FindFirstChild("Enemies"))
                                        return ((v746 ~= nil) and (v743.Parent == v746))
                                    end
                                    local function v747(v748)
                                        local v749 = v722:FindFirstChild("Characters")
                                        return (((v749 ~= nil) and (v748 ~= nil)) and (v748.Parent == v749))
                                    end
                                    local function v750()
                                        local v751 = {}
                                        local v752 = {}
                                        local v753 = v722:FindFirstChild("Enemies")
                                        if v753 then
                                            v751[(#v751 + 1)] = v753
                                            v752[v753] = true
                                        end
                                        local v754 = v722:FindFirstChild("_WorldOrigin")
                                        local v755 = (v754 and v754:FindFirstChild("Enemies"))
                                        if (v755 and (not v752[v755])) then
                                            v751[(#v751 + 1)] = v755
                                        end
                                        return v751
                                    end
                                    local function v756(v757, v758)
                                        if (not v757) then
                                            return false
                                        end
                                        local v759, v760 = pcall(function()
                                            if (type(v757.HasTag) == "function") then
                                                return v757:HasTag(v758)
                                            end
                                            return v723:HasTag(v757, v758)
                                        end)
                                        if v759 then
                                            return (v760 == true)
                                        end
                                        return (v757:GetAttribute(("K4Tag_" .. tostring(v758))) == true)
                                    end
                                    local function v761(v762, v763)
                                        if ((not v762) or v756(v762, v763)) then
                                            return
                                        end
                                        local v764 = pcall(function()
                                            if (type(v762.AddTag) == "function") then
                                                v762:AddTag(v763)
                                            else
                                                v723:AddTag(v762, v763)
                                            end
                                        end)
                                        if (not v764) then
                                            pcall(function()
                                                v762:SetAttribute(("K4Tag_" .. tostring(v763)), true)
                                            end)
                                        end
                                    end
                                    local function v765(v766, v767)
                                        if (not v766) then
                                            return
                                        end
                                        pcall(function()
                                            if (type(v766.RemoveTag) == "function") then
                                                v766:RemoveTag(v767)
                                            else
                                                v723:RemoveTag(v766, v767)
                                            end
                                        end)
                                        pcall(function()
                                            v766:SetAttribute(("K4Tag_" .. tostring(v767)), nil)
                                        end)
                                    end
                                    local function v768(v769)
                                        if ((not v769) or (not v769.Parent)) then
                                            return false
                                        end
                                        if (type(isnetworkowner) == "function") then
                                            local v770, v771 = pcall(isnetworkowner, v769)
                                            if v770 then
                                                return (v771 == true)
                                            end
                                        end
                                        local _, _, v774 = v729()
                                        return ((v774 ~= nil) and ((v774.Position - v769.Position).Magnitude <= math.max((tonumber((v719.BringRadius or v719.BringDistance)) or 350), 50)))
                                    end
                                    local function v775(v776)
                                        if (not v776) then
                                            return true
                                        end
                                        if v756(v776, "Ignore") then
                                            return true
                                        end
                                        local v777 = v728.IgnoreUntil[v776]
                                        if (v777 and (v777 > tick())) then
                                            return true
                                        end
                                        if v777 then
                                            v728.IgnoreUntil[v776] = nil
                                        end
                                        return false
                                    end
                                    local function v778(v779, v780)
                                        if (not v779) then
                                            return
                                        end
                                        v728.IgnoreUntil[v779] = (tick() + math.max((tonumber(v780) or 3), 0.5))
                                    end
                                    local function v781(v782)
                                        local v783 = (v782 and v782:FindFirstChildOfClass("Humanoid"))
                                        local v784 = (v782 and v782:FindFirstChild("HumanoidRootPart"))
                                        if ((not v783) or (not v784)) then
                                            return
                                        end
                                        if (v782:GetAttribute("OldPosition") == nil) then
                                            v782:SetAttribute("OldPosition", v784.Position)
                                        end
                                        if (v782:GetAttribute("K4OldWalkSpeed") == nil) then
                                            v782:SetAttribute("K4OldWalkSpeed", v783.WalkSpeed)
                                        end
                                        if (v782:GetAttribute("K4OldJumpPower") == nil) then
                                            v782:SetAttribute("K4OldJumpPower", v783.JumpPower)
                                        end
                                        if (v782:GetAttribute("K4OldRootSize") == nil) then
                                            v782:SetAttribute("K4OldRootSize", v784.Size)
                                        end
                                    end
                                    local function v785(v786)
                                        local v787 = (v786 and v786:FindFirstChildOfClass("Humanoid"))
                                        local v788 = (v786 and v786:FindFirstChild("HumanoidRootPart"))
                                        if ((not v787) or (not v788)) then
                                            return false
                                        end
                                        v781(v786)
                                        pcall(function()
                                            v788.CanCollide = false
                                            v788.Size = Vector3.new(50, 50, 50)
                                            v788.AssemblyLinearVelocity = Vector3.zero
                                            v788.AssemblyAngularVelocity = Vector3.zero
                                        end)
                                        local v789 = v786:FindFirstChild("Head")
                                        if (v789 and v789:IsA("BasePart")) then
                                            v789.CanCollide = false
                                        end
                                        v787.WalkSpeed = 0
                                        v787.JumpPower = 0
                                        v787.PlatformStand = true
                                        local v790 = v787:FindFirstChildOfClass("Animator")
                                        if v790 then
                                            pcall(function()
                                                v790:Destroy()
                                            end)
                                        end
                                        local v791 = v788:FindFirstChild("K4BringLock")
                                        if (not v791) then
                                            v791 = Instance.new("BodyVelocity")
                                            v791.Name = "K4BringLock"
                                            v791.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                            v791.Velocity = Vector3.zero
                                            v791.Parent = v788
                                        end
                                        if (type(sethiddenproperty) == "function") then
                                            pcall(sethiddenproperty, v788, "NetworkOwnershipRule", Enum.NetworkOwnership.Manual)
                                        end
                                        return true
                                    end
                                    local function v792(v793, v794)
                                        if (not v793) then
                                            return
                                        end
                                        local v795 = v793:FindFirstChildOfClass("Humanoid")
                                        local v796 = v793:FindFirstChild("HumanoidRootPart")
                                        if v796 then
                                            local v797 = v796:FindFirstChild("K4BringLock")
                                            if v797 then
                                                pcall(function()
                                                    v797:Destroy()
                                                end)
                                            end
                                            local v798 = v793:GetAttribute("K4OldRootSize")
                                            if (typeof(v798) == "Vector3") then
                                                v796.Size = v798
                                            end
                                            v796.CanCollide = false
                                            v796.AssemblyLinearVelocity = Vector3.zero
                                            v796.AssemblyAngularVelocity = Vector3.zero
                                            local v799 = v793:GetAttribute("OldPosition")
                                            if (v794 and (typeof(v799) == "Vector3")) then
                                                pcall(function()
                                                    v796.CFrame = CFrame.new(v799)
                                                end)
                                            end
                                        end
                                        if v795 then
                                            local v800 = v793:GetAttribute("K4OldWalkSpeed")
                                            local v801 = v793:GetAttribute("K4OldJumpPower")
                                            if tonumber(v800) then
                                                v795.WalkSpeed = tonumber(v800)
                                            end
                                            if tonumber(v801) then
                                                v795.JumpPower = tonumber(v801)
                                            end
                                            v795.PlatformStand = false
                                        end
                                        v765(v793, "Brought")
                                        v765(v793, "secondmob")
                                        v728.BringWorkers[v793] = nil
                                    end
                                    local function v802(v803)
                                        local v804 = {}
                                        for v805 in pairs(v728.BringWorkers) do
                                            v804[(#v804 + 1)] = v805
                                        end
                                        for v806, v807 in ipairs(v804) do
                                            v792(v807, (v803 == true))
                                        end
                                    end
                                    local function v808()
                                        local v809 = 0
                                        for v810 in pairs(v728.BringWorkers) do
                                            if v733(v810) then
                                                v809 = (v809 + 1)
                                            else
                                                v728.BringWorkers[v810] = nil
                                            end
                                        end
                                        return v809
                                    end
                                    local function v811(v812, v813, v814)
                                        local v815 = nil
                                        local v816 = math.huge
                                        v813 = (tonumber(v813) or math.huge)
                                        v814 = ((v814 and tostring(v814)) or nil)
                                        for v817, v818 in ipairs(v750()) do
                                            for v819, v820 in ipairs(v818:GetChildren()) do
                                                if ((v733(v820) and (not v775(v820))) and ((not v814) or (v820.Name == v814))) then
                                                    local v821 = v737(v820)
                                                    if v821 then
                                                        local v822 = (v821.Position - v812).Magnitude
                                                        if ((v822 <= v813) and (v822 < v816)) then
                                                            v815 = v820
                                                            v816 = v822
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                        return v815
                                    end
                                    local function v823(v824, v825)
                                        local v826 = v722:FindFirstChild("Characters")
                                        if (not v826) then
                                            return nil
                                        end
                                        local v827 = v724.Character
                                        local v828 = nil
                                        local v829 = math.huge
                                        v825 = (tonumber(v825) or math.huge)
                                        for v830, v831 in ipairs(v826:GetChildren()) do
                                            if ((v831 ~= v827) and v733(v831)) then
                                                local v832 = v737(v831)
                                                if v832 then
                                                    local v833 = (v832.Position - v824).Magnitude
                                                    if ((v833 <= v825) and (v833 < v829)) then
                                                        v828 = v831
                                                        v829 = v833
                                                    end
                                                end
                                            end
                                        end
                                        return v828
                                    end
                                    v728.BringMob = function(v834, v835, v836, v837)
                                        if (((v719.BringMobs == false) or (not v733(v835))) or (not v742(v835))) then
                                            return false
                                        end
                                        local v838 = tick()
                                        local v839 = math.max((tonumber(v719.BringCooldown) or 0.15), 0.05)
                                        if ((v838 - (v834.LastBring or 0)) <= v839) then
                                            return false
                                        end
                                        if (v808() >= math.max((tonumber(v719.BringMaxMobs) or 4), 1)) then
                                            return false
                                        end
                                        v834.LastBring = v838
                                        if (type(sethiddenproperty) == "function") then
                                            pcall(sethiddenproperty, v724, "SimulationRadius", math.huge)
                                        end
                                        local v840 = v835:FindFirstChild("HumanoidRootPart")
                                        if (not v840) then
                                            return false
                                        end
                                        v836 = (((typeof(v836) == "CFrame") and v836) or v840.CFrame)
                                        v834.BringAnchors[v835] = v836
                                        local v841 = ((v837 and math.huge) or math.max((tonumber((v719.BringRadius or v719.BringDistance)) or 350), 50))
                                        local v842 = nil
                                        local v843 = math.huge
                                        for v844, v845 in ipairs(v750()) do
                                            for v846, v847 in ipairs(v845:GetChildren()) do
                                                local v848 = v847:FindFirstChild("HumanoidRootPart")
                                                if ((((((((v847 ~= v835) and (v847.Name == v835.Name)) and v733(v847)) and v848) and (not v756(v847, "realmob"))) and (not v756(v847, "Brought"))) and (not v775(v847))) and v768(v848)) then
                                                    local v849 = (v848.Position - v836.Position).Magnitude
                                                    if ((v849 <= v841) and (v849 < v843)) then
                                                        v842 = v847
                                                        v843 = v849
                                                    end
                                                end
                                            end
                                        end
                                        if (not v842) then
                                            return false
                                        end
                                        v781(v835)
                                        v781(v842)
                                        v765(v835, "secondmob")
                                        v761(v835, "realmob")
                                        v761(v842, "Brought")
                                        v761(v842, "secondmob")
                                        v834.BringWorkers[v842] = true
                                        task.spawn(function()
                                            local v850 = nil
                                            local v851 = tick()
                                            local v852 = math.max((tonumber(v719.BringLockTimeout) or 10), 3)
                                            while ((((((((v728.Enabled and (v719.BringMobs ~= false)) and (v719.AutoClickEnabled ~= false)) and (v728.CurrentTarget == v835)) and v733(v835)) and v733(v842)) and v756(v842, "Brought")) and (not v775(v835))) and (not v775(v842))) do
                                                local v853 = v835:FindFirstChildOfClass("Humanoid")
                                                local v854 = v835:FindFirstChild("HumanoidRootPart")
                                                local v855 = v842:FindFirstChildOfClass("Humanoid")
                                                local v856 = v842:FindFirstChild("HumanoidRootPart")
                                                if ((((not v853) or (not v854)) or (not v855)) or (not v856)) then
                                                    break
                                                end
                                                if ((v850 == nil) or (v855.Health < v850)) then
                                                    v850 = v855.Health
                                                    v851 = tick()
                                                elseif ((v855.Health >= v855.MaxHealth) and ((tick() - v851) >= v852)) then
                                                    v778(v842, 3)
                                                    v792(v842, true)
                                                    return
                                                end
                                                v785(v842)
                                                local v857 = (v728.BringAnchors[v835] or v854.CFrame)
                                                v854.CanCollide = false
                                                v854.AssemblyLinearVelocity = Vector3.zero
                                                v854.AssemblyAngularVelocity = Vector3.zero
                                                v854.CFrame = v857
                                                v856.CFrame = v857
                                                task.wait()
                                            end
                                            v792(v842, false)
                                        end)
                                        return true
                                    end
                                    local function v858(v859)
                                        if (v728.CurrentTarget ~= v859) then
                                            local v860 = v728.CurrentTarget
                                            if v860 then
                                                v765(v860, "realmob")
                                                v728.BringAnchors[v860] = nil
                                            end
                                            v802(false)
                                            v728.CurrentTarget = v859
                                        end
                                        if (v859 and v742(v859)) then
                                            v765(v859, "secondmob")
                                            v761(v859, "realmob")
                                        end
                                    end
                                    local function v861()
                                        if ((v728.RemoteAttack and v728.RemoteAttack.Parent) and v728.RemoteId) then
                                            return true
                                        end
                                        v728.RemoteAttack = nil
                                        v728.RemoteId = nil
                                        for v862, v863 in ipairs({
                                            v721:FindFirstChild("Util"),
                                            v721:FindFirstChild("Common"),
                                            v721:FindFirstChild("Remotes"),
                                            v721:FindFirstChild("Assets"),
                                            v721:FindFirstChild("FX")
                                        }) do
                                            if v863 then
                                                for v864, v865 in ipairs(v863:GetChildren()) do
                                                    if (v865:IsA("RemoteEvent") and v865:GetAttribute("Id")) then
                                                        v728.RemoteAttack = v865
                                                        v728.RemoteId = v865:GetAttribute("Id")
                                                        return true
                                                    end
                                                end
                                            end
                                        end
                                        return false
                                    end
                                    local function v866()
                                        if v728.AttackSeed then
                                            return true
                                        end
                                        local v868 = pcall(function()
                                            local v867 = v725:FindFirstChild("seed")
                                            if v867 then
                                                v728.AttackSeed = v867:InvokeServer()
                                            end
                                        end)
                                        return (v868 and (v728.AttackSeed ~= nil))
                                    end
                                    v866()
                                    local function v869(v870)
                                        if ((not v866()) or (not v861())) then
                                            return false
                                        end
                                        local v873 = pcall(function()
                                            local v872 = string.gsub("RE/RegisterHit", ".", function(v871)
                                                return string.char(bit32.bxor(string.byte(v871), (math.floor(((v722:GetServerTimeNow() / 10) % 10)) + 1)))
                                            end)
                                            v728.RemoteAttack:FireServer(v872, bit32.bxor((v728.RemoteId + 909090), (v728.AttackSeed * 2)), unpack(v870))
                                        end)
                                        if (not v873) then
                                            v728.AttackSeed = nil
                                            v728.RemoteAttack = nil
                                            v728.RemoteId = nil
                                        end
                                        return v873
                                    end
                                    local function v874(v875, v876)
                                        local _, _, v879 = v729()
                                        if (not v879) then
                                            return {}
                                        end
                                        v876 = math.max(((tonumber(v876) or tonumber(v719.AttackDistance)) or 120), 1)
                                        local v880 = math.clamp(math.floor((tonumber(v719.MaxTargets) or 3)), 1, 3)
                                        local v881 = {}
                                        local v882 = {}
                                        local function v883(v884)
                                            local v885 = getgenv().K4FFACombat
                                            if (v885 and (((v884 ~= v885.character) or (type(getgenv().K4_FFAAttackStillValid) ~= "function")) or (not getgenv().K4_FFAAttackStillValid()))) then
                                                return
                                            end
                                            if (((#v881 >= v880) or v882[v884]) or (not v733(v884))) then
                                                return
                                            end
                                            local v886 = v737(v884)
                                            local v887 = v739(v884)
                                            if ((not v886) or (not v887)) then
                                                return
                                            end
                                            if ((v886.Position - v879.Position).Magnitude > v876) then
                                                return
                                            end
                                            v882[v884] = true
                                            v881[(#v881 + 1)] = { v884, v887 }
                                        end
                                        if v875 then
                                            if (v742(v875) and (v719.AttackMobs ~= false)) then
                                                v883(v875)
                                            elseif (v747(v875) and (v719.AttackPlayers ~= false)) then
                                                v883(v875)
                                            end
                                        end
                                        if (v719.AttackMobs ~= false) then
                                            for v888, v889 in ipairs(v750()) do
                                                for v890, v891 in ipairs(v889:GetChildren()) do
                                                    if (#v881 >= v880) then
                                                        break
                                                    end
                                                    v883(v891)
                                                end
                                                if (#v881 >= v880) then
                                                    break
                                                end
                                            end
                                        end
                                        if ((v719.AttackPlayers ~= false) and (#v881 < v880)) then
                                            local v892 = v722:FindFirstChild("Characters")
                                            if v892 then
                                                local v893 = v724.Character
                                                for v894, v895 in ipairs(v892:GetChildren()) do
                                                    if (#v881 >= v880) then
                                                        break
                                                    end
                                                    if (v895 ~= v893) then
                                                        v883(v895)
                                                    end
                                                end
                                            end
                                        end
                                        return v881
                                    end
                                    v728.FastAttack = function(v896, v897, v898)
                                        if ((v896.Enabled ~= true) or (v719.AutoClickEnabled == false)) then
                                            return false
                                        end
                                        if ((os.clock() < (getgenv().VapeNextAttackPacket or 0)) or ((tick() - v896.LastAttack) < math.max((tonumber(v719.AttackDelay) or 0.15), 0.15))) then
                                            return false
                                        end
                                        local v899, v900 = v729()
                                        if (((not v899) or (not v900)) or (v900.Health <= 0)) then
                                            return false
                                        end
                                        local v901 = v899:FindFirstChildWhichIsA("Tool")
                                        if (not v901) then
                                            pcall(function()
                                                v411:eq()
                                            end)
                                            v901 = v899:FindFirstChildWhichIsA("Tool")
                                        end
                                        if (not v901) then
                                            return false
                                        end
                                        local v902 = math.max((tonumber(v719.AttackDelay) or 0.15), 0.15)
                                        if (os.clock() < (getgenv().VapeNextAttackPacket or 0)) then
                                            return false
                                        end
                                        if ((tick() - v896.LastAttack) < v902) then
                                            return false
                                        end
                                        if v897 then
                                            v858(v897)
                                            v896.ForcedDistance = (tonumber(v898) or v896.ForcedDistance)
                                        end
                                        local v903 = (v897 or v896.CurrentTarget)
                                        if (v903 and (not v733(v903))) then
                                            v858(nil)
                                            v903 = nil
                                        end
                                        if (not v903) then
                                            local _, _, v906 = v729()
                                            if (not v906) then
                                                return false
                                            end
                                            if (v719.AttackMobs ~= false) then
                                                v903 = v811(v906.Position, math.max((tonumber(v719.PreGrabDistance) or 150), (tonumber(v719.AttackDistance) or 120)))
                                            end
                                            if ((not v903) and (v719.AttackPlayers ~= false)) then
                                                v903 = v823(v906.Position, (tonumber(v719.AttackDistance) or 120))
                                            end
                                            if v903 then
                                                v858(v903)
                                            end
                                        end
                                        if (not v903) then
                                            return false
                                        end
                                        local v907 = v737(v903)
                                        if ((v907 and v742(v903)) and (v719.BringMobs ~= false)) then
                                            v896.BringAnchors[v903] = v907.CFrame
                                            v896:BringMob(v903, v907.CFrame, false)
                                        end
                                        local v908 = (((tonumber(v898) or tonumber(v896.ForcedDistance)) or tonumber(v719.AttackDistance)) or 120)
                                        local v909 = v874(v903, v908)
                                        if (#v909 == 0) then
                                            return false
                                        end
                                        local v910 = (v909[1] and v909[1][2])
                                        if ((not v910) or (not v910:IsA("BasePart"))) then
                                            return false
                                        end
                                        local v911 = { v910, {} }
                                        for v912, v913 in ipairs(v909) do
                                            local v914 = v913[1]
                                            local v915 = v913[2]
                                            if ((((v914 and v914.Parent) and v915) and v915:IsA("BasePart")) and v915.Parent) then
                                                v911[2][(#v911[2] + 1)] = { v914, v915 }
                                            end
                                        end
                                        if (#v911[2] == 0) then
                                            return false
                                        end
                                        if v726 then
                                            pcall(function()
                                                v726:FireServer()
                                            end)
                                        end
                                        if v727 then
                                            pcall(function()
                                                v727:FireServer(unpack(v911))
                                            end)
                                        end
                                        v869(v911)
                                        v896.LastAttack = tick()
                                        getgenv().VapeNextAttackPacket = (os.clock() + 0.15)
                                        return true
                                    end
                                    v728.ResetCombatState = function(v916, v917)
                                        if (v917 and (v916.CurrentTarget == v917)) then
                                            v765(v917, "realmob")
                                            v916.BringAnchors[v917] = nil
                                        elseif v916.CurrentTarget then
                                            v765(v916.CurrentTarget, "realmob")
                                            v916.BringAnchors[v916.CurrentTarget] = nil
                                        end
                                        v802(true)
                                        if ((not v917) or (v916.CurrentTarget == v917)) then
                                            v916.CurrentTarget = nil
                                            v916.ForcedDistance = nil
                                        end
                                        v916.LastAttack = 0
                                        v916.LastBring = 0
                                        v916.AttackSeed = nil
                                    end
                                    GrabMobs = function(v918)
                                        local _, _, v921 = v729()
                                        if (not v921) then
                                            return false
                                        end
                                        local v922 = nil
                                        if ((typeof(v918) == "Instance") and v918:IsA("Model")) then
                                            v922 = v918
                                        else
                                            local v923 = tostring((v918 or ""))
                                            v922 = v811(v921.Position, math.max((tonumber((v719.BringRadius or v719.BringDistance)) or 350), (tonumber(v719.PreGrabDistance) or 150)), (((v923 ~= "") and v923) or nil))
                                        end
                                        if (not v922) then
                                            return false
                                        end
                                        v858(v922)
                                        local v924 = v737(v922)
                                        return ((v924 ~= nil) and v728:BringMob(v922, v924.CFrame, false))
                                    end
                                    K4FindNearestMobName = function(v925, v926)
                                        local v927 = v811(v925, v926)
                                        return ((v927 and tostring(v927.Name)) or nil)
                                    end
                                    getgenv().K4BringMob = function(v928, v929, v930)
                                        local v931, v932 = pcall(function()
                                            return v728:BringMob(v928, v929, v930)
                                        end)
                                        return (v931 and (v932 == true))
                                    end
                                    getgenv().BringMob = getgenv().K4BringMob
                                    getgenv().K4_AttackTarget = function(v933, v934)
                                        local v935, v936 = pcall(function()
                                            return v728:FastAttack(v933, v934)
                                        end)
                                        return (v935 and (v936 == true))
                                    end
                                    getgenv().Attack = function()
                                        local v937, v938 = pcall(function()
                                            return v728:FastAttack(nil, nil)
                                        end)
                                        return (v937 and (v938 == true))
                                    end
                                    getgenv().K4_ResetFastAttackTarget = function(v939)
                                        return v728:ResetCombatState(v939)
                                    end
                                    v724.CharacterAdded:Connect(function()
                                        v728:ResetCombatState()
                                        task.defer(function()
                                            task.wait(0.5)
                                            v728.Enabled = true
                                        end)
                                    end)
                                    getgenv().K4CombatController = v728
                                    getgenv().KaitunFastAttack = v728
                                    getgenv().KaitunFastAttack.MultiTargetWithoutBuddha = true
                                    getgenv().KaitunFastAttack.TurboOptimized = true
                                    getgenv().KaitunFastAttack.EncryptedRegisterHit = true
                                    getgenv().KaitunFastAttack.DonorBringMob = true
                                end
                                FastAttack = function()
                                    return getgenv().KaitunFastAttack
                                end
                                FastAttack()
                                Attack = getgenv().Attack
                                _G.Attack = getgenv().Attack
                                getgenv().DragonTalonFastAttack = getgenv().Attack
                                getgenv().TyrantFastAttack = getgenv().Attack
                                local v940 = { Connections = {} }
                                v940.Attack = function(v941)
                                    if (type(getgenv().Attack) == "function") then
                                        return getgenv().Attack()
                                    end
                                    return nil
                                end
                                task.spawn(function()
                                    while task.wait(0.15) do
                                        if (v719.AutoClickEnabled ~= false) then
                                            pcall(function()
                                                v411:haki()
                                                v940:Attack()
                                            end)
                                        end
                                    end
                                end)
                                local v943 = tostring((getgenv().K4_TOOL_API or "http://127.0.0.1:20425"))
                                local v944 = game.JobId
                                local v945 = v348.LocalPlayer.Name
                                local v946 = false
                                local v947 = 0
                                local v948 = nil
                                local v949 = nil
                                local v950 = 0
                                local v951 = ""
                                local v952 = ""
                                local v954 = "starting"
                                local v955 = 0
                                local v956 = 0
                                local v957 = 0
                                local v958 = 0
                                local v959 = ""
                                local v960 = 0
                                local v961 = false
                                local v962 = false
                                local v963 = 0
                                local v964 = 0
                                local v965 = math.huge
                                local v966 = false
                                local v967 = 0
                                _G.K4TurnGuard = (_G.K4TurnGuard or {
                                    waitingCFrame = nil,
                                    waitingHubId = "",
                                    lastReturnAt = 0,
                                    lastResetAt = 0,
                                    lastStrictGroup = "",
                                    lastStrictToken = ""
                                })
                                _G.K4TrialLifecycle = (_G.K4TrialLifecycle or {
                                    groupId = "",
                                    started = false,
                                    startedAt = 0,
                                    lastActiveAt = 0,
                                    endMoonPending = false,
                                    endMoonReason = "",
                                    endMoonDetectedAt = 0
                                })
                                _G.K4PostTrialReset = {
                                    armed = false,
                                    armedAt = 0,
                                    armedGroup = "",
                                    trialSeen = false,
                                    ffaLatched = false,
                                    ffaInactiveAt = 0,
                                    active = false,
                                    groupId = "",
                                    startedAt = 0,
                                    helperNames = {},
                                    helperCharacters = {},
                                    helperConfirmed = {},
                                    selfResetIssued = false,
                                    selfResetIssuedAt = 0,
                                    selfResetRetries = 0,
                                    selfResetConfirmed = false,
                                    mainWinnerPoint = false,
                                    mainResetForbidden = false,
                                    mainGearClaimed = false,
                                    lastGearClaimAt = 0,
                                    lastWinnerCheckAt = 0,
                                    templeClockFailures = 0,
                                    completed = false,
                                    completedAt = 0,
                                    forceFinishedAt = 0,
                                    forceFinishReason = ""
                                }
                                K4_ForceFinishHelpPostTrialReset = function(v968)
                                    local v969 = _G.K4PostTrialReset
                                    if ((not v969) or (not v395)) then
                                        return false
                                    end
                                    v969.selfResetConfirmed = true
                                    v969.helperConfirmed = (v969.helperConfirmed or {})
                                    v969.helperConfirmed[v945] = true
                                    v969.active = false
                                    v969.armed = false
                                    v969.trialSeen = false
                                    v969.ffaLatched = false
                                    v969.ffaInactiveAt = tick()
                                    v969.mainResetForbidden = false
                                    v969.completed = true
                                    v969.completedAt = tick()
                                    v969.forceFinishedAt = tick()
                                    v969.forceFinishReason = tostring((v968 or "help_reset_timeout"))
                                    return true
                                end
                                K4_PostTrialLockPending = function()
                                    local v970 = _G.K4PostTrialReset
                                    if (not v970) then
                                        return false
                                    end
                                    if v395 then
                                        local v971 = tostring((v970.groupId or ""))
                                        if (v971 == "") then
                                            v971 = tostring((v970.armedGroup or ""))
                                        end
                                        local v972 = tostring(((v948 and v948.group_id) or ""))
                                        if (((v971 ~= "") and (v972 ~= "")) and (v971 ~= v972)) then
                                            K4_ForceFinishHelpPostTrialReset("group_changed")
                                            return false
                                        end
                                        if (((((v970.active ~= true) and (v970.armed == true)) and (v970.trialSeen == true)) and ((tick() - (tonumber(v970.armedAt) or 0)) >= 20)) and (not ((type(_K4TrialCycleIsActive) == "function") and (_K4TrialCycleIsActive() == true)))) then
                                            K4_ForceFinishHelpPostTrialReset("stale_armed_help_reset")
                                            return false
                                        end
                                    end
                                    if (v970.active == true) then
                                        if v395 then
                                            local v973 = (tick() - (tonumber(v970.startedAt) or tick()))
                                            local v974 = ((type(_K4MoonHubMoonEnded) == "function") and (_K4MoonHubMoonEnded() == true))
                                            if (v974 and (v973 >= 3)) then
                                                K4_ForceFinishHelpPostTrialReset("full_moon_ended")
                                                return false
                                            end
                                            if (v973 >= 20) then
                                                K4_ForceFinishHelpPostTrialReset("help_reset_watchdog_timeout")
                                                return false
                                            end
                                        end
                                        return true
                                    end
                                    return (((v970.armed == true) and (v970.trialSeen == true)) and ((tick() - (tonumber(v970.armedAt) or 0)) <= 300))
                                end
                                K4_MainScriptResetBlocked = function()
                                    if (v396 ~= true) then
                                        return false
                                    end
                                    if (_G.K4PostTrialReset and (_G.K4PostTrialReset.mainResetForbidden == true)) then
                                        return true
                                    end
                                    local v975 = false
                                    pcall(function()
                                        local v976 = v348.LocalPlayer
                                        local v977 = (v976.Character and v976.Character:FindFirstChild("HumanoidRootPart"))
                                        local v978 = workspace:FindFirstChild("Map")
                                        local v979 = (v978 and v978:FindFirstChild("Temple of Time"))
                                        local v980 = (v979 and v979:FindFirstChild("FFABorder"))
                                        local v981 = (v980 and v980:FindFirstChild("Forcefield"))
                                        local v982 = v976.PlayerGui:FindFirstChild("Main")
                                        local v983 = (v982 and v982:FindFirstChild("TopHUDList"))
                                        local v984 = (v983 and v983:FindFirstChild("RaidTimer"))
                                        local v985 = (v982 and v982:FindFirstChild("Timer"))
                                        local v986 = (v977 and ((v977.Position - Vector3.new(28310.0234, 14895.1123, 109.456741)).Magnitude < 2500))
                                        v975 = ((v986 and (((((v985 and (v985.Visible == true)) or (v984 and (v984.Visible == true))) or (v981 and (v981.Transparency == 0))) or (v966 == true)) or (_G.K4TrialLifecycle and (_G.K4TrialLifecycle.started == true)))) or false)
                                    end)
                                    return (v975 == true)
                                end
                                _G.K4DoorRecovery = {
                                    issuedForRound = "",
                                    scheduledId = "",
                                    handledId = "",
                                    active = false,
                                    allFiredRoundId = "",
                                    allFiredAt = 0,
                                    doorOpenTimeout = math.max(4, (tonumber(getgenv().Config["V3 Door Open Timeout"]) or 10)),
                                    respawnCountdown = math.max(0.5, (tonumber(getgenv().Config["V3 Respawn Countdown"]) or 2))
                                }
                                local v987 = math.max(15, (tonumber(getgenv().Config["Pair Temple Timeout"]) or 35))
                                local v988 = getgenv().Config["Pair Sticky Until Trial Complete"]
                                if (v988 == nil) then
                                    v988 = getgenv().Config["Pair Sticky Until Gear"]
                                end
                                local v989 = (v988 ~= false)
                                local v990 = (getgenv().Config["Pair Release After Trial"] ~= false)
                                local v991 = math.max(5, (tonumber(getgenv().Config["Pair Requeue Delay"]) or 15))
                                local v992 = math.max(0.25, (tonumber(getgenv().Config["Pair Force Temple Interval"]) or 0.8))
                                local v993 = math.max(10, (tonumber(getgenv().Config["V3 Door Distance"]) or 150))
                                local v996 = math.max(0.4, (tonumber(getgenv().Config["V3 File Poll"]) or 0.4))
                                local v999 = math.max(1, math.floor((tonumber(getgenv().Config["V3 Fire Count"]) or 1)))
                                local v1000 = math.max(0.03, (tonumber(getgenv().Config["V3 Fire Interval"]) or 0.05))
                                local v1001 = math.max(0.5, (tonumber(getgenv().Config["V3 Fire Window"]) or 6))
                                function _K4F.v1002()
                                    if (type(http_request) == "function") then
                                        return http_request
                                    end
                                    if (type(request) == "function") then
                                        return request
                                    end
                                    if ((type(syn) == "table") and (type(syn.request) == "function")) then
                                        return syn.request
                                    end
                                    if ((type(http) == "table") and (type(http.request) == "function")) then
                                        return http.request
                                    end
                                    return nil
                                end
                                function _K4F.v1003(v1004)
                                    return v347:JSONEncode(v1004)
                                end
                                function _K4F.v1005(v1006)
                                    return v347:JSONDecode(v1006)
                                end
                                function _K4F.v1007()
                                    if v396 then
                                        return "upgear"
                                    end
                                    if v395 then
                                        return "allies"
                                    end
                                    return "none"
                                end
                                _G.K4MatchNet = (_G.K4MatchNet or { busy = false, latencyMs = 0, lastError = "not_checked", lastOkAt = 0 })
                                function _K4F.v1008(v1009, v1010)
                                    if ((type(v1010) == "table") and (v1010.config_name == nil)) then
                                        v1010.config_name = K4_ConfigId()
                                        if (v1010.config_name == "") then
                                            v1010.config_name = "default"
                                        end
                                    end
                                    local v1011 = _K4F.v1002()
                                    if (not v1011) then
                                        _G.K4MatchNet.lastError = "request_unavailable"
                                        return nil
                                    end
                                    local v1012 = tick()
                                    local v1013, v1014 = pcall(function()
                                        return v1011({
                                            Url = (v943 .. v1009),
                                            Method = "POST",
                                            Timeout = math.max(2, (tonumber(getgenv().Config["Match Request Timeout"]) or 5)),
                                            Headers = { ["Content-Type"] = "application/json", Accept = "application/json", ["Cache-Control"] = "no-cache" },
                                            Body = _K4F.v1003(v1010)
                                        })
                                    end)
                                    _G.K4MatchNet.latencyMs = math.floor((((tick() - v1012) * 1000) + 0.5))
                                    if ((v1013 and v1014) and (v1014.Body or v1014.body)) then
                                        local v1015 = (v1014.Body or v1014.body)
                                        local v1016, v1017 = pcall(function()
                                            return _K4F.v1005(v1015)
                                        end)
                                        if (v1016 and (type(v1017) == "table")) then
                                            if (v1017.ok == true) then
                                                _G.K4MatchNet.lastError = "ok"
                                                _G.K4MatchNet.lastOkAt = tick()
                                            else
                                                _G.K4MatchNet.lastError = tostring((v1017.error or "api_rejected"))
                                            end
                                            return v1017
                                        end
                                        _G.K4MatchNet.lastError = "json_decode_failed"
                                        return nil
                                    end
                                    _G.K4MatchNet.lastError = ((v1013 and "empty_response") or "request_failed")
                                    return nil
                                end
                                _G.K4MoonHub = (_G.K4MoonHub or {
                                    apiUrl = tostring((getgenv().Config["Full Moon API"] or ((getgenv().K4_TOOL_API or "http://127.0.0.1:20425") .. "/fullmoon"))),
                                    maxCandidatePlayers = math.max(0, (tonumber(getgenv().Config["Full Moon Max Candidate Players"]) or 7)),
                                    pollInterval = math.max(0.5, (tonumber(getgenv().Config["Full Moon API Poll"]) or 1)),
                                    teleportCooldown = math.max(1.5, (tonumber(getgenv().Config["Moon Hub Teleport Cooldown"]) or 2)),
                                    lastFetchAt = 0,
                                    lastTeleportAt = 0,
                                    lastLeaveAt = 0,
                                    candidate = nil,
                                    pendingJob = "",
                                    pendingReason = "",
                                    seenActiveMoon = false,
                                    endSignal = false,
                                    endReason = "",
                                    endedJob = "",
                                    blacklist = {},
                                    watchedText = setmetatable({}, { __mode = "k" }),
                                    teleporting = false,
                                    pendingPlace = 0,
                                    pendingStartedAt = 0,
                                    lastApiError = "not_checked",
                                    lastApiStatus = 0,
                                    lastApiCount = 0,
                                    lastEligibleCount = 0,
                                    moonState = "Unknown",
                                    moonStatusText = "Moon: checking...",
                                    moonClockText = "00:00",
                                    moonCountdownType = "none",
                                    moonCountdownSeconds = (-1),
                                    endDeferredForTrial = false,
                                    mainJoinFailures = {}
                                })
                                _G.K4MoonHub.apiUrl = tostring((getgenv().Config["Full Moon API"] or ((getgenv().K4_TOOL_API or "http://127.0.0.1:20425") .. "/fullmoon")))
                                _G.K4MoonHub.maxCandidatePlayers = math.max(0, (tonumber(getgenv().Config["Full Moon Max Candidate Players"]) or 7))
                                _G.K4MoonHub.pollInterval = math.max(0.5, (tonumber(getgenv().Config["Full Moon API Poll"]) or 1))
                                _G.K4MoonHub.teleportCooldown = math.max(1.5, (tonumber(getgenv().Config["Moon Hub Teleport Cooldown"]) or 2))
                                _G.K4MoonHub.blacklist = (_G.K4MoonHub.blacklist or {})
                                _G.K4MoonHub.watchedText = (_G.K4MoonHub.watchedText or setmetatable({}, { __mode = "k" }))
                                _G.K4MoonHub.pendingStartedAt = (tonumber(_G.K4MoonHub.pendingStartedAt) or 0)
                                _G.K4MoonHub.lastFetchAt = 0
                                _G.K4MoonHub.candidate = nil
                                _G.K4MoonHub.attemptSeq = (tonumber(_G.K4MoonHub.attemptSeq) or 0)
                                _G.K4MoonHub.pendingAttemptId = (tonumber(_G.K4MoonHub.pendingAttemptId) or 0)
                                _G.K4MoonHub.nextTeleportAt = (tonumber(_G.K4MoonHub.nextTeleportAt) or 0)
                                _G.K4MoonHub.consecutiveFailures = (tonumber(_G.K4MoonHub.consecutiveFailures) or 0)
                                _G.K4MoonHub.lastFailureAt = (tonumber(_G.K4MoonHub.lastFailureAt) or 0)
                                _G.K4MoonHub.lastFailureKey = tostring((_G.K4MoonHub.lastFailureKey or ""))
                                _G.K4MoonHub.lastFailedJob = tostring((_G.K4MoonHub.lastFailedJob or ""))
                                local v1025 = "k4_hopped_fullmoon.json"
                                function _K4F.v1026()
                                    local v1027 = {}
                                    if (isfile and isfile(v1025)) then
                                        pcall(function()
                                            local v1028 = v347:JSONDecode(readfile(v1025))
                                            if (type(v1028) == "table") then
                                                local v1029 = tick()
                                                for v1030, v1031 in pairs(v1028) do
                                                    if ((type(v1031) == "number") and (v1031 > v1029)) then
                                                        v1027[tostring(v1030)] = v1031
                                                    end
                                                end
                                            end
                                        end)
                                    end
                                    return v1027
                                end
                                function _K4F.v1032()
                                    if writefile then
                                        pcall(function()
                                            writefile(v1025, v347:JSONEncode((_G.K4MoonHub.hopped or {})))
                                        end)
                                    end
                                end
                                _G.K4MoonHub.hopped = (_G.K4MoonHub.hopped or _K4F.v1026())
                                _K4MoonHubHoppedTTL = function()
                                    return math.max(600, (tonumber(getgenv().Config["Hopped Full Moon TTL Seconds"]) or 21600))
                                end
                                _K4MoonHubIsHopped = function(v1033)
                                    if ((not v1033) or (v1033 == "")) then
                                        return false
                                    end
                                    local v1034 = (_G.K4MoonHub.hopped and _G.K4MoonHub.hopped[tostring(v1033)])
                                    return ((type(v1034) == "number") and (v1034 > tick()))
                                end
                                _K4MoonHubMarkHopped = function(v1035)
                                    if ((not v1035) or (v1035 == "")) then
                                        return
                                    end
                                    _G.K4MoonHub.hopped = (_G.K4MoonHub.hopped or {})
                                    _G.K4MoonHub.hopped[tostring(v1035)] = (tick() + _K4MoonHubHoppedTTL())
                                    _K4F.v1032()
                                end
                                _K4MoonHubTextHasEnd = function(v1036)
                                    return ((type(v1036) == "string") and (string.find(string.lower(v1036), "the full moon ends", 1, true) ~= nil))
                                end
                                _K4MoonHubMarkEnded = function(v1037)
                                    _G.K4MoonHub.endSignal = true
                                    _G.K4MoonHub.endReason = tostring((v1037 or "detected"))
                                    _G.K4MoonHub.endedJob = tostring(game.JobId)
                                    local v1038 = (((getgenv().Config["Defer Moon Hop During Trial"] ~= false) and (type(_K4TrialCycleIsActive) == "function")) and (_K4TrialCycleIsActive() == true))
                                    if v1038 then
                                        _G.K4MoonHub.endDeferredForTrial = true
                                        _G.K4TrialLifecycle.endMoonPending = true
                                        _G.K4TrialLifecycle.endMoonReason = tostring((v1037 or "detected"))
                                        _G.K4TrialLifecycle.endMoonDetectedAt = tick()
                                    else
                                        _G.K4MoonHub.endDeferredForTrial = false
                                        _G.K4MoonHub.blacklist[tostring(game.JobId)] = (tick() + 20)
                                    end
                                    _G.K4MoonHub.candidate = nil
                                end
                                _K4MoonHubMoonTextureId = function()
                                    local v1039 = game:GetService("Lighting"):FindFirstChildOfClass("Sky")
                                    return ((v1039 and tostring((v1039.MoonTextureId or ""))) or "")
                                end
                                _K4MoonHubTextureIsFull = function()
                                    local v1040 = _K4MoonHubMoonTextureId()
                                    return (string.find(v1040, "9709149431", 1, true) ~= nil)
                                end
                                _K4MoonHubTextureIsNextNight = function()
                                    local v1041 = _K4MoonHubMoonTextureId()
                                    return (string.find(v1041, "9709149052", 1, true) ~= nil)
                                end
                                _G.K4MoonClock = (_G.K4MoonClock or {})
                                _K4MoonClockFormatSeconds = function(v1042)
                                    local v1043 = math.max(0, math.floor((tonumber(v1042) or 0)))
                                    local v1044 = math.floor((v1043 / 60))
                                    local v1045 = (v1043 % 60)
                                    if (v1044 > 0) then
                                        return (tostring(v1044) .. ("m " .. string.format("%02ds", v1045)))
                                    end
                                    return (tostring(v1045) .. "s")
                                end
                                _K4MoonClockSnapshot = function()
                                    local v1046 = game:GetService("Lighting")
                                    local v1047 = (tonumber(v1046.ClockTime) or 0)
                                    local v1048 = (math.floor(v1047) % 24)
                                    local v1049 = math.floor((((v1047 - math.floor(v1047)) * 60) + 0.5))
                                    if (v1049 >= 60) then
                                        v1049 = 0
                                        v1048 = ((v1048 + 1) % 24)
                                    end
                                    local v1050 = (tonumber(v1046:GetAttribute("MoonPhase")) or (-1))
                                    local v1051 = (_K4MoonHubTextureIsFull() or (v1050 == 5))
                                    local v1052 = _K4MoonHubTextureIsNextNight()
                                    local v1053 = false
                                    local v1054 = "Bad Moon"
                                    local v1055 = "none"
                                    local v1056 = (-1)
                                    if v1051 then
                                        if (v1047 <= 5) then
                                            v1053 = true
                                            v1054 = "Full Moon"
                                            v1055 = "end"
                                            v1056 = math.max(0, math.floor((((5 - v1047) * 60) + 0.5)))
                                        elseif (v1047 < 18) then
                                            v1054 = (((v1047 < 12) and "Fake Moon") or "Full Moon Soon")
                                            v1055 = "full"
                                            v1056 = math.max(0, math.floor((((18 - v1047) * 60) + 0.5)))
                                        else
                                            v1053 = true
                                            v1054 = "Full Moon"
                                            v1055 = "end"
                                            v1056 = math.max(0, math.floor((((30 - v1047) * 60) + 0.5)))
                                        end
                                    elseif v1052 then
                                        v1054 = "Next Night"
                                        v1055 = "full"
                                        if (v1047 <= 12) then
                                            v1056 = math.max(0, math.floor((((18 - v1047) * 60) + 0.5)))
                                        else
                                            v1056 = math.max(0, math.floor((((42 - v1047) * 60) + 0.5)))
                                        end
                                    end
                                    local v1057 = ""
                                    if (v1055 == "end") then
                                        v1057 = ("End in " .. _K4MoonClockFormatSeconds(v1056))
                                    elseif (v1055 == "full") then
                                        v1057 = ("Full in " .. _K4MoonClockFormatSeconds(v1056))
                                    end
                                    local v1058 = string.upper(v1054)
                                    if (v1057 ~= "") then
                                        v1058 = (v1058 .. (" | " .. v1057))
                                    end
                                    local v1059 = {
                                        state = v1054,
                                        active = v1053,
                                        phase = v1050,
                                        clock = v1047,
                                        clock_text = string.format("%02d:%02d", v1048, v1049),
                                        countdown_type = v1055,
                                        countdown_seconds = v1056,
                                        event_text = v1057,
                                        display = v1058,
                                        texture_id = _K4MoonHubMoonTextureId()
                                    }
                                    _G.K4MoonClock.last = v1059
                                    _G.K4MoonHub.moonState = v1054
                                    _G.K4MoonHub.moonStatusText = v1058
                                    _G.K4MoonHub.moonClockText = v1059.clock_text
                                    _G.K4MoonHub.moonCountdownType = v1055
                                    _G.K4MoonHub.moonCountdownSeconds = v1056
                                    return v1059
                                end
                                _K4MoonHubFullMoonNight = function()
                                    local v1060 = _K4MoonClockSnapshot()
                                    local v1061 = (v1060.active == true)
                                    if v1061 then
                                        _G.K4MoonHub.seenActiveMoon = true
                                        _G.K4MoonHub.endSignal = false
                                        _G.K4MoonHub.endReason = ""
                                        _G.K4MoonHub.endedJob = ""
                                        _G.K4MoonHub.endDeferredForTrial = false
                                    end
                                    return v1061
                                end
                                _K4MoonHubMoonLeadSeconds = function()
                                    local v1062 = (tonumber(getgenv().Config["Full Moon Lead Seconds"]) or 90)
                                    return math.max(0, math.min(360, v1062))
                                end
                                _K4MoonHubMoonImminent = function()
                                    local v1063 = _K4MoonClockSnapshot()
                                    if (v1063.active == true) then
                                        return false
                                    end
                                    if (tostring(v1063.countdown_type) ~= "full") then
                                        return false
                                    end
                                    local v1064 = tonumber(v1063.countdown_seconds)
                                    if ((not v1064) or (v1064 < 0)) then
                                        return false
                                    end
                                    return (v1064 <= _K4MoonHubMoonLeadSeconds())
                                end
                                _K4MoonHubMoonEnded = function()
                                    if _G.K4MoonHub.endSignal then
                                        return true
                                    end
                                    local v1065 = (tonumber(game:GetService("Lighting").ClockTime) or 0)
                                    if ((_G.K4MoonHub.seenActiveMoon and (v1065 >= 5)) and (v1065 < 12)) then
                                        _K4MoonHubMarkEnded("clock_reached_5")
                                        return true
                                    end
                                    return false
                                end
                                _K4MoonHubWatchTextObject = function(v1066)
                                    if ((not v1066) or _G.K4MoonHub.watchedText[v1066]) then
                                        return
                                    end
                                    if (not ((v1066:IsA("TextLabel") or v1066:IsA("TextButton")) or v1066:IsA("TextBox"))) then
                                        return
                                    end
                                    _G.K4MoonHub.watchedText[v1066] = true
                                    pcall(function()
                                        if _K4MoonHubTextHasEnd(v1066.Text) then
                                            _K4MoonHubMarkEnded("ui")
                                        end
                                        v1066:GetPropertyChangedSignal("Text"):Connect(function()
                                            if _K4MoonHubTextHasEnd(v1066.Text) then
                                                _K4MoonHubMarkEnded("ui")
                                            end
                                        end)
                                    end)
                                end
                                _K4MoonHubIsSea3Place = function(v1067)
                                    v1067 = tonumber(v1067)
                                    return ((v1067 == 7449423635) or (v1067 == 100117331123089))
                                end
                                _K4MoonHubPlaceAllowed = function(v1068)
                                    v1068 = tonumber(v1068)
                                    if (not v1068) then
                                        return false
                                    end
                                    if (v1068 == tonumber(game.PlaceId)) then
                                        return true
                                    end
                                    return (((getgenv().Config["Allow Sea3 Cross Place"] ~= false) and _K4MoonHubIsSea3Place(v1068)) and _K4MoonHubIsSea3Place(game.PlaceId))
                                end
                                K4JobCodec = (function()
                                    local v1069 = ((getgenv and getgenv()) or _G)
                                    local v1070 = {}
                                    local v1071 = {}
                                    local function v1072(v1073)
                                        return (((type(v1073) == "string") and (#v1073 == 36)) and (v1073:match("^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") ~= nil))
                                    end
                                    v1070.Request = function(v1074, v1075, v1076, v1077)
                                        if ((type(v1074) ~= "string") or (not v1074:match("^https://"))) then
                                            return nil, "HTTPS API URL required"
                                        end
                                        apiKey = "92b62b279e2d9869c739467fcfb54d01e5f35253c3f8e659cc4eaead65cf46de"
                                        if ((type(apiKey) ~= "string") or (#apiKey < 32)) then
                                            return nil, "Set HopApiKey first"
                                        end
                                        local v1078 = ((((syn and syn.request) or http_request) or request) or (http and http.request))
                                        if (type(v1078) ~= "function") then
                                            return nil, "HTTP request unavailable"
                                        end
                                        local v1079 = { Url = (v1074:gsub("/+$", "") .. v1076), Method = v1075, Headers = { ["Content-Type"] = "application/json", Authorization = ("Bearer " .. apiKey) } }
                                        if v1077 then
                                            v1079.Body = v347:JSONEncode(v1077)
                                        end
                                        local v1080, v1081 = pcall(v1078, v1079)
                                        if ((not v1080) or (type(v1081) ~= "table")) then
                                            return nil, "API request failed"
                                        end
                                        if (tonumber(v1081.StatusCode) ~= 200) then
                                            return nil, ("API HTTP " .. tostring(v1081.StatusCode))
                                        end
                                        local v1082, v1083 = pcall(v347.JSONDecode, v347, v1081.Body)
                                        if ((not v1082) or (type(v1083) ~= "table")) then
                                            return nil, "Invalid API response"
                                        end
                                        return v1083
                                    end
                                    v1070.Decode = function(v1084, v1085)
                                        if (((type(v1085) ~= "string") or (#v1085 > 512)) or (not v1085:match("^JID1%.[%w_-]+$"))) then
                                            return nil, "Invalid encoded Job ID"
                                        end
                                        local v1086, v1087 = v1070.Request(v1084, "POST", "/api/job-id/decode", { token = v1085 })
                                        if (not v1086) then
                                            return nil, v1087
                                        end
                                        if (not v1072(v1086.jobId)) then
                                            return nil, "Invalid decoded Job ID"
                                        end
                                        return v1086.jobId
                                    end
                                    v1070.Encode = function(v1088, v1089)
                                        if (not v1072(v1089)) then
                                            return nil, "Invalid Job ID"
                                        end
                                        local v1090, v1091 = v1070.Request(v1088, "POST", "/api/job-id/encode", { jobId = v1089 })
                                        if (not v1090) then
                                            return nil, v1091
                                        end
                                        return v1090.token
                                    end
                                    v1069.JobIdCodec = (v1069.JobIdCodec or v1070)
                                    v1070.Resolve = function(v1092)
                                        if v1072(v1092) then
                                            return v1092
                                        end
                                        if (((type(v1092) ~= "string") or (#v1092 > 512)) or (not v1092:match("^JID1%.[%w_-]+$"))) then
                                            return nil, "Invalid encoded Job ID"
                                        end
                                        local v1093 = (v1069.HopApiBaseUrl or tostring(((v1069.Config or {})["Full Moon API"] or "https://memaybeo.kurinian-hub.xyz")):match("^(https://[^/]+)"))
                                        local v1094 = (tostring(v1093) .. ("|" .. v1092))
                                        local v1095 = v1071[v1094]
                                        if (v1095 and (tick() < v1095.untilAt)) then
                                            return v1095.job, v1095.err
                                        end
                                        local v1096, v1097, v1098 = pcall(v1069.JobIdCodec.Decode, v1093, v1092)
                                        if (not v1096) then
                                            v1097, v1098 = nil, "Job ID decode failed"
                                        end
                                        if (v1097 and (not v1072(v1097))) then
                                            v1097, v1098 = nil, "Invalid decoded Job ID"
                                        end
                                        v1071[v1094] = { job = v1097, err = v1098, untilAt = (tick() + ((v1097 and 300) or 10)) }
                                        local v1099 = 0
                                        for v1100, v1101 in pairs(v1071) do
                                            if (tick() >= v1101.untilAt) then
                                                v1071[v1100] = nil
                                            else
                                                v1099 = (v1099 + 1)
                                            end
                                        end
                                        if (v1099 > 256) then
                                            v1071 = { __none__ = v1071[v1094] }
                                        end
                                        return v1097, v1098
                                    end
                                    return v1070
                                end)()
                                K4_MapCustomMoonJSON = function(v1102, v1103)
                                    if (type(v1103) ~= "table") then
                                        return v1102
                                    end
                                    local function v1104(v1105, v1106)
                                        if ((v1106 == "") or (v1106 == "$")) then
                                            return v1105
                                        end
                                        if (type(v1106) ~= "string") then
                                            return nil
                                        end
                                        local v1107 = v1105
                                        v1106 = v1106:gsub("^%$%.", "")
                                        for v1108 in v1106:gmatch("[^%.]+") do
                                            if (type(v1107) ~= "table") then
                                                return nil
                                            end
                                            local v1109 = v1107[v1108]
                                            if (v1109 == nil) then
                                                v1109 = v1107[tonumber(v1108)]
                                            end
                                            v1107 = v1109
                                        end
                                        return v1107
                                    end
                                    if (v1103.Success ~= nil) then
                                        local v1110 = v1103.SuccessValue
                                        if (v1110 == nil) then
                                            v1110 = true
                                        end
                                        if (v1104(v1102, v1103.Success) ~= v1110) then
                                            return nil, "Custom API success check failed"
                                        end
                                    end
                                    local v1111
                                    if (v1103.List ~= nil) then
                                        v1111 = v1104(v1102, v1103.List)
                                    else
                                        v1111 = ((v1102.data or v1102.servers) or v1102)
                                    end
                                    if (type(v1111) ~= "table") then
                                        return nil, "APIJson.List did not resolve to a server list"
                                    end
                                    local v1112 = (((type(v1103.Fields) == "table") and v1103.Fields) or {})
                                    local v1113 = (((type(v1103.Defaults) == "table") and v1103.Defaults) or {})
                                    local v1114 = {}
                                    local v1115 = {
                                        "jobId",
                                        "placeId",
                                        "players",
                                        "maxPlayers",
                                        "moon",
                                        "age",
                                        "world",
                                        "uptime",
                                        "time",
                                        "source"
                                    }
                                    for v1116, v1117 in ipairs(v1111) do
                                        if (type(v1117) == "table") then
                                            local v1118 = {}
                                            for v1119, v1120 in ipairs(v1115) do
                                                local v1121 = v1112[v1120]
                                                if (v1121 == nil) then
                                                    v1121 = v1120
                                                end
                                                local v1122
                                                if (v1121 ~= false) then
                                                    v1122 = v1104(v1117, v1121)
                                                end
                                                if (v1122 == nil) then
                                                    v1122 = v1113[v1120]
                                                end
                                                v1118[v1120] = v1122
                                            end
                                            if ((type(v1103.MoonValues) == "table") and (v1118.moon ~= nil)) then
                                                v1118.moon = (v1103.MoonValues[tostring(v1118.moon)] or v1118.moon)
                                            end
                                            table.insert(v1114, v1118)
                                        end
                                    end
                                    return { success = true, data = v1114 }
                                end
                                K4_RequestRobloxServers = function()
                                    local v1123, v1124 = {}, {}
                                    local v1125
                                    local v1126 = ((((syn and syn.request) or http_request) or request) or (http and http.request))
                                    for v1127 = 1, 3 do
                                        local v1128 = ("https://games.roblox.com/v1/games/" .. (tostring(game.PlaceId) .. "/servers/Public?sortOrder=Asc&limit=100&excludeFullGames=true"))
                                        if v1125 then
                                            v1128 = (v1128 .. ("&cursor=" .. v347:UrlEncode(v1125)))
                                        end
                                        local v1130, v1131 = pcall(function()
                                            if (type(v1126) == "function") then
                                                local v1129 = v1126({ Url = v1128, Method = "GET", Headers = { Accept = "application/json" } })
                                                if ((type(v1129) ~= "table") or (tonumber((v1129.StatusCode or v1129.Status)) ~= 200)) then
                                                    error(("Roblox server API HTTP " .. tostring((((type(v1129) == "table") and (v1129.StatusCode or v1129.Status)) or "unknown"))))
                                                end
                                                return v1129.Body
                                            end
                                            return game:HttpGet(v1128)
                                        end)
                                        if (not v1130) then
                                            if (#v1123 > 0) then
                                                break
                                            end
                                            return nil, tostring(v1131)
                                        end
                                        local v1132, v1133 = pcall(v347.JSONDecode, v347, v1131)
                                        if (((not v1132) or (type(v1133) ~= "table")) or (type(v1133.data) ~= "table")) then
                                            if (#v1123 > 0) then
                                                break
                                            end
                                            return nil, "Invalid Roblox server list"
                                        end
                                        for v1134, v1135 in ipairs(v1133.data) do
                                            local v1136 = ((type(v1135) == "table") and v1135.id)
                                            local v1137 = ((type(v1135) == "table") and tonumber(v1135.playing))
                                            local v1138 = ((type(v1135) == "table") and tonumber(v1135.maxPlayers))
                                            if (((((((type(v1136) == "string") and (v1136 ~= "")) and (v1136 ~= game.JobId)) and (not v1124[v1136])) and v1137) and v1138) and (v1137 < v1138)) then
                                                v1124[v1136] = true
                                                table.insert(v1123, {
                                                    jobId = v1136,
                                                    placeId = game.PlaceId,
                                                    players = v1137,
                                                    maxPlayers = v1138,
                                                    source = "Roblox"
                                                })
                                            end
                                        end
                                        v1125 = ((((type(v1133.nextPageCursor) == "string") and (v1133.nextPageCursor ~= "")) and v1133.nextPageCursor) or nil)
                                        if (not v1125) then
                                            break
                                        end
                                        task.wait(0.3)
                                    end
                                    return { success = true, data = v1123 }
                                end
                                K4_RequestMoonList = function()
                                    local v1139 = getgenv()
                                    local v1140 = (v1139.Config or {})
                                    if (v1140.Hop == "Roblox") then
                                        return K4_RequestRobloxServers()
                                    end
                                    local v1141 = ("/api/bloxfruit/" .. (((v1140.HopMethod == "NearMoon") and "nearmoon") or "fullmoon"))
                                    return v1139.JobIdCodec.Request((v1139.HopApiBaseUrl or "https://memaybeo.kurinian-hub.xyz"), "GET", v1141)
                                end
                                _K4MoonHubFetchCandidateOnce = function(v1142)
                                    if (not v395) then
                                        return nil
                                    end
                                    if ((((getgenv().Config["Defer Moon Hop During Trial"] ~= false) and (_G.K4MoonHub.endSignal == true)) and (type(_K4TrialCycleIsActive) == "function")) and (_K4TrialCycleIsActive() == true)) then
                                        _G.K4MoonHub.lastApiError = "deferred_until_trial_complete"
                                        return _G.K4MoonHub.candidate
                                    end
                                    if ((((not v1142) and _K4MoonHubFullMoonNight()) and (not _K4MoonHubMoonEnded())) and (tick() >= (tonumber(_G.K4MoonHub.blacklist[tostring(game.JobId)]) or 0))) then
                                        return _G.K4MoonHub.candidate
                                    end
                                    if ((not v1142) and ((tick() - (_G.K4MoonHub.lastFetchAt or 0)) < _G.K4MoonHub.pollInterval)) then
                                        return _G.K4MoonHub.candidate
                                    end
                                    _G.K4MoonHub.lastFetchAt = tick()
                                    _G.K4MoonHub.lastApiError = "requesting"
                                    _G.K4MoonHub.lastApiStatus = 0
                                    local v1143, v1144, v1145 = pcall(K4_RequestMoonList)
                                    if (((not v1143) or (type(v1144) ~= "table")) or (v1144.success == false)) then
                                        _G.K4MoonHub.candidate = nil
                                        _G.K4MoonHub.lastApiError = ((v1143 and ((v1145 or (v1144 and v1144.error)) or "Invalid API response")) or "API request failed")
                                        _G.K4MoonHub.lastApiCount = 0
                                        _G.K4MoonHub.lastEligibleCount = 0
                                        return nil
                                    end
                                    _G.K4MoonHub.lastApiStatus = 200
                                    local v1146 = (((v1144.data or v1144.servers) or (v1144[1] and v1144)) or ((next(v1144) == nil) and {}))
                                    if (type(v1146) ~= "table") then
                                        _G.K4MoonHub.candidate = nil
                                        _G.K4MoonHub.lastApiError = "api_data_invalid"
                                        _G.K4MoonHub.lastApiCount = 0
                                        _G.K4MoonHub.lastEligibleCount = 0
                                        return nil
                                    end
                                    _G.K4MoonHub.lastApiCount = (tonumber(v1144.total) or #v1146)
                                    local v1147 = {}
                                    local v1148 = _K4MoonHubFullMoonNight()
                                    local v1149 = math.max(0, (tonumber(getgenv().Config["Full Moon Max Age Seconds"]) or 180))
                                    local function v1150(v1151)
                                        v1151 = tostring((v1151 or "")):match("^%s*(.-)%s*$")
                                        local v1152, v1153, v1154 = v1151:match("^(%d+):(%d+):(%d+)$")
                                        if v1152 then
                                            return ((((tonumber(v1152) or 0) * 3600) + ((tonumber(v1153) or 0) * 60)) + (tonumber(v1154) or 0))
                                        end
                                        local v1155, v1156 = v1151:match("^(%d+):(%d+)$")
                                        if v1155 then
                                            return (((tonumber(v1155) or 0) * 60) + (tonumber(v1156) or 0))
                                        end
                                        local v1157 = v1151:match("^(%d+)$")
                                        if v1157 then
                                            return tonumber(v1157)
                                        end
                                        return nil
                                    end
                                    for v1158, v1159 in ipairs(v1146) do
                                        if (type(v1159) == "table") then
                                            local v1160 = tostring((((v1159.jobId or v1159.jobid) or v1159.joinId) or ""))
                                            local v1161 = (tonumber((v1159.placeId or v1159.placeid)) or tonumber(game.PlaceId))
                                            local v1162 = (tonumber(v1159.players) or tonumber(tostring((v1159.players or "")):match("(%d+)")))
                                            local v1163 = tonumber((v1159.maxPlayers or v1159.maxplayers))
                                            local v1164 = tostring((v1159.moon or ""))
                                            local v1165 = tostring((v1159.world or ""))
                                            local v1166 = tostring((v1159.uptime or ""))
                                            local v1167 = tonumber(v1159.time)
                                            local v1168 = tostring((v1159.source or ""))
                                            local v1169 = tostring((v1159.age or ""))
                                            local v1170 = (_G.K4MoonHub.blacklist[v1160] or 0)
                                            local v1171 = string.lower(v1164)
                                            local v1172 = v1171:gsub("%s+", "")
                                            local v1173 = ((v1172 == "fullmoon") or (v1171:find("8/8", 1, true) ~= nil))
                                            local v1174 = ((not v1163) or (v1162 and (v1162 < v1163)))
                                            local v1175 = (v1150(v1169) or (((v1169 == "") and 0) or nil))
                                            local v1176 = (v1175 and (v1175 < v1149))
                                            if (((((((((((v1160 ~= "") and v1161) and v1162) and (((v1164 == "") or (getgenv().Config.HopMethod == "NearMoon")) or v1173)) and v1174) and v1176) and _K4MoonHubPlaceAllowed(v1161)) and (v1162 <= _G.K4MoonHub.maxCandidatePlayers)) and (tick() >= v1170)) and (not _K4MoonHubIsHopped(v1160))) and (not (((not v1148) or _K4MoonHubMoonEnded()) and (v1160 == tostring(game.JobId))))) then
                                                table.insert(v1147, {
                                                    jobid = v1160,
                                                    placeid = v1161,
                                                    players = v1162,
                                                    maxplayers = v1163,
                                                    moon = v1164,
                                                    world = v1165,
                                                    uptime = v1166,
                                                    time = v1167,
                                                    source = v1168,
                                                    age = v1169,
                                                    age_seconds = v1175
                                                })
                                            end
                                        end
                                    end
                                    table.sort(v1147, function(v1177, v1178)
                                        if (v1177.players ~= v1178.players) then
                                            return (v1177.players < v1178.players)
                                        end
                                        if (v1177.placeid ~= v1178.placeid) then
                                            return (v1177.placeid < v1178.placeid)
                                        end
                                        return (v1177.jobid < v1178.jobid)
                                    end)
                                    _G.K4MoonHub.lastEligibleCount = #v1147
                                    _G.K4MoonHub.candidate = nil
                                    local v1179 = nil
                                    local v1180 = 0
                                    for v1181, v1182 in ipairs(v1147) do
                                        v1180 = (v1180 + 1)
                                        if (v1180 > 5) then
                                            break
                                        end
                                        local v1183, v1184 = K4JobCodec.Resolve(v1182.jobid)
                                        if v1183 then
                                            if (((tick() >= (tonumber(_G.K4MoonHub.blacklist[v1183]) or 0)) and (not _K4MoonHubIsHopped(v1183))) and (v1183 ~= tostring(game.JobId))) then
                                                v1182.jobid = v1183
                                                _G.K4MoonHub.candidate = v1182
                                                break
                                            end
                                        else
                                            v1179 = v1184
                                            if tostring(v1184):find("HTTP 429", 1, true) then
                                                break
                                            end
                                        end
                                    end
                                    if _G.K4MoonHub.candidate then
                                        _G.K4MoonHub.lastApiError = "ok"
                                    else
                                        _G.K4MoonHub.lastApiError = (v1179 or ("no_eligible_server_place_" .. tostring(game.PlaceId)))
                                    end
                                    return _G.K4MoonHub.candidate
                                end
                                _K4MoonHubFetchCandidate = function(v1185)
                                    local v1186 = _G.K4MoonHub
                                    if (v1186.fetchBusy or (tick() < (v1186.nextFetchAt or 0))) then
                                        return v1186.candidate
                                    end
                                    v1186.fetchBusy = true
                                    local v1187, v1188 = pcall(_K4MoonHubFetchCandidateOnce, v1185)
                                    v1186.fetchBusy = false
                                    if (not v1187) then
                                        v1186.lastApiError = "API request failed"
                                    end
                                    local v1189 = math.max(1, (tonumber(v1186.pollInterval) or 1))
                                    if tostring(v1186.lastApiError):find("HTTP 429", 1, true) then
                                        v1186.rateLimitDelay = math.min(120, math.max(15, ((v1186.rateLimitDelay or 0) * 2)))
                                        v1189 = v1186.rateLimitDelay
                                    elseif (v1186.lastApiError == "ok") then
                                        v1186.rateLimitDelay = 0
                                    end
                                    v1186.nextFetchAt = (tick() + v1189)
                                    return ((v1187 and v1188) or v1186.candidate)
                                end
                                _K4MoonHubHelperRaceUnlocked = function()
                                    local v1190 = v348.LocalPlayer.Character
                                    return ((v1190 ~= nil) and (v1190:FindFirstChild("RaceTransformed") ~= nil))
                                end
                                _K4MoonHubDriveHelpPriority = function()
                                    if ((not v395) or (getgenv().Config["Help Search Full Moon Priority"] == false)) then
                                        return false
                                    end
                                    if (((_K4MoonHubMoonEnded() and (getgenv().Config["Defer Moon Hop During Trial"] ~= false)) and (type(_K4TrialCycleIsActive) == "function")) and (_K4TrialCycleIsActive() == true)) then
                                        _G.K4TrialLifecycle.endMoonPending = true
                                        _G.K4TrialLifecycle.endMoonReason = tostring((_G.K4MoonHub.endReason or "moon_ended"))
                                        if (type(status) == "function") then
                                            status("Full Moon ended - finishing current Trial before Help hops")
                                        end
                                        return false
                                    end
                                    local v1191 = ((v948 and tostring((v948.target_job_id or ""))) or "")
                                    local v1192 = ((v948 and tonumber(((v948.target_place_id or v948.hub_place_id) or v948.main_place_id))) or tonumber(game.PlaceId))
                                    local v1193 = ((v1191 ~= "") and (v1191 ~= tostring(game.JobId)))
                                    if (K4TyrantFarmController and K4TyrantFarmController.IsActive()) then
                                        pcall(K4TyrantFarmController.Stop)
                                    end
                                    if v719 then
                                        v719.AutoClickEnabled = false
                                    end
                                    if v1193 then
                                        if (type(status) == "function") then
                                            status(("Help joining shared Full Moon hub | Place " .. tostring(v1192)))
                                        end
                                        _K4MoonHubTeleport(v1191, "web_shared_hub", v1192)
                                        return true
                                    end
                                    if (_K4MoonHubFullMoonNight() and (not _K4MoonHubMoonEnded())) then
                                        return false
                                    end
                                    if _K4MoonHubMoonImminent() then
                                        if (type(status) == "function") then
                                            status(string.format("Full Moon in %s - Help holding this server", _K4MoonClockFormatSeconds(_K4MoonClockSnapshot().countdown_seconds)))
                                        end
                                        return false
                                    end
                                    local v1194 = (_G.K4MoonHub.candidate or _K4MoonHubFetchCandidate(false))
                                    if (v1194 and ((v1194.jobid ~= tostring(game.JobId)) or (tonumber(v1194.placeid) ~= tonumber(game.PlaceId)))) then
                                        if (type(status) == "function") then
                                            status(string.format("Help found Full Moon: %d players | Place %s | hopping...", (v1194.players or 0), tostring((v1194.placeid or "?"))))
                                        end
                                        _K4MoonHubTeleport(v1194.jobid, "api_lowest_players", v1194.placeid)
                                    else
                                        if (type(status) == "function") then
                                            status(("Help searching Full Moon API | " .. (tostring((_G.K4MoonHub.lastApiError or "unknown")) .. (" | API=" .. (tostring((_G.K4MoonHub.lastApiCount or 0)) .. (" eligible=" .. (tostring((_G.K4MoonHub.lastEligibleCount or 0)) .. (" | Place=" .. tostring(game.PlaceId)))))))))
                                        end
                                    end
                                    return true
                                end
                                _K4TeleportResultName = function(v1195)
                                    local v1196 = tostring((v1195 or "Unknown"))
                                    local v1197 = string.match(v1196, "Enum%.TeleportResult%.(.+)")
                                    return (v1197 or v1196)
                                end
                                _K4MoonHubFailureTTL = function(v1198, v1199, v1200)
                                    local v1201 = string.lower(table.concat({ tostring((v1198 or "")), tostring((v1199 or "")), tostring((v1200 or "")) }, " "))
                                    if (((((string.find(v1201, "gameended", 1, true) or string.find(v1201, "no longer available", 1, true)) or string.find(v1201, "error code: 771", 1, true)) or string.find(v1201, "restricted", 1, true)) or string.find(v1201, "unauthorized", 1, true)) or string.find(v1201, "error code: 773", 1, true)) then
                                        return math.max(300, (tonumber(getgenv().Config["Dead Hub Blacklist Seconds"]) or 1800)), true
                                    end
                                    if (string.find(v1201, "gamefull", 1, true) or string.find(v1201, "full", 1, true)) then
                                        return 60, false
                                    end
                                    if string.find(v1201, "timeout", 1, true) then
                                        return 120, false
                                    end
                                    return 180, false
                                end
                                _K4MoonHubClearPending = function(v1202)
                                    if (v1202 and (tonumber((_G.K4MoonHub.pendingAttemptId or 0)) ~= tonumber(v1202))) then
                                        return false
                                    end
                                    _G.K4MoonHub.pendingJob = ""
                                    _G.K4MoonHub.pendingPlace = 0
                                    _G.K4MoonHub.pendingStartedAt = 0
                                    _G.K4MoonHub.pendingAttemptId = 0
                                    _G.K4MoonHub.pendingReason = ""
                                    _G.K4MoonHub.teleporting = false
                                    return true
                                end
                                _K4MoonHubIsAssignedMainJoin = function(v1203)
                                    local v1204 = ((v948 and tostring((v948.target_job_id or ""))) or "")
                                    if ((v1204 == "") and v948) then
                                        v1204 = tostring(((v948.hub_job_id or v948.main_job_id) or ""))
                                    end
                                    return (((((((v396 and v948) and (v948.assigned == true)) and (tostring((v948.main_username or "")) == v945)) and (tostring((v948.group_id or "")) ~= "")) and (tostring((v948.turn_token or "")) ~= "")) and (v1204 == tostring(v1203))) and (tostring(v1203) ~= tostring(game.JobId)))
                                end
                                _K4MoonHubReportFailure = function(v1205, v1206, v1207, v1208, v1209, v1210, v1211)
                                    v1205 = tostring((v1205 or ""))
                                    if (v1205 == "") then
                                        return
                                    end
                                    local v1212 = {
                                        job_id = v1205,
                                        place_id = (tonumber(v1206) or 0),
                                        username = v945,
                                        role = _K4F.v1007(),
                                        reason = tostring((v1207 or "teleport_failed")),
                                        teleport_result = tostring((v1208 or "Unknown")),
                                        error_message = tostring((v1209 or "")),
                                        terminal = (v1210 == true),
                                        group_id = ((v948 and tostring((v948.group_id or ""))) or ""),
                                        turn_token = ((v948 and tostring((v948.turn_token or ""))) or ""),
                                        source_job_id = tostring(game.JobId),
                                        attempt_id = (((tonumber(v1211) and (tonumber(v1211) > 0)) and (tostring(game.JobId) .. (":" .. tostring(v1211)))) or ""),
                                        main_hub_join = (_K4MoonHubIsAssignedMainJoin(v1205) == true)
                                    }
                                    if ((v1212.main_hub_join and (not _K4MoonHubFailureIsClientSide(v1207, v1208, v1209))) and (v1212.attempt_id ~= "")) then
                                        v1212.attempt_ids = {}
                                        for v1213, v1214 in ipairs((_G.K4MoonHub.mainJoinAttemptIds or {})) do
                                            v1212.attempt_ids[(#v1212.attempt_ids + 1)] = v1214
                                        end
                                        _G.K4MoonHub.pendingJoinReport = v1212
                                    end
                                    task.spawn(function()
                                        for v1215 = 1, 3 do
                                            local v1216, v1217 = pcall(_K4F.v1008, "/hub/fail", v1212)
                                            if ((v1216 and v1217) and v1217.ok) then
                                                break
                                            end
                                            if (v1215 < 3) then
                                                task.wait(1)
                                            end
                                        end
                                    end)
                                end
                                _K4MoonHubFailureIsClientSide = function(v1218, v1219, v1220)
                                    local v1221 = string.lower(table.concat({ tostring((v1218 or "")), tostring((v1219 or "")), tostring((v1220 or "")) }, " "))
                                    return (string.find(v1221, "isteleporting", 1, true) ~= nil)
                                end
                                _K4MoonHubHandleFailure = function(v1222, v1223, v1224, v1225, v1226, v1227)
                                    v1222 = tostring(((v1222 or _G.K4MoonHub.pendingJob) or ""))
                                    v1223 = ((tonumber(v1223) or tonumber(_G.K4MoonHub.pendingPlace)) or tonumber(game.PlaceId))
                                    if (v1222 == "") then
                                        return false
                                    end
                                    if ((v1227 ~= nil) and ((tonumber(v1227) or 0) <= 0)) then
                                        return false
                                    end
                                    local v1228 = table.concat({ v1222, tostring((v1224 or "")), tostring((v1225 or "")) }, "|")
                                    if ((_G.K4MoonHub.lastFailureKey == v1228) and ((tick() - (tonumber(_G.K4MoonHub.lastFailureAt) or 0)) < 1.25)) then
                                        return false
                                    end
                                    if (v1227 and (tonumber((_G.K4MoonHub.pendingAttemptId or 0)) ~= tonumber(v1227))) then
                                        return false
                                    end
                                    if _K4MoonHubFailureIsClientSide(v1224, v1225, v1226) then
                                        local v1229 = _G.K4MoonHub
                                        v1229.lastFailureKey = v1228
                                        v1229.lastFailureAt = tick()
                                        v1229.clientBusyCount = math.min(30, ((tonumber(v1229.clientBusyCount) or 0) + 1))
                                        local v1230 = math.min(60, (2 ^ math.min(6, v1229.clientBusyCount)))
                                        v1229.nextTeleportAt = math.max((tonumber(v1229.nextTeleportAt) or 0), (tick() + v1230))
                                        if ((type(v1229.hopped) == "table") and (v1229.hopped[v1222] ~= nil)) then
                                            v1229.hopped[v1222] = nil
                                            if (type(_K4F.v1032) == "function") then
                                                pcall(_K4F.v1032)
                                            end
                                        end
                                        v1229.lastApiError = "client_busy_isteleporting"
                                        _K4MoonHubClearPending(v1227)
                                        _K4MoonHubReportFailure(v1222, v1223, v1224, v1225, v1226, false, v1227)
                                        if (type(status) == "function") then
                                            status(string.format("Roblox chua cho teleport (acc dang bay do) - cho %ds | lan %d lien tiep", math.floor(v1230), v1229.clientBusyCount))
                                        end
                                        return false
                                    end
                                    local v1231, v1232 = _K4MoonHubFailureTTL(v1224, v1225, v1226)
                                    _G.K4MoonHub.lastFailureKey = v1228
                                    _G.K4MoonHub.lastFailureAt = tick()
                                    _G.K4MoonHub.lastFailedJob = v1222
                                    _G.K4MoonHub.consecutiveFailures = math.min(10, ((tonumber(_G.K4MoonHub.consecutiveFailures) or 0) + 1))
                                    _G.K4MoonHub.blacklist[v1222] = math.max((tonumber(_G.K4MoonHub.blacklist[v1222]) or 0), (tick() + v1231))
                                    if _K4MoonHubIsAssignedMainJoin(v1222) then
                                        local v1233 = (tostring(v948.group_id) .. ("|" .. v1222))
                                        if (_G.K4MoonHub.mainJoinFailureScope ~= v1233) then
                                            _G.K4MoonHub.mainJoinFailureScope = v1233
                                            _G.K4MoonHub.mainJoinFailures = {}
                                            _G.K4MoonHub.mainJoinAttemptIds = {}
                                        end
                                        local v1234 = (tostring(game.JobId) .. (":" .. tostring(v1227)))
                                        if (#_G.K4MoonHub.mainJoinAttemptIds < 3) then
                                            table.insert(_G.K4MoonHub.mainJoinAttemptIds, v1234)
                                        end
                                        local v1235 = ((tonumber(_G.K4MoonHub.mainJoinFailures[v1222]) or 0) + 1)
                                        _G.K4MoonHub.mainJoinFailures[v1222] = v1235
                                        local v1236 = (((v1235 >= 3) and 600) or math.max(1.5, (tonumber(getgenv().Config["Moon Hub Retry Delay"]) or 2.5)))
                                        _G.K4MoonHub.blacklist[v1222] = (tick() + v1236)
                                        if ((v1235 >= 3) and (type(status) == "function")) then
                                            status("Main join failed 3 times - asking both Help to blacklist this hub and find another")
                                        end
                                    end
                                    _G.K4MoonHub.nextTeleportAt = (tick() + math.max(1.5, (tonumber(getgenv().Config["Moon Hub Retry Delay"]) or 2.5)))
                                    _G.K4MoonHub.candidate = nil
                                    _G.K4MoonHub.lastFetchAt = 0
                                    _G.K4MoonHub.lastApiError = ("teleport_failed_" .. string.lower(tostring(((v1225 or v1224) or "unknown"))):gsub("[^%w_%-]", "_"))
                                    _K4MoonHubClearPending(v1227)
                                    _K4MoonHubReportFailure(v1222, v1223, v1224, v1225, v1226, v1232, v1227)
                                    if (type(status) == "function") then
                                        status(("Teleport failed (" .. (tostring(((v1225 or v1224) or "unknown")) .. ") - selecting another Full Moon server")))
                                    end
                                    if v395 then
                                        task.spawn(function()
                                            task.wait(math.max(0.25, (tonumber(getgenv().Config["Moon Hub Retry Delay"]) or 2.5)))
                                            if (not _G.K4MoonHub.teleporting) then
                                                pcall(function()
                                                    _K4MoonHubFetchCandidate(true)
                                                end)
                                            end
                                        end)
                                    end
                                    return true
                                end
                                _K4MoonHubTeleport = function(v1237, v1238, v1239)
                                    v1237 = tostring((v1237 or ""))
                                    if (v396 and (((v1238 == "main_join_hub") or (v1238 == "main_admitted")) or (v1238 == "web_hub"))) then
                                        local v1240, v1241 = pcall(function()
                                            return getV4Status(false)
                                        end)
                                        if (((v1240 and v1241) and (v1241.needsTraining == true)) and (not v1241.canTrial)) then
                                            if (type(status) == "function") then
                                                status("Main dang training gear - khong hop Full Moon cho toi khi train xong!")
                                            end
                                            warn("[K4] Main dang training (chua trialable) - chan hop server Full Moon!")
                                            return false
                                        end
                                    end
                                    if (((v396 and (v1237 ~= "")) and (v1237 ~= tostring(game.JobId))) and (((v1238 == "main_join_hub") or (v1238 == "main_admitted")) or (v1238 == "web_hub"))) then
                                        local v1242, v1243 = pcall(function()
                                            return getV4Status(false)
                                        end)
                                        if ((v1242 and v1243) and v1243.canTrial) then
                                            if ((type(K4_PrepareGreatTreeBeforeMoon) ~= "function") or (not K4_PrepareGreatTreeBeforeMoon())) then
                                                return false
                                            end
                                        end
                                    end
                                    v1239 = (tonumber(v1239) or tonumber(game.PlaceId))
                                    local v1244 = _G.K4PostTrialReset
                                    if (v1244 and K4_PostTrialLockPending()) then
                                        local v1245 = ((v396 and (v1244.mainGearClaimed ~= true)) or (v395 and (v1244.selfResetConfirmed ~= true)))
                                        if v1245 then
                                            if (type(status) == "function") then
                                                status(((v396 and "Post-Trial lock: Main must claim gear successfully before leaving") or "Post-Trial lock: Help must finish its reset before leaving"))
                                            end
                                            return false
                                        end
                                    end
                                    if ((v1237 == "") or (v1237 == tostring(game.JobId))) then
                                        _K4MoonHubClearPending()
                                        return false
                                    end
                                    if (not _K4MoonHubPlaceAllowed(v1239)) then
                                        _G.K4MoonHub.lastApiError = ("target_place_not_allowed_" .. tostring(v1239))
                                        _K4MoonHubReportFailure(v1237, v1239, "place_not_allowed", "RestrictedPlace", "Target PlaceId is not allowed", true)
                                        _G.K4MoonHub.blacklist[v1237] = (tick() + 1800)
                                        return false
                                    end
                                    local v1246 = math.max(5, (tonumber(getgenv().Config["Moon Hub Teleport Timeout"]) or 8))
                                    if _G.K4MoonHub.teleporting then
                                        local v1247 = (tick() - (tonumber(_G.K4MoonHub.pendingStartedAt) or 0))
                                        if (v1247 < v1246) then
                                            return false
                                        end
                                        _K4MoonHubHandleFailure(_G.K4MoonHub.pendingJob, _G.K4MoonHub.pendingPlace, "attempt_timeout", "Timeout", "Previous teleport attempt did not start", _G.K4MoonHub.pendingAttemptId)
                                    end
                                    if (tick() < (tonumber(_G.K4MoonHub.nextTeleportAt) or 0)) then
                                        return false
                                    end
                                    if ((tick() - (tonumber(_G.K4MoonHub.lastTeleportAt) or 0)) < _G.K4MoonHub.teleportCooldown) then
                                        return false
                                    end
                                    if (tick() < (tonumber(_G.K4MoonHub.blacklist[v1237]) or 0)) then
                                        return false
                                    end
                                    _G.K4MoonHub.attemptSeq = ((tonumber(_G.K4MoonHub.attemptSeq) or 0) + 1)
                                    local v1248 = _G.K4MoonHub.attemptSeq
                                    _G.K4MoonHub.lastTeleportAt = tick()
                                    _G.K4MoonHub.pendingJob = v1237
                                    _G.K4MoonHub.pendingPlace = v1239
                                    _G.K4MoonHub.pendingReason = tostring((v1238 or "moon_hub"))
                                    _G.K4MoonHub.pendingStartedAt = tick()
                                    _G.K4MoonHub.pendingAttemptId = v1248
                                    _G.K4MoonHub.teleporting = true
                                    local v1256 = task.spawn(function()
                                        local v1249, v1250 = false, ""
                                        if (v1239 == tonumber(game.PlaceId)) then
                                            local v1252, v1253 = pcall(function()
                                                local v1251 = v349:WaitForChild("__ServerBrowser", 5)
                                                if (not v1251) then
                                                    error("ServerBrowser missing")
                                                end
                                                return v1251:InvokeServer("teleport", v1237)
                                            end)
                                            v1249 = (v1252 and (v1253 ~= false))
                                            if (not v1252) then
                                                v1250 = tostring(v1253)
                                            end
                                        else
                                            local v1254, v1255 = pcall(function()
                                                v354:TeleportToPlaceInstance(v1239, v1237, v348.LocalPlayer)
                                            end)
                                            v1249 = v1254
                                            if (not v1254) then
                                                v1250 = tostring(v1255)
                                            end
                                        end
                                        if (tonumber((_G.K4MoonHub.pendingAttemptId or 0)) ~= v1248) then
                                            return
                                        end
                                        if (not v1249) then
                                            _K4MoonHubHandleFailure(v1237, v1239, "teleport_call_failed", "CallFailed", v1250, v1248)
                                        end
                                    end)
                                    task.spawn(function()
                                        task.wait(v1246)
                                        if (((tostring(game.JobId) == tostring(v944)) and (tonumber((_G.K4MoonHub.pendingAttemptId or 0)) == v1248)) and (tostring((_G.K4MoonHub.pendingJob or "")) == v1237)) then
                                            pcall(task.cancel, v1256)
                                            _K4MoonHubHandleFailure(v1237, v1239, "attempt_timeout", "Timeout", "Teleport did not leave the current JobId", v1248)
                                        end
                                    end)
                                    return true
                                end
                                _G.K4TrainingHop = (_G.K4TrainingHop or {})
                                local v1257 = _G.K4TrainingHop
                                v1257.pendingJob = ""
                                v1257.pendingAt = 0
                                v1257.pendingPlayers = nil
                                v1257.HopActive = false
                                v1257.HopToken = (tonumber(v1257.HopToken) or 0)
                                v1257.TPStartedAt = 0
                                v1257.TPFailedAt = 0
                                v1257.TPFailure = ""
                                v1257.noDamageHopActive = false
                                v1257.noDamageHopStartedAt = 0
                                local v1258 = {
                                    MaxPages = 100,
                                    MaxPlayers = math.max(1, (tonumber(getgenv().Config["Training Hop Max Players"]) or 8)),
                                    PageRetries = 3,
                                    PageStartDelay = 0.02,
                                    RetryDelay = 0.2,
                                    ScanTimeout = 8,
                                    BrowserWait = 1.25,
                                    TeleportWait = 6
                                }
                                function _K4F.v1259(v1260, v1261, v1262)
                                    v1257.pendingJob = tostring((v1260 or ""))
                                    v1257.pendingAt = tick()
                                    v1257.pendingPlayers = v1261
                                    _G.K4MoonHub.pendingJob = v1257.pendingJob
                                    _G.K4MoonHub.pendingPlace = tonumber(game.PlaceId)
                                    _G.K4MoonHub.pendingReason = tostring((v1262 or "training_low_player"))
                                    _G.K4MoonHub.pendingStartedAt = tick()
                                    _G.K4MoonHub.teleporting = true
                                end
                                function _K4F.v1263()
                                    v1257.pendingJob = ""
                                    v1257.pendingAt = 0
                                    v1257.pendingPlayers = nil
                                    _G.K4MoonHub.pendingJob = ""
                                    _G.K4MoonHub.pendingPlace = 0
                                    _G.K4MoonHub.pendingStartedAt = 0
                                    _G.K4MoonHub.teleporting = false
                                end
                                function _K4F.v1264(v1265)
                                    if (getgenv().Config.Hop == "Roblox") then
                                        local v1266, v1267 = K4_RequestRobloxServers()
                                        if (not v1266) then
                                            return {}, v1267
                                        end
                                        local v1268 = {}
                                        for v1269, v1270 in ipairs(v1266.data) do
                                            if (v1270.players <= v1258.MaxPlayers) then
                                                table.insert(v1268, { JobId = v1270.jobId, Count = v1270.players, Region = "Roblox" })
                                            end
                                        end
                                        table.sort(v1268, function(v1271, v1272)
                                            return (v1271.Count < v1272.Count)
                                        end)
                                        return v1268
                                    end
                                    local v1273 = v349:FindFirstChild("__ServerBrowser")
                                    if (not v1273) then
                                        return {}, "__ServerBrowser not found"
                                    end
                                    local v1274 = {}
                                    local v1275 = 0
                                    local v1276 = v1258.MaxPages
                                    status(("Scanning " .. (tostring(v1276) .. " ServerBrowser pages for training...")))
                                    for v1277 = 1, v1276 do
                                        task.delay(((v1277 - 1) * v1258.PageStartDelay), function()
                                            if ((not v1257.HopActive) or (v1257.HopToken ~= v1265)) then
                                                v1275 = (v1275 + 1)
                                                return
                                            end
                                            local v1278 = nil
                                            for v1279 = 1, v1258.PageRetries do
                                                local v1280, v1281 = pcall(function()
                                                    return v1273:InvokeServer(v1277)
                                                end)
                                                if (v1280 and (type(v1281) == "table")) then
                                                    v1278 = v1281
                                                    break
                                                end
                                                if (v1279 < v1258.PageRetries) then
                                                    task.wait(v1258.RetryDelay)
                                                end
                                            end
                                            if (((type(v1278) == "table") and v1257.HopActive) and (v1257.HopToken == v1265)) then
                                                for v1282, v1283 in pairs(v1278) do
                                                    if (type(v1283) == "table") then
                                                        local v1284 = (tonumber(v1283.Count) or 99)
                                                        local v1285 = tostring(v1282)
                                                        if ((v1285 ~= tostring(game.JobId)) and (v1284 <= v1258.MaxPlayers)) then
                                                            local v1286 = v1274[v1285]
                                                            if ((not v1286) or (v1284 < v1286.Count)) then
                                                                v1274[v1285] = { JobId = v1285, Count = v1284, Region = tostring((v1283.Region or "Unknown")) }
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                            v1275 = (v1275 + 1)
                                        end)
                                    end
                                    local v1287 = (os.clock() + v1258.ScanTimeout)
                                    repeat
                                        task.wait(0.03)
                                    until ((((v1275 >= v1276) or (os.clock() >= v1287)) or (not v1257.HopActive)) or (v1257.HopToken ~= v1265))
                                    local v1288 = {}
                                    for v1289, v1290 in pairs(v1274) do
                                        v1288[(#v1288 + 1)] = v1290
                                    end
                                    table.sort(v1288, function(v1291, v1292)
                                        if (v1291.Count == v1292.Count) then
                                            return (v1291.JobId < v1292.JobId)
                                        end
                                        return (v1291.Count < v1292.Count)
                                    end)
                                    return v1288
                                end
                                function _K4F.v1293(v1294, v1295)
                                    local v1296 = (os.clock() + v1295)
                                    repeat
                                        if ((not v1257.HopActive) or (v1257.HopToken ~= v1294)) then
                                            return "cancelled"
                                        end
                                        if (v1257.TPFailedAt > 0) then
                                            return "failed"
                                        end
                                        if (v1257.TPStartedAt > 0) then
                                            return "started"
                                        end
                                        task.wait(0.05)
                                    until (os.clock() >= v1296)
                                    return "timeout"
                                end
                                function _K4F.v1297(v1298, v1299, v1300, v1301, v1302)
                                    v1257.TPStartedAt = 0
                                    v1257.TPFailedAt = 0
                                    v1257.TPFailure = ""
                                    _K4F.v1259(v1298.JobId, v1298.Count, v1302)
                                    status(("Training hop joining " .. (tostring(v1298.Count) .. ("/" .. (tostring(v348.MaxPlayers) .. (" [" .. (tostring(v1300) .. ("/" .. (tostring(v1301) .. "]")))))))))
                                    local v1303 = v349:FindFirstChild("__ServerBrowser")
                                    local v1304 = false
                                    if v1303 then
                                        v1304 = pcall(function()
                                            v1303:InvokeServer("teleport", v1298.JobId)
                                        end)
                                    end
                                    local v1305 = nil
                                    if v1304 then
                                        v1305 = _K4F.v1293(v1299, v1258.BrowserWait)
                                    end
                                    if ((not v1304) or (v1305 ~= "started")) then
                                        if ((v1305 == "failed") or (v1305 == "cancelled")) then
                                            _K4F.v1263()
                                            return false
                                        end
                                        v1257.TPStartedAt = 0
                                        v1257.TPFailedAt = 0
                                        v1257.TPFailure = ""
                                        local v1306 = pcall(function()
                                            v354:TeleportToPlaceInstance(game.PlaceId, v1298.JobId, v348.LocalPlayer)
                                        end)
                                        if (not v1306) then
                                            _K4F.v1263()
                                            return false
                                        end
                                        v1305 = _K4F.v1293(v1299, v1258.TeleportWait)
                                    end
                                    if (v1305 == "started") then
                                        status("Training teleport started...")
                                        local v1307 = (os.clock() + 10)
                                        repeat
                                            if ((not v1257.HopActive) or (v1257.HopToken ~= v1299)) then
                                                _K4F.v1263()
                                                return false
                                            end
                                            if (v1257.TPFailedAt > 0) then
                                                _K4F.v1263()
                                                return false
                                            end
                                            task.wait(0.1)
                                        until (os.clock() >= v1307)
                                    end
                                    _K4F.v1263()
                                    return false
                                end
                                function _K4F.v1308(v1309)
                                    if v1257.HopActive then
                                        return true
                                    end
                                    v1257.HopActive = true
                                    v1257.HopToken = (v1257.HopToken + 1)
                                    local v1310 = v1257.HopToken
                                    local v1311 = tostring((v1309 or "training_low_player"))
                                    task.spawn(function()
                                        while (v1257.HopActive and (v1257.HopToken == v1310)) do
                                            local v1312, v1313 = _K4F.v1264(v1310)
                                            if v1313 then
                                                status(v1313)
                                                break
                                            end
                                            if ((not v1257.HopActive) or (v1257.HopToken ~= v1310)) then
                                                break
                                            end
                                            if (#v1312 == 0) then
                                                status(("No training server <= " .. (tostring(v1258.MaxPlayers) .. " players; rescanning...")))
                                                task.wait(0.75)
                                            else
                                                status(("Found " .. (tostring(#v1312) .. " suitable training servers")))
                                                for v1314, v1315 in ipairs(v1312) do
                                                    if ((not v1257.HopActive) or (v1257.HopToken ~= v1310)) then
                                                        break
                                                    end
                                                    _K4F.v1297(v1315, v1310, v1314, #v1312, v1311)
                                                end
                                                if (v1257.HopActive and (v1257.HopToken == v1310)) then
                                                    status("All training candidates failed; rescanning...")
                                                    task.wait(0.5)
                                                end
                                            end
                                        end
                                        if (v1257.HopToken == v1310) then
                                            v1257.HopActive = false
                                            _K4F.v1263()
                                        end
                                    end)
                                    return true
                                end
                                _K4HopLowPlayerServer = function(v1316, v1317, v1318)
                                    if (not v396) then
                                        return false
                                    end
                                    local v1319 = false
                                    pcall(function()
                                        v1319 = (_K4MoonHubMoonImminent() == true)
                                    end)
                                    if v1319 then
                                        local v1320 = (-1)
                                        pcall(function()
                                            v1320 = _K4MoonClockSnapshot().countdown_seconds
                                        end)
                                        status(string.format("Full Moon soon in %s - Main holding this server, not hopping", _K4MoonClockFormatSeconds(v1320)))
                                        return false
                                    end
                                    local v1321 = _G.K4PostTrialReset
                                    if ((((not v1318) and v1321) and K4_PostTrialLockPending()) and (v1321.mainGearClaimed ~= true)) then
                                        status("Post-Trial lock: Main cannot hop/train until gear claim is verified")
                                        return false
                                    end
                                    _G.K4MoonHub.lastLeaveAt = tick()
                                    if string.find(tostring((v1316 or "")), "training_no_damage", 1, true) then
                                        status("No-damage watchdog - starting fast low-player training hop...")
                                    else
                                        status("Starting fast low-player training hop...")
                                    end
                                    return _K4F.v1308(v1316)
                                end
                                _K4MoonHubLeaveForTraining = function(v1322)
                                    return _K4HopLowPlayerServer(v1322, false, false)
                                end
                                _K4ForceTrainingNoDamageHop = function(v1323, v1324)
                                    if (not v396) then
                                        return false
                                    end
                                    local v1325 = v1257
                                    if v1325.HopActive then
                                        v1325.noDamageHopActive = true
                                        return true
                                    end
                                    v1325.noDamageHopActive = true
                                    v1325.noDamageHopStartedAt = tick()
                                    pcall(K4_CancelTrialMovement)
                                    v719.AutoClickEnabled = false
                                    status((tostring((v1324 or "Main")) .. (" [" .. (tostring((v1323 or "Training")) .. "] forcing fast low-player hop after no damage"))))
                                    local v1326 = ("training_no_damage_" .. tostring((v1323 or "unknown")))
                                    local v1327, v1328 = pcall(_K4HopLowPlayerServer, v1326, true, true)
                                    if (v1327 and (v1328 == true)) then
                                        return true
                                    end
                                    v1325.noDamageHopActive = false
                                    v1325.noDamageHopStartedAt = 0
                                    v719.AutoClickEnabled = true
                                    return false
                                end
                                pcall(function()
                                    v348.LocalPlayer.OnTeleport:Connect(function(v1335)
                                        if (v1257.HopActive and (tostring((v1257.pendingJob or "")) ~= "")) then
                                            local v1336 = ""
                                            pcall(function()
                                                v1336 = v1335.Name
                                            end)
                                            if (v1336 == "Failed") then
                                                v1257.TPFailedAt = os.clock()
                                                v1257.TPFailure = "OnTeleport: Failed"
                                            else
                                                v1257.TPStartedAt = os.clock()
                                                _G.K4MoonHub.teleporting = true
                                                _G.K4MoonHub.consecutiveFailures = 0
                                            end
                                            return
                                        end
                                        if (v1335 == Enum.TeleportState.Failed) then
                                            _K4MoonHubHandleFailure(_G.K4MoonHub.pendingJob, _G.K4MoonHub.pendingPlace, "local_onteleport", tostring(v1335), "LocalPlayer.OnTeleport reported failure", _G.K4MoonHub.pendingAttemptId)
                                        elseif ((v1335 == Enum.TeleportState.Started) or (v1335 == Enum.TeleportState.InProgress)) then
                                            _G.K4MoonHub.teleporting = true
                                            _G.K4MoonHub.consecutiveFailures = 0
                                            local v1337 = tostring((_G.K4MoonHub.pendingJob or ""))
                                            if ((v1337 ~= "") and (not (_G.K4MoonHub.hopped or {})[v1337])) then
                                                _K4MoonHubMarkHopped(v1337)
                                            end
                                            _G.K4MoonHub.clientBusyCount = 0
                                        end
                                    end)
                                end)
                                pcall(function()
                                    v354.TeleportInitFailed:Connect(function(v1338, v1339, v1340, v1341, v1342)
                                        if (v1338 and (v1338 ~= v348.LocalPlayer)) then
                                            return
                                        end
                                        if (v1257.HopActive and (tostring((v1257.pendingJob or "")) ~= "")) then
                                            v1257.TPFailedAt = os.clock()
                                            v1257.TPFailure = (tostring(((v1339 and v1339.Name) or v1339)) .. (" | " .. tostring((v1340 or ""))))
                                            return
                                        end
                                        local v1343 = tostring((_G.K4MoonHub.pendingJob or ""))
                                        pcall(function()
                                            local v1344 = (v1342 and v1342.ServerInstanceId)
                                            if (v1344 and (tostring(v1344) ~= "")) then
                                                v1343 = tostring(v1344)
                                            end
                                        end)
                                        _K4MoonHubHandleFailure(v1343, (tonumber(v1341) or _G.K4MoonHub.pendingPlace), "teleport_init_failed", _K4TeleportResultName(v1339), tostring((v1340 or "")), _G.K4MoonHub.pendingAttemptId)
                                    end)
                                end)
                                pcall(function()
                                    local v1345 = game:GetService("TextChatService")
                                    v1345.MessageReceived:Connect(function(v1346)
                                        if (v1346 and _K4MoonHubTextHasEnd(v1346.Text)) then
                                            _K4MoonHubMarkEnded("chat")
                                        end
                                    end)
                                end)
                                task.spawn(function()
                                    local v1347 = v348.LocalPlayer:WaitForChild("PlayerGui")
                                    for v1348, v1349 in ipairs(v1347:GetDescendants()) do
                                        _K4MoonHubWatchTextObject(v1349)
                                    end
                                    v1347.DescendantAdded:Connect(_K4MoonHubWatchTextObject)
                                end)
                                task.spawn(function()
                                    while task.wait(0.5) do
                                        if v395 then
                                            local v1350 = _K4MoonHubMoonEnded()
                                            local v1351 = _K4MoonHubFullMoonNight()
                                            local v1352 = (((getgenv().Config["Defer Moon Hop During Trial"] ~= false) and (type(_K4TrialCycleIsActive) == "function")) and (_K4TrialCycleIsActive() == true))
                                            if (v1350 and v1352) then
                                                _G.K4TrialLifecycle.endMoonPending = true
                                                if (type(status) == "function") then
                                                    status("Full Moon ended - Trial is still active, keeping current server")
                                                end
                                            elseif ((not v1350) and v1351) then
                                            elseif ((((not v1350) and (not v1351)) and (type(_K4MoonHubMoonImminent) == "function")) and _K4MoonHubMoonImminent()) then
                                                if (type(status) == "function") then
                                                    local v1353 = (-1)
                                                    pcall(function()
                                                        v1353 = _K4MoonClockSnapshot().countdown_seconds
                                                    end)
                                                    status(string.format("Full Moon soon in %s - holding this server, not hopping", _K4MoonClockFormatSeconds(v1353)))
                                                end
                                            else
                                                local v1354 = _K4MoonHubFetchCandidate((v1350 or (not v1351)))
                                                local v1355 = ((v948 and tostring((v948.target_job_id or ""))) or "")
                                                local v1356 = ((v948 and tonumber(((v948.target_place_id or v948.hub_place_id) or v948.main_place_id))) or game.PlaceId)
                                                if ((v1355 ~= "") and ((v1355 ~= tostring(game.JobId)) or (v1356 ~= tonumber(game.PlaceId)))) then
                                                    if (type(status) == "function") then
                                                        status("Help joining selected Full Moon hub")
                                                    end
                                                    _K4MoonHubTeleport(v1355, "web_hub", v1356)
                                                elseif (((v1350 or (not v1351)) and v1354) and (v1354.jobid ~= tostring(game.JobId))) then
                                                    if (type(status) == "function") then
                                                        status(string.format("Help joining Full Moon server (%d players)", (v1354.players or 0)))
                                                    end
                                                    _K4MoonHubTeleport(v1354.jobid, "api_lowest_players", v1354.placeid)
                                                end
                                            end
                                        elseif (((v396 and _K4MoonHubMoonEnded()) and v948) and v948.lobby_waiting) then
                                            _K4MoonHubLeaveForTraining("moon_ended_while_waiting")
                                        end
                                    end
                                end)
                                function _K4F.v1357()
                                    v948 = nil
                                    v949 = nil
                                    v946 = false
                                    v951 = ""
                                    v952 = ""
                                    v959 = ""
                                    v955 = 0
                                    v956 = 0
                                    v957 = 0
                                    v958 = 0
                                    v963 = 0
                                    v964 = 0
                                    v965 = math.huge
                                    v966 = false
                                    v967 = 0
                                    _G.K4TrialLifecycle.groupId = ""
                                    _G.K4TrialLifecycle.started = false
                                    _G.K4TrialLifecycle.startedAt = 0
                                    _G.K4TrialLifecycle.lastActiveAt = 0
                                    _G.K4TrialLifecycle.endMoonPending = false
                                    _G.K4TrialLifecycle.endMoonReason = ""
                                    _G.K4TrialLifecycle.endMoonDetectedAt = 0
                                    _G.K4MoonHub.endDeferredForTrial = false
                                    _G.K4DoorRecovery.issuedForRound = ""
                                    _G.K4DoorRecovery.scheduledId = ""
                                    _G.K4DoorRecovery.handledId = ""
                                    _G.K4DoorRecovery.active = false
                                    _G.K4DoorRecovery.allFiredRoundId = ""
                                    _G.K4DoorRecovery.allFiredAt = 0
                                end
                                function _K4F.v1358(v1359, v1360)
                                    v1359 = tostring((v1359 or "completed"))
                                    v1360 = (((type(v1360) == "table") and v1360) or {})
                                    local v1361 = (((v1359 == "trial_completed") or (v1359 == "gear_claimed")) or (v1359 == "race_v4_completed"))
                                    if (((v396 and _G.K4PostTrialReset) and K4_PostTrialLockPending()) and (_G.K4PostTrialReset.mainGearClaimed ~= true)) then
                                        status("Post-Trial lock: pair release waits for verified Main gear claim")
                                        return false
                                    end
                                    if (((v1361 and (getgenv().Config["Defer Moon Hop During Trial"] ~= false)) and (type(_K4TrialCycleIsActive) == "function")) and (_K4TrialCycleIsActive() == true)) then
                                        _G.K4TrialLifecycle.endMoonPending = (_G.K4TrialLifecycle.endMoonPending or _K4MoonHubMoonEnded())
                                        status("Trial is still active - delaying pair release and server hop")
                                        return false
                                    end
                                    if (((v961 or (not v396)) or (not v948)) or (not v948.assigned)) then
                                        return false
                                    end
                                    if (tostring((v948.main_username or "")) ~= v945) then
                                        return false
                                    end
                                    local v1362 = tostring((v948.group_id or ""))
                                    if (v1362 == "") then
                                        return false
                                    end
                                    v961 = true
                                    status(("Releasing pair: " .. v1359))
                                    local v1363 = _K4F.v1008("/match/release", { group_id = v1362, username = v945, job_id = game.JobId, reason = v1359 })
                                    local v1364 = ((v1363 and v1363.ok) and (v1363.released == true))
                                    if v1364 then
                                        local v1365 = (((v1363.leave_server == true) and (getgenv().Config["Main Leave After Trial"] ~= false)) and (v1360.stayInServer ~= true))
                                        v960 = (tick() + v991)
                                        _K4F.v1357()
                                        status("Pair released - next Main can join")
                                        if (v1365 and v396) then
                                            task.spawn(function()
                                                task.wait(2)
                                                _K4MoonHubLeaveForTraining(v1359)
                                            end)
                                        end
                                    else
                                        status("Pair release failed - retrying")
                                    end
                                    v961 = false
                                    return v1364
                                end
                                K4_ShouldFarmFragments = function()
                                    if ((not v396) or v395) then
                                        return false
                                    end
                                    local v1366 = getgenv().Config["Farm Fragments"]
                                    if ((type(v1366) ~= "table") or (v1366.CakePrince == false)) then
                                        return false
                                    end
                                    if ((type(_K4TrialCycleIsActive) == "function") and _K4TrialCycleIsActive()) then
                                        return false
                                    end
                                    if K4_PostTrialLockPending() then
                                        return false
                                    end
                                    local v1367 = v348.LocalPlayer:FindFirstChild("Data")
                                    local v1368 = (v1367 and v1367:FindFirstChild("Fragments"))
                                    return ((v1368 ~= nil) and ((tonumber(v1368.Value) or 0) < math.max(1, (tonumber(v1366.MinFragments) or 5000))))
                                end
                                function _K4F.v1369()
                                    if K4_ShouldFarmFragments() then
                                        return false, "farming_fragments"
                                    end
                                    if v396 then
                                        local v1370 = K4_ReadRaceLevel(false)
                                        if ((not v1370) or (v1370 < 3)) then
                                            return false, "upgrading_race"
                                        end
                                    end
                                    if (tick() < v960) then
                                        return false, "requeue_cooldown"
                                    end
                                    if (v948 and v948.assigned) then
                                        if v395 then
                                            return true, "helper_locked_to_active_pair"
                                        end
                                        if ((((((v396 and (v948.trial_turn == true)) and (v948.can_approach_trial == true)) and (tostring((v948.main_username or "")) == v945)) and (tostring((v948.active_main or "")) == v945)) and (tostring((v948.group_id or "")) ~= "")) and (tostring((v948.turn_token or "")) ~= "")) then
                                            return true, "main_locked_trial_turn"
                                        end
                                        return false, "assigned_without_trial_turn"
                                    end
                                    if v395 then
                                        if _K4MoonHubMoonEnded() then
                                            return true, "helper_seeking_next_full_moon"
                                        end
                                        if _K4MoonHubFullMoonNight() then
                                            return true, "helper_holding_full_moon"
                                        end
                                        local v1371 = false
                                        pcall(function()
                                            v1371 = (_K4MoonHubMoonImminent() == true)
                                        end)
                                        if v1371 then
                                            return true, "helper_holding_full_moon_soon"
                                        end
                                        return true, "helper_seeking_full_moon"
                                    end
                                    local v1373, v1374 = pcall(function()
                                        local v1372 = trialable()
                                        return (v1372 == true)
                                    end)
                                    if (v1373 and v1374) then
                                        return true, "main_waiting_moon_hub"
                                    end
                                    return false, "not_trial_ready"
                                end
                                getCurrentUpgearTurn = function()
                                    if ((v948 and v948.assigned) and v948.main_username) then
                                        return v948.main_username
                                    end
                                    if v396 then
                                        return v945
                                    end
                                    return nil
                                end
                                isMyUpgearTurn = function()
                                    if K4_ShouldFarmFragments() then
                                        return false
                                    end
                                    if (not v396) then
                                        return false
                                    end
                                    if ((not v948) or (v948.assigned ~= true)) then
                                        return false
                                    end
                                    return (((((((v948.trial_turn == true) and (v948.can_approach_trial == true)) and (tostring((v948.main_username or "")) == v945)) and (tostring((v948.active_main or "")) == v945)) and (tostring((v948.group_id or "")) ~= "")) and (tostring((v948.turn_token or "")) ~= "")) and (tostring((v948.main_job_id or "")) == tostring(game.JobId)))
                                end
                                isOtherUpgearTraining = function()
                                    if (not v396) then
                                        return false
                                    end
                                    return ((v948 and v948.assigned) and (v948.main_username ~= v945))
                                end
                                function _K4F.v1375(v1376)
                                    if ((not v1376) or (not v1376.assigned)) then
                                        return
                                    end
                                    v949 = v1376.main_job_id
                                    v397 = (v1376.main_username or v397)
                                    v399 = {}
                                    for v1377, v1378 in ipairs((v1376.helpers or {})) do
                                        if (v1378 and (v1378 ~= "")) then
                                            v399[v1378] = true
                                        end
                                    end
                                end
                                getgenv().AimPos = nil
                                K4_CreateFilteredNamecall = function(v1379, v1380, v1381)
                                    local v1382 = getgenv()
                                    if (not v1382.K4NamecallFilterFactory) then
                                        local v1383, v1384 = loadstring("            return function(previous, handler, env, mode)\n                local methodOf, callerIsExecutor = getnamecallmethod, checkcaller\n                return newcclosure(function(self, ...)\n                    local method = methodOf()\n                    if mode == \"shark\" then\n                        if method ~= \"FireServer\" or not env.AimPos or self.Name ~= \"RemoteEvent\" then\n                            return previous(self, ...)\n                        end\n                    elseif mode == \"tyrant\" then\n                        if (method ~= \"FireServer\" and method ~= \"InvokeServer\")\n                            or not env.TyrantSkillAimTarget or callerIsExecutor() then\n                            return previous(self, ...)\n                        end\n                    else\n                        return previous(self, ...)\n                    end\n                    return handler(self, ...)\n                end)\n            end\n        ", "@K4NamecallFilter")
                                        assert(v1383, v1384)
                                        v1382.K4NamecallFilterFactory = v1383()
                                    end
                                    return v1382.K4NamecallFilterFactory(v1379, v1380, v1382, v1381)
                                end
                                if (getgenv().K4SharkSkillAimHookInstalled ~= true) then
                                    local v1393, v1394 = pcall(function()
                                        assert((type(getrawmetatable) == "function"), "getrawmetatable unavailable")
                                        assert((type(setreadonly) == "function"), "setreadonly unavailable")
                                        assert((type(newcclosure) == "function"), "newcclosure unavailable")
                                        assert((type(getnamecallmethod) == "function"), "getnamecallmethod unavailable")
                                        local v1385 = getrawmetatable(game)
                                        local v1386 = v1385.__namecall
                                        local v1392 = K4_CreateFilteredNamecall(v1386, function(v1387, ...)
                                            local v1388 = getnamecallmethod()
                                            local v1389 = getgenv().AimPos
                                            if (((v1388 ~= "FireServer") or (v1387.Name ~= "RemoteEvent")) or (not v1389)) then
                                                return v1386(v1387, ...)
                                            end
                                            local v1390 = { ... }
                                            local v1391 = nil
                                            if (typeof(v1389) == "CFrame") then
                                                v1391 = v1389
                                            elseif (typeof(v1389) == "Vector3") then
                                                v1391 = CFrame.new(v1389)
                                            elseif ((typeof(v1389) == "Instance") and v1389:IsA("BasePart")) then
                                                v1391 = v1389.CFrame
                                            end
                                            if ((((v1388 == "FireServer") and (v1387.Name == "RemoteEvent")) and v1391) and (v1391.Position.X == v1391.Position.X)) then
                                                if ((#v1390 == 1) and (typeof(v1390[1]) == "Vector3")) then
                                                    v1390[1] = v1391.Position
                                                elseif ((#v1390 == 1) and (typeof(v1390[1]) == "CFrame")) then
                                                    v1390[1] = v1391
                                                end
                                            end
                                            return v1386(v1387, unpack(v1390))
                                        end, "shark")
                                        setreadonly(v1385, false)
                                        v1385.__namecall = v1392
                                        setreadonly(v1385, true)
                                    end)
                                    if v1393 then
                                        getgenv().K4SharkSkillAimHookInstalled = true
                                    else
                                        getgenv().K4SharkSkillAimHookInstalled = false
                                        warn(("[K4 Shark Trial] Skill aim hook failed: " .. tostring(v1394)))
                                    end
                                end
                                K4_HelpCanLeaveRejectedHub = function()
                                    local v1395 = _G.K4MoonHub
                                    if ((((not v395) or (not v1395)) or (v1395.recoveryJob ~= tostring(game.JobId))) or (tick() >= (v1395.recoveryUntil or 0))) then
                                        return false
                                    end
                                    local v1396 = ((v948 and v948.main_username) or v1395.recoveryMain)
                                    if (v1396 and v348:FindFirstChild(tostring(v1396))) then
                                        return false
                                    end
                                    local v1397 = v348.LocalPlayer.Character
                                    local v1398 = (v1397 and v1397:FindFirstChild("HumanoidRootPart"))
                                    local v1399 = v348.LocalPlayer.Data.Race.Value
                                    local v1400 = v596[v1399]
                                    if ((not v1398) or (not v1400)) then
                                        return false
                                    end
                                    local v1401, v1402 = pcall(function()
                                        return getdis(v1400.CFrame)
                                    end)
                                    return (v1401 and (v1402 >= 1500))
                                end
                                K4_ApplyHubRecovery = function(v1403)
                                    local v1404 = v1403.hub_recovery
                                    if (((((not v395) or (not v1403.assigned)) or (not v1404)) or (v1404.main_outside ~= true)) or (tostring((v1404.job_id or "")) ~= tostring(game.JobId))) then
                                        return false
                                    end
                                    _G.K4MoonHub.recoveryJob = tostring(v1404.job_id)
                                    _G.K4MoonHub.recoveryMain = v1404.main_username
                                    _G.K4MoonHub.recoveryUntil = (tick() + 10)
                                    if (not K4_HelpCanLeaveRejectedHub()) then
                                        return false
                                    end
                                    K4_ForceFinishHelpPostTrialReset("main_cannot_join_rejected_hub")
                                    v951, v952 = "", ""
                                    v967, v966, v946 = 0, false, false
                                    _G.K4TrialLifecycle.started, _G.K4TrialLifecycle.lastActiveAt = false, 0
                                    return true
                                end
                                K4_RefreshMatchOnce = function()
                                    if ((not v396) and (not v395)) then
                                        return nil
                                    end
                                    if (getgenv().K4RaceUpgrade and getgenv().K4RaceUpgrade.active) then
                                        return nil
                                    end
                                    local v1405 = ""
                                    pcall(function()
                                        v1405 = v348.LocalPlayer.Data.Race.Value
                                    end)
                                    local v1406 = 0
                                    pcall(function()
                                        v1406 = (tonumber(v348.LocalPlayer.Data.Fragments.Value) or 0)
                                    end)
                                    local v1407, v1408 = _K4F.v1369()
                                    local v1409 = _K4MoonClockSnapshot()
                                    local v1410 = _K4MoonHubMoonEnded()
                                    local v1411 = (((type(_K4TrialCycleIsActive) == "function") and (_K4TrialCycleIsActive() == true)) or false)
                                    local v1412 = false
                                    pcall(function()
                                        v1412 = (getV4Status(false).needsTraining == true)
                                    end)
                                    local v1413 = ((v396 and K4_ReadRaceLevel(false)) or nil)
                                    local v1414 = (((v396 and v1413) and (v1413 < 3)) or false)
                                    local v1415 = K4_ShouldFarmFragments()
                                    v1412 = ((v1412 or v1414) or v1415)
                                    if (v396 and v1412) then
                                        v1407 = false
                                        v1411 = false
                                        v1408 = ((v1415 and "farming_fragments") or "training")
                                    end
                                    local v1416 = nil
                                    if v395 then
                                        if (v1410 and v1411) then
                                            v1416 = _G.K4MoonHub.candidate
                                        elseif ((v1409.active ~= true) or v1410) then
                                            local v1417 = false
                                            pcall(function()
                                                v1417 = (_K4MoonHubMoonImminent() == true)
                                            end)
                                            if v1417 then
                                                v1416 = nil
                                            else
                                                v1416 = _K4MoonHubFetchCandidate(false)
                                            end
                                        else
                                            v1416 = _G.K4MoonHub.candidate
                                        end
                                    end
                                    local v1418 = _K4F.v1008("/match", {
                                        job_id = game.JobId,
                                        place_id = game.PlaceId,
                                        server_players = #v348:GetPlayers(),
                                        server_capacity = v348.MaxPlayers,
                                        turn_busy = (((K4_PostTrialLockPending() == true) or (tostring((v952 or "")) ~= "")) or (tostring((v951 or "")) ~= "")),
                                        username = v945,
                                        role = _K4F.v1007(),
                                        race = v1405,
                                        task_status = tostring((v954 or "starting")),
                                        fragments = v1406,
                                        queue_ready = v1407,
                                        cycle_state = v1408,
                                        moon_active = (v1409.active == true),
                                        moon_ended = v1410,
                                        trial_active = v1411,
                                        training = v1412,
                                        farming_fragments = v1415,
                                        race_level = v1413,
                                        upgrading_race = v1414,
                                        trial_started = (_G.K4TrialLifecycle.started == true),
                                        moon_end_pending = (_G.K4TrialLifecycle.endMoonPending == true),
                                        trial_round_id = tostring((v952 or "")),
                                        moon_texture_state = tostring((v1409.state or "Unknown")),
                                        moon_status_text = tostring((v1409.display or "")),
                                        moon_clock = (tonumber(v1409.clock) or 0),
                                        moon_clock_text = tostring((v1409.clock_text or "")),
                                        moon_countdown_type = tostring((v1409.countdown_type or "none")),
                                        moon_countdown_seconds = (tonumber(v1409.countdown_seconds) or (-1)),
                                        moon_phase = (tonumber(v1409.phase) or (-1)),
                                        moon_lead_seconds = _K4MoonHubMoonLeadSeconds(),
                                        candidate_job_id = ((v1416 and v1416.jobid) or ""),
                                        candidate_place_id = ((v1416 and v1416.placeid) or 0),
                                        candidate_players = ((v1416 and v1416.players) or 999),
                                        api_total = (tonumber(_G.K4MoonHub.lastApiCount) or 0),
                                        api_eligible = (tonumber(_G.K4MoonHub.lastEligibleCount) or 0),
                                        temple_tries = (tonumber(_G.K4TempleProbe.tries) or 0),
                                        temple_ret = tostring((_G.K4TempleProbe.lastRet or "")),
                                        temple_ret_type = tostring((_G.K4TempleProbe.lastType or "")),
                                        temple_progress = (tonumber(_G.K4TempleProbe.progress) or (-1)),
                                        temple_dist = (tonumber(_G.K4TempleProbe.dist) or (-1)),
                                        temple_stuck_s = ((((tonumber(_G.K4TempleProbe.firstAt) or 0) > 0) and math.floor((tick() - _G.K4TempleProbe.firstAt))) or (-1)),
                                        teleporting = (_G.K4MoonHub.teleporting == true),
                                        hub_join_failure = _G.K4MoonHub.pendingJoinReport
                                    })
                                    if (v1418 and v1418.ok) then
                                        if K4_ApplyHubRecovery(v1418) then
                                            v1411 = false
                                        end
                                        local v1419 = _G.K4MoonHub.pendingJoinReport
                                        if (v1419 and ((v1418.hub_join_failure_ack == v1419.attempt_id) or (tostring((v1418.group_id or "")) ~= tostring((v1419.group_id or ""))))) then
                                            _G.K4MoonHub.pendingJoinReport = nil
                                        end
                                        for v1420, v1421 in pairs((v1418.hub_blacklist or {})) do
                                            local v1422 = math.max(0, (((tonumber(v1421) or 0) - (tonumber(v1418.server_time_ms) or 0)) / 1000))
                                            if (v1422 > 0) then
                                                _G.K4MoonHub.blacklist[tostring(v1420)] = (tick() + math.min(600, v1422))
                                                if (_G.K4MoonHub.candidate and (tostring(_G.K4MoonHub.candidate.jobid) == tostring(v1420))) then
                                                    _G.K4MoonHub.candidate = nil
                                                end
                                            end
                                        end
                                        if ((((v1418.search_new_hub == true) and v395) and (not v1411)) and (not K4_PostTrialLockPending())) then
                                            status("Full Moon server full - searching another hub; old server blocked for 10 minutes")
                                            local v1423 = _K4MoonHubFetchCandidate(false)
                                            if v1423 then
                                                _K4MoonHubTeleport(v1423.jobid, "full_server_recovery", v1423.placeid)
                                            end
                                        end
                                        local v1424 = ((v1418.assigned and tostring((v1418.group_id or ""))) or "")
                                        if ((v1424 ~= "") and (v1424 ~= v959)) then
                                            v959 = v1424
                                            v955 = tick()
                                            v956 = 0
                                            v957 = 0
                                            v958 = 0
                                            v963 = 0
                                            v964 = tick()
                                            v965 = math.huge
                                            v966 = false
                                            v967 = 0
                                            v951 = ""
                                            v952 = ""
                                            _G.K4TrialLifecycle.groupId = v1424
                                            _G.K4TrialLifecycle.started = false
                                            _G.K4TrialLifecycle.startedAt = 0
                                            _G.K4TrialLifecycle.lastActiveAt = 0
                                            _G.K4TrialLifecycle.endMoonPending = false
                                            _G.K4TrialLifecycle.endMoonReason = ""
                                            _G.K4TrialLifecycle.endMoonDetectedAt = 0
                                            _G.K4MoonHub.endDeferredForTrial = false
                                            if (_G.K4PostTrialReset and (_G.K4PostTrialReset.active ~= true)) then
                                                _G.K4PostTrialReset.armed = false
                                                _G.K4PostTrialReset.trialSeen = false
                                                _G.K4PostTrialReset.ffaLatched = false
                                                _G.K4PostTrialReset.completed = false
                                                _G.K4PostTrialReset.mainGearClaimed = false
                                                if v396 then
                                                    _G.K4PostTrialReset.mainResetForbidden = false
                                                end
                                            end
                                        elseif ((v1424 == "") and (v959 ~= "")) then
                                            v959 = ""
                                            v955 = 0
                                            v956 = 0
                                            v957 = 0
                                            v958 = 0
                                            v966 = false
                                            v967 = 0
                                            _G.K4TrialLifecycle.groupId = ""
                                            _G.K4TrialLifecycle.started = false
                                            _G.K4TrialLifecycle.startedAt = 0
                                            _G.K4TrialLifecycle.lastActiveAt = 0
                                            _G.K4TrialLifecycle.endMoonPending = false
                                            _G.K4TrialLifecycle.endMoonReason = ""
                                            _G.K4TrialLifecycle.endMoonDetectedAt = 0
                                            _G.K4MoonHub.endDeferredForTrial = false
                                        end
                                        if (((v1424 ~= "") and (v1418.all_in_job == true)) and (v956 <= 0)) then
                                            v956 = tick()
                                        end
                                        v948 = v1418
                                        _K4F.v1375(v1418)
                                        if v396 then
                                            if isMyUpgearTurn() then
                                                _G.K4TurnGuard.lastStrictGroup = tostring((v1418.group_id or ""))
                                                _G.K4TurnGuard.lastStrictToken = tostring((v1418.turn_token or ""))
                                            else
                                                v946 = false
                                                v951 = ""
                                                v952 = ""
                                                local v1425 = ((K4TyrantFarmController and K4TyrantFarmController.IsActive) and K4TyrantFarmController.IsActive())
                                                v1425 = (v1425 or (K4CakeFarm and K4CakeFarm.IsActive()))
                                                if (not v1425) then
                                                    pcall(K4_CancelTrialMovement)
                                                end
                                            end
                                        end
                                        local v1426 = tostring(((v1418.target_job_id or v1418.main_job_id) or ""))
                                        local v1427 = (tonumber(((v1418.target_place_id or v1418.hub_place_id) or v1418.main_place_id)) or game.PlaceId)
                                        local v1428 = ((not K4_ShouldFarmFragments()) and ((v395 or (v1418.assigned == true)) or (v1418.admission_granted == true)))
                                        if ((v1428 and (v1426 ~= "")) and (v1426 ~= tostring(game.JobId))) then
                                            if v396 then
                                                local v1429, v1430 = pcall(function()
                                                    return getV4Status(false)
                                                end)
                                                if (((v1429 and v1430) and (v1430.needsTraining == true)) and (not v1430.canTrial)) then
                                                    v1428 = false
                                                end
                                            end
                                            if (v1428 and ((tick() - v950) >= 3)) then
                                                v950 = tick()
                                                if (type(status) == "function") then
                                                    status(((v395 and "Help joining Full Moon hub") or "Main admitted - joining Full Moon hub"))
                                                end
                                                _K4MoonHubTeleport(v1426, ((v395 and "helper_hub") or "main_admitted"), v1427)
                                            end
                                        end
                                    end
                                    return v1418
                                end
                                refreshMatch = function()
                                    local v1431 = _G.K4MatchNet
                                    if (v1431.requesting or (v948 and (tick() < (v1431.nextRequestAt or 0)))) then
                                        return v948
                                    end
                                    v1431.requesting = true
                                    v1431.nextRequestAt = (tick() + 0.75)
                                    local v1432, v1433 = pcall(K4_RefreshMatchOnce)
                                    v1431.requesting = false
                                    if v1432 then
                                        return v1433
                                    end
                                    v1431.lastError = "match_refresh_failed"
                                    return nil
                                end
                                sendMainJob = function()
                                    return refreshMatch()
                                end
                                getMainJob = function()
                                    if (v948 and v948.main_job_id) then
                                        return v948.main_job_id
                                    end
                                    return v949
                                end
                                task.spawn(function()
                                    task.wait(0.15)
                                    while true do
                                        if (not _G.K4MatchNet.busy) then
                                            _G.K4MatchNet.busy = true
                                            pcall(refreshMatch)
                                            _G.K4MatchNet.busy = false
                                        end
                                        local v1434 = math.max(1, (tonumber(getgenv().Config["Match Normal Poll"]) or 2))
                                        local v1435 = math.max(0.75, (tonumber(getgenv().Config["Match Fast Poll"]) or 0.75))
                                        if v395 then
                                            if (_K4MoonHubFullMoonNight() or (v948 and ((v948.hub_available or v948.target_job_id) or v948.assigned))) then
                                                v1434 = v1435
                                            end
                                        elseif (v396 and v948) then
                                            if ((((v948.admission_granted == true) or (v948.assigned == true)) or (v948.lobby_waiting == true)) or (tostring((v948.target_job_id or "")) ~= "")) then
                                                v1434 = v1435
                                            end
                                        end
                                        task.wait(v1434)
                                    end
                                end)
                                autoEquipGear = function()
                                    if (getgenv().VapeHunterCapeController and getgenv().VapeHunterCapeController.equipped) then
                                        return
                                    end
                                    local v1436 = getgenv().Config.Gear
                                    if ((not v1436) or (#v1436 ~= 5)) then
                                        return
                                    end
                                    local v1437 = string.sub(v1436, 1, 1)
                                    local v1440 = {
                                        A = {
                                        "Pale Scarf",
                                        "Pink Coat",
                                        "Valentine's Necklace",
                                        "Black Cape",
                                        "Swan Glasses",
                                        "Tomoe Ring",
                                        "Dark Coat",
                                        "Musketeer Hat",
                                        "Kitsune Mask",
                                        "Kitsune Ribbon",
                                        "Lei",
                                        "Pretty Helmet"
                                    },
                                        B = {
                                        "Ghoul Mask",
                                        "Winter Sky",
                                        "Black Spikey Coat",
                                        "Koko's Glasses",
                                        "Berserker Mask",
                                        "Warrior Helmet",
                                        "Water Key Necklace",
                                        "Pilot Helmet"
                                    },
                                        C = {
                                        "Marine Cap",
                                        "Swordsman Hat",
                                        "Usoap's Hat",
                                        "Choppa's Hat",
                                        "Robin's Glasses",
                                        "Namis Glasses",
                                        "Brook's Glasses",
                                        "Bobby's Glasses",
                                        "Jaw's Glasses",
                                        "Bear Ears",
                                        "Cool Shades",
                                        "Skeleton Mask"
                                    }
                                    }
                                    local function v1441(v1442)
                                        for v1443, v1444 in pairs(v1440) do
                                            for v1445, v1446 in ipairs(v1444) do
                                                if v1442:find(v1446) then
                                                    return ((((v1443 == "A") and 3) or ((v1443 == "B") and 2)) or 1)
                                                end
                                            end
                                        end
                                        return 0
                                    end
                                    local function v1447()
                                        local v1448, v1449 = nil, (-1)
                                        for v1450, v1451 in ipairs(v348.LocalPlayer.Backpack:GetChildren()) do
                                            if v1451:IsA("Accessory") then
                                                local v1452 = v1441(v1451.Name)
                                                if (v1452 > v1449) then
                                                    v1449 = v1452
                                                    v1448 = v1451
                                                end
                                            end
                                        end
                                        return v1448
                                    end
                                    local v1453 = v348.LocalPlayer.Character
                                    if (not v1453) then
                                        return
                                    end
                                    local function v1454(v1455, v1456)
                                        local v1457 = v1453:FindFirstChildOfClass("Accessory")
                                        if (v1457 and v1457.Name:find("Accessory")) then
                                            local v1458 = v1441(v1457.Name)
                                            local v1459 = (((v1456 == "-") and 99) or ((v1440[v1456] and ((((v1456 == "A") and 3) or ((v1456 == "B") and 2)) or 1)) or 0))
                                            if (v1458 >= v1459) then
                                                return
                                            end
                                        end
                                        local v1460 = v1447()
                                        if v1460 then
                                            local v1461 = v1441(v1460.Name)
                                            local v1462 = (((v1456 == "-") and 0) or ((v1440[v1456] and ((((v1456 == "A") and 3) or ((v1456 == "B") and 2)) or 1)) or 0))
                                            if (v1461 >= v1462) then
                                                v348.LocalPlayer.Character.Humanoid:EquipTool(v1460)
                                            end
                                        end
                                    end
                                    if v348.LocalPlayer.Backpack:FindFirstChildOfClass("Accessory") then
                                        v1454(1, v1437)
                                    end
                                end
                                local v1463 = false
                                function _K4F.v1464(v1465)
                                    if ((not v396) or v1463) then
                                        return false
                                    end
                                    v1463 = true
                                    task.spawn(function()
                                        pcall(K4_CancelTrialMovement)
                                        _K4F.v639()
                                        for v1466 = 1, 30 do
                                            if (tostring(game.JobId) ~= tostring(v944)) then
                                                break
                                            end
                                            local v1467 = getV4Status(true)
                                            local v1468 = ((v948 and (v948.assigned == true)) and (tostring((v948.main_username or "")) == v945))
                                            if (v1467.needsTraining == true) then
                                                if v1468 then
                                                    if _K4F.v1358("gear_claimed") then
                                                        v1463 = false
                                                        return
                                                    end
                                                else
                                                    status("Trial complete - V4 requires training, leaving for training now")
                                                    _K4MoonHubLeaveForTraining(tostring((v1465 or "post_trial_training")))
                                                    v1463 = false
                                                    return
                                                end
                                            elseif (v1467.needsPurchase == true) then
                                                if v1468 then
                                                    if _K4F.v1358("v4_upgrade_pending", { stayInServer = true }) then
                                                        v1463 = false
                                                        return
                                                    end
                                                else
                                                    status("Post-Trial resolved - V4 upgrade purchase is pending")
                                                    v1463 = false
                                                    return
                                                end
                                            elseif (v1467.complete == true) then
                                                if v1468 then
                                                    if _K4F.v1358("post_trial_v4_completed", { stayInServer = true }) then
                                                        v1463 = false
                                                        return
                                                    end
                                                else
                                                    status("Race V4 completed - no training transition required")
                                                    v1463 = false
                                                    return
                                                end
                                            elseif ((v1467.canTrial == true) and (v1466 >= 20)) then
                                                if v1468 then
                                                    if _K4F.v1358("ready_for_next_trial", { stayInServer = true }) then
                                                        v1463 = false
                                                        return
                                                    end
                                                else
                                                    status("READY FOR TRIAL - waiting for the next Full Moon")
                                                    v1463 = false
                                                    return
                                                end
                                            end
                                            task.wait(0.4)
                                        end
                                        v1463 = false
                                    end)
                                    return true
                                end
                                function _K4F.v1469(v1470)
                                    if (not v396) then
                                        return false
                                    end
                                    local v1471 = _G.K4PostTrialReset
                                    if v1471 then
                                        v1471.mainWinnerPoint = true
                                        v1471.mainGearClaimed = true
                                        v1471.mainResetForbidden = false
                                        v1471.active = false
                                        v1471.armed = false
                                        v1471.trialSeen = false
                                        v1471.completed = true
                                        v1471.completedAt = tick()
                                    end
                                    _K4F.v639()
                                    status((tostring((v1470 or "Main post-Trial progression verified")) .. " - starting training immediately"))
                                    _K4F.v1464("post_trial_required_training")
                                    return true
                                end
                                function _K4F.v1472(v1473, v1474)
                                    if (not v396) then
                                        return false
                                    end
                                    local v1475 = _G.K4PostTrialReset
                                    if v1475 then
                                        v1475.mainWinnerPoint = (v1475.mainWinnerPoint == true)
                                        v1475.mainGearClaimed = true
                                        v1475.mainResetForbidden = false
                                        v1475.active = false
                                        v1475.armed = false
                                        v1475.trialSeen = false
                                        v1475.ffaLatched = false
                                        v1475.ffaInactiveAt = 0
                                        v1475.completed = true
                                        v1475.completedAt = tick()
                                        v1475.templeClockFailures = 0
                                    end
                                    v966 = false
                                    if _G.K4TrialLifecycle then
                                        _G.K4TrialLifecycle.started = false
                                        _G.K4TrialLifecycle.lastActiveAt = tick()
                                    end
                                    v719.AutoClickEnabled = true
                                    _K4F.v639()
                                    status(tostring((v1473 or "Cleared stale Main Post-Trial lock")))
                                    local v1476 = ((v948 and (v948.assigned == true)) and (tostring((v948.main_username or "")) == v945))
                                    if v1476 then
                                        local v1477 = _K4F.v1358(tostring((v1474 or "post_trial_state_resolved")), { stayInServer = true })
                                        if (not v1477) then
                                            task.spawn(function()
                                                for v1478 = 1, 12 do
                                                    task.wait(0.75)
                                                    local v1479 = ((v948 and (v948.assigned == true)) and (tostring((v948.main_username or "")) == v945))
                                                    if (not v1479) then
                                                        return
                                                    end
                                                    if _K4F.v1358(tostring((v1474 or "post_trial_state_resolved")), { stayInServer = true }) then
                                                        return
                                                    end
                                                end
                                            end)
                                        end
                                    end
                                    return true
                                end
                                K4_CaptureGearEnabled = function()
                                    return ((((v396 == true) and (v395 ~= true)) and (getgenv().Config.CaptureGear == true)) and (K4_GetTargetTier() == 5))
                                end
                                K4_RunCaptureGear = function(v1480)
                                    local v1481 = getgenv().K4CaptureGear
                                    if (not v1481) then
                                        v1481 = { active = false, nextCheck = 0 }
                                        getgenv().K4CaptureGear = v1481
                                    end
                                    if (not K4_CaptureGearEnabled()) then
                                        v1481.active = false
                                        return false
                                    end
                                    local v1482 = v348.LocalPlayer.Data:FindFirstChild("Race")
                                    local v1483 = (v1482 and v1482:FindFirstChild("C"))
                                    if (((not v1481.active) and (not v1480)) and ((not v1483) or ((tonumber(v1483.Value) or 0) < 4))) then
                                        return false
                                    end
                                    if (type(v1480) ~= "table") then
                                        if (tick() < v1481.nextCheck) then
                                            return v1481.active
                                        end
                                        v1481.nextCheck = (tick() + 0.75)
                                        local v1484, v1485 = pcall(function()
                                            return v369:InvokeServer("TempleClock", "Check")
                                        end)
                                        if ((not v1484) or (type(v1485) ~= "table")) then
                                            if v1481.active then
                                                status("CaptureGear: waiting for clock data")
                                            end
                                            return v1481.active
                                        end
                                        v1480 = v1485
                                    end
                                    local v1486 = (((type(v1480.RaceDetails) == "table") and v1480.RaceDetails) or {})
                                    local v1487 = (((tonumber(v1486.A) or 0) + (tonumber(v1486.B) or 0)) >= 2)
                                    if (not v1481.active) then
                                        if ((v1480.HadPoint ~= true) or (not v1487)) then
                                            return false
                                        end
                                        v1481.active = true
                                        v1481.startedAt = tick()
                                        v1481.arrived = false
                                        local v1488 = _G.K4PostTrialReset
                                        if v1488 then
                                            v1488.active = true
                                            v1488.mainResetForbidden = true
                                            v1488.mainGearClaimed = false
                                            v1488.mainWinnerPoint = true
                                        end
                                        pcall(K4_CancelTrialMovement)
                                    elseif (v1480.HadPoint == false) then
                                        v1481.active = false
                                        v1481.completed = true
                                        v1481.completedAt = tick()
                                        _K4F.v1469("CaptureGear: manual Gear4 selection verified")
                                        return false
                                    end
                                    v719.AutoClickEnabled = false
                                    _G.SHOULDSPAMSKILLS = false
                                    local v1489 = v348.LocalPlayer.Character
                                    local v1490 = (v1489 and v1489:FindFirstChild("HumanoidRootPart"))
                                    local v1491 = (v1489 and v1489:FindFirstChildOfClass("Humanoid"))
                                    if (((not v1490) or (not v1491)) or (v1491.Health <= 0)) then
                                        status("CaptureGear: waiting for character")
                                        return true
                                    end
                                    local v1492 = CFrame.new(29552, 15069, (-86))
                                    local v1493 = workspace:FindFirstChild("NPCs")
                                    local v1494 = ((v1493 and v1493:FindFirstChild("Ancient Clock")) or workspace:FindFirstChild("Ancient Clock", true))
                                    if v1494 then
                                        if v1494:IsA("BasePart") then
                                            v1492 = v1494.CFrame
                                        elseif v1494:IsA("Model") then
                                            local v1495 = (v1494:FindFirstChild("HumanoidRootPart") or v1494.PrimaryPart)
                                            if (v1495 and v1495:IsA("BasePart")) then
                                                v1492 = v1495.CFrame
                                            elseif v1494:FindFirstChildWhichIsA("BasePart", true) then
                                                v1492 = v1494:GetPivot()
                                            end
                                        end
                                    end
                                    if ((v1490.Position - v1492.Position).Magnitude > 8) then
                                        v1481.arrived = false
                                        v411:topos(v1492)
                                        status("CaptureGear: moving to clock for manual Gear4 selection")
                                    else
                                        if (not v1481.arrived) then
                                            pcall(K4_CancelTrialMovement)
                                            v1481.arrived = true
                                        end
                                        status("CaptureGear: choose Gear4 manually at the clock")
                                    end
                                    return true
                                end
                                checkgear = function()
                                    if (v395 or (not v396)) then
                                        return false
                                    end
                                    if (v962 or (not v369)) then
                                        return false
                                    end
                                    v962 = true
                                    local function v1496(v1497)
                                        v962 = false
                                        return v1497
                                    end
                                    local function v1498(v1499)
                                        local v1500 = (v1499 and v1499.RaceDetails)
                                        if (type(v1500) ~= "table") then
                                            return nil
                                        end
                                        local v1501 = (((type(v1500.Gears) == "table") and v1500.Gears) or {})
                                        local v1502 = {}
                                        for v1503 = 1, 3 do
                                            v1502[v1503] = tostring((v1501[v1503] or ""))
                                        end
                                        return {
                                            hadPoint = (v1499.HadPoint == true),
                                            raceLevel = (tonumber(v1499.RaceLevel) or 0),
                                            a = (tonumber(v1500.A) or 0),
                                            b = (tonumber(v1500.B) or 0),
                                            c = (tonumber(v1500.C) or 0),
                                            completed = ((tonumber(v1500.Completed) or tonumber(v1499.Completed)) or 0),
                                            gears = table.concat(v1502, "|")
                                        }
                                    end
                                    local v1504, v1505 = pcall(function()
                                        return v369:InvokeServer("TempleClock", "Check")
                                    end)
                                    local v1506 = ((v1504 and v1498(v1505)) or nil)
                                    if ((not v1506) or (v1505.HadPoint ~= true)) then
                                        return v1496(false)
                                    end
                                    if K4_RunCaptureGear(v1505) then
                                        return v1496(false)
                                    end
                                    local v1507 = ((getgenv().Config and getgenv().Config.Gear) or "B-B-A")
                                    if (getgenv().Config and getgenv().Config.ChangeBestGear) then
                                        local v1508 = v348.LocalPlayer.Data.Race.Value
                                        if v392[v1508] then
                                            v1507 = v392[v1508]
                                        end
                                    end
                                    local v1509, v1510, v1511 = tostring(v1507):match("^([AB])%-([AB])%-([AB])$")
                                    if (((not v1509) or (not v1510)) or (not v1511)) then
                                        v1509, v1510, v1511 = "B", "B", "A"
                                    end
                                    local v1512 = nil
                                    local v1513 = nil
                                    local v1514 = (v1506.raceLevel < 2)
                                    if v1514 then
                                        v1512 = "Gear1"
                                    else
                                        local v1515 = (v1506.a + v1506.b)
                                        if ((v1515 < 0) or (v1515 > 2)) then
                                            status("Temple Clock has no new branch slot to claim")
                                            return v1496(false)
                                        end
                                        local v1516 = (v1515 + 2)
                                        local v1517 = { v1509, v1510, v1511 }
                                        local v1518 = { A = "Alpha", B = "Omega" }
                                        v1512 = ("Gear" .. tostring(v1516))
                                        v1513 = v1518[v1517[(v1515 + 1)]]
                                        if (v1506.a >= 2) then
                                            v1513 = "Omega"
                                        elseif (v1506.b >= 2) then
                                            v1513 = "Alpha"
                                        elseif ((v1513 ~= "Alpha") and (v1513 ~= "Omega")) then
                                            v1513 = "Omega"
                                        end
                                    end
                                    if v1514 then
                                        status("Claiming Gear1 - Default")
                                    else
                                        status(("Claiming " .. (v1512 .. (" - " .. tostring(v1513)))))
                                    end
                                    local v1519, v1520 = pcall(function()
                                        if v1514 then
                                            return v369:InvokeServer("TempleClock", "SpendPoint")
                                        end
                                        return v369:InvokeServer("TempleClock", "SpendPoint", v1512, v1513)
                                    end)
                                    if ((not v1519) or (v1520 == false)) then
                                        status("Temple Clock rejected gear claim - will retry")
                                        return v1496(false)
                                    end
                                    local v1521 = false
                                    for v1522 = 1, 12 do
                                        task.wait(0.35)
                                        local v1523, v1524 = pcall(function()
                                            return v369:InvokeServer("TempleClock", "Check")
                                        end)
                                        local v1525 = ((v1523 and v1498(v1524)) or nil)
                                        if (v1525 and (v1524.HadPoint == false)) then
                                            v1521 = true
                                            break
                                        end
                                    end
                                    if v1521 then
                                        v1496(true)
                                        _K4F.v1469("Gear claimed and verified successfully")
                                        return true
                                    end
                                    status("Gear claim not verified - keeping pair and retrying")
                                    return v1496(false)
                                end
                                local v1526 = false
                                local v1527 = 0
                                function _K4F.v1528(v1529)
                                    v1529 = tostring((v1529 or ""))
                                    if (type(status) == "function") then
                                        status(v1529)
                                    else
                                        warn(("[K4] " .. v1529))
                                    end
                                end
                                function _K4F.v1530(v1531)
                                    local v1532 = tostring((v1531 or "")):lower()
                                    if ((v1532 == "") or (v1532 == "nil")) then
                                        return ""
                                    end
                                    if ((v1532 == "a") or v1532:find("alpha", 1, true)) then
                                        return "A"
                                    end
                                    if ((v1532 == "b") or v1532:find("omega", 1, true)) then
                                        return "B"
                                    end
                                    return ""
                                end
                                function _K4F.v1533(v1534)
                                    if (type(v1534) ~= "table") then
                                        return nil
                                    end
                                    local v1535 = v1534.RaceDetails
                                    if (type(v1535) ~= "table") then
                                        return nil
                                    end
                                    local v1536 = (((type(v1535.Gears) == "table") and v1535.Gears) or {})
                                    local v1537 = {}
                                    for v1538 = 1, 3 do
                                        local v1539 = (v1538 + 1)
                                        local v1540 = ((((((v1536[v1538] or v1536[tostring(v1538)]) or v1536[v1539]) or v1536[tostring(v1539)]) or v1536[("Gear" .. tostring(v1539))]) or v1535[("Gear" .. tostring(v1539))]) or v1535[("G" .. tostring(v1539))])
                                        v1537[v1538] = _K4F.v1530(v1540)
                                    end
                                    return {
                                        hadPoint = (v1534.HadPoint == true),
                                        raceLevel = (tonumber(v1534.RaceLevel) or 0),
                                        a = ((tonumber(v1535.A) or tonumber(v1535.Alpha)) or 0),
                                        b = ((tonumber(v1535.B) or tonumber(v1535.Omega)) or 0),
                                        c = (tonumber(v1535.C) or 0),
                                        completed = ((tonumber(v1535.Completed) or tonumber(v1534.Completed)) or 0),
                                        installed = v1537,
                                        gearText = table.concat(v1537, "|")
                                    }
                                end
                                function _K4F.v1541(v1542)
                                    local v1543 = {}
                                    if (not v1542) then
                                        return v1543
                                    end
                                    for v1544, v1545 in ipairs({ 2, 3, 4 }) do
                                        local v1546 = v1542.installed[(v1545 - 1)]
                                        if (v1546 == "A") then
                                            table.insert(v1543, { slot = ("Gear" .. tostring(v1545)), choice = "Omega" })
                                        elseif (v1546 == "B") then
                                            table.insert(v1543, { slot = ("Gear" .. tostring(v1545)), choice = "Alpha" })
                                        end
                                    end
                                    return v1543
                                end
                                helpSwapGearForTrial = function(v1547)
                                    if (not v395) then
                                        return false
                                    end
                                    if (getgenv().Config and (getgenv().Config["Help Auto Swap Gear"] == false)) then
                                        return false
                                    end
                                    if (v1526 or (not v369)) then
                                        return false
                                    end
                                    local v1548 = math.max(0.5, (tonumber((getgenv().Config and getgenv().Config["Help Gear Swap Interval"])) or 2))
                                    if ((not v1547) and ((tick() - v1527) < v1548)) then
                                        return false
                                    end
                                    v1527 = tick()
                                    v1526 = true
                                    local function v1549(v1550)
                                        v1526 = false
                                        return v1550
                                    end
                                    local v1551, v1552 = pcall(function()
                                        return v369:InvokeServer("TempleClock", "Check")
                                    end)
                                    local v1553 = ((v1551 and _K4F.v1533(v1552)) or nil)
                                    if ((not v1553) or (not v1553.hadPoint)) then
                                        return v1549(false)
                                    end
                                    local v1554 = _K4F.v1541(v1553)
                                    if (#v1554 <= 0) then
                                        _K4F.v1528("HELP unspent point detected, but TempleClock returned no installed gear slot")
                                        return v1549(false)
                                    end
                                    for v1555, v1556 in ipairs(v1554) do
                                        local v1557, v1558 = v1556.slot, v1556.choice
                                        _K4F.v1528(("HELP swap gear for trial: " .. (v1557 .. (" -> " .. v1558))))
                                        local v1559, v1560 = pcall(function()
                                            return v369:InvokeServer("TempleClock", "SpendPoint", v1557, v1558)
                                        end)
                                        if (v1559 and (v1560 ~= false)) then
                                            for v1561 = 1, 10 do
                                                task.wait(0.25)
                                                local v1562, v1563 = pcall(function()
                                                    return v369:InvokeServer("TempleClock", "Check")
                                                end)
                                                local v1564 = ((v1562 and _K4F.v1533(v1563)) or nil)
                                                if (v1564 and ((v1564.hadPoint == false) or (v1564.gearText ~= v1553.gearText))) then
                                                    _K4F.v639()
                                                    _K4F.v1528("HELP gear swapped - TempleClock HadPoint cleared")
                                                    return v1549(true)
                                                end
                                            end
                                        else
                                            _K4F.v1528(("HELP TempleClock rejected " .. (tostring(v1557) .. (" -> " .. tostring(v1558)))))
                                        end
                                    end
                                    _K4F.v1528("HELP gear swap not verified - will retry")
                                    return v1549(false)
                                end
                                task.spawn(function()
                                    while task.wait(2) do
                                        if ((v395 and getgenv().Config) and (getgenv().Config["Help Auto Swap Gear"] ~= false)) then
                                            if (isfullmoon() or (v948 and v948.assigned)) then
                                                pcall(helpSwapGearForTrial, false)
                                            end
                                        end
                                    end
                                end)
                                task.spawn(function()
                                    while task.wait(5) do
                                        if (v348.LocalPlayer.Character and v348.LocalPlayer.Character:FindFirstChild("Humanoid")) then
                                            pcall(autoEquipGear)
                                        end
                                    end
                                end)
                                task.spawn(function()
                                    while task.wait(1) do
                                        if (((v396 and isMyUpgearTurn()) and v948) and v948.assigned) then
                                            pcall(checkgear)
                                        end
                                    end
                                end)
                                local v1565
                                local v1566 = {
                                    Human = CFrame.new(29221.822, 14890.975, (-205.991)),
                                    Skypiea = CFrame.new(28960.158, 14919.624, 235.039),
                                    Fishman = CFrame.new(28231.175, 14890.975, (-211.641)),
                                    Cyborg = CFrame.new(28502.681, 14895.975, (-423.727)),
                                    Ghoul = CFrame.new(28674.244, 14890.676, 445.431),
                                    Mink = CFrame.new(29012.341, 14890.975, (-380.149))
                                }
                                function _K4F.v1567()
                                    local v1568 = ""
                                    pcall(function()
                                        v1568 = tostring(v348.LocalPlayer.Data.Race.Value)
                                    end)
                                    return v1568
                                end
                                function _K4F.v1569()
                                    local v1570 = v348.LocalPlayer.Character
                                    local v1571 = (v1570 and v1570:FindFirstChild("HumanoidRootPart"))
                                    if (not v1571) then
                                        _G.lastDoorDist, _G.lastDoorSrc = math.huge, "X"
                                        return math.huge, nil, nil
                                    end
                                    local v1572 = getdoor()
                                    if v1572 then
                                        local v1573 = (v1572.Position - v1571.Position).Magnitude
                                        _G.lastDoorDist, _G.lastDoorSrc = v1573, "R"
                                        return v1573, v1572, v1572.CFrame
                                    end
                                    local v1574 = v1566[_K4F.v1567()]
                                    if v1574 then
                                        local v1575 = (v1574.Position - v1571.Position).Magnitude
                                        _G.lastDoorDist, _G.lastDoorSrc = v1575, "B"
                                        return v1575, nil, v1574
                                    end
                                    _G.lastDoorDist, _G.lastDoorSrc = math.huge, "X"
                                    return math.huge, nil, nil
                                end
                                function _K4F.v1576()
                                    local v1577 = v348.LocalPlayer.Character
                                    local v1578 = (v1577 and v1577:FindFirstChildOfClass("Humanoid"))
                                    local v1579, v1580, v1581 = _K4F.v1569()
                                    local v1582 = false
                                    pcall(function()
                                        v1582 = (v348.LocalPlayer.PlayerGui.Main.Timer.Visible == true)
                                    end)
                                    local v1583 = ((v1578 ~= nil) and (v1578.Health > 0))
                                    local v1584 = ((v1583 and (v1581 ~= nil)) and (v1579 <= v993))
                                    return {
                                        door = v1580,
                                        targetCFrame = v1581,
                                        distance = v1579,
                                        nearDoor = v1584,
                                        timerVisible = v1582,
                                        alive = v1583,
                                        source = (_G.lastDoorSrc or "X")
                                    }
                                end
                                local v1585 = CFrame.new(2252.15478515625, 29.89207649230957, (-6873.9169921875))
                                local v1586 = CFrame.new(3032, 2280, (-7325))
                                local v1587 = "kurinianhub/greattree_spawn.json"
                                function _K4F.v1588(v1589)
                                    local v1590 = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
                                    local v1591 = (v1590 and (v1590:FindFirstChild("CommF_") or v1590:FindFirstChild("CommF")))
                                    if v1591 then
                                        return v1591:InvokeServer(v1589)
                                    end
                                end
                                function _K4F.v1592()
                                    if (_G.K4GreatTreeSpawnSaved == true) then
                                        return true
                                    end
                                    local v1593, v1594 = pcall(function()
                                        if (isfile and isfile(v1587)) then
                                            return game:GetService("HttpService"):JSONDecode(readfile(v1587))
                                        end
                                        return nil
                                    end)
                                    if (v1593 and (type(v1594) == "table")) then
                                        local v1595 = game.Players.LocalPlayer.Name
                                        if (v1594[v1595] == true) then
                                            _G.K4GreatTreeSpawnSaved = true
                                            return true
                                        end
                                    end
                                    return false
                                end
                                function _K4F.v1596()
                                    _G.K4GreatTreeSpawnSaved = true
                                    local v1597 = {}
                                    pcall(function()
                                        if (isfile and isfile(v1587)) then
                                            v1597 = (game:GetService("HttpService"):JSONDecode(readfile(v1587)) or {})
                                        end
                                    end)
                                    if (type(v1597) ~= "table") then
                                        v1597 = {}
                                    end
                                    v1597[game.Players.LocalPlayer.Name] = true
                                    if ((type(isfolder) == "function") and (not isfolder("kurinianhub"))) then
                                        pcall(function()
                                            makefolder("kurinianhub")
                                        end)
                                    end
                                    if (type(writefile) == "function") then
                                        pcall(function()
                                            writefile(v1587, game:GetService("HttpService"):JSONEncode(v1597))
                                        end)
                                    end
                                end
                                K4_PrepareGreatTreeBeforeMoon = function()
                                    if (not v396) then
                                        return true
                                    end
                                    local v1598 = v348.LocalPlayer.Character
                                    local v1599 = (v1598 and v1598:FindFirstChild("HumanoidRootPart"))
                                    local v1600 = (v1598 and v1598:FindFirstChildOfClass("Humanoid"))
                                    if (((not v1599) or (not v1600)) or (v1600.Health <= 0)) then
                                        status("Training complete - waiting respawn before Great Tree")
                                        return false
                                    end
                                    if ((v1599.Position.Y >= 14000) and ((v1599.Position - Vector3.new(28310, 14895, 109)).Magnitude < 3000)) then
                                        return true
                                    end
                                    if K4TyrantFarmController.IsActive() then
                                        K4TyrantFarmController.Stop()
                                    end
                                    v719.AutoClickEnabled = false
                                    _G.SHOULDSPAMSKILLS = false
                                    if ((v1599.Position - v1585.Position).Magnitude > 35) then
                                        status("Training complete - moving to Great Tree before joining Full Moon")
                                        v411:topos(v1585)
                                        return false
                                    end
                                    pcall(K4_CancelTrialMovement)
                                    if (_G.K4PreMoonSpawnJob ~= tostring(game.JobId)) then
                                        local v1601, v1602 = pcall(function()
                                            return _K4F.v1588("SetSpawnPoint")
                                        end)
                                        if ((not v1601) or (v1602 == false)) then
                                            status("Great Tree - retrying SetSpawnPoint before Full Moon")
                                            return false
                                        end
                                        _K4F.v1596()
                                        _G.K4PreMoonSpawnJob = tostring(game.JobId)
                                    end
                                    status("Great Tree ready - waiting to join Full Moon")
                                    return true
                                end
                                function _K4F.v1603()
                                    _G.K4GreatTreeSpawnSaved = false
                                    local v1604 = {}
                                    pcall(function()
                                        if (isfile and isfile(v1587)) then
                                            v1604 = (game:GetService("HttpService"):JSONDecode(readfile(v1587)) or {})
                                        end
                                    end)
                                    if ((type(v1604) == "table") and v1604[game.Players.LocalPlayer.Name]) then
                                        v1604[game.Players.LocalPlayer.Name] = nil
                                        if (type(writefile) == "function") then
                                            pcall(function()
                                                writefile(v1587, game:GetService("HttpService"):JSONEncode(v1604))
                                            end)
                                        end
                                    end
                                end
                                K4_HookTeleportHome = function(v1605)
                                    local v1606 = nil
                                    local v1607 = nil
                                    pcall(function()
                                        v1607 = game.Players.LocalPlayer:WaitForChild("PlayerGui", 5)
                                    end)
                                    if (not v1607) then
                                        return nil
                                    end
                                    local function v1608(v1609)
                                        if v1606 then
                                            return
                                        end
                                        local v1610, v1611 = pcall(function()
                                            return v1609.Text
                                        end)
                                        if ((v1610 and (type(v1611) == "string")) and (v1611 ~= "")) then
                                            local v1612 = ((v1611:match("Teleporting home to <(.-)>") or v1611:match("Teleporting to <(.-)>")) or v1611:match("home to <(.-)>"))
                                            if (v1612 and (v1612 ~= "")) then
                                                v1606 = v1612
                                            elseif v1611:lower():find("great tree", 1, true) then
                                                v1606 = "Great Tree"
                                            end
                                        end
                                    end
                                    pcall(function()
                                        for v1613, v1614 in ipairs(v1607:GetDescendants()) do
                                            v1608(v1614)
                                        end
                                    end)
                                    local v1615 = nil
                                    pcall(function()
                                        v1615 = v1607.DescendantAdded:Connect(function(v1616)
                                            task.wait(0.1)
                                            v1608(v1616)
                                        end)
                                    end)
                                    pcall(function()
                                        _K4F.v1588("TeleportToSpawn")
                                    end)
                                    local v1617 = (tick() + (tonumber(v1605) or 8))
                                    repeat
                                        task.wait(0.15)
                                    until ((v1606 ~= nil) or (tick() >= v1617))
                                    if v1615 then
                                        pcall(function()
                                            v1615:Disconnect()
                                        end)
                                    end
                                    return v1606
                                end
                                K4_HandleFarTemple = function()
                                    if (tick() < (tonumber(_G.K4FarTempleCooldownUntil) or 0)) then
                                        return false
                                    end
                                    local v1618 = game.Players.LocalPlayer.Character
                                    local v1619 = (v1618 and v1618:FindFirstChild("HumanoidRootPart"))
                                    if (not v1619) then
                                        return true
                                    end
                                    if ((v1619.Position - TEMPLE_ENTRY_POSITION).Magnitude < 3000) then
                                        return false
                                    end
                                    if ((v1619.Position - v1586.Position).Magnitude <= 2600) then
                                        return false
                                    end
                                    if _K4F.v1592() then
                                        status("Hooking TeleportToSpawn - kiem tra dich den Great Tree...")
                                        _G.K4FarTempleCooldownUntil = (tick() + 20)
                                        local v1620 = K4_HookTeleportHome(7)
                                        local v1621 = (v1620 and (v1620:lower():find("great tree", 1, true) ~= nil))
                                        status(((v1621 and "Dich den la Great Tree - cho 7s hoan tat teleport...") or "Dang cho teleport task.spawn(7s)..."))
                                        task.wait(7)
                                        local v1622 = game.Players.LocalPlayer.Character
                                        local v1623 = (v1622 and v1622:FindFirstChild("HumanoidRootPart"))
                                        local v1624 = (v1623 and ((v1623.Position - v1586.Position).Magnitude <= 2600))
                                        if (v1621 or v1624) then
                                            status("Xac nhan da ha canh tai Great Tree! Tiep tuc tween len NPC...")
                                            return true
                                        else
                                            status(("Spawn hien tai [" .. (tostring((v1620 or "Khac")) .. "] khong phai Great Tree! Xoa cache & bat dau bay toi Great Tree...")))
                                            _K4F.v1603()
                                            task.wait(2)
                                        end
                                    end
                                    if (not _G._K4CheckedInitSpawn) then
                                        _G._K4CheckedInitSpawn = true
                                        status("Kiem tra nhanh spawn hien tai...")
                                        local v1625 = K4_HookTeleportHome(6)
                                        if (v1625 and v1625:lower():find("great tree", 1, true)) then
                                            status("Acc da co san spawn tai Great Tree! Cho 7s & luu JSON...")
                                            task.wait(7)
                                            local v1626 = game.Players.LocalPlayer.Character
                                            local v1627 = (v1626 and v1626:FindFirstChild("HumanoidRootPart"))
                                            if (v1627 and ((v1627.Position - v1586.Position).Magnitude <= 2600)) then
                                                _K4F.v1596()
                                                status("Xac nhan Great Tree & da luu JSON! Tweening len NPC...")
                                                return true
                                            end
                                        else
                                            task.wait(2)
                                        end
                                    end
                                    status("Chua set spawn Great Tree - dang tween toi diem SetSpawnPoint...")
                                    _G.K4FarTempleCooldownUntil = (tick() + 60)
                                    _G.K4StagingClaim = { target = v1585, untilTick = (tick() + 60) }
                                    local v1628 = false
                                    local v1629 = (tick() + 45)
                                    while (tick() < v1629) do
                                        local v1630 = game.Players.LocalPlayer.Character
                                        local v1631 = (v1630 and v1630:FindFirstChild("HumanoidRootPart"))
                                        if (not v1631) then
                                            break
                                        end
                                        if ((v1631.Position - v1585.Position).Magnitude <= 35) then
                                            v1628 = true
                                            break
                                        end
                                        pcall(function()
                                            if (type(v590) == "function") then
                                                v590(v1585)
                                            elseif (v411 and (type(v411.topos) == "function")) then
                                                v411:topos(v1585)
                                            end
                                        end)
                                        task.wait(0.5)
                                    end
                                    _G.K4StagingClaim = nil
                                    if v1628 then
                                        status("Den diem staging Great Tree - dang goi SetSpawnPoint...")
                                        pcall(function()
                                            _K4F.v1588("SetSpawnPoint")
                                        end)
                                        task.wait(1)
                                        _K4F.v1596()
                                        status("SetSpawnPoint thanh cong & da luu JSON! Tweening len Great Tree NPC...")
                                        _G.K4FarTempleCooldownUntil = (tick() + 5)
                                        return true
                                    else
                                        status("Dang tiep tuc bay ve Great Tree SetSpawnPoint...")
                                        _G.K4FarTempleCooldownUntil = (tick() + 5)
                                        return true
                                    end
                                end
                                local v1632 = Vector3.new(28310.0234, 14895.1123, 109.456741)
                                K4_RecordMainLobbyPosition = function()
                                    if ((not v396) or isMyUpgearTurn()) then
                                        return false
                                    end
                                    local v1633 = ((v948 and tostring((v948.hub_id or ""))) or "")
                                    if ((v1633 == "") or (tostring((v948.hub_job_id or "")) ~= tostring(game.JobId))) then
                                        return false
                                    end
                                    local v1634 = v348.LocalPlayer.Character
                                    local v1635 = (v1634 and v1634:FindFirstChild("HumanoidRootPart"))
                                    if (not v1635) then
                                        return false
                                    end
                                    if (_G.K4TurnGuard.waitingHubId ~= v1633) then
                                        _G.K4TurnGuard.waitingHubId = v1633
                                        _G.K4TurnGuard.waitingCFrame = nil
                                    end
                                    local v1636 = v348.LocalPlayer.RespawnLocation
                                    if (v1636 and v1636:IsA("SpawnLocation")) then
                                        _G.K4TurnGuard.waitingCFrame = (v1636.CFrame * CFrame.new(0, 5, 0))
                                        return true
                                    end
                                    if ((v1635.Position - v1632).Magnitude >= 2500) then
                                        _G.K4TurnGuard.waitingCFrame = v1635.CFrame
                                        return true
                                    end
                                    return false
                                end
                                K4_HoldWaitingMainAtLobby = function()
                                    if ((not v396) or isMyUpgearTurn()) then
                                        return false
                                    end
                                    local v1637 = K4_MainScriptResetBlocked()
                                    local v1638 = ((_G.K4PostTrialReset and K4_PostTrialLockPending()) and (_G.K4PostTrialReset.mainGearClaimed ~= true))
                                    if (v1637 or v1638) then
                                        v946 = false
                                        pcall(K4_CancelTrialMovement)
                                        status("Post-Trial lock: scripted Main reset blocked until gear claim succeeds")
                                        return true
                                    end
                                    v946 = false
                                    local v1639 = v348.LocalPlayer.Character
                                    local v1640 = (v1639 and v1639:FindFirstChildOfClass("Humanoid"))
                                    local v1641 = (v1639 and v1639:FindFirstChild("HumanoidRootPart"))
                                    if (not ((v1640 and v1641) and (v1640.Health > 0))) then
                                        return false
                                    end
                                    local v1642 = (v1641.Position - v1632).Magnitude
                                    if ((v1642 >= 3000) or (v1641.Position.Y < 14000)) then
                                        local v1643 = CFrame.new(3032, 2280, (-7325))
                                        local v1644 = (v1641.Position - v1643.Position).Magnitude
                                        do
                                            local v1645 = _G.K4StagingClaim
                                            if ((v1645 and (tick() < (tonumber(v1645.untilTick) or 0))) and (typeof(v1645.target) == "CFrame")) then
                                                pcall(function()
                                                    v411:topos(v1645.target)
                                                end)
                                                return true
                                            end
                                            if (v1644 > 2600) then
                                                local v1646, v1647 = pcall(K4_HandleFarTemple)
                                                if (v1646 and v1647) then
                                                    return true
                                                end
                                            end
                                            if (v1644 > 10) then
                                                pcall(function()
                                                    v411:topos(v1643)
                                                end)
                                            end
                                            if ((v1644 <= 10) or K4_TempleStuckNearTree(v1644)) then
                                                if ((not _G.lastReqEntrance) or ((tick() - _G.lastReqEntrance) > 1)) then
                                                    _G.lastReqEntrance = tick()
                                                    pcall(K4_TryEnterTemple, v1644, v1641.Position.Y)
                                                end
                                            end
                                            return true
                                        end
                                    end
                                    if (v1642 > 15) then
                                        pcall(function()
                                            v411:topos(CFrame.new(v1632))
                                        end)
                                    else
                                        pcall(K4_CancelTrialMovement)
                                        pcall(function()
                                            if v1640.Sit then
                                                v1640.Sit = false
                                            end
                                            v1641.Velocity = Vector3.zero
                                        end)
                                    end
                                    return true
                                end
                                function _K4F.v1648()
                                    local v1649 = _K4F.v1567()
                                    local v1650 = v596[v1649]
                                    if v1650 then
                                        local v1651, v1652 = pcall(function()
                                            return getdis(v1650.CFrame)
                                        end)
                                        if (v1651 and (v1652 < 1500)) then
                                            return true
                                        end
                                    end
                                    local v1653 = false
                                    pcall(function()
                                        v1653 = (v348.LocalPlayer.PlayerGui.Main.Timer.Visible == true)
                                    end)
                                    return v1653
                                end
                                _G.K4DoorRecovery.isTrialDoorOpen = function()
                                    local v1654 = getdoor()
                                    local v1655 = (v1654 and v1654.Parent)
                                    if (not v1655) then
                                        return false
                                    end
                                    local v1656 = nil
                                    local v1657 = nil
                                    local v1658 = nil
                                    pcall(function()
                                        v1656 = v1655:GetAttribute("State")
                                    end)
                                    pcall(function()
                                        v1657 = v1655:GetAttribute("Open")
                                    end)
                                    pcall(function()
                                        v1658 = v1655:GetAttribute("Opened")
                                    end)
                                    return (((string.lower(tostring((v1656 or ""))) == "open") or (v1657 == true)) or (v1658 == true))
                                end
                                _G.K4DoorRecovery.isTrialStartedOrDoorOpen = function()
                                    return (_K4F.v1648() or _G.K4DoorRecovery.isTrialDoorOpen())
                                end
                                _K4TrialCycleIsActive = function()
                                    if ((type(K4_HelpCanLeaveRejectedHub) == "function") and K4_HelpCanLeaveRejectedHub()) then
                                        return false
                                    end
                                    if (getgenv().Config["Defer Moon Hop During Trial"] == false) then
                                        return false
                                    end
                                    if ((not v948) or (v948.assigned ~= true)) then
                                        return false
                                    end
                                    local v1659 = false
                                    pcall(function()
                                        v1659 = (v348.LocalPlayer.PlayerGui.Main.Timer.Visible == true)
                                    end)
                                    local v1660 = false
                                    pcall(function()
                                        local v1661 = workspace.Map:FindFirstChild("Temple of Time")
                                        local v1662 = (v1661 and v1661:FindFirstChild("FFABorder"))
                                        local v1663 = (v1662 and v1662:FindFirstChild("Forcefield"))
                                        v1660 = ((v1663 and (v1663.Transparency == 0)) or false)
                                    end)
                                    local v1664 = _K4F.v1648()
                                    local v1665 = _G.K4DoorRecovery.isTrialDoorOpen()
                                    local v1666 = (((tostring((v952 or "")) ~= "") or (tostring((v951 or "")) ~= "")) or ((tonumber(v967) or 0) > 0))
                                    local v1667 = ((v1664 or v1659) or ((v1665 or v1660) and v1666))
                                    if v1667 then
                                        if (not _G.K4TrialLifecycle.started) then
                                            _G.K4TrialLifecycle.started = true
                                            _G.K4TrialLifecycle.startedAt = tick()
                                        end
                                        _G.K4TrialLifecycle.lastActiveAt = tick()
                                        _G.K4TrialLifecycle.groupId = ((v948 and tostring((v948.group_id or ""))) or "")
                                        v966 = true
                                        _G.K4PostTrialReset.armed = true
                                        _G.K4PostTrialReset.armedAt = tick()
                                        _G.K4PostTrialReset.armedGroup = tostring((_G.K4TrialLifecycle.groupId or ""))
                                        _G.K4PostTrialReset.trialSeen = true
                                        if v396 then
                                            _G.K4PostTrialReset.mainResetForbidden = true
                                        end
                                    end
                                    if (_G.K4TrialLifecycle.started and ((tick() - (tonumber(_G.K4TrialLifecycle.lastActiveAt) or 0)) <= 4)) then
                                        return true
                                    end
                                    return v1667
                                end
                                _K4TrialCycleDeferMoonEnd = function(v1668)
                                    if (not _K4TrialCycleIsActive()) then
                                        return false
                                    end
                                    _G.K4TrialLifecycle.endMoonPending = true
                                    _G.K4TrialLifecycle.endMoonReason = tostring((v1668 or "moon_ended"))
                                    _G.K4TrialLifecycle.endMoonDetectedAt = tick()
                                    _G.K4MoonHub.endDeferredForTrial = true
                                    return true
                                end
                                function _K4F.v1669()
                                    local v1670 = v348.LocalPlayer.Character
                                    local v1671 = (v1670 and v1670:FindFirstChild("HumanoidRootPart"))
                                    local v1672 = (v1670 and v1670:FindFirstChildOfClass("Humanoid"))
                                    if (not ((v1671 and v1672) and (v1672.Health > 0))) then
                                        return false, math.huge
                                    end
                                    _K4F.v1567()
                                    local v1674 = (v1671.Position - v1632).Magnitude
                                    if ((v1674 >= 3000) or (v1671.Position.Y < 14000)) then
                                        local v1675 = CFrame.new(3032, 2280, (-7325))
                                        local v1676 = (v1671.Position - v1675.Position).Magnitude
                                        do
                                            local v1677 = _G.K4StagingClaim
                                            if ((v1677 and (tick() < (tonumber(v1677.untilTick) or 0))) and (typeof(v1677.target) == "CFrame")) then
                                                pcall(function()
                                                    v411:topos(v1677.target)
                                                end)
                                                return false, v1674
                                            end
                                            if (v1676 > 2600) then
                                                local v1678, v1679 = pcall(K4_HandleFarTemple)
                                                if (v1678 and v1679) then
                                                    return false, v1674
                                                end
                                            end
                                            if (v1676 > 10) then
                                                pcall(function()
                                                    v590(v1675)
                                                end)
                                            end
                                            if ((v1676 <= 10) or K4_TempleStuckNearTree(v1676)) then
                                                if ((not _G.lastReqEntrance) or ((tick() - _G.lastReqEntrance) > 1)) then
                                                    _G.lastReqEntrance = tick()
                                                    pcall(K4_TryEnterTemple, v1676, v1671.Position.Y)
                                                end
                                            end
                                            return false, v1674
                                        end
                                    end
                                    local v1680, v1681, v1682 = _K4F.v1569()
                                    if (v1681 and v1682) then
                                        pcall(function()
                                            v590(v1682)
                                        end)
                                    end
                                    return ((v1681 ~= nil) and (v1680 <= v993)), v1680
                                end
                                function _K4F.v1683()
                                    if (v396 and (not isMyUpgearTurn())) then
                                        return false
                                    end
                                    if (v395 and ((not v948) or (v948.can_approach_trial ~= true))) then
                                        return false
                                    end
                                    if ((not v1565()) or (not (isnight() and isfullmoon()))) then
                                        return false
                                    end
                                    if _K4F.v1648() then
                                        return true
                                    end
                                    if ((tick() - v963) < v992) then
                                        return false
                                    end
                                    v963 = tick()
                                    local v1684 = workspace:FindFirstChild("Map")
                                    if (v1684 and (not v1684:FindFirstChild("Temple of Time"))) then
                                        local v1685 = v349:FindFirstChild("MapStash")
                                        local v1686 = (v1685 and v1685:FindFirstChild("Temple of Time"))
                                        if v1686 then
                                            v1686.Parent = v1684
                                        end
                                    end
                                    local v1687 = v348.LocalPlayer.Character
                                    local v1688 = (v1687 and v1687:FindFirstChild("HumanoidRootPart"))
                                    if (not v1688) then
                                        status("Paired - waiting character before Temple")
                                        return false
                                    end
                                    local v1689, v1690 = _K4F.v1669()
                                    if v1689 then
                                        v965 = v1690
                                        v964 = tick()
                                        if _G.K4DoorRecovery.isTrialDoorOpen() then
                                            status(string.format("Trial door open - entering Trial (%.0f studs)", v1690))
                                        else
                                            status(string.format("Paired - at race door (%.0f studs)", v1690))
                                        end
                                        return true
                                    end
                                    local v1691 = (v1688.Position - v1632).Magnitude
                                    if (v1691 >= 3000) then
                                        status("Paired - entering Temple of Time")
                                        return false
                                    end
                                    if ((v1690 + 20) < v965) then
                                        v965 = v1690
                                        v964 = tick()
                                    elseif (v964 <= 0) then
                                        v964 = tick()
                                    end
                                    if (v1690 == math.huge) then
                                        status("Paired - waiting race door to stream")
                                    else
                                        status(string.format("Paired - holding race door (%.0f studs, %s)", v1690, tostring((_G.lastDoorSrc or "X"))))
                                    end
                                    return false
                                end
                                local v1694 = (((((type(writefile) == "function") and (type(readfile) == "function")) and (type(isfile) == "function")) and (type(makefolder) == "function")) and (type(isfolder) == "function"))
                                function _K4F.v1705()
                                    if ((v948 and v948.assigned) and v948.group_id) then
                                        return tostring(v948.group_id)
                                    end
                                    return ""
                                end
                                v1565 = function()
                                    if ((v948 == nil) or (v948.assigned ~= true)) then
                                        return false
                                    end
                                    if (tostring((v948.main_job_id or "")) ~= tostring(game.JobId)) then
                                        return false
                                    end
                                    if ((_K4F.v1705() == "") or (tostring((v948.turn_token or "")) == "")) then
                                        return false
                                    end
                                    if v396 then
                                        return isMyUpgearTurn()
                                    end
                                    if v395 then
                                        return (v948.can_approach_trial == true)
                                    end
                                    return false
                                end
                                _G.K4V3ToolSync = (_G.K4V3ToolSync or {})
                                local v1715 = _G.K4V3ToolSync
                                v1715.version = 2
                                v1715.groupId = tostring((v1715.groupId or ""))
                                v1715.busy = false
                                v1715.lastPollAt = (tonumber(v1715.lastPollAt) or 0)
                                v1715.lastOkAt = (tonumber(v1715.lastOkAt) or 0)
                                v1715.lastError = tostring((v1715.lastError or "not_synced"))
                                v1715.readyCount = (tonumber(v1715.readyCount) or 0)
                                v1715.allReady = (v1715.allReady == true)
                                v1715.readyReason = tostring((v1715.readyReason or "waiting"))
                                v1715.firedCount = (tonumber(v1715.firedCount) or 0)
                                v1715.allFired = (v1715.allFired == true)
                                v1715.anyTrialStarted = (v1715.anyTrialStarted == true)
                                v1715.doorWaitRemainingMs = (tonumber(v1715.doorWaitRemainingMs) or (-1))
                                v1715.round = nil
                                v1715.recovery = nil
                                v1715.roundLocalTimes = (v1715.roundLocalTimes or {})
                                v1715.recoveryLocalTimes = (v1715.recoveryLocalTimes or {})
                                function _K4F.v1716(v1717)
                                    v1715.groupId = tostring((v1717 or ""))
                                    v1715.lastPollAt = 0
                                    v1715.lastOkAt = 0
                                    v1715.lastError = "group_changed"
                                    v1715.readyCount = 0
                                    v1715.allReady = false
                                    v1715.readyReason = "waiting"
                                    v1715.firedCount = 0
                                    v1715.allFired = false
                                    v1715.anyTrialStarted = false
                                    v1715.doorWaitRemainingMs = (-1)
                                    v1715.round = nil
                                    v1715.recovery = nil
                                    v1715.roundLocalTimes = {}
                                    v1715.recoveryLocalTimes = {}
                                end
                                local v1718 = ""
                                function _K4F.v1719(v1720)
                                    v1720 = tostring((v1720 or ""))
                                    if ((v1720 == "") or (v1720 == v1718)) then
                                        return false
                                    end
                                    v1718 = v1720
                                    if (tostring((v952 or "")) == v1720) then
                                        v952 = ""
                                    end
                                    v951 = ""
                                    v967 = 0
                                    v966 = false
                                    v947 = 0
                                    v946 = false
                                    if _G.K4TrialLifecycle then
                                        _G.K4TrialLifecycle.groupId = _K4F.v1705()
                                        _G.K4TrialLifecycle.started = false
                                        _G.K4TrialLifecycle.startedAt = 0
                                        _G.K4TrialLifecycle.lastActiveAt = 0
                                    end
                                    if (_G.K4PostTrialReset and (_G.K4PostTrialReset.active ~= true)) then
                                        _G.K4PostTrialReset.armed = false
                                        _G.K4PostTrialReset.trialSeen = false
                                        _G.K4PostTrialReset.ffaLatched = false
                                        _G.K4PostTrialReset.ffaInactiveAt = 0
                                        _G.K4PostTrialReset.completed = false
                                        _G.K4PostTrialReset.mainResetForbidden = false
                                    end
                                    if _G.K4DoorRecovery then
                                        _G.K4DoorRecovery.allFiredRoundId = ""
                                        _G.K4DoorRecovery.allFiredAt = 0
                                        _G.K4DoorRecovery.issuedForRound = ""
                                    end
                                    status("Failed Trial detected - V3 retry re-armed")
                                    return true
                                end
                                function _K4F.v1721(v1722, v1723, v1724)
                                    v1722 = (tonumber(v1722) or 0)
                                    v1723 = (tonumber(v1723) or 0)
                                    v1724 = math.max(0, (tonumber(v1724) or 0))
                                    if ((v1722 <= 0) or (v1723 <= 0)) then
                                        return tick()
                                    end
                                    local v1725 = ((v1723 - v1722) / 1000)
                                    v1725 = (v1725 - math.min(0.3, (v1724 * 0.5)))
                                    return (tick() + v1725)
                                end
                                function _K4F.v1726(v1727, v1728)
                                    if ((type(v1727) ~= "table") or (v1727.ok ~= true)) then
                                        return false
                                    end
                                    local v1729 = tostring((v1727.group_id or ""))
                                    if ((v1729 == "") or (v1729 ~= _K4F.v1705())) then
                                        return false
                                    end
                                    v1715.groupId = v1729
                                    v1715.lastOkAt = tick()
                                    v1715.lastError = "ok"
                                    v1715.readyCount = (tonumber(v1727.ready_count) or 0)
                                    v1715.allReady = (v1727.all_ready == true)
                                    v1715.readyReason = tostring((v1727.ready_reason or "waiting"))
                                    v1715.firedCount = (tonumber(v1727.fired_count) or 0)
                                    v1715.allFired = (v1727.all_fired == true)
                                    v1715.anyTrialStarted = (v1727.any_trial_started == true)
                                    v1715.doorWaitRemainingMs = (tonumber(v1727.door_wait_remaining_ms) or (-1))
                                    local v1730 = (tonumber(v1727.server_time_ms) or 0)
                                    local v1731 = (((type(v1727.round) == "table") and v1727.round) or nil)
                                    if (v1731 and (tostring((v1731.round_id or "")) ~= "")) then
                                        local v1732 = tostring(v1731.round_id)
                                        local v1733 = v1715.roundLocalTimes[v1732]
                                        if (not v1733) then
                                            v1733 = _K4F.v1721(v1730, v1731.fire_at_ms, v1728)
                                            v1715.roundLocalTimes[v1732] = v1733
                                        end
                                        v1731.local_fire_at = v1733
                                        v1731.fire_window_seconds = math.max(0.5, ((tonumber(v1731.fire_window_ms) or (v1001 * 1000)) / 1000))
                                        local v1734 = tostring((v1731.retry_of_round or ""))
                                        if (v1734 ~= "") then
                                            _K4F.v1719(v1734)
                                        end
                                        v1715.round = v1731
                                    else
                                        v1715.round = nil
                                    end
                                    local v1735 = (((type(v1727.recovery) == "table") and v1727.recovery) or nil)
                                    if (v1735 and (tostring((v1735.recovery_id or "")) ~= "")) then
                                        local v1736 = tostring(v1735.recovery_id)
                                        local v1737 = v1715.recoveryLocalTimes[v1736]
                                        if (not v1737) then
                                            v1737 = _K4F.v1721(v1730, v1735.respawn_at_ms, v1728)
                                            v1715.recoveryLocalTimes[v1736] = v1737
                                        end
                                        v1735.local_respawn_at = v1737
                                        v1715.recovery = v1735
                                    else
                                        v1715.recovery = nil
                                    end
                                    return true
                                end
                                function _K4F.v1738(v1739)
                                    if (v396 and (not isMyUpgearTurn())) then
                                        v946 = false
                                        return false, nil
                                    end
                                    if (v395 and ((not v948) or (v948.can_approach_trial ~= true))) then
                                        v946 = false
                                        return false, nil
                                    end
                                    if (not v1565()) then
                                        v946 = false
                                        return false, nil
                                    end
                                    local v1740 = _K4F.v1705()
                                    if (v1715.groupId ~= v1740) then
                                        _K4F.v1716(v1740)
                                    end
                                    if v1715.busy then
                                        return v946, nil
                                    end
                                    if ((not v1739) and ((tick() - v1715.lastPollAt) < v996)) then
                                        return v946, nil
                                    end
                                    v1715.lastPollAt = tick()
                                    v1715.busy = true
                                    local v1746, v1747, v1748, v1749 = pcall(function()
                                        local v1741 = _K4F.v1576()
                                        local v1742 = ""
                                        pcall(function()
                                            v1742 = tostring(v348.LocalPlayer.Data.Race.Value)
                                        end)
                                        local v1743 = ((((((tick() >= v947) and (not _G.K4HelpRaceChanging)) and v1741.alive) and v1741.nearDoor) and (not v1741.timerVisible)) and (not _G.K4DoorRecovery.isTrialDoorOpen()))
                                        v946 = v1743
                                        local v1744 = tick()
                                        local v1745 = _K4F.v1008("/v3/sync", {
                                            group_id = v1740,
                                            job_id = game.JobId,
                                            username = v945,
                                            role = _K4F.v1007(),
                                            turn_token = tostring(((v948 and v948.turn_token) or "")),
                                            race = v1742,
                                            ready = v1743,
                                            door_distance = (((v1741.distance == math.huge) and (-1)) or (math.floor((v1741.distance * 100)) / 100)),
                                            door_source = tostring((v1741.source or "")),
                                            timer_visible = (v1741.timerVisible == true),
                                            in_trial = _K4F.v1648(),
                                            door_open = _G.K4DoorRecovery.isTrialDoorOpen(),
                                            fired_round = tostring((v952 or ""))
                                        })
                                        return v1743, v1745, math.max(0, (tick() - v1744))
                                    end)
                                    v1715.busy = false
                                    if (not v1746) then
                                        v1715.lastError = ("v3_sync_runtime_error: " .. tostring(v1747))
                                        return v946, nil
                                    end
                                    if (v1748 and (v1748.ok == true)) then
                                        _K4F.v1726(v1748, v1749)
                                    else
                                        v1715.lastError = tostring((((v1748 and v1748.error) or _G.K4MatchNet.lastError) or "tool_unreachable"))
                                    end
                                    return (v1747 == true), v1748
                                end
                                function _K4F.v1752()
                                    local v1753 = {}
                                    return (tonumber(v1715.readyCount) or 0), (v1715.allReady == true), v1753, tostring((v1715.readyReason or "waiting"))
                                end
                                function _K4F.v1754()
                                    local v1755 = v1715.round
                                    if (type(v1755) ~= "table") then
                                        return nil
                                    end
                                    if (tostring((v1755.group_id or "")) ~= _K4F.v1705()) then
                                        return nil
                                    end
                                    if (tostring((v1755.job_id or "")) ~= tostring(game.JobId)) then
                                        return nil
                                    end
                                    return v1755
                                end
                                function _K4F.v1757(v1758)
                                    for v1759, v1760 in ipairs(((v1758 and v1758.members) or {})) do
                                        if (tostring(v1760) == v945) then
                                            return true
                                        end
                                    end
                                    return false
                                end
                                function _K4F.v1761(v1762)
                                    while true do
                                        local v1763 = ((tonumber(v1762) or tick()) - tick())
                                        if (v1763 <= 0) then
                                            return
                                        end
                                        pcall(_K4F.v1669)
                                        status(string.format("V3 Tool countdown %.2fs", v1763))
                                        if (v1763 > 0.25) then
                                            task.wait(math.min(0.1, math.max(0.03, (v1763 - 0.15))))
                                        else
                                            v350.Heartbeat:Wait()
                                        end
                                    end
                                end
                                function _K4F.v1764(v1765)
                                    local v1766 = tostring(((v1765 and v1765.round_id) or ""))
                                    local v1767 = (tonumber((v1765 and v1765.local_fire_at)) or 0)
                                    local v1768 = (tonumber((v1765 and v1765.fire_window_seconds)) or v1001)
                                    if ((v1766 == "") or (v1767 <= 0)) then
                                        return false
                                    end
                                    if ((v1766 == v952) or (v1766 == v951)) then
                                        return false
                                    end
                                    if (not _K4F.v1757(v1765)) then
                                        return false
                                    end
                                    local v1769 = (tick() - v1767)
                                    if (v1769 >= v1768) then
                                        v952 = v1766
                                        status("Skipped expired Tool V3 round")
                                        _K4F.v1738(true)
                                        return false
                                    end
                                    v951 = v1766
                                    if (v395 and (type(helpSwapGearForTrial) == "function")) then
                                        task.spawn(function()
                                            pcall(helpSwapGearForTrial, true)
                                        end)
                                    end
                                    task.spawn(function()
                                        _K4F.v1761(v1767)
                                        local v1770 = (tick() - v1767)
                                        local v1771 = ((v1565() and (tostring((v1765.group_id or "")) == _K4F.v1705())) and (tostring((v1765.job_id or "")) == tostring(game.JobId)))
                                        local v1772 = _K4F.v1576()
                                        local v1773 = false
                                        if (((((((v1770 >= 0) and (v1770 < v1768)) and v1771) and v1772.nearDoor) and (not v1772.timerVisible)) and (not _G.K4DoorRecovery.isTrialDoorOpen())) and (tick() >= v947)) then
                                            status("Activating Race V3 at Tool synchronized time")
                                            v952 = v1766
                                            v947 = (tick() + 30)
                                            v946 = false
                                            for v1774 = 1, v999 do
                                                pcall(function()
                                                    v349.Remotes.CommE:FireServer("ActivateAbility")
                                                end)
                                                if (v1774 < v999) then
                                                    task.wait(v1000)
                                                end
                                            end
                                            v1773 = true
                                            _G.K4TrialLifecycle.groupId = _K4F.v1705()
                                            if (_G.K4PostTrialReset.active ~= true) then
                                                _G.K4PostTrialReset.trialSeen = false
                                            end
                                            _G.K4PostTrialReset.armed = true
                                            _G.K4PostTrialReset.armedAt = tick()
                                            _G.K4PostTrialReset.armedGroup = _K4F.v1705()
                                            if (v396 and isMyUpgearTurn()) then
                                                v966 = true
                                                v967 = tick()
                                                _G.K4DoorRecovery.allFiredRoundId = ""
                                                _G.K4DoorRecovery.allFiredAt = 0
                                            end
                                        elseif (v1770 >= v1768) then
                                            v952 = v1766
                                            status("Tool V3 fire window expired - not activating late")
                                        elseif (not v1771) then
                                            status("Tool V3 round cancelled because pair/server changed")
                                        elseif (not v1772.nearDoor) then
                                            status(string.format("Tool V3 time reached but account left door (%.0f studs, %s)", v1772.distance, tostring(v1772.source)))
                                        elseif (v1772.timerVisible or _G.K4DoorRecovery.isTrialDoorOpen()) then
                                            status("Tool V3 time reached after Trial door opened")
                                        else
                                            status("Race V3 ability is still on cooldown")
                                        end
                                        v951 = ""
                                        _K4F.v1738(true)
                                        return v1773
                                    end)
                                    return true
                                end
                                _G.K4DoorRecovery.readGroupRoundState = function(v1775)
                                    v1775 = tostring((v1775 or ""))
                                    local v1776 = v1715.round
                                    if (((v1775 == "") or (type(v1776) ~= "table")) or (tostring((v1776.round_id or "")) ~= v1775)) then
                                        return false, (v1715.anyTrialStarted == true), 0
                                    end
                                    local v1777 = (tonumber(v1715.firedCount) or 0)
                                    local v1778 = ((v1715.anyTrialStarted == true) or _G.K4DoorRecovery.isTrialStartedOrDoorOpen())
                                    return (v1777 >= 3), v1778, v1777
                                end
                                _G.K4DoorRecovery.readV3RecoveryCommand = function()
                                    local v1779 = v1715.recovery
                                    if (type(v1779) ~= "table") then
                                        return nil
                                    end
                                    if (tostring((v1779.group_id or "")) ~= _K4F.v1705()) then
                                        return nil
                                    end
                                    if (tostring((v1779.job_id or "")) ~= tostring(game.JobId)) then
                                        return nil
                                    end
                                    if (tostring((v1779.action or "")) ~= "respawn_retry_door") then
                                        return nil
                                    end
                                    return v1779
                                end
                                _G.K4DoorRecovery.writeV3RecoveryCommand = function()
                                    return false
                                end
                                _G.K4DoorRecovery.mainRequestDoorRecovery = function(v1780)
                                    v1780 = tostring((v1780 or ""))
                                    if (v1780 == "") then
                                        return false
                                    end
                                    if (((not v396) or (not isMyUpgearTurn())) or (not v1565())) then
                                        return false
                                    end
                                    _K4F.v1738(true)
                                    local v1781 = _G.K4DoorRecovery.readV3RecoveryCommand()
                                    if (v1781 and (tostring((v1781.source_round or "")) == v1780)) then
                                        _G.K4DoorRecovery.issuedForRound = v1780
                                        return true
                                    end
                                    return false
                                end
                                _G.K4DoorRecovery.waitForNewCharacter = function(v1782)
                                    local v1783 = nil
                                    for v1784 = 1, 200 do
                                        task.wait(0.1)
                                        local v1785 = v348.LocalPlayer.Character
                                        local v1786 = (v1785 and v1785:FindFirstChildOfClass("Humanoid"))
                                        local v1787 = (v1785 and v1785:FindFirstChild("HumanoidRootPart"))
                                        if ((((v1785 and (v1785 ~= v1782)) and v1786) and v1787) and (v1786.Health > 0)) then
                                            v1783 = v1785
                                            break
                                        end
                                    end
                                    return v1783
                                end
                                _G.K4DoorRecovery.scheduleDoorRecovery = function(v1788)
                                    local v1789 = tostring(((v1788 and v1788.recovery_id) or ""))
                                    local v1790 = (tonumber((v1788 and v1788.local_respawn_at)) or 0)
                                    if ((v1789 == "") or (v1790 <= 0)) then
                                        return false
                                    end
                                    if ((v1789 == _G.K4DoorRecovery.handledId) or (v1789 == _G.K4DoorRecovery.scheduledId)) then
                                        return false
                                    end
                                    _G.K4DoorRecovery.scheduledId = v1789
                                    _G.K4DoorRecovery.active = true
                                    task.spawn(function()
                                        while (v1565() and (tick() < v1790)) do
                                            if _G.K4DoorRecovery.isTrialStartedOrDoorOpen() then
                                                _G.K4DoorRecovery.handledId = v1789
                                                _G.K4DoorRecovery.scheduledId = ""
                                                _G.K4DoorRecovery.active = false
                                                v966 = true
                                                v967 = 0
                                                status("Trial started - Tool synchronized respawn cancelled")
                                                _K4F.v1738(true)
                                                return
                                            end
                                            local v1791 = (v1790 - tick())
                                            status(string.format("Tool door retry respawn in %.1fs", math.max(0, v1791)))
                                            task.wait(math.min(0.15, math.max(0.03, v1791)))
                                        end
                                        _K4F.v1738(true)
                                        local _, v1793 = _G.K4DoorRecovery.readGroupRoundState(v1788.source_round)
                                        if (((not v1565()) or _G.K4DoorRecovery.isTrialStartedOrDoorOpen()) or v1793) then
                                            _G.K4DoorRecovery.handledId = v1789
                                            _G.K4DoorRecovery.scheduledId = ""
                                            _G.K4DoorRecovery.active = false
                                            v966 = true
                                            v967 = 0
                                            status("Trial detected - Tool respawn retry cancelled")
                                            return
                                        end
                                        _G.K4DoorRecovery.handledId = v1789
                                        _G.K4DoorRecovery.scheduledId = ""
                                        v967 = 0
                                        v966 = false
                                        v947 = 0
                                        v946 = false
                                        v951 = ""
                                        v957 = tick()
                                        v964 = tick()
                                        v965 = math.huge
                                        _G.lastReqEntrance = 0
                                        if (K4_PostTrialLockPending() or K4_MainScriptResetBlocked()) then
                                            _G.K4DoorRecovery.active = false
                                            v966 = true
                                            status("Trial lifecycle confirmed - stale Tool recovery cancelled")
                                            return
                                        end
                                        status("Trial door did not open - Tool is respawning all 3 accounts")
                                        local v1794 = v348.LocalPlayer.Character
                                        local v1795 = (v1794 and v1794:FindFirstChildOfClass("Humanoid"))
                                        if (v1795 and (v1795.Health > 0)) then
                                            pcall(function()
                                                v1795.Health = 0
                                            end)
                                        end
                                        local v1796 = _G.K4DoorRecovery.waitForNewCharacter(v1794)
                                        if (not v1796) then
                                            _G.K4DoorRecovery.active = false
                                            if (v396 and isMyUpgearTurn()) then
                                                _G.K4DoorRecovery.issuedForRound = ""
                                            end
                                            status("Respawn is taking too long - Tool recovery closed")
                                            return
                                        end
                                        v947 = 0
                                        task.wait(0.5)
                                        local v1797 = false
                                        for v1798 = 1, 160 do
                                            if ((not v1565()) or (not (isnight() and isfullmoon()))) then
                                                break
                                            end
                                            if _G.K4DoorRecovery.isTrialStartedOrDoorOpen() then
                                                v966 = true
                                                v1797 = true
                                                break
                                            end
                                            local v1799, v1800 = pcall(_K4F.v1683)
                                            if (v1799 and v1800) then
                                                v1797 = true
                                                break
                                            end
                                            task.wait(0.25)
                                        end
                                        _G.K4DoorRecovery.active = false
                                        _G.K4DoorRecovery.allFiredRoundId = ""
                                        _G.K4DoorRecovery.allFiredAt = 0
                                        if (v396 and isMyUpgearTurn()) then
                                            _G.K4DoorRecovery.issuedForRound = ""
                                        end
                                        if v1797 then
                                            status("Tool respawn complete - back at race door")
                                        else
                                            status("Tool respawn complete - continuing to race door")
                                        end
                                        _K4F.v1738(true)
                                    end)
                                    return true
                                end
                                _G.K4DoorRecovery.processDoorRecovery = function()
                                    if (not v1565()) then
                                        return false
                                    end
                                    local v1801 = _G.K4DoorRecovery.readV3RecoveryCommand()
                                    if (not v1801) then
                                        return false
                                    end
                                    return _G.K4DoorRecovery.scheduleDoorRecovery(v1801)
                                end
                                _G.K4DoorRecovery.monitorFailedV3Round = function()
                                    if (((not v396) or (not isMyUpgearTurn())) or (not v1565())) then
                                        return false
                                    end
                                    if ((v967 <= 0) or (v952 == "")) then
                                        return false
                                    end
                                    local v1802 = v952
                                    local v1803, v1804, v1805 = _G.K4DoorRecovery.readGroupRoundState(v1802)
                                    if v1804 then
                                        v966 = true
                                        v967 = 0
                                        _G.K4DoorRecovery.allFiredRoundId = ""
                                        _G.K4DoorRecovery.allFiredAt = 0
                                        return false
                                    end
                                    if (not v1803) then
                                        status(("Tool V3 activation confirmation " .. (tostring(v1805) .. "/3")))
                                        return false
                                    end
                                    local v1806 = _G.K4DoorRecovery.readV3RecoveryCommand()
                                    if v1806 then
                                        _G.K4DoorRecovery.issuedForRound = v1802
                                        status("Tool confirmed 3/3 but door stayed closed - synchronized respawn queued")
                                        return true
                                    end
                                    local v1807 = (tonumber(v1715.doorWaitRemainingMs) or (-1))
                                    if (v1807 >= 0) then
                                        status(string.format("Tool V3 confirmed 3/3 - waiting Trial door %.1fs", (v1807 / 1000)))
                                    else
                                        status("Tool V3 confirmed 3/3 - checking Trial door")
                                    end
                                    return false
                                end
                                local v1808 = false
                                tryActivateAbility = function()
                                    if v1808 then
                                        return false
                                    end
                                    if (v396 and (not isMyUpgearTurn())) then
                                        return false
                                    end
                                    if (v395 and ((not v948) or (v948.can_approach_trial ~= true))) then
                                        return false
                                    end
                                    if (not v1565()) then
                                        return false
                                    end
                                    v1808 = true
                                    if (v395 and (type(helpSwapGearForTrial) == "function")) then
                                        task.spawn(function()
                                            pcall(helpSwapGearForTrial, true)
                                        end)
                                    end
                                    local v1809 = false
                                    local v1811, v1812 = pcall(function()
                                        local v1810 = _K4F.v1738(false)
                                        return v1810
                                    end)
                                    if v1811 then
                                        v1809 = (v1812 == true)
                                    end
                                    local v1813 = _K4F.v1754()
                                    if ((not v1813) and v1809) then
                                        local v1814 = (tonumber(v1715.readyCount) or 0)
                                        local v1815 = tostring((v1715.readyReason or "waiting"))
                                        if ((v1814 >= 3) and (v1815 ~= "ready")) then
                                            status(("Tool V3 ready 3/3 - round blocked: " .. v1815))
                                        else
                                            status(("At race door - Tool V3 ready " .. (tostring(v1814) .. "/3")))
                                        end
                                    elseif (((not v1813) and (v1715.lastError ~= "ok")) and ((tick() - (v1715.lastOkAt or 0)) > 2)) then
                                        status(("V3 Tool sync error: " .. tostring(v1715.lastError)))
                                    end
                                    v1808 = false
                                    if v1813 then
                                        return _K4F.v1764(v1813)
                                    end
                                    return false
                                end
                                task.spawn(function()
                                    while task.wait(v996) do
                                        pcall(tryActivateAbility)
                                        pcall(_G.K4DoorRecovery.processDoorRecovery)
                                        pcall(_G.K4DoorRecovery.monitorFailedV3Round)
                                    end
                                end)
                                K4TyrantFarmController = (function()
                                    local v1816 = {
                                        Farming = false,
                                        CurrentMode = "IDLE",
                                        CurrentTarget = nil,
                                        SkillCasting = false,
                                        SkillInputBusy = false,
                                        VaseSkillIndex = 0,
                                        CachedTyrant = nil,
                                        LastTyrantScan = 0,
                                        CachedEyesReady = false,
                                        CachedActiveEyeCount = 0,
                                        EyeReadySince = nil,
                                        CachedEye1 = nil,
                                        CachedEye2 = nil,
                                        CachedEye3 = nil,
                                        CachedEye4 = nil,
                                        EyeConnections = {},
                                        LastEyeBindAttempt = 0,
                                        InternalSkillReadyAt = {},
                                        BringTweens = setmetatable({}, { __mode = "k" }),
                                        DragonTalonBuyFailed = false,
                                        LastDragonTalonBuyAttempt = nil,
                                        BringStarted = false,
                                        PreviousAttackConfig = nil
                                    }
                                    local v1817 = CFrame.new((-16490.9727), 98.1144867, 1245.58984, (-0.034969449), 0, 0.999388516, 0, 1, 0, (-0.999388516), 0, (-0.034969449))
                                    local v1819 = CFrame.new(5661.616211, 1211.299438, 865.999451)
                                    local v1820 = Vector3.new((-16275.984642), 157.838229, 1390.372659)
                                    local v1821 = {
                                        { Name = "Vase01", Mesh = "Meshes/brokenurns_Cylinder.010", SourceIndex = 19, CFrame = CFrame.new((-16332.5264), 158.071655, 1440.32507, 0.999388874, 0, 0.0349550731, 0, 1, 0, (-0.0349550731), 0, 0.999388874) },
                                        { Name = "Vase02", Mesh = "Meshes/brokenurns_Cylinder.009", SourceIndex = 18, CFrame = CFrame.new((-16335.1641), 158.166733, 1465.64404, 0.999388874, 0, 0.0349550731, 0, 1, 0, (-0.0349550731), 0, 0.999388874) },
                                        { Name = "Vase03", Mesh = "Meshes/brokenurns_Cylinder.009", SourceIndex = 17, CFrame = CFrame.new((-16288.6094), 158.166733, 1470.36816, 0.999388874, 0, 0.0349550731, 0, 1, 0, (-0.0349550731), 0, 0.999388874) },
                                        { Name = "Vase04", Mesh = "Meshes/brokenurns_Cylinder.009", SourceIndex = 16, CFrame = CFrame.new((-16258.001), 156.760635, 1461.40356, 0.999388874, 0, 0.0349550731, 0, 1, 0, (-0.0349550731), 0, 0.999388874) },
                                        { Name = "Vase05", Mesh = "Meshes/brokenurns_Cylinder.014", SourceIndex = 14, CFrame = CFrame.new((-16245.4121), 158.437012, 1463.36597, (-0.993159413), 0, 0.116766132, 0, 1, 0, (-0.116766132), 0, (-0.993159413)) },
                                        { Name = "Vase06", Mesh = "Meshes/brokenurns_Cylinder.009", SourceIndex = 15, CFrame = CFrame.new((-16212.4688), 158.166733, 1466.34387, 0.999388874, 0, 0.0349550731, 0, 1, 0, (-0.0349550731), 0, 0.999388874) },
                                        {
                                        Name = "Vase07",
                                        Mesh = "Meshes/brokenurns_Cylinder.010",
                                        SourceIndex = (-1),
                                        IsTree = true,
                                        CFrame = CFrame.new((-16211.9463), 158.071655, 1322.39807, (-0.466439605), 0, (-0.884553134), 0, 1, 0, 0.884553134, 0, (-0.466439605))
                                    },
                                        { Name = "Vase08", Mesh = "Meshes/brokenurns_Cylinder.009", SourceIndex = 13, CFrame = CFrame.new((-16250.2354), 158.166733, 1313.01941, 0.999388874, 0, 0.0349550731, 0, 1, 0, (-0.0349550731), 0, 0.999388874) },
                                        { Name = "Vase09", Mesh = "Meshes/brokenurns_Cylinder.009", SourceIndex = 12, CFrame = CFrame.new((-16260.2803), 158.166733, 1320.45532, 0.999388874, 0, 0.0349550731, 0, 1, 0, (-0.0349550731), 0, 0.999388874) },
                                        { Name = "Vase10", Mesh = "Meshes/brokenurns_Cylinder.010", SourceIndex = 22, CFrame = CFrame.new((-16296.1162), 157.767914, 1315.79407, (-0.463313937), 0, 0.886194229, 0, 1, 0, (-0.886194229), 0, (-0.463313937)) },
                                        { Name = "Vase11", Mesh = "Meshes/brokenurns_Cylinder.009", SourceIndex = 21, CFrame = CFrame.new((-16286.0586), 155.949478, 1323.83765, 0.999388874, 0, 0.0349550731, 0, 1, 0, (-0.0349550731), 0, 0.999388874) },
                                        { Name = "Vase12", Mesh = "Meshes/brokenurns_Cylinder.009", SourceIndex = 20, CFrame = CFrame.new((-16334.9971), 158.166733, 1321.51672, 0.999388874, 0, 0.0349550731, 0, 1, 0, (-0.0349550731), 0, 0.999388874) }
                                    }
                                    local v1822 = { Z = 0.035, X = 0.12, C = 0.05 }
                                    local v1823 = { Z = 0.65, X = 0.5, C = 1.45 }
                                    local v1824 = {
                                        ["Isle Outlaw"] = true,
                                        ["Island Boy"] = true,
                                        ["Sun-kissed Warrior"] = true,
                                        ["Isle Champion"] = true,
                                        ["Serpent Hunter"] = true,
                                        ["Skull Slayer"] = true
                                    }
                                    local v1825 = {
                                        ["Haunted Castle"] = { Position = CFrame.new((-9530.61035), 200.860657, 5763.13477), Mobs = { ["Reborn Skeleton"] = true, ["Living Zombie"] = true, ["Demonic Soul"] = true, ["Possessed Mummy"] = true } },
                                        ["Tiki Outpost"] = { Position = CFrame.new((-16490.9727), 98.1144867, 1245.58984, (-0.034969449), 0, 0.999388516, 0, 1, 0, (-0.999388516), 0, (-0.034969449)), Mobs = { ["Isle Outlaw"] = true, ["Island Boy"] = true, ["Sun-kissed Warrior"] = true, ["Isle Champion"] = true } },
                                        ["Great Tree"] = { Positions = { CFrame.new(2527.22119, 88.0126953, (-7554.48096), (-0.999390602), (-0.0349089168), (-1.05798244e-06), 1.05798244e-06, (-6.05583191e-05), 1, (-0.0349089168), 0.999390483, 6.05583191e-05), CFrame.new(2923.90332, 91.6738281, (-7734.71631), 0.997561574, (-0), (-0.0697919354), 0, 1, (-0), 0.0697919354, 0, 0.997561574), CFrame.new(3778.4248, 116.34375, (-6938.81641), (-0.667134643), (-0.731317759), 0.141794443, (-0.207926333), 2.65836716e-05, (-0.978144467), 0.71533066, (-0.682036817), (-0.152077913)) }, Mobs = { ["Marine Commodore"] = true, ["Marine Rear Admiral"] = true } },
                                        ["Ice Cream Island"] = { Position = CFrame.new((-851.74633789062), 65.819496154785, (-10932.150390625)), Mobs = { ["Peanut Scout"] = true, ["Peanut President"] = true, ["Ice Cream Chef"] = true, ["Ice Cream Commander"] = true } },
                                        ["Port Town"] = { Positions = { CFrame.new((-172.031281), 52.8853912, 5851.12793, 0.965929627, (-0), (-0.258804798), 0, 1, (-0), 0.258804798, 0, 0.965929627), CFrame.new((-638.581543), 50.9266357, 5627.74951, 0.258864343, 0, 0.965913713, 0, 1, 0, (-0.965913713), 0, 0.258864343), CFrame.new((-61.3757935), 48.8545227, 6151.30762, 0.965929627, (-0), (-0.258804798), 0, 1, (-0), 0.258804798, 0, 0.965929627), CFrame.new((-662.967041), 65.9991913, 5804.41699, 0.965938151, 0.050586991, (-0.253780305), (-4.01213765e-06), 0.980709016, 0.195473209, 0.258773029, (-0.188813999), 0.947304487) }, Mobs = { ["Pirate Millionaire"] = true, ["Pistol Billionaire"] = true } },
                                        ["Peanut Island"] = { Position = CFrame.new((-2087.0561523438), 11.722011566162, (-10002.080078125)), Mobs = { ["Peanut Scout"] = true, ["Peanut President"] = true } }
                                    }
                                    local v1826 = (getgenv().Config["Training Islands"] or { "Tiki Outpost", "Ice Cream Island", "Haunted Castle", "Peanut Island" })
                                    local v1827 = 2
                                    local v1828 = 1000
                                    local v1829 = nil
                                    local function v1830(v1831)
                                        local v1832 = v1825[v1831]
                                        if (not v1832) then
                                            return 0
                                        end
                                        local v1833 = {}
                                        if (type(v1832.Positions) == "table") then
                                            for v1834, v1835 in ipairs(v1832.Positions) do
                                                if (typeof(v1835) == "CFrame") then
                                                    v1833[(#v1833 + 1)] = v1835.Position
                                                end
                                            end
                                        elseif (typeof(v1832.Position) == "CFrame") then
                                            v1833[1] = v1832.Position.Position
                                        end
                                        if (#v1833 == 0) then
                                            return 0
                                        end
                                        local v1836 = 0
                                        for v1837, v1838 in ipairs(v348:GetPlayers()) do
                                            if (v1838 ~= v348.LocalPlayer) then
                                                local v1839 = v1838.Character
                                                local v1840 = (v1839 and v1839:FindFirstChildOfClass("Humanoid"))
                                                local v1841 = (v1839 and v1839:FindFirstChild("HumanoidRootPart"))
                                                if ((v1840 and v1841) and (v1840.Health > 0)) then
                                                    for v1842, v1843 in ipairs(v1833) do
                                                        if ((v1841.Position - v1843).Magnitude < v1828) then
                                                            v1836 = (v1836 + 1)
                                                            break
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                        return v1836
                                    end
                                    local function v1844()
                                        local v1845 = nil
                                        local v1846 = math.huge
                                        for v1847, v1848 in ipairs(v1826) do
                                            if v1825[v1848] then
                                                local v1849 = v1830(v1848)
                                                if ((v1849 < v1827) and (v1849 < v1846)) then
                                                    v1845 = v1848
                                                    v1846 = v1849
                                                end
                                            end
                                        end
                                        if (not v1845) then
                                            for v1850, v1851 in ipairs(v1826) do
                                                if v1825[v1851] then
                                                    local v1852 = v1830(v1851)
                                                    if (v1852 < v1846) then
                                                        v1845 = v1851
                                                        v1846 = v1852
                                                    end
                                                end
                                            end
                                        end
                                        v1829 = (v1845 or v1826[1])
                                        return v1829
                                    end
                                    local function v1853()
                                        v1829 = nil
                                    end
                                    CheckMonster = function(...)
                                        local v1854 = { ... }
                                        local v1855 = workspace:FindFirstChild("Enemies")
                                        if (not v1855) then
                                            return false
                                        end
                                        for v1856 = 1, #v1854 do
                                            local v1857 = v1855:FindFirstChild(v1854[v1856])
                                            if ((v1857 and v1857:IsA("Model")) and (v1857.Name ~= "Blank Buddy")) then
                                                local v1858 = v1857:FindFirstChildWhichIsA("Humanoid")
                                                local v1859 = v1857:FindFirstChild("HumanoidRootPart")
                                                if ((v1858 and v1859) and (v1858.Health > 0)) then
                                                    return v1857
                                                end
                                            end
                                        end
                                        for v1860, v1861 in ipairs(v1855:GetChildren()) do
                                            local v1862 = v1861:FindFirstChildWhichIsA("Humanoid")
                                            local v1863 = v1861:FindFirstChild("HumanoidRootPart")
                                            if ((((v1861:IsA("Model") and v1862) and v1863) and (v1862.Health > 0)) and (v1861.Name ~= "Blank Buddy")) then
                                                for v1864 = 1, #v1854 do
                                                    if ((v1861.Name == v1854[v1864]) or v1861.Name:lower():find(v1854[v1864]:lower(), 1, true)) then
                                                        return v1861
                                                    end
                                                end
                                            end
                                        end
                                        return false
                                    end
                                    local function v1865()
                                        return v362.Character
                                    end
                                    local function v1866()
                                        local v1867 = v1865()
                                        return (v1867 and v1867:FindFirstChildOfClass("Humanoid"))
                                    end
                                    local function v1868()
                                        local v1869 = v1865()
                                        return (v1869 and v1869:FindFirstChild("HumanoidRootPart"))
                                    end
                                    local function v1870(v1871)
                                        return tostring((v1871 or "")):gsub("%s+", ""):lower()
                                    end
                                    local function v1872(v1873)
                                        local v1874 = v1870(v1873)
                                        local v1875 = v1865()
                                        local v1876 = v362:FindFirstChild("Backpack")
                                        if v1875 then
                                            for v1877, v1878 in ipairs(v1875:GetChildren()) do
                                                if (v1878:IsA("Tool") and (v1870(v1878.Name) == v1874)) then
                                                    return v1878
                                                end
                                            end
                                        end
                                        if v1876 then
                                            for v1879, v1880 in ipairs(v1876:GetChildren()) do
                                                if (v1880:IsA("Tool") and (v1870(v1880.Name) == v1874)) then
                                                    return v1880
                                                end
                                            end
                                        end
                                        return nil
                                    end
                                    local function v1881(v1882, v1883, v1884)
                                        if (typeof(v1882) ~= "CFrame") then
                                            return false
                                        end
                                        local v1885 = v1868()
                                        if (not v1885) then
                                            return false
                                        end
                                        v411:topos(v1882)
                                        if (not v1883) then
                                            return true
                                        end
                                        local v1886 = tick()
                                        v1884 = (tonumber(v1884) or math.max(3, (((v1885.Position - v1882.Position).Magnitude / 200) + 2)))
                                        repeat
                                            task.wait(0.05)
                                            v1885 = v1868()
                                            if (not v1885) then
                                                return false
                                            end
                                            if ((v1885.Position - v1882.Position).Magnitude <= 8) then
                                                v1885.CFrame = v1882
                                                return true
                                            end
                                        until ((tick() - v1886) >= v1884)
                                        v1885 = v1868()
                                        if (v1885 and ((v1885.Position - v1882.Position).Magnitude <= 15)) then
                                            v1885.CFrame = v1882
                                            return true
                                        end
                                        return false
                                    end
                                    local function v1887()
                                        local v1888 = {}
                                        local v1889 = v351:FindFirstChild("Enemies")
                                        if v1889 then
                                            v1888[(#v1888 + 1)] = v1889
                                        end
                                        local v1890 = v351:FindFirstChild("_WorldOrigin")
                                        if (v1890 and v1890:FindFirstChild("Enemies")) then
                                            v1888[(#v1888 + 1)] = v1890.Enemies
                                        end
                                        return v1888
                                    end
                                    local function v1891(v1892)
                                        local v1893 = tostring((v1892 or ""))
                                        v1893 = v1893:gsub("%s*%[Lv%.%s*%d+%]", "")
                                        v1893 = v1893:gsub("%s*%[Lv%s*%d+%]", "")
                                        v1893 = v1893:gsub("%s*%[Boss%]", "")
                                        v1893 = v1893:gsub("%s*%[Raid Boss%]", "")
                                        return v1893:gsub("%s+$", "")
                                    end
                                    local function v1894(v1895)
                                        return (v1895 and (v1824[v1891(v1895.Name)] == true))
                                    end
                                    local function v1896(v1897)
                                        return ((v1897 ~= nil) and (string.find(string.lower(v1897.Name), "tyrant", 1, true) ~= nil))
                                    end
                                    local function v1898(v1899)
                                        local v1900 = tick()
                                        if ((not v1899) and ((v1900 - v1816.LastTyrantScan) < TyrantConfig.TyrantScanInterval)) then
                                            local v1901 = v1816.CachedTyrant
                                            if (v1901 and v1901.Parent) then
                                                local v1902 = v1901:FindFirstChildOfClass("Humanoid")
                                                local v1903 = v1901:FindFirstChild("HumanoidRootPart")
                                                if ((v1902 and v1903) and (v1902.Health > 0)) then
                                                    return v1901
                                                end
                                            end
                                            return nil
                                        end
                                        v1816.LastTyrantScan = v1900
                                        v1816.CachedTyrant = nil
                                        for v1904, v1905 in ipairs(v1887()) do
                                            for v1906, v1907 in ipairs(v1905:GetChildren()) do
                                                if v1896(v1907) then
                                                    local v1908 = v1907:FindFirstChildOfClass("Humanoid")
                                                    local v1909 = v1907:FindFirstChild("HumanoidRootPart")
                                                    if ((v1908 and v1909) and (v1908.Health > 0)) then
                                                        v1816.CachedTyrant = v1907
                                                        return v1907
                                                    end
                                                end
                                            end
                                        end
                                        return nil
                                    end
                                    local function v1910()
                                        local v1911 = v1868()
                                        if (not v1911) then
                                            return nil
                                        end
                                        local v1912 = nil
                                        local v1913 = math.huge
                                        for v1914, v1915 in ipairs(v1887()) do
                                            for v1916, v1917 in ipairs(v1915:GetChildren()) do
                                                local v1918 = v1917:FindFirstChildOfClass("Humanoid")
                                                local v1919 = v1917:FindFirstChild("HumanoidRootPart")
                                                if (((v1918 and v1919) and (v1918.Health > 0)) and v1894(v1917)) then
                                                    local v1920 = (v1911.Position - v1919.Position).Magnitude
                                                    if (v1920 < v1913) then
                                                        v1912 = v1917
                                                        v1913 = v1920
                                                    end
                                                end
                                            end
                                        end
                                        return v1912
                                    end
                                    local function v1921()
                                        local v1922 = v351:FindFirstChild("Map")
                                        local v1923 = (v1922 and v1922:FindFirstChild("TikiOutpost"))
                                        return (v1923 and v1923:FindFirstChild("IslandModel"))
                                    end
                                    local v1924 = Color3.fromRGB(255, 57, 57)
                                    local v1925 = (10 / 255)
                                    local v1926 = 0.75
                                    local v1927 = { Eye1 = Vector3.new((-16186.759766), 196.228531, 1440.732788), Eye2 = Vector3.new((-16192.060547), 196.052032, 1440.720825) }
                                    local function v1928()
                                        local v1929 = v1921()
                                        local v1930 = (v1929 and v1929:FindFirstChild("IslandChunks"))
                                        local v1931 = (v1930 and v1930:FindFirstChild("E"))
                                        return v1929, v1930, v1931
                                    end
                                    local function v1932()
                                        local v1933, _, v1935 = v1928()
                                        if (not v1933) then
                                            return nil, nil, nil, nil
                                        end
                                        return v1933:FindFirstChild("Eye1"), v1933:FindFirstChild("Eye2"), (v1935 and v1935:FindFirstChild("Eye3")), (v1935 and v1935:FindFirstChild("Eye4"))
                                    end
                                    local function v1936(v1937, v1938)
                                        if ((((not v1937) or (not v1937:IsA("BasePart"))) or (v1937.Name ~= v1938)) or (not v1937:IsDescendantOf(v351))) then
                                            return false
                                        end
                                        local v1939, _, v1941 = v1928()
                                        if ((v1938 == "Eye1") or (v1938 == "Eye2")) then
                                            if (v1937.Parent ~= v1939) then
                                                return false
                                            end
                                            local v1942 = v1927[v1938]
                                            return ((v1942 == nil) or ((v1937.Position - v1942).Magnitude <= 8))
                                        end
                                        if ((v1938 == "Eye3") or (v1938 == "Eye4")) then
                                            return ((v1941 ~= nil) and (v1937.Parent == v1941))
                                        end
                                        return false
                                    end
                                    local function v1943(v1944, v1945)
                                        if (not v1936(v1944, v1945)) then
                                            return false
                                        end
                                        local v1946 = v1944.Color
                                        local v1947 = (((math.abs((v1946.R - v1924.R)) <= v1925) and (math.abs((v1946.G - v1924.G)) <= v1925)) and (math.abs((v1946.B - v1924.B)) <= v1925))
                                        return (v1947 and (v1944.Transparency <= 0.1))
                                    end
                                    local function v1948()
                                        local v1949 = v1943(v1816.CachedEye1, "Eye1")
                                        local v1950 = v1943(v1816.CachedEye2, "Eye2")
                                        local v1951 = v1943(v1816.CachedEye3, "Eye3")
                                        local v1952 = v1943(v1816.CachedEye4, "Eye4")
                                        v1816.CachedActiveEyeCount = (((((v1949 and 1) or 0) + ((v1950 and 1) or 0)) + ((v1951 and 1) or 0)) + ((v1952 and 1) or 0))
                                        v1816.CachedEyesReady = (v1816.CachedActiveEyeCount == 4)
                                        if v1816.CachedEyesReady then
                                            v1816.EyeReadySince = (v1816.EyeReadySince or tick())
                                        else
                                            v1816.EyeReadySince = nil
                                        end
                                    end
                                    local function v1953()
                                        for v1954, v1955 in ipairs(v1816.EyeConnections) do
                                            pcall(function()
                                                v1955:Disconnect()
                                            end)
                                        end
                                        v1816.EyeConnections = {}
                                    end
                                    local function v1956(v1957)
                                        v1816.CachedEye1 = nil
                                        v1816.CachedEye2 = nil
                                        v1816.CachedEye3 = nil
                                        v1816.CachedEye4 = nil
                                        v1816.CachedActiveEyeCount = 0
                                        v1816.CachedEyesReady = false
                                        v1816.EyeReadySince = nil
                                        if v1957 then
                                            v1816.LastEyeBindAttempt = 0
                                        end
                                    end
                                    local function v1958(v1959)
                                        local v1960 = tick()
                                        if ((not v1959) and ((v1960 - v1816.LastEyeBindAttempt) < 1)) then
                                            return false
                                        end
                                        v1816.LastEyeBindAttempt = v1960
                                        local v1961, v1962, v1963 = v1928()
                                        if (((not v1961) or (not v1962)) or (not v1963)) then
                                            v1956(false)
                                            return false
                                        end
                                        local v1964, v1965, v1966, v1967 = v1932()
                                        if ((((not v1936(v1964, "Eye1")) or (not v1936(v1965, "Eye2"))) or (not v1936(v1966, "Eye3"))) or (not v1936(v1967, "Eye4"))) then
                                            v1956(false)
                                            return false
                                        end
                                        if (((((v1816.CachedEye1 == v1964) and (v1816.CachedEye2 == v1965)) and (v1816.CachedEye3 == v1966)) and (v1816.CachedEye4 == v1967)) and (#v1816.EyeConnections > 0)) then
                                            v1948()
                                            return true
                                        end
                                        v1953()
                                        v1816.CachedEye1 = v1964
                                        v1816.CachedEye2 = v1965
                                        v1816.CachedEye3 = v1966
                                        v1816.CachedEye4 = v1967
                                        local function v1968(v1969)
                                            v1816.EyeConnections[(#v1816.EyeConnections + 1)] = v1969:GetPropertyChangedSignal("Color"):Connect(v1948)
                                            v1816.EyeConnections[(#v1816.EyeConnections + 1)] = v1969:GetPropertyChangedSignal("Transparency"):Connect(v1948)
                                            v1816.EyeConnections[(#v1816.EyeConnections + 1)] = v1969.AncestryChanged:Connect(function()
                                                if (not v1969:IsDescendantOf(v351)) then
                                                    v1953()
                                                    v1956(true)
                                                end
                                            end)
                                        end
                                        v1968(v1964)
                                        v1968(v1965)
                                        v1968(v1966)
                                        v1968(v1967)
                                        local function v1970(v1971)
                                            if ((((((v1971.Name == "Eye1") or (v1971.Name == "Eye2")) or (v1971.Name == "Eye3")) or (v1971.Name == "Eye4")) or (v1971.Name == "IslandChunks")) or (v1971.Name == "E")) then
                                                task.defer(function()
                                                    v1958(true)
                                                end)
                                            end
                                        end
                                        v1816.EyeConnections[(#v1816.EyeConnections + 1)] = v1961.ChildAdded:Connect(v1970)
                                        v1816.EyeConnections[(#v1816.EyeConnections + 1)] = v1961.ChildRemoved:Connect(v1970)
                                        v1816.EyeConnections[(#v1816.EyeConnections + 1)] = v1962.ChildAdded:Connect(v1970)
                                        v1816.EyeConnections[(#v1816.EyeConnections + 1)] = v1962.ChildRemoved:Connect(v1970)
                                        v1816.EyeConnections[(#v1816.EyeConnections + 1)] = v1963.ChildAdded:Connect(v1970)
                                        v1816.EyeConnections[(#v1816.EyeConnections + 1)] = v1963.ChildRemoved:Connect(function(v1972)
                                            if ((v1972 == v1816.CachedEye3) or (v1972 == v1816.CachedEye4)) then
                                                v1953()
                                                v1956(true)
                                            else
                                                v1970(v1972)
                                            end
                                        end)
                                        v1948()
                                        return true
                                    end
                                    local function v1973()
                                        if ((((((((not v1816.CachedEye1) or (not v1816.CachedEye2)) or (not v1816.CachedEye3)) or (not v1816.CachedEye4)) or (not v1816.CachedEye1:IsDescendantOf(v351))) or (not v1816.CachedEye2:IsDescendantOf(v351))) or (not v1816.CachedEye3:IsDescendantOf(v351))) or (not v1816.CachedEye4:IsDescendantOf(v351))) then
                                            v1958(false)
                                        end
                                        v1948()
                                        return v1816.CachedActiveEyeCount, 4
                                    end
                                    local function v1974()
                                        local v1975 = v1973()
                                        return ((((v1975 == 4) and v1816.CachedEyesReady) and (v1816.EyeReadySince ~= nil)) and ((tick() - v1816.EyeReadySince) >= v1926))
                                    end
                                    local function v1976()
                                        if (v1872("Dragon Talon") or v1872("DragonTalon")) then
                                            return true
                                        end
                                        if ((not TyrantConfig.AutoBuyDragonTalon) or v1816.DragonTalonBuyFailed) then
                                            return false
                                        end
                                        local v1977 = tick()
                                        if (v1816.LastDragonTalonBuyAttempt and ((v1977 - v1816.LastDragonTalonBuyAttempt) < 20)) then
                                            return false
                                        end
                                        v1816.LastDragonTalonBuyAttempt = v1977
                                        status("Tyrant: buying Dragon Talon")
                                        v1881(v1819, true, 25)
                                        task.wait(0.5)
                                        for v1978 = 1, 15 do
                                            pcall(function()
                                                v369:InvokeServer("BuyDragonTalon")
                                            end)
                                            task.wait(0.5)
                                            if (v1872("Dragon Talon") or v1872("DragonTalon")) then
                                                return true
                                            end
                                        end
                                        v1816.DragonTalonBuyFailed = true
                                        return false
                                    end
                                    local function v1979()
                                        local v1980 = v1866()
                                        local v1981 = v1865()
                                        if ((not v1980) or (not v1981)) then
                                            return nil
                                        end
                                        local v1982 = v1872(TyrantConfig.Weapon)
                                        if v1982 then
                                            if (v1982.Parent ~= v1981) then
                                                v1980:EquipTool(v1982)
                                                task.wait(0.12)
                                            end
                                            return v1872(TyrantConfig.Weapon)
                                        end
                                        if (v1870(TyrantConfig.Weapon) == v1870("Dragon Talon")) then
                                            v1976()
                                            v1982 = (v1872("Dragon Talon") or v1872("DragonTalon"))
                                            if v1982 then
                                                if (v1982.Parent ~= v1981) then
                                                    v1980:EquipTool(v1982)
                                                end
                                                return v1982
                                            end
                                        end
                                        pcall(function()
                                            v411:eq()
                                        end)
                                        return v1981:FindFirstChildWhichIsA("Tool")
                                    end
                                    local function v1983(v1984)
                                        if (typeof(v1984) == "Vector3") then
                                            return v1984
                                        end
                                        if (typeof(v1984) == "CFrame") then
                                            return v1984.Position
                                        end
                                        if (typeof(v1984) == "Instance") then
                                            if v1984:IsA("BasePart") then
                                                return v1984.Position
                                            end
                                            local v1985 = (v1984:FindFirstChild("HumanoidRootPart") or v1984:FindFirstChildWhichIsA("BasePart", true))
                                            return ((v1985 and v1985.Position) or nil)
                                        end
                                        return nil
                                    end
                                    local function v1986(v1987)
                                        getgenv().TyrantSkillAimTarget = v1983(v1987)
                                    end
                                    local function v1988()
                                        if getgenv().TyrantSkillAimHookInstalled then
                                            return true
                                        end
                                        if (((((type(getrawmetatable) ~= "function") or (type(setreadonly) ~= "function")) or (type(newcclosure) ~= "function")) or (type(getnamecallmethod) ~= "function")) or (type(checkcaller) ~= "function")) then
                                            warn("[K4 Tyrant] Executor lacks metamethod hook; vase skill aim may be less accurate")
                                            return false
                                        end
                                        local v1998, v1999 = pcall(function()
                                            local v1989 = getrawmetatable(game)
                                            local v1990 = v1989.__namecall
                                            local v1997 = K4_CreateFilteredNamecall(v1990, function(v1991, ...)
                                                local v1992 = getnamecallmethod()
                                                local v1993 = getgenv().TyrantSkillAimTarget
                                                if (((not checkcaller()) and v1993) and ((v1992 == "FireServer") or (v1992 == "InvokeServer"))) then
                                                    local v1994 = { ... }
                                                    local v1995 = false
                                                    for v1996 = 1, #v1994 do
                                                        if (typeof(v1994[v1996]) == "Vector3") then
                                                            v1994[v1996] = v1993
                                                            v1995 = true
                                                            break
                                                        elseif (typeof(v1994[v1996]) == "CFrame") then
                                                            v1994[v1996] = CFrame.new(v1993)
                                                            v1995 = true
                                                            break
                                                        end
                                                    end
                                                    if v1995 then
                                                        return v1990(v1991, unpack(v1994))
                                                    end
                                                end
                                                return v1990(v1991, ...)
                                            end, "tyrant")
                                            setreadonly(v1989, false)
                                            v1989.__namecall = v1997
                                            setreadonly(v1989, true)
                                        end)
                                        if v1998 then
                                            getgenv().TyrantSkillAimHookInstalled = true
                                            return true
                                        end
                                        warn(("[K4 Tyrant] Skill aim hook failed: " .. tostring(v1999)))
                                        return false
                                    end
                                    local v2000 = {
                                        Z = 6,
                                        X = 8,
                                        C = 12,
                                        V = 15,
                                        F = 10
                                    }
                                    local function v2001(v2002, v2003)
                                        local v2004 = v362:FindFirstChild("PlayerGui")
                                        local v2005 = (v2004 and v2004:FindFirstChild("Main"))
                                        local v2006 = (v2005 and v2005:FindFirstChild("Skills"))
                                        if ((not v2006) or (not v2002)) then
                                            return nil
                                        end
                                        local v2007 = ((v2006:FindFirstChild(v2002.Name) or v2006:FindFirstChild(TyrantConfig.Weapon)) or v2006:FindFirstChild("Dragon Talon"))
                                        return ((v2007 and v2007:FindFirstChild(v2003)) or nil)
                                    end
                                    local function v2008(v2009, v2010)
                                        if (tick() < (v1816.InternalSkillReadyAt[v2010] or 0)) then
                                            return false
                                        end
                                        local v2011 = v2001(v2009, v2010)
                                        if (not v2011) then
                                            return true
                                        end
                                        local v2012 = v2011:FindFirstChild("Cooldown")
                                        if (v2012 and v2012:IsA("GuiObject")) then
                                            return ((v2012.Size.X.Scale <= 0.015) and (v2012.Size.X.Offset <= 2))
                                        end
                                        return true
                                    end
                                    local function v2013(v2014)
                                        v1816.InternalSkillReadyAt[v2014] = (tick() + (v2000[v2014] or 7))
                                    end
                                    local function v2015(v2016, v2017)
                                        local v2018 = Enum.KeyCode[v2016]
                                        local v2019 = pcall(function()
                                            v352:SendKeyEvent(v2017, v2016, false, game)
                                        end)
                                        if ((not v2019) and v2018) then
                                            v2019 = pcall(function()
                                                v352:SendKeyEvent(v2017, v2018, false, game)
                                            end)
                                        end
                                        return v2019
                                    end
                                    local function v2020(v2021, v2022)
                                        if (((not TyrantConfig.UseSkillsForVases) or v1816.SkillInputBusy) or (not v1816.Farming)) then
                                            return false
                                        end
                                        v2022 = string.upper(tostring((v2022 or "")))
                                        if (((v2022 ~= "Z") and (v2022 ~= "X")) and (v2022 ~= "C")) then
                                            return false
                                        end
                                        local v2023 = v1983(v2021)
                                        local v2024 = v1979()
                                        local v2025 = v1865()
                                        local v2026 = v1866()
                                        local v2027 = v1868()
                                        if (((((((not v2023) or (not v2024)) or (not v2025)) or (v2024.Parent ~= v2025)) or (not v2026)) or (v2026.Health <= 0)) or (not v2027)) then
                                            return false
                                        end
                                        if (not v2008(v2024, v2022)) then
                                            return false
                                        end
                                        v1816.SkillInputBusy = true
                                        v1816.SkillCasting = true
                                        v1986(v2023)
                                        v1988()
                                        local v2028 = v2027:FindFirstChild("BodyClip")
                                        local v2029 = (v2028 and v2028.MaxForce)
                                        local v2030 = v719.AutoClickEnabled
                                        local v2031 = false
                                        local v2032 = false
                                        v719.AutoClickEnabled = false
                                        local v2034, v2035 = pcall(function()
                                            v2026.Sit = false
                                            v2027.AssemblyLinearVelocity = Vector3.zero
                                            v2027.AssemblyAngularVelocity = Vector3.zero
                                            local v2033 = Vector3.new(v2023.X, v2027.Position.Y, v2023.Z)
                                            if ((v2033 - v2027.Position).Magnitude > 0.1) then
                                                v2027.CFrame = CFrame.lookAt(v2027.Position, v2033)
                                            end
                                            if v2028 then
                                                v2028.MaxForce = Vector3.zero
                                                v2028.Velocity = Vector3.zero
                                            end
                                            task.wait(0.08)
                                            v2031 = v2015(v2022, true)
                                            if (not v2031) then
                                                return
                                            end
                                            task.wait((v1822[v2022] or TyrantConfig.VaseSkillHoldTime))
                                            v2015(v2022, false)
                                            v2031 = false
                                            v2013(v2022)
                                            task.wait((v1823[v2022] or TyrantConfig.VaseSkillReleaseDelay))
                                            v2032 = true
                                        end)
                                        if v2031 then
                                            v2015(v2022, false)
                                        end
                                        v1986(nil)
                                        if v1816.Farming then
                                            v719.AutoClickEnabled = v2030
                                        end
                                        if (v2028 and v2028.Parent) then
                                            v2028.MaxForce = (v2029 or Vector3.new(100000, 100000, 100000))
                                            v2028.Velocity = Vector3.zero
                                        end
                                        v1816.SkillCasting = false
                                        v1816.SkillInputBusy = false
                                        if (not v2034) then
                                            warn(("[K4 Tyrant] Vase skill " .. (tostring(v2022) .. (" failed: " .. tostring(v2035)))))
                                            return false
                                        end
                                        if v2032 then
                                            task.wait(TyrantConfig.VaseSkillRetryDelay)
                                        end
                                        return v2032
                                    end
                                    local function v2036(v2037)
                                        return (v2037.CFrame.Position + Vector3.new(0, 0.75, 0))
                                    end
                                    local function v2038(v2039, v2040)
                                        local v2041 = v2039.CFrame.Position
                                        local v2042 = v2036(v2039)
                                        local v2043 = Vector3.new((v1820.X - v2041.X), 0, (v1820.Z - v2041.Z))
                                        v2043 = (((v2043.Magnitude < 0.1) and Vector3.new(0, 0, (-1))) or v2043.Unit)
                                        local v2044
                                        if (v2040 == "Z") then
                                            v2044 = ((v2041 + (v2043 * 92)) + Vector3.new(0, 3, 0))
                                        elseif (v2040 == "C") then
                                            v2044 = (v2041 + Vector3.new(0, 3.2, 0))
                                        else
                                            v2044 = ((v2041 + (v2043 * 14)) + Vector3.new(0, 3, 0))
                                        end
                                        if (v2040 == "C") then
                                            return CFrame.lookAt(v2044, (v2044 + (v2043 * 8)))
                                        end
                                        return CFrame.lookAt(v2044, v2042)
                                    end
                                    local function v2045(v2046, v2047)
                                        local v2048 = tick()
                                        while ((v1816.Farming and (not v1898())) and v1974()) do
                                            local v2049 = v1979()
                                            if v2049 then
                                                v2046 = string.upper(tostring((v2046 or "")))
                                                if ((v2046 ~= "") and v2008(v2049, v2046)) then
                                                    return v2046
                                                end
                                                for v2050, v2051 in ipairs(TyrantConfig.VaseSkillKeys) do
                                                    v2051 = string.upper(tostring(v2051))
                                                    if v2008(v2049, v2051) then
                                                        return v2051
                                                    end
                                                end
                                            end
                                            if (v2047 and ((tick() - v2048) >= v2047)) then
                                                return nil
                                            end
                                            task.wait(0.1)
                                        end
                                        return nil
                                    end
                                    local function v2052(v2053, v2054)
                                        if ((((not v2053) or (not v1816.Farming)) or v1898()) or (not v1974())) then
                                            return false
                                        end
                                        local v2055 = v2045(v2054, 15)
                                        if (not v2055) then
                                            return false
                                        end
                                        local v2056 = v2036(v2053)
                                        local v2057 = v2038(v2053, v2055)
                                        status(string.format("Tyrant vase %s | %s", v2053.Name, v2055))
                                        v1881(v2057, true, TyrantConfig.VaseTargetTimeout)
                                        local v2058 = v1868()
                                        if (not v2058) then
                                            return false
                                        end
                                        v2058.CFrame = v2057
                                        v2058.AssemblyLinearVelocity = Vector3.zero
                                        v2058.AssemblyAngularVelocity = Vector3.zero
                                        task.wait(0.1)
                                        v1986(v2056)
                                        local v2059 = v2020(v2056, v2055)
                                        v1986(nil)
                                        return v2059
                                    end
                                    local function v2060(v2061, v2062)
                                        local v2063 = (v2061.Position + Vector3.new(0, v2062, 0))
                                        return CFrame.new(v2063, v2061.Position)
                                    end
                                    local function v2064(v2065, v2066)
                                        local v2067 = (v2065 and v2065:FindFirstChildOfClass("Humanoid"))
                                        local v2068 = (v2065 and v2065:FindFirstChild("HumanoidRootPart"))
                                        if (((not v2067) or (not v2068)) or (v2067.Health <= 0)) then
                                            return
                                        end
                                        v1816.CurrentTarget = v2065
                                        v1816.CurrentMode = ((v2066 and "BOSS") or "MOBS")
                                        local v2069 = tick()
                                        local v2070 = v2067.Health
                                        local v2071 = 0
                                        while ((((v1816.Farming and v2065.Parent) and v2067.Parent) and v2068.Parent) and (v2067.Health > 0)) do
                                            local v2072 = v1868()
                                            local v2073 = v1866()
                                            if (((not v2072) or (not v2073)) or (v2073.Health <= 0)) then
                                                break
                                            end
                                            v1979()
                                            if TyrantConfig.AutoBuso then
                                                pcall(function()
                                                    v411:haki()
                                                end)
                                            end
                                            local v2074 = ((v2066 and TyrantConfig.BossHeight) or TyrantConfig.FarmHeight)
                                            local v2075 = v2060(v2068, v2074)
                                            if ((tick() - v2071) >= 0.12) then
                                                v411:topos(v2075)
                                                v2071 = tick()
                                            end
                                            if (v2067.Health < v2070) then
                                                v2070 = v2067.Health
                                                v2069 = tick()
                                            elseif ((tick() - v2069) > 15) then
                                                v2072.CFrame = v2075
                                                pcall(function()
                                                    v940:Attack()
                                                end)
                                                v2069 = tick()
                                            end
                                            task.wait(0.08)
                                        end
                                        v1816.CurrentTarget = nil
                                    end
                                    local function v2076()
                                        v1816.CurrentMode = "VASES"
                                        v1816.CurrentTarget = nil
                                        status("Tyrant: 4/4 eyes red - breaking 12 vases with Z/X/C")
                                        local v2077 = CFrame.lookAt((v1820 + Vector3.new(0, 8, 0)), v1820)
                                        v1881(v2077, true, 20)
                                        task.wait(0.25)
                                        local v2078 = 0
                                        local v2079 = TyrantConfig.VaseSkillKeys
                                        while ((v1816.Farming and v1974()) and (not v1898())) do
                                            v2078 = (v2078 + 1)
                                            for v2080, v2081 in ipairs(v1821) do
                                                if (((not v1816.Farming) or v1898()) or (not v1974())) then
                                                    return
                                                end
                                                local v2082 = ((((v2080 + v2078) - 2) % #v2079) + 1)
                                                local v2083 = string.upper(tostring(v2079[v2082]))
                                                v2052(v2081, v2083)
                                                task.wait(0.08)
                                            end
                                            status(("Tyrant: scanned all 12 vases, pass " .. tostring(v2078)))
                                            task.wait(0.35)
                                        end
                                    end
                                    local function v2091()
                                        if (v1816.BringStarted or (not TyrantConfig.BringMobs)) then
                                            return
                                        end
                                        v1816.BringStarted = true
                                        task.spawn(function()
                                            while task.wait((TyrantConfig.BringMobInterval or 0.15)) do
                                                if ((v1816.Farming and v719) and (v719.BringMobs ~= false)) then
                                                    local v2092 = ((v1816.CurrentTarget or v1898(false)) or v1910())
                                                    if ((v2092 and v2092.Parent) and v2092:FindFirstChild("HumanoidRootPart")) then
                                                        pcall(GrabMobs, v2092)
                                                    end
                                                end
                                            end
                                        end)
                                    end
                                    local v2093 = false
                                    local v2094 = nil
                                    local v2095 = false
                                    local v2096 = 10000
                                    local function v2097()
                                        if v1816.PreviousAttackConfig then
                                            return
                                        end
                                        v1816.PreviousAttackConfig = {
                                            AttackDistance = v719.AttackDistance,
                                            AttackMobs = v719.AttackMobs,
                                            AttackPlayers = v719.AttackPlayers,
                                            AutoClickEnabled = v719.AutoClickEnabled,
                                            BringMobs = v719.BringMobs,
                                            PreGrabDistance = v719.PreGrabDistance
                                        }
                                        v719.AttackDistance = (tonumber(TyrantConfig.AttackDistance) or 105)
                                        v719.AttackMobs = true
                                        v719.AttackPlayers = false
                                        v719.AutoClickEnabled = true
                                        v719.BringMobs = true
                                        v719.PreGrabDistance = (tonumber(TyrantConfig.BringDistance) or 1500)
                                    end
                                    local function v2098()
                                        local v2099 = v1816.PreviousAttackConfig
                                        if (not v2099) then
                                            return
                                        end
                                        v719.AttackDistance = v2099.AttackDistance
                                        v719.AttackMobs = v2099.AttackMobs
                                        v719.AttackPlayers = v2099.AttackPlayers
                                        v719.AutoClickEnabled = v2099.AutoClickEnabled
                                        v719.BringMobs = v2099.BringMobs
                                        v719.PreGrabDistance = v2099.PreGrabDistance
                                        v1816.PreviousAttackConfig = nil
                                    end
                                    local function v2100()
                                        for v2101, v2102 in pairs(v1816.BringTweens) do
                                            pcall(function()
                                                v2102:Cancel()
                                            end)
                                            v1816.BringTweens[v2101] = nil
                                        end
                                    end
                                    local function v2103()
                                        v2093 = false
                                        v1816.Farming = false
                                        v1816.CurrentMode = "IDLE"
                                        v1816.CurrentTarget = nil
                                        v1986(nil)
                                        v2100()
                                        v2098()
                                    end
                                    local function v2104(v2105)
                                        v2096 = math.max(0, ((tonumber(v2105) or v2096) or 10000))
                                        if v2094 then
                                            return
                                        end
                                        v2093 = true
                                        v1816.Farming = true
                                        v1816.DragonTalonBuyFailed = false
                                        v1816.LastDragonTalonBuyAttempt = 0
                                        v2097()
                                        if (not v2095) then
                                            v2095 = true
                                            v1958(true)
                                            v2091()
                                            v1988()
                                        end
                                        v2094 = task.spawn(function()
                                            if (v1870(TyrantConfig.Weapon) == v1870("Dragon Talon")) then
                                                v1976()
                                            end
                                            while (v2093 and v1816.Farming) do
                                                local v2106 = getV4Status(false)
                                                local v2107 = (v362.Data and v362.Data:FindFirstChild("Fragments"))
                                                local v2108 = ((v2107 and tonumber(v2107.Value)) or 0)
                                                if ((v2106.canTrial or v2106.complete) or (v2108 >= v2096)) then
                                                    break
                                                end
                                                local v2109 = v1866()
                                                if ((not v2109) or (v2109.Health <= 0)) then
                                                    status("Tyrant: waiting character respawn")
                                                    task.wait(1)
                                                else
                                                    if TyrantConfig.AutoBuso then
                                                        pcall(function()
                                                            v411:haki()
                                                        end)
                                                    end
                                                    local v2110 = (((isnight() and isfullmoon()) and " | Full Moon") or "")
                                                    local v2111 = v1898()
                                                    if v2111 then
                                                        status(("Fighting Tyrant for V4 fragments" .. v2110))
                                                        v2064(v2111, true)
                                                    elseif v1974() then
                                                        v2076()
                                                    else
                                                        v1816.CurrentMode = "MOBS"
                                                        v1816.CurrentTarget = nil
                                                        local v2112 = v1973()
                                                        status(string.format("Farming Tiki NPC %d/%d fragments | eyes %d/4%s", v2108, v2096, v2112, v2110))
                                                        v1979()
                                                        local v2113 = v1910()
                                                        if v2113 then
                                                            v2064(v2113, false)
                                                        else
                                                            v1881(v1817, true, 25)
                                                            task.wait(0.8)
                                                        end
                                                    end
                                                end
                                                task.wait(0.05)
                                            end
                                            v2093 = false
                                            v1816.Farming = false
                                            v1816.CurrentMode = "IDLE"
                                            v1816.CurrentTarget = nil
                                            v1986(nil)
                                            v2100()
                                            v2098()
                                            v2094 = nil
                                            _K4F.v639()
                                        end)
                                    end
                                    local function v2114(v2115)
                                        local v2116 = getgenv().Config["Farm Fragments"]
                                        if (not v2116) then
                                            return false
                                        end
                                        local v2117 = getV4Status(false)
                                        if (v2117.canTrial or v2117.complete) then
                                            if v2093 then
                                                v2103()
                                            end
                                            return false
                                        end
                                        local v2118 = math.max(0, (tonumber(v2115) or 10000))
                                        local v2119 = (tonumber(v362.Data.Fragments.Value) or 0)
                                        if (v2119 >= v2118) then
                                            if v2093 then
                                                v2103()
                                            end
                                            return false
                                        end
                                        if ((type(v2116) == "table") and v2116.autotyrant) then
                                            v2104(v2118)
                                            return v2093
                                        end
                                        return false
                                    end
                                    return {
                                        HandleFragmentFarming = v2114,
                                        Stop = v2103,
                                        IsActive = function()
                                        return v2093
                                    end,
                                        AssignTrainingIsland = v1844,
                                        GetTrainingIslandData = function(v2120)
                                        return v1825[v2120]
                                    end,
                                        CheckTrainingMonster = CheckMonster,
                                        ForceReassignIsland = v1853
                                    }
                                end)()
                                K4CakeFarm = (function()
                                    local v2121, v2122, v2123 = false, nil, 0
                                    local function v2124()
                                        if (not v2121) then
                                            return
                                        end
                                        v2121 = false
                                        K4_CancelTrialMovement()
                                        if v2122 then
                                            for v2125, v2126 in pairs(v2122) do
                                                v719[v2125] = v2126
                                            end
                                        end
                                        v2122 = nil
                                        _K4F.v639()
                                    end
                                    local function v2127()
                                        if (tick() < v2123) then
                                            return
                                        end
                                        v2123 = (tick() + 10)
                                        local v2128 = getgenv()
                                        local v2129 = (v2128.HopApiBaseUrl or tostring(v2128.Config["Full Moon API"]):match("^(https://[^/]+)"))
                                        local v2130, v2131 = v2128.JobIdCodec.Request(v2129, "GET", "/api/bloxfruit/cakeprince")
                                        if (not v2130) then
                                            status(("Cake Prince API: " .. tostring(v2131)))
                                            return
                                        end
                                        local v2132 = {}
                                        for v2133, v2134 in ipairs(((v2130.data or v2130.servers) or {})) do
                                            local v2135 = (tonumber((v2134.placeId or v2134.placeid)) or game.PlaceId)
                                            local v2136 = ((tonumber(v2134.players) or tonumber(tostring((v2134.players or "")):match("(%d+)"))) or 99)
                                            local v2137 = {}
                                            for v2138 in tostring((v2134.age or "0")):gmatch("(%d+)") do
                                                v2137[(#v2137 + 1)] = tonumber(v2138)
                                            end
                                            local v2139 = (((#v2137 >= 3) and (((v2137[(#v2137 - 2)] * 3600) + (v2137[(#v2137 - 1)] * 60)) + v2137[#v2137])) or (((#v2137 == 2) and ((v2137[1] * 60) + v2137[2])) or (v2137[1] or 0)))
                                            local v2140 = tonumber(tostring((v2134.sea or "3")):match("(%d+)"))
                                            if (((_K4MoonHubPlaceAllowed(v2135) and (v2140 == 3)) and (v2139 < 180)) and (v2136 < (tonumber((v2134.maxplayers or v2134.maxPlayers)) or 12))) then
                                                v2132[(#v2132 + 1)] = { token = ((v2134.jobId or v2134.jobid) or v2134.joinId), place = v2135, age = v2139 }
                                            end
                                        end
                                        table.sort(v2132, function(v2141, v2142)
                                            return (v2141.age < v2142.age)
                                        end)
                                        for v2143 = 1, math.min(5, #v2132) do
                                            local v2144 = v2132[v2143]
                                            local v2145 = K4JobCodec.Resolve(v2144.token)
                                            if ((v2145 and (v2145 ~= game.JobId)) and (tick() >= (tonumber(_G.K4MoonHub.blacklist[v2145]) or 0))) then
                                                K4_QueueRaceUpgradeResume()
                                                _K4MoonHubTeleport(v2145, "cake_prince_fragments", v2144.place)
                                                return
                                            end
                                        end
                                        status("Farming fragments: searching a fresh Cake Prince server")
                                    end
                                    local function v2146()
                                        if (not K4_ShouldFarmFragments()) then
                                            v2124()
                                            return false
                                        end
                                        local v2147 = refreshMatch()
                                        if (((not v2147) or (not v2147.ok)) or v2147.assigned) then
                                            status("Farming fragments: waiting to leave trial queue")
                                            return true
                                        end
                                        if (not v2121) then
                                            K4TyrantFarmController.Stop()
                                            K4_CancelTrialMovement()
                                            v2122 = { AutoClickEnabled = v719.AutoClickEnabled, AttackPlayers = v719.AttackPlayers, BringMobs = v719.BringMobs }
                                            v2121 = true
                                        end
                                        local v2148 = v348.LocalPlayer.Character
                                        local v2149 = (v2148 and v2148:FindFirstChildOfClass("Humanoid"))
                                        if ((not v2149) or (v2149.Health <= 0)) then
                                            status("Farming fragments: waiting for respawn")
                                            return true
                                        end
                                        local v2150 = getgenv().Config["Farm Fragments"]
                                        status(("Farming Cake Prince fragments " .. (tostring(v348.LocalPlayer.Data.Fragments.Value) .. ("/" .. tostring(v2150.MinFragments)))))
                                        local v2151 = nil
                                        local v2152 = { v349 }
                                        local v2153 = workspace:FindFirstChild("Enemies")
                                        if v2153 then
                                            table.insert(v2152, 1, v2153)
                                        end
                                        for v2154, v2155 in ipairs(v2152) do
                                            for v2156, v2157 in ipairs(v2155:GetChildren()) do
                                                local v2158 = v2157:FindFirstChildOfClass("Humanoid")
                                                if (((v2157.Name:match("^Cake Prince") and v2158) and (v2158.Health > 0)) and v2157:FindFirstChild("HumanoidRootPart")) then
                                                    v2151 = v2157
                                                    break
                                                end
                                            end
                                            if v2151 then
                                                break
                                            end
                                        end
                                        if v2151 then
                                            v411:haki()
                                            for v2159, v2160 in ipairs(v348.LocalPlayer.Backpack:GetChildren()) do
                                                if (v2160:IsA("Tool") and (v2160.ToolTip == "Melee")) then
                                                    v2149:EquipTool(v2160)
                                                    break
                                                end
                                            end
                                            v719.AutoClickEnabled = true
                                            v719.AttackPlayers = false
                                            v719.BringMobs = false
                                            v411:topos((v2151.HumanoidRootPart.CFrame * CFrame.new(0, 18, 0)))
                                            getgenv().K4_AttackTarget(v2151, 120)
                                        else
                                            v719.AutoClickEnabled = false
                                            v2127()
                                        end
                                        return true
                                    end
                                    return {
                                        Step = v2146,
                                        Stop = v2124,
                                        IsActive = function()
                                        return v2121
                                    end
                                    }
                                end)()
                                function _K4F.v2161(v2162, v2163)
                                    if (v395 and (getgenv().Config["Lock Help V4 Progress"] ~= false)) then
                                        status("Help V4 progression locked - no purchase")
                                        return false
                                    end
                                    if ((not v2162) or (not v2162.needsPurchase)) then
                                        return false
                                    end
                                    v2163 = tostring((v2163 or "Account"))
                                    local v2164 = (tonumber(v362.Data.Fragments.Value) or 0)
                                    local v2165 = (tonumber(v2162.cost) or 0)
                                    if ((v2165 > 0) and (v2164 < v2165)) then
                                        if K4TyrantFarmController.HandleFragmentFarming(v2165) then
                                            return true
                                        end
                                        status((v2163 .. (" needs " .. (tostring((v2165 - v2164)) .. " more fragments for V4"))))
                                        return true
                                    end
                                    if K4TyrantFarmController.IsActive() then
                                        K4TyrantFarmController.Stop()
                                    end
                                    status((v2163 .. " buying V4 upgrade"))
                                    local v2166, v2167 = pcall(function()
                                        return _K4F.v637("Buy")
                                    end)
                                    _K4F.v639()
                                    if (v2166 and v2167) then
                                        status((v2163 .. " V4 upgrade purchased"))
                                        K4_RunCaptureGear()
                                    else
                                        status((v2163 .. " V4 purchase failed - retrying"))
                                    end
                                    task.wait(0.6)
                                    return true
                                end
                                function _K4F.v2168(v2169, v2170)
                                    if (getgenv().K4CaptureGear and getgenv().K4CaptureGear.active) then
                                        return true
                                    end
                                    v2170 = tostring((v2170 or "Account"))
                                    local v2171 = v348.LocalPlayer.Character
                                    if (not v2171) then
                                        status((v2170 .. " waiting character"))
                                        task.wait(1)
                                        return false
                                    end
                                    local v2172 = getV4Status(false)
                                    if v2172.complete then
                                        status((v2170 .. " Race V4 completed"))
                                        return true
                                    end
                                    if v2172.canTrial then
                                        status((v2170 .. " training complete - ready for trial"))
                                        pcall(function()
                                            local v2173 = _K4F.v1738(true)
                                            if v2173 then
                                                local v2174 = _K4F.v1754()
                                                if v2174 then
                                                    local v2175 = tonumber(((v2174 and v2174.local_fire_at) or 0))
                                                    if (v2175 > 0) then
                                                        _K4F.v1761(v2175)
                                                    end
                                                end
                                                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
                                                v352:SendKeyEvent(true, "T", false, game)
                                                v352:SendKeyEvent(false, "T", false, game)
                                            end
                                        end)
                                        return true
                                    end
                                    if v2172.needsPurchase then
                                        _K4F.v2161(v2172, v2170)
                                        return false
                                    end
                                    if (not v2171:FindFirstChild("RaceTransformed")) then
                                        status((v2170 .. (" " .. tostring(v2172.label))))
                                        talktoonggianaodo()
                                        _K4F.v639()
                                        return false
                                    end
                                    if K4TyrantFarmController.IsActive() then
                                        K4TyrantFarmController.Stop()
                                    end
                                    local v2177 = (isnight() and isfullmoon())
                                    local v2178 = (((type(v2169) == "number") and (" (" .. (tostring(v2169) .. " left)"))) or "")
                                    status((v2170 .. (((v2177 and " Full Moon - continue training") or " training") .. v2178)))
                                    local v2179 = 0
                                    local v2180 = false
                                    local function v2181()
                                        v719.AutoClickEnabled = false
                                        pcall(K4_CancelTrialMovement)
                                        if (type(getgenv().K4_ResetFastAttackTarget) == "function") then
                                            pcall(getgenv().K4_ResetFastAttackTarget)
                                        end
                                        status((v2170 .. " died - waiting respawn to continue training"))
                                        local v2182, v2183, v2184
                                        repeat
                                            task.wait(0.35)
                                            v2182 = v348.LocalPlayer.Character
                                            v2183 = (v2182 and v2182:FindFirstChildOfClass("Humanoid"))
                                            v2184 = (v2182 and v2182:FindFirstChild("HumanoidRootPart"))
                                        until (v2180 or ((v2183 and v2184) and (v2183.Health > 0)))
                                        if v2180 then
                                            return false
                                        end
                                        task.wait(0.75)
                                        v719.AutoClickEnabled = true
                                        v719.AttackMobs = true
                                        v719.AttackPlayers = true
                                        v719.BringMobs = true
                                        _K4F.v639()
                                        K4TyrantFarmController.ForceReassignIsland()
                                        status((v2170 .. " respawned - resuming training"))
                                        return true
                                    end
                                    local function v2185()
                                        local v2186 = v348.LocalPlayer.Character
                                        local v2187 = (v2186 and v2186:FindFirstChildOfClass("Humanoid"))
                                        local v2188 = (v2186 and v2186:FindFirstChild("HumanoidRootPart"))
                                        return (((v2187 ~= nil) and (v2188 ~= nil)) and (v2187.Health > 0))
                                    end
                                    local function v2189()
                                        if v2180 then
                                            return true
                                        end
                                        if (v395 and (getgenv().Config["Help Search Full Moon Priority"] ~= false)) then
                                            local v2190 = ((v948 and tostring((v948.target_job_id or ""))) or "")
                                            local v2192 = ((v2190 ~= "") and (v2190 ~= tostring(game.JobId)))
                                            if (v2192 or _K4MoonHubMoonEnded()) then
                                                v2180 = true
                                                v719.AutoClickEnabled = false
                                                return true
                                            end
                                            if (not _K4MoonHubFullMoonNight()) then
                                                local v2193 = false
                                                pcall(function()
                                                    v2193 = (_K4MoonHubMoonImminent() == true)
                                                end)
                                                if v2193 then
                                                    return false
                                                end
                                                v2180 = true
                                                v719.AutoClickEnabled = false
                                                return true
                                            end
                                        end
                                        if (tick() < v2179) then
                                            return false
                                        end
                                        v2179 = (tick() + 0.8)
                                        local v2194 = getV4Status(true)
                                        if v2194.canTrial then
                                            v2180 = true
                                            status((v2170 .. " training complete - ready for trial"))
                                            return true
                                        end
                                        if v2194.complete then
                                            v2180 = true
                                            status((v2170 .. " Race V4 completed"))
                                            return true
                                        end
                                        if v2194.needsPurchase then
                                            v2180 = true
                                            status((v2170 .. " training complete - V4 upgrade available"))
                                            return true
                                        end
                                        return false
                                    end
                                    pcall(function()
                                        local v2195 = v348.LocalPlayer.Character:FindFirstChild("RaceEnergy")
                                        local v2196 = v348.LocalPlayer.Character:FindFirstChild("RaceTransformed")
                                        if (((v2195 and (v2195.Value >= 1)) and v2196) and (not v2196.Value)) then
                                            v352:SendKeyEvent(true, "Y", false, game)
                                            v352:SendKeyEvent(false, "Y", false, game)
                                        end
                                    end)
                                    local v2197 = K4TyrantFarmController.AssignTrainingIsland()
                                    local v2198 = K4TyrantFarmController.GetTrainingIslandData(v2197)
                                    local v2199 = nil
                                    if v2198.Positions then
                                        v2199 = v2198.Positions
                                    elseif v2198.Position then
                                        v2199 = { v2198.Position }
                                    else
                                        status("Island has no position data")
                                        return false
                                    end
                                    local v2200 = 1
                                    local function v2201()
                                        return v2199[v2200]
                                    end
                                    local function v2202()
                                        v2200 = (v2200 + 1)
                                        if (v2200 > #v2199) then
                                            v2200 = 1
                                        end
                                    end
                                    local v2203 = v2201()
                                    local v2204 = math.max(350, (tonumber(getgenv().Config["Training Move Arrival Distance"]) or 120))
                                    if (getdis(v2203) >= v2204) then
                                        local v2205, v2206 = K4_TrainingTPBypassToIsland(v2203, v2197, v2170, v2189)
                                        if (v2206 == "stopped") then
                                            v719.AutoClickEnabled = true
                                            return v2180
                                        end
                                        if v2205 then
                                            task.wait(0.2)
                                        end
                                        if (getdis(v2203) >= v2204) then
                                            status((v2170 .. (" moving smoothly to [" .. (tostring(v2197) .. "] for training"))))
                                            local v2207, v2208 = K4_SmoothTrainingTravel(v2203, v2170, v2189)
                                            if (not v2207) then
                                                v719.AutoClickEnabled = true
                                                if (v2208 == "dead") then
                                                    if v2181() then
                                                        return false
                                                    end
                                                end
                                                return v2180
                                            end
                                        end
                                    end
                                    local v2209 = {}
                                    for v2210 in pairs(v2198.Mobs) do
                                        table.insert(v2209, v2210)
                                    end
                                    while (not v2189()) do
                                        if (not v2185()) then
                                            if v2181() then
                                                return false
                                            end
                                            break
                                        end
                                        local v2211 = K4TyrantFarmController.CheckTrainingMonster(table.unpack(v2209))
                                        if (not v2211) then
                                            v719.AutoClickEnabled = true
                                            status((v2170 .. (" [" .. (tostring(v2197) .. "] waiting for mobs..."))))
                                            v590(v2201())
                                            task.wait(0.8)
                                            v2202()
                                        else
                                            local v2212 = v2211:FindFirstChildWhichIsA("Humanoid")
                                            local v2213 = ((v2212 and tonumber(v2212.Health)) or 0)
                                            local v2214 = tick()
                                            local v2215 = false
                                            _G.K4TrainingHop.noDamageHopActive = false
                                            _G.K4TrainingHop.noDamageHopStartedAt = 0
                                            repeat
                                                task.wait(0.03)
                                                if (not v2185()) then
                                                    if v2181() then
                                                        return false
                                                    end
                                                    v2180 = true
                                                    break
                                                end
                                                v411:eq()
                                                v411:haki()
                                                local v2216 = false
                                                pcall(function()
                                                    local v2217 = v348.LocalPlayer.Character
                                                    local v2218 = (v2217 and v2217:FindFirstChild("RaceTransformed"))
                                                    local v2219 = (v2217 and v2217:FindFirstChild("RaceEnergy"))
                                                    local v2220 = (v2211 and v2211:FindFirstChild("HumanoidRootPart"))
                                                    if (v2218 and v2218.Value) then
                                                        v719.AutoClickEnabled = false
                                                        v2214 = tick()
                                                        status((v2170 .. (" [" .. (tostring(v2197) .. "] wait transform end"))))
                                                        if v2220 then
                                                            v411:topos((v2220.CFrame * CFrame.new(0, 150, 0)), false, 200)
                                                        end
                                                    else
                                                        v719.AttackMobs = true
                                                        v719.AttackPlayers = false
                                                        v719.BringMobs = true
                                                        v719.AutoClickEnabled = true
                                                        v2216 = true
                                                        status((v2170 .. (" [" .. (tostring(v2197) .. "] killing mobs + charge"))))
                                                        if v2220 then
                                                            v411:topos((v2220.CFrame * CFrame.new(0, 18, 0)), false, 200)
                                                            if (type(getgenv().K4_AttackTarget) == "function") then
                                                                pcall(getgenv().K4_AttackTarget, v2211, 180)
                                                            end
                                                        end
                                                        if (v2219 and (v2219.Value >= 1)) then
                                                            v352:SendKeyEvent(true, "Y", false, game)
                                                            v352:SendKeyEvent(false, "Y", false, game)
                                                        end
                                                    end
                                                end)
                                                v2212 = (v2211 and v2211:FindFirstChildWhichIsA("Humanoid"))
                                                local v2221 = (v2211 and v2211:FindFirstChild("HumanoidRootPart"))
                                                local v2222 = v348.LocalPlayer.Character
                                                local v2223 = (v2222 and v2222:FindFirstChild("HumanoidRootPart"))
                                                local v2225 = ((v2212 and tonumber(v2212.Health)) or 0)
                                                local v2226 = (v2225 < (v2213 - 0.05))
                                                local v2227 = math.max(4, (tonumber(getgenv().Config["Training No Damage Timeout"]) or 60))
                                                local v2228 = (getgenv().Config["Enable Training No Damage Hop"] == true)
                                                if v2226 then
                                                    v2214 = tick()
                                                elseif ((((((v2228 and v2216) and (v2211.Parent == workspace:FindFirstChild("Enemies"))) and v2221) and v2223) and ((v2221.Position - v2223.Position).Magnitude <= 220)) and ((tick() - v2214) >= v2227)) then
                                                    status((v2170 .. (" [" .. (tostring(v2197) .. ("] no damage (" .. (tostring(math.floor(v2227)) .. "s) - hopping server now"))))))
                                                    v2215 = true
                                                    v719.AutoClickEnabled = false
                                                    pcall(K4_CancelTrialMovement)
                                                    if (type(getgenv().K4_ResetFastAttackTarget) == "function") then
                                                        pcall(getgenv().K4_ResetFastAttackTarget, v2211)
                                                    end
                                                    pcall(_K4ForceTrainingNoDamageHop, v2197, v2170)
                                                elseif ((((not v2216) or (not v2221)) or (not v2223)) or ((v2221.Position - v2223.Position).Magnitude > 220)) then
                                                    v2214 = tick()
                                                end
                                                v2213 = v2225
                                                if v2215 then
                                                    break
                                                end
                                            until ((not checkmob_(v2211)) or v2189())
                                            if v2215 then
                                                return false
                                            end
                                        end
                                    end
                                    v719.AutoClickEnabled = true
                                    v719.AttackMobs = true
                                    v719.AttackPlayers = true
                                    v719.BringMobs = true
                                    if (type(getgenv().K4_ResetFastAttackTarget) == "function") then
                                        pcall(getgenv().K4_ResetFastAttackTarget)
                                    end
                                    _K4F.v639()
                                    K4TyrantFarmController.ForceReassignIsland()
                                    return v2180
                                end
                                function _K4F.v2229()
                                    local v2230 = ((v396 and "Main") or "Help")
                                    local v2231 = (isnight() and isfullmoon())
                                    local v2232 = getV4Status(false)
                                    if v2232.canTrial then
                                        if (v396 and (not K4_PrepareGreatTreeBeforeMoon())) then
                                            return
                                        end
                                        if K4TyrantFarmController.IsActive() then
                                            K4TyrantFarmController.Stop()
                                        end
                                        if v2231 then
                                            status("Full Moon + trial-ready - waiting auto pair 1 Main + 2 Help")
                                        else
                                            local v2233 = false
                                            pcall(function()
                                                v2233 = (_K4MoonHubMoonImminent() == true)
                                            end)
                                            if v2233 then
                                                local v2234 = (-1)
                                                pcall(function()
                                                    v2234 = _K4MoonClockSnapshot().countdown_seconds
                                                end)
                                                status(string.format("Full Moon soon in %s - holding this server, waiting auto pair", _K4MoonClockFormatSeconds(v2234)))
                                            else
                                                status("Ready for trial - waiting Full Moon and auto pair")
                                            end
                                        end
                                        return
                                    end
                                    if v2232.complete then
                                        if K4TyrantFarmController.IsActive() then
                                            K4TyrantFarmController.Stop()
                                        end
                                        status("Race V4 completed - no more training needed")
                                        return
                                    end
                                    if v2232.needsPurchase then
                                        _K4F.v2161(v2232, v2230)
                                        return
                                    end
                                    if K4TyrantFarmController.IsActive() then
                                        K4TyrantFarmController.Stop()
                                    end
                                    local v2235 = (v2232.remainingTraining or ((v2232.needsTraining and "training") or v2232.key))
                                    _K4F.v2168(v2235, v2230)
                                end
                                K4_RunWaitingMainTrainingOrLobby = function()
                                    local v2236 = (v948 and ((v948.lobby_waiting == true) or (tostring((v948.waiting_reason or "")) == "waiting_for_free_hub_slot")))
                                    if ((not v396) or (not v2236)) then
                                        return false
                                    end
                                    v946 = false
                                    v951 = ""
                                    v952 = ""
                                    local v2237 = getV4Status(false)
                                    local v2238 = (" | Queue #" .. (tostring((v948.queue_position or "?")) .. (" | Active: " .. tostring((v948.active_main or "?")))))
                                    if _K4MoonHubMoonEnded() then
                                        status(("Full Moon ended - waiting Main leaving for training" .. v2238))
                                        _K4MoonHubLeaveForTraining("full_moon_ended_waiting_main")
                                        return true
                                    end
                                    if (v2237.canTrial == true) then
                                        pcall(K4_CancelTrialMovement)
                                        if K4TyrantFarmController.IsActive() then
                                            K4TyrantFarmController.Stop()
                                        end
                                        if (not K4_PrepareGreatTreeBeforeMoon()) then
                                            return true
                                        end
                                        status(("Main READY at Great Tree - waiting Trial turn" .. v2238))
                                        return true
                                    end
                                    if (v2237.complete == true) then
                                        pcall(K4_CancelTrialMovement)
                                        if K4TyrantFarmController.IsActive() then
                                            K4TyrantFarmController.Stop()
                                        end
                                        pcall(K4_HoldWaitingMainAtLobby)
                                        status(("Main Race V4 completed - waiting outside Trial" .. v2238))
                                        return true
                                    end
                                    local v2239 = v348.LocalPlayer.Character
                                    local v2240 = (v2239 and v2239:FindFirstChildOfClass("Humanoid"))
                                    local v2241 = (v2239 and v2239:FindFirstChild("HumanoidRootPart"))
                                    if (v2241 and ((v2241.Position - v1632).Magnitude < 2500)) then
                                        if K4_MainScriptResetBlocked() then
                                            status("Main trial/FFA active - training reset blocked")
                                            return true
                                        end
                                        pcall(K4_CancelTrialMovement)
                                        if (v2240 and (v2240.Health > 0)) then
                                            pcall(function()
                                                v2240.Health = 0
                                            end)
                                        end
                                        status(("Main needs training - leaving Temple before farm" .. v2238))
                                        return true
                                    end
                                    if (getgenv().Config["Waiting Main Training"] == false) then
                                        pcall(K4_CancelTrialMovement)
                                        if K4TyrantFarmController.IsActive() then
                                            K4TyrantFarmController.Stop()
                                        end
                                        pcall(K4_HoldWaitingMainAtLobby)
                                        status(("Main training disabled - waiting Trial turn" .. v2238))
                                        return true
                                    end
                                    if (v2237.needsPurchase == true) then
                                        local v2242 = (tonumber(v362.Data.Fragments.Value) or 0)
                                        local v2243 = (tonumber(v2237.cost) or 0)
                                        if ((v2243 > 0) and (v2242 < v2243)) then
                                            if K4TyrantFarmController.HandleFragmentFarming(v2243) then
                                                return true
                                            end
                                            status(("Main needs " .. (tostring((v2243 - v2242)) .. (" more fragments for V4" .. v2238))))
                                            return true
                                        end
                                        pcall(K4_CancelTrialMovement)
                                        status(("Main buying V4 upgrade" .. v2238))
                                        _K4F.v2161(v2237, "Main")
                                        return true
                                    end
                                    local v2244 = (v2237.remainingTraining or ((v2237.needsTraining and "training") or v2237.key))
                                    _K4F.v2168(v2244, "Main")
                                    return true
                                end
                                K4_IsPostTrialFFAActive = function()
                                    local v2245 = false
                                    pcall(function()
                                        local v2246 = workspace.Map:FindFirstChild("Temple of Time")
                                        local v2247 = (v2246 and v2246:FindFirstChild("FFABorder"))
                                        local v2248 = (v2247 and v2247:FindFirstChild("Forcefield"))
                                        v2245 = ((v2248 ~= nil) and (v2248.Transparency == 0))
                                    end)
                                    return v2245
                                end
                                K4_GetPostTrialHelperNames = function()
                                    local v2249 = {}
                                    local v2250 = {}
                                    local function v2251(v2252)
                                        v2252 = tostring((v2252 or ""))
                                        if (((v2252 ~= "") and (v2252 ~= tostring((v397 or "")))) and (not v2250[v2252])) then
                                            v2250[v2252] = true
                                            table.insert(v2249, v2252)
                                        end
                                    end
                                    if (v948 and (type(v948.helpers) == "table")) then
                                        for v2253, v2254 in ipairs(v948.helpers) do
                                            v2251(v2254)
                                        end
                                    end
                                    if (#v2249 < 2) then
                                        for v2255 in pairs((v399 or {})) do
                                            v2251(v2255)
                                        end
                                    end
                                    table.sort(v2249, function(v2256, v2257)
                                        return (string.lower(v2256) < string.lower(v2257))
                                    end)
                                    return v2249
                                end
                                K4_PostTrialCharacterReset = function(v2258, v2259)
                                    local v2260 = v348:FindFirstChild(tostring((v2258 or "")))
                                    if (not v2260) then
                                        return true
                                    end
                                    local v2261 = v2260.Character
                                    if v2259 then
                                        if ((not v2259.Parent) or (v2261 ~= v2259)) then
                                            return true
                                        end
                                    elseif (not v2261) then
                                        return false
                                    end
                                    local v2262 = (v2259 or v2261)
                                    local v2263 = (v2262 and v2262:FindFirstChildOfClass("Humanoid"))
                                    if (v2263 and (v2263.Health <= 0)) then
                                        return true
                                    end
                                    local v2264 = (v2262 and v2262:FindFirstChild("HumanoidRootPart"))
                                    if (v2264 and ((v2264.Position - v1632).Magnitude >= 2500)) then
                                        return true
                                    end
                                    return false
                                end
                                K4_BeginPostTrialResetSequence = function()
                                    local v2265 = _G.K4PostTrialReset
                                    if ((not v2265) or (v2265.active == true)) then
                                        return (v2265 and (v2265.active == true))
                                    end
                                    local v2266 = K4_GetPostTrialHelperNames()
                                    if (#v2266 ~= 2) then
                                        status(("Post-Trial reset needs exactly 2 Help accounts; found " .. tostring(#v2266)))
                                        return false
                                    end
                                    if v395 then
                                        local v2267 = false
                                        for v2268, v2269 in ipairs(v2266) do
                                            if (tostring(v2269) == v945) then
                                                v2267 = true
                                                break
                                            end
                                        end
                                        if (not v2267) then
                                            return false
                                        end
                                    end
                                    local v2270 = _K4F.v1705()
                                    if (v2270 == "") then
                                        v2270 = tostring((_G.K4TrialLifecycle.groupId or ""))
                                    end
                                    if (v2270 == "") then
                                        v2270 = tostring((v959 or ""))
                                    end
                                    if (v2270 == "") then
                                        v2270 = (tostring(game.JobId) .. "_post_trial")
                                    end
                                    v2265.ffaLatched = true
                                    v2265.armed = false
                                    v2265.ffaInactiveAt = 0
                                    v2265.active = true
                                    v2265.groupId = v2270
                                    v2265.startedAt = tick()
                                    v2265.helperNames = v2266
                                    v2265.helperCharacters = {}
                                    v2265.helperConfirmed = {}
                                    v2265.selfResetIssued = false
                                    v2265.selfResetIssuedAt = 0
                                    v2265.selfResetRetries = 0
                                    v2265.selfResetConfirmed = false
                                    v2265.mainWinnerPoint = false
                                    v2265.mainResetForbidden = (v396 == true)
                                    v2265.mainGearClaimed = false
                                    v2265.lastGearClaimAt = 0
                                    v2265.lastWinnerCheckAt = 0
                                    v2265.templeClockFailures = 0
                                    v2265.completed = false
                                    v2265.completedAt = 0
                                    for v2271, v2272 in ipairs(v2266) do
                                        local v2273 = v348:FindFirstChild(v2272)
                                        v2265.helperCharacters[v2272] = ((v2273 and v2273.Character) or nil)
                                        v2265.helperConfirmed[v2272] = false
                                    end
                                    pcall(K4_CancelTrialMovement)
                                    v719.AutoClickEnabled = false
                                    _G.SHOULDSPAMSKILLS = false
                                    status(((v396 and "FFA started: blocking scripted Main reset until gear claim succeeds") or "FFA started: both Help accounts reset immediately"))
                                    return true
                                end
                                K4_FinishPostTrialLocalReset = function(v2274)
                                    local v2275 = _G.K4PostTrialReset
                                    if (not v2275) then
                                        return
                                    end
                                    v2275.active = false
                                    v2275.armed = false
                                    v2275.trialSeen = false
                                    v2275.completed = true
                                    v2275.completedAt = tick()
                                    status(tostring((v2274 or "Post-Trial reset completed")))
                                end
                                K4_RunHelpPostTrialReset = function()
                                    local v2276 = _G.K4PostTrialReset
                                    if (((not v2276) or (v2276.active ~= true)) or (not v395)) then
                                        return false
                                    end
                                    pcall(K4_CancelTrialMovement)
                                    v719.AutoClickEnabled = false
                                    _G.SHOULDSPAMSKILLS = false
                                    local v2277 = false
                                    for v2278, v2279 in ipairs((v2276.helperNames or {})) do
                                        if (tostring(v2279) == v945) then
                                            v2277 = true
                                            break
                                        end
                                    end
                                    if (not v2277) then
                                        status("Post-Trial lock: this Help is not in the active pair")
                                        return true
                                    end
                                    local v2280 = (tick() - (tonumber(v2276.startedAt) or tick()))
                                    local v2281 = ((type(_K4MoonHubMoonEnded) == "function") and (_K4MoonHubMoonEnded() == true))
                                    if (v2281 and (v2280 >= 3)) then
                                        K4_ForceFinishHelpPostTrialReset("full_moon_ended_during_help_reset")
                                        status("Full Moon ended - clearing stale Help Post-Trial lock")
                                        return false
                                    end
                                    if (v2280 >= 20) then
                                        K4_ForceFinishHelpPostTrialReset("help_reset_watchdog_timeout")
                                        status("Help reset confirmation timed out - unlocking server hop")
                                        return false
                                    end
                                    local v2282 = v2276.helperCharacters[v945]
                                    if v2276.selfResetIssued then
                                        if K4_PostTrialCharacterReset(v945, v2282) then
                                            v2276.selfResetConfirmed = true
                                            v2276.helperConfirmed[v945] = true
                                            K4_FinishPostTrialLocalReset("Help reset confirmed (simultaneous Help mode)")
                                            return false
                                        end
                                        if (((tick() - (tonumber(v2276.selfResetIssuedAt) or 0)) >= 1.5) and ((tonumber(v2276.selfResetRetries) or 0) < 3)) then
                                            v2276.selfResetRetries = ((tonumber(v2276.selfResetRetries) or 0) + 1)
                                            v2276.selfResetIssuedAt = tick()
                                            local v2283 = v348.LocalPlayer.Character
                                            local v2284 = (v2283 and v2283:FindFirstChildOfClass("Humanoid"))
                                            if (v2284 and (v2284.Health > 0)) then
                                                pcall(function()
                                                    v2284.Health = 0
                                                end)
                                            end
                                            status(("Help reset retry " .. (tostring(v2276.selfResetRetries) .. "/3")))
                                        elseif (((tonumber(v2276.selfResetRetries) or 0) >= 3) and ((tick() - (tonumber(v2276.selfResetIssuedAt) or 0)) >= 2)) then
                                            K4_ForceFinishHelpPostTrialReset("help_reset_retry_limit")
                                            status("Help reset retry limit reached - unlocking server hop")
                                            return false
                                        else
                                            status("Help reset sent - waiting for respawn confirmation")
                                        end
                                        return true
                                    end
                                    local v2285 = math.max(0, (tonumber(getgenv().Config["Help Reset Delay"]) or 0))
                                    if ((tick() - v2276.startedAt) < v2285) then
                                        status("Both Help preparing simultaneous reset")
                                        return true
                                    end
                                    local v2286 = v348.LocalPlayer.Character
                                    local v2287 = (v2286 and v2286:FindFirstChildOfClass("Humanoid"))
                                    if (not (v2287 and (v2287.Health > 0))) then
                                        v2276.selfResetIssued = true
                                        v2276.selfResetIssuedAt = tick()
                                        return true
                                    end
                                    v2276.helperCharacters[v945] = v2286
                                    v2276.selfResetIssued = true
                                    v2276.selfResetIssuedAt = tick()
                                    v2276.selfResetRetries = 0
                                    status("Help resetting now (simultaneous mode); Main remains locked alive")
                                    pcall(function()
                                        v2287.Health = 0
                                    end)
                                    return true
                                end
                                K4_RunMainPostTrialReset = function(v2288)
                                    if K4_RunCaptureGear() then
                                        return true
                                    end
                                    local v2289 = _G.K4PostTrialReset
                                    if (((not v2289) or (v2289.active ~= true)) or (not v396)) then
                                        return false
                                    end
                                    pcall(K4_CancelTrialMovement)
                                    v719.AutoClickEnabled = false
                                    _G.SHOULDSPAMSKILLS = false
                                    v2289.mainResetForbidden = true
                                    v2289.templeClockFailures = (tonumber(v2289.templeClockFailures) or 0)
                                    if (v2289.mainGearClaimed == true) then
                                        v2289.mainResetForbidden = false
                                        v2289.active = false
                                        v2289.armed = false
                                        v2289.trialSeen = false
                                        v2289.completed = true
                                        v2289.completedAt = tick()
                                        _K4F.v1464("post_trial_training")
                                        status("Main gear claim verified - checking the correct next V4 action")
                                        return false
                                    end
                                    local v2290 = (tick() - (tonumber(v2289.startedAt) or tick()))
                                    local v2291 = false
                                    pcall(function()
                                        v2291 = (isfullmoon() == true)
                                    end)
                                    if ((tick() - (tonumber(v2289.lastWinnerCheckAt) or 0)) >= 0.45) then
                                        v2289.lastWinnerCheckAt = tick()
                                        _K4F.v639()
                                        local v2292, v2293 = pcall(function()
                                            return getV4Status(true)
                                        end)
                                        if (v2292 and (type(v2293) == "table")) then
                                            if (v2293.needsTraining == true) then
                                                _K4F.v1469("V4 TRAINING REQUIRED detected after Trial")
                                                return false
                                            end
                                            local v2294 = ((v2288 ~= true) and (v2290 >= 4))
                                            if (((v2293.canTrial == true) and v2294) and (((v2291 ~= true) or (v2290 >= 15)) or (v2289.templeClockFailures >= 3))) then
                                                _K4F.v1472("READY FOR TRIAL confirmed - cleared stale Post-Trial lock; waiting next Full Moon", "ready_for_next_trial")
                                                return false
                                            end
                                            if ((v2293.complete == true) and v2294) then
                                                _K4F.v1472("Race V4 already completed - cleared stale Post-Trial lock", "post_trial_v4_completed")
                                                return false
                                            end
                                            if ((v2293.needsPurchase == true) and v2294) then
                                                _K4F.v1472("V4 purchase is pending - cleared old Trial lock for the normal upgrade loop", "v4_upgrade_pending")
                                                return false
                                            end
                                        end
                                    end
                                    local v2295 = math.max(0.35, (tonumber(getgenv().Config["Main Gear Claim Retry"]) or 0.75))
                                    if ((tick() - (tonumber(v2289.lastGearClaimAt) or 0)) < v2295) then
                                        status("Both Help reset together - keeping Main alive for gear claim")
                                        return true
                                    end
                                    v2289.lastGearClaimAt = tick()
                                    local v2296, v2297 = pcall(function()
                                        return v369:InvokeServer("TempleClock", "Check")
                                    end)
                                    if ((not v2296) or (type(v2297) ~= "table")) then
                                        v2289.templeClockFailures = (v2289.templeClockFailures + 1)
                                        status(("Main kept alive - TempleClock check failed (" .. (tostring(v2289.templeClockFailures) .. "), checking V4 fallback")))
                                        return true
                                    end
                                    v2289.templeClockFailures = 0
                                    if (v2297.HadPoint ~= true) then
                                        _K4F.v639()
                                        local v2298, v2299 = pcall(function()
                                            return getV4Status(true)
                                        end)
                                        if (v2298 and (type(v2299) == "table")) then
                                            if (v2299.needsTraining == true) then
                                                _K4F.v1469("V4 TRAINING REQUIRED detected after Trial")
                                                return false
                                            end
                                            local v2300 = ((v2288 ~= true) and (v2290 >= 4))
                                            if ((v2299.canTrial == true) and v2300) then
                                                _K4F.v1472("TempleClock has no point and V4 is READY FOR TRIAL - stale lock cleared", "ready_for_next_trial")
                                                return false
                                            elseif ((v2299.complete == true) and v2300) then
                                                _K4F.v1472("TempleClock has no point and Race V4 is complete - stale lock cleared", "post_trial_v4_completed")
                                                return false
                                            elseif ((v2299.needsPurchase == true) and v2300) then
                                                _K4F.v1472("TempleClock has no point - handing control to the V4 purchase loop", "v4_upgrade_pending")
                                                return false
                                            end
                                        end
                                        status(((v2288 and "Both Help resetting together - waiting Main win point") or "Main kept alive - waiting TempleClock win point"))
                                        return true
                                    end
                                    v2289.mainWinnerPoint = true
                                    status("Main win point detected - claiming and upgrading gear")
                                    local v2301 = checkgear()
                                    if v2301 then
                                        return false
                                    end
                                    status("Main gear claim not verified - keeping Main alive and retrying")
                                    return true
                                end
                                K4_IsInsideFFAArena = function(v2302)
                                    local v2303 = workspace:FindFirstChild("Map")
                                    local v2304 = (v2303 and v2303:FindFirstChild("Temple of Time"))
                                    local v2305 = (v2304 and v2304:FindFirstChild("FFABorder"))
                                    local v2306 = (v2305 and v2305:FindFirstChild("Forcefield"))
                                    if ((((not v2302) or (not v2306)) or (not v2306:IsA("BasePart"))) or (v2306.Transparency ~= 0)) then
                                        return false
                                    end
                                    local v2307 = v2306.CFrame:PointToObjectSpace(v2302.Position)
                                    local v2308 = ((v2306.Size * 0.5) - Vector3.new(2, 2, 2))
                                    if (((v2308.X <= 0) or (v2308.Y <= 0)) or (v2308.Z <= 0)) then
                                        return false
                                    end
                                    if (math.abs(v2307.Y) > v2308.Y) then
                                        return false
                                    end
                                    return ((((v2307.X / v2308.X) ^ 2) + ((v2307.Z / v2308.Z) ^ 2)) < 1)
                                end
                                K4_FFAAttackStillValid = function()
                                    local v2309 = getgenv().K4FFACombat
                                    if (not v2309) then
                                        return true
                                    end
                                    local v2310 = v348.LocalPlayer.Character
                                    local v2311 = (v2310 and v2310:FindFirstChild("HumanoidRootPart"))
                                    local v2312 = (v2309.player and v2309.player.Character)
                                    local v2313 = (v2312 and v2312:FindFirstChild("HumanoidRootPart"))
                                    local v2314 = (v2312 and v2312:FindFirstChildOfClass("Humanoid"))
                                    return (((((v2312 == v2309.character) and v2314) and (v2314.Health > 0)) and K4_IsInsideFFAArena(v2311)) and K4_IsInsideFFAArena(v2313))
                                end
                                getgenv().K4_FFAAttackStillValid = K4_FFAAttackStillValid
                                K4_StopFFAPlayerAttack = function()
                                    local v2315 = getgenv().K4FFACombat
                                    if (not v2315) then
                                        return
                                    end
                                    getgenv().K4FFACombat = nil
                                    _G.SHOULDSPAMSKILLS = false
                                    getgenv().AimPos = nil
                                    v719.AutoClickEnabled = v2315.previousAutoClick
                                    v719.AttackPlayers = v2315.previousPlayers
                                    v719.AttackMobs = v2315.previousMobs
                                    pcall(K4_CancelTrialMovement)
                                end
                                K4_RunFFAPlayerAttack = function()
                                    if ((not v396) or (not K4_IsPostTrialFFAActive())) then
                                        K4_StopFFAPlayerAttack()
                                        return false
                                    end
                                    local v2316 = v348.LocalPlayer.Character
                                    local v2317 = (v2316 and v2316:FindFirstChildOfClass("Humanoid"))
                                    local v2318 = (v2316 and v2316:FindFirstChild("HumanoidRootPart"))
                                    if ((((not v2318) or (not v2317)) or (v2317.Health <= 0)) or (not K4_IsInsideFFAArena(v2318))) then
                                        K4_StopFFAPlayerAttack()
                                        return false
                                    end
                                    local v2319, v2320 = nil, math.huge
                                    for v2321, v2322 in ipairs(v348:GetPlayers()) do
                                        if (v2322 ~= v348.LocalPlayer) then
                                            local v2323 = v2322.Character
                                            local v2324 = (v2323 and v2323:FindFirstChildOfClass("Humanoid"))
                                            local v2325 = (v2323 and v2323:FindFirstChild("HumanoidRootPart"))
                                            if ((((v2325 and v2324) and (v2324.Health > 0)) and (not v2323:FindFirstChildOfClass("ForceField"))) and K4_IsInsideFFAArena(v2325)) then
                                                local v2326 = (v2318.Position - v2325.Position).Magnitude
                                                if ((v2326 < 350) and (v2326 < v2320)) then
                                                    v2319 = v2322
                                                    v2320 = v2326
                                                end
                                            end
                                        end
                                    end
                                    if (not v2319) then
                                        K4_StopFFAPlayerAttack()
                                        return false
                                    end
                                    local v2327 = getgenv().K4FFACombat
                                    if (not v2327) then
                                        v2327 = {
                                            previousAutoClick = v719.AutoClickEnabled,
                                            previousPlayers = v719.AttackPlayers,
                                            previousMobs = v719.AttackMobs,
                                            nextClick = 0,
                                            nextPvp = 0
                                        }
                                        getgenv().K4FFACombat = v2327
                                    end
                                    v719.AutoClickEnabled = true
                                    local v2328 = (v2319.Character and v2319.Character:FindFirstChild("HumanoidRootPart"))
                                    if (not v2328) then
                                        return true
                                    end
                                    v2327.target = v2319.Name
                                    v2327.player = v2319
                                    v2327.character = v2319.Character
                                    v719.AttackPlayers = true
                                    v719.AttackMobs = false
                                    if (not K4_FFAAttackStillValid()) then
                                        K4_StopFFAPlayerAttack()
                                        return false
                                    end
                                    getgenv().AimPos = v2328.CFrame
                                    _G.SHOULDSPAMSKILLS = (v2320 < 65)
                                    status(("Trial FFA: attacking " .. v2319.Name))
                                    if (tick() >= v2327.nextPvp) then
                                        v2327.nextPvp = (tick() + 5)
                                        pcall(function()
                                            v369:InvokeServer("EnablePvp")
                                        end)
                                    end
                                    pcall(function()
                                        v411:eq()
                                        v411:haki()
                                    end)
                                    local v2329 = (v2328.CFrame * CFrame.new(0, 3, 4))
                                    if K4_IsInsideFFAArena({ Position = v2329.Position }) then
                                        v590(v2329)
                                    end
                                    if (not K4_FFAAttackStillValid()) then
                                        K4_StopFFAPlayerAttack()
                                        return false
                                    end
                                    if ((v2320 < 65) and (type(getgenv().K4_AttackTarget) == "function")) then
                                        pcall(getgenv().K4_AttackTarget, v2327.character, 65)
                                    end
                                    if ((v2320 < 35) and (tick() >= v2327.nextClick)) then
                                        v2327.nextClick = (tick() + 0.2)
                                        pcall(function()
                                            local v2330 = game:GetService("VirtualUser")
                                            v2330:CaptureController()
                                            v2330:ClickButton1(Vector2.new())
                                        end)
                                    end
                                    return true
                                end
                                K4_RunPostTrialResetSequence = function()
                                    local v2331 = _G.K4PostTrialReset
                                    if (not v2331) then
                                        return false
                                    end
                                    local v2332 = K4_IsPostTrialFFAActive()
                                    if v2332 then
                                        v2331.ffaInactiveAt = 0
                                        if ((not v2331.ffaLatched) and (v2331.active ~= true)) then
                                            local v2333 = ((((v948 and (v948.assigned == true)) or (v966 == true)) or (_G.K4TrialLifecycle and (_G.K4TrialLifecycle.started == true))) or ((v2331.armed == true) and ((tick() - (tonumber(v2331.armedAt) or 0)) <= 300)))
                                            if v2333 then
                                                K4_BeginPostTrialResetSequence()
                                            end
                                        end
                                    elseif v2331.ffaLatched then
                                        if (v2331.ffaInactiveAt <= 0) then
                                            v2331.ffaInactiveAt = tick()
                                        end
                                        if ((tick() - v2331.ffaInactiveAt) >= 1.5) then
                                            v2331.ffaLatched = false
                                        end
                                    end
                                    if (((v2332 and v396) and (v2331.mainWinnerPoint ~= true)) and (v2331.mainGearClaimed ~= true)) then
                                        if K4_RunFFAPlayerAttack() then
                                            return true
                                        end
                                    else
                                        K4_StopFFAPlayerAttack()
                                    end
                                    if (v2331.active ~= true) then
                                        if ((v2331.completed == true) and ((tick() - (tonumber(v2331.completedAt) or 0)) < 2)) then
                                            return true
                                        end
                                        return false
                                    end
                                    if v395 then
                                        return K4_RunHelpPostTrialReset()
                                    end
                                    if v396 then
                                        return K4_RunMainPostTrialReset(v2332)
                                    end
                                    return false
                                end
                                task.spawn(function()
                                    while task.wait(0.1) do
                                        if ((not v396) and (not v395)) then
                                            status("Set Main or Help = true")
                                            task.wait(2)
                                            continue
                                        end
                                        if v396 then
                                            local v2334 = K4_ReadRaceLevel(false)
                                            if (((not v2334) or (v2334 < 3)) or (getgenv().K4RaceUpgrade and getgenv().K4RaceUpgrade.active)) then
                                                task.wait(1)
                                                continue
                                            end
                                        end
                                        if (v396 and K4_RunCaptureGear()) then
                                            task.wait(0.1)
                                            continue
                                        end
                                        if K4_RunPostTrialResetSequence() then
                                            task.wait(0.1)
                                            continue
                                        end
                                        if K4CakeFarm.Step() then
                                            task.wait(0.5)
                                            continue
                                        end
                                        if ((not v948) or (not v948.assigned)) then
                                            local v2335 = ((v396 and v948) and ((v948.lobby_waiting == true) or (tostring((v948.waiting_reason or "")) == "waiting_for_free_hub_slot")))
                                            if (v2335 and K4TyrantFarmController.IsActive()) then
                                                task.wait(0.8)
                                            elseif v2335 then
                                                K4_RunWaitingMainTrainingOrLobby()
                                                task.wait(0.2)
                                            elseif ((v395 and v948) and v948.hub_available) then
                                                if ((tostring((v948.target_job_id or "")) ~= "") and (tostring(v948.target_job_id) ~= tostring(game.JobId))) then
                                                    status("Help moving to shared Full Moon hub")
                                                elseif v948.hub_ready then
                                                    status("Help holding Full Moon hub - waiting next Main")
                                                else
                                                    status("Help waiting second Help in Full Moon hub")
                                                end
                                                task.wait(0.5)
                                            elseif v395 then
                                                local v2336 = (_G.K4MoonHub.candidate or _K4MoonHubFetchCandidate(false))
                                                if _K4MoonHubFullMoonNight() then
                                                    status("Help holding Full Moon server - waiting shared hub")
                                                elseif v2336 then
                                                    status(string.format("Help found Full Moon: %d players | Place %s | joining...", (v2336.players or 0), tostring((v2336.placeid or "?"))))
                                                else
                                                    status(("Help searching Full Moon API | " .. (tostring((_G.K4MoonHub.lastApiError or "unknown")) .. (" | API=" .. (tostring((_G.K4MoonHub.lastApiCount or 0)) .. (" eligible=" .. (tostring((_G.K4MoonHub.lastEligibleCount or 0)) .. (" | Place=" .. tostring(game.PlaceId)))))))))
                                                end
                                                task.wait(0.5)
                                            else
                                                _K4F.v2229()
                                                task.wait(0.2)
                                            end
                                            continue
                                        end
                                        if (v395 and _K4MoonHubDriveHelpPriority()) then
                                            task.wait(0.5)
                                            continue
                                        end
                                        if ((v396 and v948.main_job_id) and (v948.main_job_id ~= game.JobId)) then
                                            local v2337 = true
                                            local v2338, v2339 = pcall(function()
                                                return getV4Status(false)
                                            end)
                                            if (((v2338 and v2339) and (v2339.needsTraining == true)) and (not v2339.canTrial)) then
                                                v2337 = false
                                            end
                                            if v2337 then
                                                local v2340 = tostring(v948.main_job_id)
                                                local v2341 = (tonumber(((v948.main_place_id or v948.hub_place_id) or v948.target_place_id)) or game.PlaceId)
                                                status(("Main joining selected Full Moon hub | " .. v2340:sub(1, 18)))
                                                if ((tick() - (_G._lastMainHubHopAt or 0)) >= 4) then
                                                    _G._lastMainHubHopAt = tick()
                                                    _K4MoonHubTeleport(v2340, "main_join_hub", v2341)
                                                end
                                                task.wait(1)
                                                continue
                                            end
                                        end
                                        if (v396 and (not isMyUpgearTurn())) then
                                            pcall(K4_HoldWaitingMainAtLobby)
                                            status(("Main locked at lobby | Waiting turn | Active: " .. tostring((v948.active_main or "?"))))
                                            task.wait(0.5)
                                            continue
                                        end
                                        local v2342 = getV4Status(false)
                                        local v2343 = nil
                                        if v395 then
                                            pcall(function()
                                                v2343 = checkbackpack(v595[v348.LocalPlayer.Data.Race.Value])
                                            end)
                                        end
                                        local v2344 = ((v2342.canTrial == true) or (v395 and (((v2342.complete == true) or (v2343 ~= nil)) or _K4MoonHubHelperRaceUnlocked())))
                                        local v2345 = (v2342.remainingTraining or ((v2342.needsTraining and "training") or v2342.key))
                                        if (v396 and isMyUpgearTurn()) then
                                            local v2346 = _K4F.v1648()
                                            local v2347 = false
                                            pcall(function()
                                                v2347 = (workspace.Map["Temple of Time"].FFABorder.Forcefield.Transparency == 0)
                                            end)
                                            local v2348 = (((tostring((v952 or "")) ~= "") or (tostring((v951 or "")) ~= "")) or ((tonumber(v967) or 0) > 0))
                                            if (v2346 or (v2347 and v2348)) then
                                                v966 = true
                                                _G.K4TrialLifecycle.started = true
                                                if (_G.K4TrialLifecycle.startedAt <= 0) then
                                                    _G.K4TrialLifecycle.startedAt = tick()
                                                end
                                                _G.K4TrialLifecycle.lastActiveAt = tick()
                                                _G.K4TrialLifecycle.groupId = _K4F.v1705()
                                            end
                                        end
                                        if (not v2344) then
                                            v957 = 0
                                            v958 = 0
                                            local v2349 = (((v966 or (v967 > 0)) or (v952 ~= "")) or _K4F.v1648())
                                            local v2350 = ((v2342.needsTraining == true) or (v2342.needsPurchase == true))
                                            if (((((v990 and v396) and isMyUpgearTurn()) and v2349) and v2350) and (not _K4TrialCycleIsActive())) then
                                                v966 = true
                                                if _G.K4TrialLifecycle.endMoonPending then
                                                    status("Trial completed after End Moon - releasing pair, Help will find next Full Moon")
                                                else
                                                    status("Trial completed - releasing pair for next Main")
                                                end
                                                _K4F.v1358("trial_completed")
                                                task.wait(1)
                                                continue
                                            end
                                            if v2342.complete then
                                                if K4TyrantFarmController.IsActive() then
                                                    K4TyrantFarmController.Stop()
                                                end
                                                if _K4TrialCycleIsActive() then
                                                    status("Race V4 completed - waiting for current Trial to fully finish")
                                                else
                                                    status("Paired account has completed Race V4")
                                                    if (v396 and isMyUpgearTurn()) then
                                                        _K4F.v1358("race_v4_completed")
                                                    end
                                                end
                                                task.wait(1)
                                            elseif (v2342.needsPurchase and (not v395)) then
                                                _K4F.v2161(v2342, "Main")
                                                task.wait(0.2)
                                            elseif (v395 and (getgenv().Config["Help Training"] ~= true)) then
                                                if K4TyrantFarmController.IsActive() then
                                                    K4TyrantFarmController.Stop()
                                                end
                                                v719.AutoClickEnabled = false
                                                status("Help support mode - no training | waiting Full Moon Trial")
                                                task.wait(0.8)
                                            else
                                                if K4TyrantFarmController.IsActive() then
                                                    K4TyrantFarmController.Stop()
                                                end
                                                status("Paired but not trial-ready - continue training")
                                                _K4F.v2168(v2345, ((v396 and "Main") or "Help"))
                                                task.wait(0.2)
                                            end
                                            continue
                                        end
                                        local v2351 = (isnight() and isfullmoon())
                                        local v2352 = _K4TrialCycleIsActive()
                                        if ((not v2351) and (not v2352)) then
                                            v957 = 0
                                            v958 = 0
                                            if ((v396 and isMyUpgearTurn()) and v989) then
                                                status("Keeping Main turn - waiting for Help to select the next Full Moon hub")
                                            elseif _K4MoonHubMoonEnded() then
                                                if (v396 and isMyUpgearTurn()) then
                                                    _K4F.v1358("full_moon_ended_before_trial")
                                                else
                                                    status("Full Moon ended before Trial - Help selecting next server")
                                                end
                                            elseif v989 then
                                                status("Trial-ready pair locked until this Trial is completed")
                                            elseif (((v396 and isMyUpgearTurn()) and (v955 > 0)) and ((tick() - v955) > 8)) then
                                                _K4F.v1358("full_moon_ended_before_trial")
                                            else
                                                status("Trial-ready pair reserved - waiting Full Moon")
                                            end
                                            task.wait(1)
                                            continue
                                        elseif ((not v2351) and v2352) then
                                            _K4TrialCycleDeferMoonEnd((_G.K4MoonHub.endReason or "moon_ended_during_trial"))
                                            status("Full Moon ended - finishing current Trial before any hop")
                                        end
                                        if K4TyrantFarmController.IsActive() then
                                            K4TyrantFarmController.Stop()
                                        end
                                        if ((v956 > 0) and (v957 <= 0)) then
                                            v957 = tick()
                                            v958 = 0
                                        end
                                        _K4F.v1683()
                                        if ((v396 and isMyUpgearTurn()) and (v957 > 0)) then
                                            local v2353 = math.max(v957, (v964 or 0))
                                            if ((tick() - v2353) > v987) then
                                                local v2354 = 0
                                                pcall(function()
                                                    v2354 = select(1, _K4F.v1752())
                                                end)
                                                if (v2354 > v958) then
                                                    v958 = v2354
                                                    v957 = tick()
                                                elseif ((v2354 < 3) and (not _K4F.v1648())) then
                                                    if v989 then
                                                        v957 = tick()
                                                        v964 = tick()
                                                        v965 = math.huge
                                                        v946 = false
                                                        status("Temple ready timeout - keeping pair until Trial completes")
                                                    else
                                                        _K4F.v1358("temple_ready_timeout")
                                                        task.wait(1)
                                                        continue
                                                    end
                                                end
                                            end
                                        end
                                        local v2355 = ((type(_K4TrialCycleIsActive) == "function") and (_K4TrialCycleIsActive() == true))
                                        local v2356, v2357 = true, v2355
                                        if (not v2355) then
                                            v2356, v2357 = K4_CheckTempleDoorCached()
                                        end
                                        v2355 = (v2355 or (v2356 and (v2357 == true)))
                                        if (not v2355) then
                                            status(((v2356 and "Temple door is not available yet") or "CheckTempleDoor remote failed"))
                                            task.wait(0.5)
                                        else
                                            if (not workspace.Map:FindFirstChild("Temple of Time")) then
                                                local v2358 = v349.MapStash:FindFirstChild("Temple of Time")
                                                if v2358 then
                                                    v2358.Parent = workspace.Map
                                                end
                                            elseif (workspace.Map["Temple of Time"].FFABorder.Forcefield.Transparency == 0) then
                                                K4_RunPostTrialResetSequence()
                                                task.wait(0.1)
                                            else
                                                local v2359
                                                if v596[v348.LocalPlayer.Data.Race.Value] then
                                                    v2359 = v596[v348.LocalPlayer.Data.Race.Value]
                                                end
                                                if (v2359 and (getdis(v2359.CFrame) < 1500)) then
                                                    status("Doing trial")
                                                    local v2360 = v348.LocalPlayer.Data.Race.Value
                                                    if (v2360 == "Mink") then
                                                        v590((workspace.Map.MinkTrial.Ceiling.CFrame * CFrame.new(0, (-20), 0)))
                                                    elseif (v2360 == "Skypiea") then
                                                        pcall(function()
                                                            v590(workspace.Map.SkyTrial.Model.FinishPart.CFrame)
                                                        end)
                                                    elseif (v2360 == "Cyborg") then
                                                        pcall(function()
                                                            v590((workspace.Map.CyborgTrial.Floor.CFrame * CFrame.new(0, 500, 0)))
                                                        end)
                                                    elseif ((v2360 == "Human") or (v2360 == "Ghoul")) then
                                                        local v2361 = v719.AttackDistance
                                                        local v2362 = v719.AttackPlayers
                                                        local v2363 = v719.AttackMobs
                                                        local v2364 = v719.BringMobs
                                                        local v2365 = v719.PreGrabDistance
                                                        local v2366 = v719.AutoClickEnabled
                                                        v719.AttackDistance = 240
                                                        v719.AttackPlayers = false
                                                        v719.AttackMobs = true
                                                        v719.BringMobs = false
                                                        v719.PreGrabDistance = 650
                                                        v719.AutoClickEnabled = true
                                                        for v2367, v2368 in pairs(workspace.Enemies:GetChildren()) do
                                                            if ((v2368:FindFirstChild("HumanoidRootPart") and v2368:FindFirstChild("Humanoid")) and (v2368.Humanoid.Health > 0)) then
                                                                if (getdis(v2368.HumanoidRootPart.CFrame, v2359.CFrame) < 1500) then
                                                                    K4_TryTrialKillAura(v2368)
                                                                    repeat
                                                                        task.wait()
                                                                        if (((not v2368.Parent) or (not v2368:FindFirstChild("Humanoid"))) or (v2368.Humanoid.Health <= 0)) then
                                                                            break
                                                                        end
                                                                        local v2369 = v348.LocalPlayer.Character
                                                                        local v2370 = (v2369 and v2369:FindFirstChildOfClass("Humanoid"))
                                                                        local v2371 = (v2369 and v2369:FindFirstChild("HumanoidRootPart"))
                                                                        if ((((not v2371) or (not v2370)) or (v2370.Health <= 0)) or (getdis(v2359.CFrame) >= 1500)) then
                                                                            break
                                                                        end
                                                                        if K4_TryTrialKillAura(v2368) then
                                                                            break
                                                                        end
                                                                        v411:eq()
                                                                        v411:haki()
                                                                        pcall(function()
                                                                            local v2372 = v348.LocalPlayer.Character
                                                                            local v2373 = (v2372 and v2372:FindFirstChild("HumanoidRootPart"))
                                                                            local v2374 = (v2372 and v2372:FindFirstChildOfClass("Humanoid"))
                                                                            local v2375 = v2368:FindFirstChild("HumanoidRootPart")
                                                                            if (((((v2373 and v2374) and (v2374.Health > 0)) and v2375) and ((v2373.Position - v2375.Position).Magnitude <= 260)) and (os.clock() >= (getgenv().K4_TrialNextClick or 0))) then
                                                                                getgenv().K4_TrialNextClick = (os.clock() + 0.15)
                                                                                local v2376 = game:GetService("VirtualUser")
                                                                                v2376:CaptureController()
                                                                                v2376:ClickButton1(Vector2.new())
                                                                            end
                                                                        end)
                                                                        pcall(function()
                                                                            v590((v2368:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 18, 0)))
                                                                        end)
                                                                        pcall(function()
                                                                            if (type(getgenv().K4_AttackTarget) == "function") then
                                                                                getgenv().K4_AttackTarget(v2368, 260)
                                                                            elseif (type(getgenv().Attack) == "function") then
                                                                                getgenv().Attack()
                                                                            end
                                                                        end)
                                                                    until ((((not v2368) or (not v2368:FindFirstChild("HumanoidRootPart"))) or (not v2368:FindFirstChild("Humanoid"))) or (v2368.Humanoid.Health <= 0))
                                                                end
                                                            end
                                                        end
                                                        v719.AttackDistance = v2361
                                                        v719.AttackPlayers = v2362
                                                        v719.AttackMobs = v2363
                                                        v719.BringMobs = v2364
                                                        v719.PreGrabDistance = v2365
                                                        v719.AutoClickEnabled = v2366
                                                    elseif (v2360 == "Fishman") then
                                                        getgenv().AimPos = nil
                                                        _G.SHOULDSPAMSKILLS = false
                                                        local v2377 = v348.LocalPlayer.Character
                                                        local v2378 = workspace:FindFirstChild("_WorldOrigin")
                                                        local v2379 = (v2378 and v2378:FindFirstChild("Locations"))
                                                        local v2380 = (v2379 and v2379:FindFirstChild("Trial of Water"))
                                                        local v2381 = workspace:FindFirstChild("Map")
                                                        local v2382 = (v2377 and v2377:FindFirstChild("HumanoidRootPart"))
                                                        local v2383 = ((v2380 and v2382) and ((v2382.Position - v2380.Position).Magnitude < 1500))
                                                        local function v2384()
                                                            local v2385 = v348.LocalPlayer.Character
                                                            local v2386 = (v2385 and v2385:FindFirstChildOfClass("Humanoid"))
                                                            local v2387 = (v2385 and v2385:FindFirstChild("HumanoidRootPart"))
                                                            if ((((v2385 ~= v2377) or (not v2386)) or (v2386.Health <= 0)) or (not v2387)) then
                                                                return false
                                                            end
                                                            if (v348.LocalPlayer.Data.Race.Value ~= "Fishman") then
                                                                return false
                                                            end
                                                            if ((((not v2383) or (not v2380)) or (not v2380.Parent)) or ((v2387.Position - v2380.Position).Magnitude > 1000)) then
                                                                return false
                                                            end
                                                            local v2388 = v348.LocalPlayer:FindFirstChild("PlayerGui")
                                                            local v2389 = (v2388 and v2388:FindFirstChild("Main"))
                                                            local v2390 = (v2389 and v2389:FindFirstChild("TopHUDList"))
                                                            local v2391 = (v2390 and v2390:FindFirstChild("RaidTimer"))
                                                            if (v2391 and (not v2391.Visible)) then
                                                                return false
                                                            end
                                                            local v2392 = workspace:FindFirstChild("Map")
                                                            local v2393 = (v2392 and v2392:FindFirstChild("Temple of Time"))
                                                            local v2394 = (v2393 and v2393:FindFirstChild("FFABorder"))
                                                            local v2395 = (v2394 and v2394:FindFirstChild("Forcefield"))
                                                            if (v2395 and (v2395.Transparency == 0)) then
                                                                return false
                                                            end
                                                            return (_K4TrialCycleIsActive() == true)
                                                        end
                                                        local function v2396(v2397)
                                                            if (((not v2383) or (not v2381)) or (not v2381:FindFirstChild("FishmanTrial"))) then
                                                                return nil
                                                            end
                                                            if (((not v2397) or (not v2397.Parent)) or (not v2397.Name:find("SeaBeast", 1, true))) then
                                                                return nil
                                                            end
                                                            local v2398 = v2397:FindFirstChild("HumanoidRootPart")
                                                            local v2399 = v2397:FindFirstChild("Health")
                                                            if (((((not v2398) or (not v2398:IsA("BasePart"))) or (not v2399)) or (not (v2399:IsA("NumberValue") or v2399:IsA("IntValue")))) or (v2399.Value <= 0)) then
                                                                return nil
                                                            end
                                                            if ((v2398.Position - v2380.Position).Magnitude > 1500) then
                                                                return nil
                                                            end
                                                            return v2398, v2399
                                                        end
                                                        local v2400 = workspace:FindFirstChild("SeaBeasts")
                                                        local v2401 = (v2377 and v2377:FindFirstChild("HumanoidRootPart"))
                                                        local v2402, v2403 = nil, math.huge
                                                        if (v2400 and v2401) then
                                                            for v2404, v2405 in ipairs(v2400:GetChildren()) do
                                                                local v2406 = v2396(v2405)
                                                                if v2406 then
                                                                    local v2407 = (v2406.Position - v2401.Position).Magnitude
                                                                    if (v2407 < v2403) then
                                                                        v2402, v2403 = v2405, v2407
                                                                    end
                                                                end
                                                            end
                                                        end
                                                        if v2402 then
                                                            local v2408 = { Active = true, Target = v2402, StartedAt = os.clock() }
                                                            getgenv().K4_SharkTrialState = v2408
                                                            local v2412, v2413 = pcall(function()
                                                                while (v2384() and ((os.clock() - v2408.StartedAt) < 120)) do
                                                                    local v2409 = v2396(v2402)
                                                                    if (not v2409) then
                                                                        break
                                                                    end
                                                                    local v2410 = v2377:FindFirstChild("HumanoidRootPart")
                                                                    if (math.abs((v2409.Position.Y + 60)) <= 175) then
                                                                        v2408.Goal = (v2409.CFrame * CFrame.new(0, 200, 50))
                                                                    else
                                                                        v2408.Goal = CFrame.new(v2409.Position.X, 140, v2409.Position.Z)
                                                                    end
                                                                    local v2411 = (v2408.Goal.Position - v2410.Position).Magnitude
                                                                    v2408.Distance = v2411
                                                                    getgenv().AimPos = CFrame.new(v2409.Position.X, 40, v2409.Position.Z)
                                                                    _G.SHOULDSPAMSKILLS = ((v2410.Position - v2409.Position).Magnitude < 400)
                                                                    if (v2411 > 10) then
                                                                        v411:topos(v2408.Goal)
                                                                    elseif v427 then
                                                                        pcall(function()
                                                                            v427:Cancel()
                                                                        end)
                                                                    end
                                                                    status(("Shark trial | " .. (v2402.Name .. (" | " .. (math.floor((v2410.Position - v2409.Position).Magnitude) .. " studs")))))
                                                                    task.wait(0.1)
                                                                end
                                                            end)
                                                            v2408.Active = false
                                                            getgenv().AimPos = nil
                                                            _G.SHOULDSPAMSKILLS = false
                                                            pcall(K4_CancelTrialMovement)
                                                            if (not v2412) then
                                                                v2408.Error = tostring(v2413)
                                                                warn(("[K4 Shark Trial] " .. tostring(v2413)))
                                                            end
                                                        else
                                                            pcall(K4_CancelTrialMovement)
                                                            status("Shark trial | waiting for trial Sea Beast")
                                                        end
                                                    end
                                                else
                                                    if (v348.LocalPlayer.PlayerGui.Main.Timer.Visible == false) then
                                                        local v2414, v2415 = _K4F.v1669()
                                                        if v2414 then
                                                            status(string.format("At race door - waiting (%.0f studs)", v2415))
                                                            if trialable() then
                                                                if v396 then
                                                                    if isMyUpgearTurn() then
                                                                        v946 = true
                                                                        status("Ready trials")
                                                                    else
                                                                        v946 = false
                                                                        status("Waiting my turn")
                                                                        task.wait(1)
                                                                    end
                                                                elseif v395 then
                                                                    v946 = true
                                                                    status("Helper ready")
                                                                end
                                                            elseif (v396 and (not isMyUpgearTurn())) then
                                                                status("Waiting turn")
                                                                task.wait(1)
                                                            end
                                                        else
                                                            if (v2415 == math.huge) then
                                                                status("Waiting race door to stream")
                                                            elseif (v2415 >= 3000) then
                                                                status("Entering Temple of Time")
                                                            else
                                                                status(string.format("Moving to race door (%.0f studs)", v2415))
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                            if tryActivateAbility() then
                                                task.wait(0.2)
                                            end
                                        end
                                    end
                                end)
                                local v2416 = {
                                    ["Buddha-Buddha"] = true,
                                    ["T-Rex-T-Rex"] = true,
                                    ["Dragon-Dragon"] = true,
                                    ["Yeti-Yeti"] = true,
                                    ["Leopard-Leopard"] = true,
                                    ["Venom-Venom"] = true,
                                    ["Phoenix-Phoenix"] = true,
                                    ["Kitsune-Kitsune"] = true,
                                    ["Mammoth-Mammoth"] = true,
                                    ["Gas-Gas"] = true,
                                    ["Portal-Portal"] = true
                                }
                                local v2417 = { Melee = true, ["Blox Fruit"] = true, Sword = true, Gun = true }
                                local v2418 = {
                                    Z = true,
                                    X = true,
                                    C = true,
                                    V = true,
                                    F = true
                                }
                                getallweapon = function()
                                    local v2419 = {}
                                    for v2420, v2421 in pairs(v348.LocalPlayer.Backpack:GetChildren()) do
                                        if (v2421:IsA("Tool") and v2417[v2421.ToolTip]) then
                                            table.insert(v2419, v2421)
                                        end
                                    end
                                    for v2422, v2423 in pairs(v348.LocalPlayer.Character:GetChildren()) do
                                        if (v2423:IsA("Tool") and v2417[v2423.ToolTip]) then
                                            table.insert(v2419, v2423)
                                        end
                                    end
                                    return v2419
                                end
                                EquipTool = function(v2424)
                                    local v2425 = v348.LocalPlayer.Backpack:FindFirstChild(v2424)
                                    if v2425 then
                                        v348.LocalPlayer.Character.Humanoid:EquipTool(v2425)
                                    end
                                end
                                _G.SHOULDSPAMSKILLS = false
                                task.spawn(function()
                                    while task.wait(0.1) do
                                        if (_G.SHOULDSPAMSKILLS and (not K4_FFAAttackStillValid())) then
                                            K4_StopFFAPlayerAttack()
                                        end
                                        if _G.SHOULDSPAMSKILLS then
                                            local v2426 = getallweapon()
                                            for v2427, v2428 in pairs(v2426) do
                                                if (not v348.LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(v2428.Name)) then
                                                    EquipTool(v2428.Name)
                                                end
                                            end
                                            for v2429, v2430 in pairs(v2426) do
                                                if ((not _G.SHOULDSPAMSKILLS) or (not K4_FFAAttackStillValid())) then
                                                    break
                                                end
                                                if (v2430.Parent ~= v348.LocalPlayer.Character) then
                                                    EquipTool(v2430.Name)
                                                end
                                                local v2431 = v348.LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(v2430.Name)
                                                if v2431 then
                                                    for v2432, v2433 in pairs(v2431:GetChildren()) do
                                                        if ((not _G.SHOULDSPAMSKILLS) or (not K4_FFAAttackStillValid())) then
                                                            break
                                                        end
                                                        if v2418[v2433.Name] then
                                                            local v2434 = v2433:WaitForChild("Cooldown")
                                                            local v2435 = v2433:WaitForChild("Title")
                                                            if ((v2435.TextColor3 == Color3.new(1, 1, 1)) or (v2435.TextColor3 == Color3.fromRGB(255, 255, 255))) then
                                                                if (v2434.Size == UDim2.new(0, 0, 1, (-1))) then
                                                                    if (v2433.Name == "V") then
                                                                        if (not v2416[v2431.Name]) then
                                                                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                                                                            task.wait(0.1)
                                                                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                                                                            task.wait(1.5)
                                                                        end
                                                                    else
                                                                        game:GetService("VirtualInputManager"):SendKeyEvent(true, v2433.Name, false, game)
                                                                        task.wait(0.1)
                                                                        game:GetService("VirtualInputManager"):SendKeyEvent(false, v2433.Name, false, game)
                                                                        task.wait(1.5)
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
                                local v2436 = v348.LocalPlayer
                                function _K4F.v2437(v2438)
                                    if (not v2438) then
                                        return false
                                    end
                                    local v2439 = v2438:FindFirstChild("Humanoid")
                                    return (v2439 and (v2439.Health > 0))
                                end
                                _G[v348.LocalPlayer.Name] = true
                                getgenv().UseSeaUi = true
                                local v2453 = nil
                                K4_FormatNumber = function(v2454)
                                    local v2455 = tostring(math.floor((tonumber(v2454) or 0)))
                                    while true do
                                        local v2456, v2457 = v2455:gsub("^(-?%d+)(%d%d%d)", "%1,%2")
                                        v2455 = v2456
                                        if (v2457 == 0) then
                                            break
                                        end
                                    end
                                    return v2455
                                end
                                status = function(v2458)
                                    local v2459 = tostring((v2458 or "idle"))
                                    if (v954 == v2459) then
                                        return
                                    end
                                    v954 = v2459
                                    if v2453 then
                                        v2453.Text = v954
                                    end
                                end
                                function _K4F.v2460()
                                    local v2461 = game:GetService("Players")
                                    local v2462 = game:GetService("TweenService")
                                    local v2463 = game:GetService("RunService")
                                    local v2464 = v2461.LocalPlayer
                                    local v2465 = "KaitunV4_TestUI"
                                    local v2466 = v2464:WaitForChild("PlayerGui")
                                    local v2467, v2468 = pcall(function()
                                        return gethui()
                                    end)
                                    if (v2467 and v2468) then
                                        v2466 = v2468
                                    end
                                    if v2466:FindFirstChild(v2465) then
                                        v2466[v2465]:Destroy()
                                    end
                                    local v2469 = Instance.new("ScreenGui")
                                    v2469.Name = v2465
                                    v2469.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                                    v2469.Parent = v2466
                                    local v2470 = Color3.fromRGB(255, 255, 255)
                                    local v2471 = 0.7
                                    local v2472 = Color3.fromRGB(70, 130, 255)
                                    local v2473 = Color3.fromRGB(30, 30, 35)
                                    local v2474 = Color3.fromRGB(110, 110, 120)
                                    local v2475 = Color3.fromRGB(200, 200, 210)
                                    local v2476 = Instance.new("Frame")
                                    v2476.Size = UDim2.new(0, 0, 0, 46)
                                    v2476.Position = UDim2.new(0.5, 0, 0, 20)
                                    v2476.AnchorPoint = Vector2.new(0.5, 0)
                                    v2476.AutomaticSize = Enum.AutomaticSize.X
                                    local v2477 = Instance.new("UIPadding", v2476)
                                    v2477.PaddingRight = UDim.new(0, 25)
                                    v2476.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
                                    v2476.BackgroundTransparency = 0.15
                                    v2476.ZIndex = 20
                                    Instance.new("UICorner", v2476).CornerRadius = UDim.new(1, 0)
                                    v2476.Parent = v2469
                                    local v2478 = Instance.new("UIStroke", v2476)
                                    v2478.Color = Color3.fromRGB(255, 255, 255)
                                    v2478.Thickness = 1.5
                                    v2478.Transparency = 0.2
                                    local v2479 = Instance.new("UIGradient", v2478)
                                    v2479.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 130, 255)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 130, 255)) })
                                    local v2480 = Instance.new("Frame", v2476)
                                    v2480.Size = UDim2.new(0, 20, 0, 20)
                                    v2480.Position = UDim2.new(0, 20, 0.5, (-10))
                                    v2480.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                    Instance.new("UICorner", v2480).CornerRadius = UDim.new(1, 0)
                                    local v2481 = Instance.new("UIGradient", v2480)
                                    v2481.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v2472), ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 25)) })
                                    local v2482 = Instance.new("TextLabel", v2476)
                                    v2482.Size = UDim2.new(0, 0, 1, 0)
                                    v2482.Position = UDim2.new(0, 50, 0, 0)
                                    v2482.AutomaticSize = Enum.AutomaticSize.X
                                    v2482.BackgroundTransparency = 1
                                    v2482.Text = (v954 or "Target...")
                                    v2482.TextColor3 = Color3.fromRGB(240, 240, 245)
                                    v2482.Font = Enum.Font.Code
                                    v2482.TextSize = 16
                                    v2482.TextXAlignment = Enum.TextXAlignment.Left
                                    v2482.Parent = v2476
                                    local v2483 = 0
                                    if (not (getgenv().K4FPSBoost and getgenv().K4FPSBoost.enabled)) then
                                        local v2484
                                        v2484 = v2463.RenderStepped:Connect(function(v2485)
                                            if (not v2469.Parent) then
                                                v2484:Disconnect()
                                                return
                                            end
                                            v2483 = ((v2483 + (v2485 * 100)) % 360)
                                            v2479.Rotation = v2483
                                            v2481.Rotation = (v2483 * 3)
                                        end)
                                    end
                                    local v2486 = Instance.new("ImageButton")
                                    v2486.Name = "ToggleButton"
                                    v2486.Size = UDim2.new(0, 56, 0, 56)
                                    v2486.Position = UDim2.new(0, 20, 0.25, (-28))
                                    v2486.BackgroundColor3 = v2470
                                    v2486.BackgroundTransparency = 0.3
                                    v2486.Image = "rbxassetid://75790154306661"
                                    v2486.ZIndex = 10
                                    Instance.new("UICorner", v2486).CornerRadius = UDim.new(1, 0)
                                    local v2487 = Instance.new("UIStroke", v2486)
                                    v2487.Color = v2472
                                    v2487.Thickness = 2
                                    v2487.Transparency = 0.3
                                    v2486.Parent = v2469
                                    local v2488 = Instance.new("Frame")
                                    v2488.Size = UDim2.new(0, 56, 0, 0)
                                    v2488.Position = UDim2.new(0, 20, 0.25, 40)
                                    v2488.BackgroundColor3 = v2470
                                    v2488.BackgroundTransparency = v2471
                                    v2488.ClipsDescendants = true
                                    v2488.ZIndex = 9
                                    Instance.new("UICorner", v2488).CornerRadius = UDim.new(1, 0)
                                    local v2489 = Instance.new("UIStroke", v2488)
                                    v2489.Color = v2475
                                    v2489.Transparency = 0.5
                                    v2488.Parent = v2469
                                    local v2490 = Instance.new("UIListLayout", v2488)
                                    v2490.Padding = UDim.new(0, 15)
                                    v2490.HorizontalAlignment = Enum.HorizontalAlignment.Center
                                    v2490.VerticalAlignment = Enum.VerticalAlignment.Center
                                    local v2491 = Instance.new("UIPadding", v2488)
                                    v2491.PaddingTop = UDim.new(0, 12)
                                    v2491.PaddingBottom = UDim.new(0, 12)
                                    local function v2492(v2493)
                                        local v2494 = Instance.new("ImageButton")
                                        v2494.Size = UDim2.new(0, 34, 0, 34)
                                        v2494.BackgroundTransparency = 1
                                        v2494.Image = ("rbxassetid://" .. v2493)
                                        v2494.ImageColor3 = v2474
                                        v2494.ZIndex = 10
                                        v2494.Parent = v2488
                                        return v2494
                                    end
                                    local v2495 = v2492("3926305904")
                                    local v2496 = v2492("3926307971")
                                    local v2497 = Instance.new("Frame")
                                    v2497.Size = UDim2.new(0, 320, 0, 350)
                                    v2497.Position = UDim2.new(0, 95, 0.25, (-28))
                                    v2497.BackgroundTransparency = 1
                                    v2497.ZIndex = 8
                                    v2497.Parent = v2469
                                    local function v2498(v2499)
                                        local v2500 = Instance.new("Frame")
                                        v2500.Name = v2499
                                        v2500.Size = UDim2.new(1, 0, 1, 0)
                                        v2500.Position = UDim2.new(0, (-20), 0, 0)
                                        v2500.BackgroundColor3 = v2470
                                        v2500.BackgroundTransparency = v2471
                                        v2500.Visible = false
                                        v2500.ZIndex = 8
                                        Instance.new("UICorner", v2500).CornerRadius = UDim.new(0, 16)
                                        local v2501 = Instance.new("UIStroke", v2500)
                                        v2501.Color = v2475
                                        v2501.Transparency = 0.3
                                        v2501.Thickness = 1.5
                                        local v2502 = Instance.new("UIListLayout", v2500)
                                        v2502.Padding = UDim.new(0, 0)
                                        v2502.HorizontalAlignment = Enum.HorizontalAlignment.Center
                                        local v2503 = Instance.new("UIPadding", v2500)
                                        v2503.PaddingTop = UDim.new(0, 15)
                                        v2503.PaddingBottom = UDim.new(0, 15)
                                        v2500.Parent = v2497
                                        return v2500
                                    end
                                    local v2504 = v2498("Status")
                                    local v2505 = v2498("Shop")
                                    local v2506 = Instance.new("ScrollingFrame")
                                    v2506.Size = UDim2.new(1, 0, 1, 0)
                                    v2506.BackgroundTransparency = 1
                                    v2506.ScrollBarThickness = 2
                                    v2506.ScrollBarImageColor3 = v2472
                                    v2506.ScrollBarImageTransparency = 0.5
                                    v2506.BorderSizePixel = 0
                                    v2506.Parent = v2504
                                    local v2507 = Instance.new("UIListLayout")
                                    v2507.Padding = UDim.new(0, 0)
                                    v2507.HorizontalAlignment = Enum.HorizontalAlignment.Center
                                    v2507.SortOrder = Enum.SortOrder.LayoutOrder
                                    v2507.Parent = v2506
                                    local v2508 = Instance.new("UIPadding")
                                    v2508.PaddingTop = UDim.new(0, 5)
                                    v2508.PaddingBottom = UDim.new(0, 10)
                                    v2508.Parent = v2506
                                    local function v2509(v2510, v2511, v2512)
                                        local v2513 = Instance.new("Frame")
                                        v2513.Size = UDim2.new(1, 0, 0, 22)
                                        v2513.BackgroundTransparency = 1
                                        local v2514 = Instance.new("TextLabel", v2513)
                                        v2514.Size = UDim2.new(0.4, 0, 1, 0)
                                        v2514.Position = UDim2.new(0, 15, 0, 0)
                                        v2514.BackgroundTransparency = 1
                                        v2514.Text = v2511
                                        v2514.TextColor3 = v2474
                                        v2514.Font = Enum.Font.Code
                                        v2514.TextSize = 13
                                        v2514.TextXAlignment = Enum.TextXAlignment.Left
                                        local v2515 = Instance.new("TextLabel", v2513)
                                        v2515.Size = UDim2.new(0.6, (-20), 1, 0)
                                        v2515.Position = UDim2.new(0.4, 0, 0, 0)
                                        v2515.BackgroundTransparency = 1
                                        v2515.Text = v2512
                                        v2515.TextColor3 = v2473
                                        v2515.Font = Enum.Font.Code
                                        v2515.TextSize = 13
                                        v2515.TextXAlignment = Enum.TextXAlignment.Right
                                        v2515.RichText = true
                                        local v2516 = Instance.new("Frame", v2513)
                                        v2516.Size = UDim2.new(1, (-30), 0, 1)
                                        v2516.Position = UDim2.new(0, 15, 1, (-1))
                                        v2516.BackgroundColor3 = v2475
                                        v2516.BackgroundTransparency = 0.8
                                        v2516.BorderSizePixel = 0
                                        v2513.Parent = v2510
                                        return v2515
                                    end
                                    v2509(v2506, "Place ID", tostring(game.PlaceId))
                                    local v2517 = v2509(v2506, "Game Time", "--:--")
                                    local v2518 = v2509(v2506, "Moon", "<font color='#FF4444'><b>BAD MOON</b></font>")
                                    v2509(v2506, "Player", v2464.Name)
                                    v2509(v2506, "Role", ((v395 and "HELP") or "MAIN"))
                                    local v2521 = v2509(v2506, "Race", "Unknown")
                                    local v2522 = v2509(v2506, "Fragments", "0")
                                    local v2523 = v2509(v2506, "Pair", "NONE")
                                    local v2524 = v2509(v2506, "V4 Status", "<font color='#D4A017'><b>TRAINING REQUIRED</b></font>")
                                    local v2525 = v2509(v2506, "Sessions", "0/0")
                                    local v2526 = v2509(v2506, "Energy", "0%")
                                    local v2527 = v2509(v2506, "Transform", "OFF")
                                    v2507:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                                        v2506.CanvasSize = UDim2.new(0, 0, 0, (v2507.AbsoluteContentSize.Y + 20))
                                    end)
                                    local function v2528(v2529, v2530)
                                        local v2531 = Instance.new("TextButton")
                                        v2531.Size = UDim2.new(0.9, 0, 0, 42)
                                        v2531.BackgroundColor3 = Color3.fromRGB(245, 245, 250)
                                        v2531.BackgroundTransparency = 0.4
                                        v2531.Text = v2530
                                        v2531.TextColor3 = v2473
                                        v2531.Font = Enum.Font.Code
                                        v2531.TextSize = 14
                                        Instance.new("UICorner", v2531).CornerRadius = UDim.new(0, 10)
                                        local v2532 = Instance.new("UIStroke", v2531)
                                        v2532.Color = v2475
                                        v2532.Transparency = 0.5
                                        v2531.MouseEnter:Connect(function()
                                            v2531.BackgroundTransparency = 0.1
                                        end)
                                        v2531.MouseLeave:Connect(function()
                                            v2531.BackgroundTransparency = 0.4
                                        end)
                                        v2531.Parent = v2529
                                        return v2531
                                    end
                                    local v2533 = v2505:FindFirstChildWhichIsA("UIListLayout")
                                    if v2533 then
                                        v2533.Padding = UDim.new(0, 12)
                                    end
                                    local v2534 = Instance.new("Frame")
                                    v2534.Size = UDim2.new(0.9, 0, 0, 42)
                                    v2534.BackgroundTransparency = 1
                                    v2534.Parent = v2505
                                    local v2535 = Instance.new("TextBox", v2534)
                                    v2535.Size = UDim2.new(0.68, (-8), 1, 0)
                                    v2535.BackgroundColor3 = Color3.fromRGB(245, 245, 250)
                                    v2535.BackgroundTransparency = 0.3
                                    v2535.PlaceholderText = "Job ID..."
                                    v2535.Text = ""
                                    v2535.TextColor3 = v2473
                                    v2535.PlaceholderColor3 = v2474
                                    v2535.Font = Enum.Font.Code
                                    v2535.TextSize = 14
                                    Instance.new("UICorner", v2535).CornerRadius = UDim.new(0, 10)
                                    Instance.new("UIStroke", v2535).Color = v2475
                                    local v2536 = Instance.new("UIPadding", v2535)
                                    v2536.PaddingLeft = UDim.new(0, 15)
                                    local v2537 = Instance.new("TextButton", v2534)
                                    v2537.Size = UDim2.new(0.32, 0, 1, 0)
                                    v2537.Position = UDim2.new(0.68, 8, 0, 0)
                                    v2537.BackgroundColor3 = v2472
                                    v2537.BackgroundTransparency = 0.1
                                    v2537.Text = "Join"
                                    v2537.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    v2537.Font = Enum.Font.Code
                                    v2537.TextSize = 14
                                    Instance.new("UICorner", v2537).CornerRadius = UDim.new(0, 10)
                                    v2537.Parent = v2534
                                    local v2538 = v2528(v2505, "Travel Sea 3")
                                    local v2539 = v2528(v2505, "Travel Sea 2")
                                    local v2540 = v2528(v2505, "Reroll Race")
                                    v2538.MouseButton1Click:Connect(function()
                                        status("Traveling to Sea 3...")
                                        pcall(function()
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                                        end)
                                    end)
                                    v2539.MouseButton1Click:Connect(function()
                                        status("Traveling to Sea 2...")
                                        pcall(function()
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                                        end)
                                    end)
                                    v2540.MouseButton1Click:Connect(function()
                                        status("Rerolling Race...")
                                        pcall(function()
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
                                        end)
                                    end)
                                    local v2541 = Instance.new("Frame")
                                    v2541.Size = UDim2.new(0, 180, 0, 26)
                                    v2541.Position = UDim2.new(0, 95, 0.25, 335)
                                    v2541.BackgroundColor3 = v2470
                                    v2541.BackgroundTransparency = v2471
                                    v2541.Visible = false
                                    v2541.ZIndex = 8
                                    Instance.new("UICorner", v2541).CornerRadius = UDim.new(1, 0)
                                    Instance.new("UIStroke", v2541).Color = v2475
                                    local v2542 = Instance.new("TextLabel", v2541)
                                    v2542.Size = UDim2.new(1, 0, 1, 0)
                                    v2542.BackgroundTransparency = 1
                                    v2542.Text = "[ KaitunV4 Exclusive ]"
                                    v2542.TextColor3 = v2472
                                    v2542.Font = Enum.Font.Code
                                    v2542.TextSize = 12
                                    v2541.Parent = v2469
                                    local v2543 = false
                                    local v2544 = nil
                                    local v2545 = TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                                    local function v2546(v2547, v2548)
                                        if (v2544 == v2547) then
                                            return
                                        end
                                        if v2544 then
                                            v2462:Create(v2544, TweenInfo.new(0.2), { Position = UDim2.new(0, (-20), 0, 0), BackgroundTransparency = 1 }):Play()
                                            local v2549 = v2544
                                            task.delay(0.2, function()
                                                v2549.Visible = false
                                            end)
                                        end
                                        v2495.ImageColor3 = v2474
                                        v2496.ImageColor3 = v2474
                                        v2548.ImageColor3 = v2472
                                        v2544 = v2547
                                        v2547.Visible = true
                                        v2547.Position = UDim2.new(0, (-20), 0, 0)
                                        v2547.BackgroundTransparency = 1
                                        v2462:Create(v2547, v2545, { Position = UDim2.new(0, 0, 0, 0), BackgroundTransparency = v2471 }):Play()
                                    end
                                    v2486.MouseButton1Click:Connect(function()
                                        v2543 = (not v2543)
                                        if v2543 then
                                            v2462:Create(v2488, v2545, { Size = UDim2.new(0, 56, 0, 130) }):Play()
                                            v2541.Visible = true
                                            v2541.BackgroundTransparency = 1
                                            v2542.TextTransparency = 1
                                            v2462:Create(v2541, v2545, { BackgroundTransparency = v2471 }):Play()
                                            v2462:Create(v2542, v2545, { TextTransparency = 0 }):Play()
                                            v2546(v2504, v2495)
                                        else
                                            v2462:Create(v2488, v2545, { Size = UDim2.new(0, 56, 0, 0) }):Play()
                                            if v2544 then
                                                v2462:Create(v2544, v2545, { Position = UDim2.new(0, (-20), 0, 0), BackgroundTransparency = 1 }):Play()
                                                local v2550 = v2544
                                                task.delay(0.35, function()
                                                    v2550.Visible = false
                                                end)
                                                v2544 = nil
                                            end
                                            v2462:Create(v2541, v2545, { BackgroundTransparency = 1 }):Play()
                                            v2462:Create(v2542, v2545, { TextTransparency = 1 }):Play()
                                            task.delay(0.35, function()
                                                v2541.Visible = false
                                            end)
                                            v2495.ImageColor3 = v2474
                                            v2496.ImageColor3 = v2474
                                        end
                                    end)
                                    v2495.MouseButton1Click:Connect(function()
                                        v2546(v2504, v2495)
                                    end)
                                    v2496.MouseButton1Click:Connect(function()
                                        v2546(v2505, v2496)
                                    end)
                                    local function v2551()
                                        if (type(_K4MoonClockSnapshot) == "function") then
                                            return (_K4MoonClockSnapshot() or {})
                                        end
                                        return { display = "UNKNOWN", clock_text = "--:--" }
                                    end
                                    task.spawn(function()
                                        while v2469.Parent do
                                            task.wait(0.75)
                                            if (not v2469.Parent) then
                                                break
                                            end
                                            pcall(function()
                                                local v2552 = (v2464 or v2461.LocalPlayer)
                                                if (v2552:FindFirstChild("Data") and v2552.Data:FindFirstChild("Race")) then
                                                    v2521.Text = tostring(v2552.Data.Race.Value)
                                                end
                                                local v2553 = (((v2552:FindFirstChild("Data") and v2552.Data:FindFirstChild("Fragments")) and v2552.Data.Fragments.Value) or 0)
                                                v2522.Text = K4_FormatNumber(v2553)
                                                local v2554 = ((v395 and "WAITING") or "NONE")
                                                if (((v395 and _G.K4MoonHub) and _G.K4MoonHub.hostJobId) and (_G.K4MoonHub.hostJobId ~= "")) then
                                                    v2554 = "<font color='#00FF00'>PAIRED</font>"
                                                end
                                                v2523.Text = v2554
                                                local v2555 = v2551()
                                                v2518.Text = tostring((v2555.display or "UNKNOWN"))
                                                v2517.Text = tostring((v2555.clock_text or "--:--"))
                                                local v2556 = (((type(getV4Status) == "function") and getV4Status(false)) or {})
                                                v2524.Text = tostring((v2556.label or "UNKNOWN"))
                                                local v2557 = math.floor(((math.clamp((tonumber(v2556.energy) or 0), 0, 1) * 100) + 0.5))
                                                v2526.Text = (tostring(v2557) .. "%")
                                                v2527.Text = ((v2556.transformed and "<font color='#00FF00'>ON</font>") or "<font color='#FF4444'>OFF</font>")
                                                if (v2556.code == 6) then
                                                    v2525.Text = (tostring((v2556.completedTraining or 0)) .. "/3")
                                                else
                                                    v2525.Text = "-"
                                                end
                                            end)
                                        end
                                    end)
                                    v2537.MouseButton1Click:Connect(function()
                                        local v2558 = v2535.Text:gsub("%s+", "")
                                        if (v2558 == "") then
                                            status("Input empty")
                                            return
                                        end
                                        status("Joining...")
                                        local v2559 = pcall(function()
                                            game:GetService("ReplicatedStorage"):WaitForChild("__ServerBrowser"):InvokeServer("teleport", v2558)
                                        end)
                                        if (not v2559) then
                                            status("Join failed")
                                        else
                                            status("Teleporting...")
                                        end
                                    end)
                                    v2453 = v2482
                                    if v954 then
                                        v2482.Text = v954
                                    end
                                    status = function(v2560)
                                        local v2561 = tostring((v2560 or "idle"))
                                        if (v954 == v2561) then
                                            return
                                        end
                                        v954 = v2561
                                        if v2482 then
                                            v2482.Text = v954
                                        end
                                        if v2453 then
                                            v2453.Text = v954
                                        end
                                    end
                                end
                                task.spawn(_K4F.v2460)
                                if v395 then
                                    status("Help starting Full Moon API scan...")
                                    task.spawn(function()
                                        task.wait(0.05)
                                        _G.K4MoonHub.lastFetchAt = 0
                                        pcall(function()
                                            _K4MoonHubFetchCandidate(true)
                                        end)
                                        pcall(function()
                                            _K4MoonHubDriveHelpPriority()
                                        end)
                                    end)
                                else
                                    status("idle")
                                end
                                do
                                    local v2562 = K4_ConfigId()
                                    local v2563 = tostring((getgenv().K4_TOOL_API or "")):gsub("/api/k4/?$", "")
                                    local v2564 = game:GetService("Players")
                                    local v2565 = game:GetService("HttpService")
                                    local v2566 = v2564.LocalPlayer.Name
                                    local v2567 = (v396 == true)
                                    local function v2568(v2569, v2570)
                                        local v2571 = (((syn and syn.request) or http_request) or request)
                                        if ((not v2571) or (v2563 == "")) then
                                            return
                                        end
                                        pcall(function()
                                            v2571({ Url = (v2563 .. v2569), Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = v2565:JSONEncode(v2570) })
                                        end)
                                    end
                                    local function v2572()
                                        local v2573 = {}
                                        pcall(function()
                                            for v2574, v2575 in ipairs(v2564:GetPlayers()) do
                                                v2573[(#v2573 + 1)] = v2575.Name
                                            end
                                        end)
                                        return v2573
                                    end
                                    local function v2576()
                                        local v2577, v2578 = pcall(function()
                                            return isfullmoon()
                                        end)
                                        return (v2577 and (v2578 == true))
                                    end
                                    local function v2579()
                                        if (not v2567) then
                                            return "training"
                                        end
                                        if K4_ShouldFarmFragments() then
                                            return "farming_fragments"
                                        end
                                        local v2580 = nil
                                        pcall(function()
                                            v2580 = getV4Status(false)
                                        end)
                                        if (type(v2580) == "table") then
                                            if v2580.needsTraining then
                                                return "training"
                                            end
                                            if v2580.complete then
                                                return "trial_done"
                                            end
                                        end
                                        local v2581 = false
                                        pcall(function()
                                            v2581 = (_K4TrialCycleIsActive() == true)
                                        end)
                                        if v2581 then
                                            return "trialing"
                                        end
                                        if ((type(v2580) == "table") and v2580.canTrial) then
                                            return "waiting_fullmoon"
                                        end
                                        return "training"
                                    end
                                    task.spawn(function()
                                        while true do
                                            pcall(function()
                                                if (getgenv().K4RaceUpgrade and getgenv().K4RaceUpgrade.active) then
                                                    return
                                                end
                                                local v2582 = {
                                                    jobid = tostring(game.JobId),
                                                    placeid = tostring(game.PlaceId),
                                                    count = 0,
                                                    players = v2572(),
                                                    fullmoon = v2576()
                                                }
                                                if v2567 then
                                                    v2582.trialStatus = v2579()
                                                    v2568(("/api/mainaccount/" .. v2566), v2582)
                                                elseif (v2562 ~= "") then
                                                    v2568(("/api/helpusers/" .. (v2562 .. ("/" .. v2566))), v2582)
                                                end
                                            end)
                                            task.wait(1)
                                        end
                                    end)
                                end
                                task.spawn(function()
                                    while v396 do
                                        local v2583 = K4_ReadRaceLevel(false)
                                        if (v2583 and (v2583 < 3)) then
                                            K4_RunRaceUpgradePrerequisite()
                                        end
                                        task.wait(1)
                                    end
                                end)
                                isMainAcc = function(v2584)
                                    return (v396 == true)
                                end;
                                (function()
                                    local v2585 = {
                                        Human = true,
                                        Mink = true,
                                        Fishman = true,
                                        Skypiea = true,
                                        Ghoul = true,
                                        Cyborg = true
                                    }
                                    local function v2586()
                                        if K4_ShouldFarmFragments() then
                                            return { Enable = false, Race = {} }
                                        end
                                        local v2587 = (getgenv().Config and getgenv().Config.ChangeRaceUp)
                                        if (type(v2587) ~= "table") then
                                            return { Enable = false, Race = {} }
                                        end
                                        local v2588 = v2587.Race
                                        if ((type(v2588) == "table") and (#v2588 == 0)) then
                                            local v2589 = {}
                                            for v2590, v2591 in pairs(v2588) do
                                                if (v2591 and (type(v2590) == "string")) then
                                                    v2589[(#v2589 + 1)] = v2590
                                                end
                                            end
                                            if (#v2589 > 0) then
                                                v2588 = v2589
                                            end
                                        end
                                        local v2592 = {}
                                        if (type(v2588) == "table") then
                                            for v2593, v2594 in ipairs(v2588) do
                                                if ((type(v2594) == "string") and (v2594 ~= "")) then
                                                    v2592[(#v2592 + 1)] = (string.upper(string.sub(v2594, 1, 1)) .. string.sub(v2594, 2))
                                                end
                                            end
                                        end
                                        return { Enable = ((v2587.Enable and true) or false), Race = v2592 }
                                    end
                                    local function v2595()
                                        return K4_GetTargetTier()
                                    end
                                    local function v2596()
                                        return ("kurinian_racedone_" .. (tostring(game.Players.LocalPlayer.Name) .. ".json"))
                                    end
                                    local function v2597()
                                        local v2598 = {}
                                        if (isfile and isfile(v2596())) then
                                            pcall(function()
                                                local v2599 = game:GetService("HttpService"):JSONDecode(readfile(v2596()))
                                                if (type(v2599) == "table") then
                                                    v2598 = v2599
                                                end
                                            end)
                                        end
                                        return v2598
                                    end
                                    local function v2600(v2601)
                                        if writefile then
                                            pcall(function()
                                                writefile(v2596(), game:GetService("HttpService"):JSONEncode((v2601 or {})))
                                            end)
                                        end
                                    end
                                    local function v2602()
                                        local v2603, v2604 = pcall(function()
                                            return game.Players.LocalPlayer.Data.Race.Value
                                        end)
                                        if (v2603 and v2604) then
                                            return tostring(v2604)
                                        end
                                        return nil
                                    end
                                    local function v2605()
                                        local v2606, v2607 = pcall(function()
                                            return game.Players.LocalPlayer.Data.Race.C.Value
                                        end)
                                        return ((v2606 and tonumber(v2607)) or 0)
                                    end
                                    local function v2608(v2609)
                                        if ((not v2609) or (v2609 == "")) then
                                            return false
                                        end
                                        local v2610 = v2586()
                                        if (not v2610.Enable) then
                                            return false
                                        end
                                        if (table.find(v2610.Race, v2609) == nil) then
                                            return false
                                        end
                                        local v2611 = v2595()
                                        local v2612 = v2597()
                                        return (not (tonumber(v2612[v2609]) and (tonumber(v2612[v2609]) >= v2611)))
                                    end
                                    local function v2613(v2614)
                                        if (v2602() == v2614) then
                                            return true
                                        end
                                        if (not v2585[v2614]) then
                                            return false
                                        end
                                        if ((tick() - (getgenv().K4_RerollAt or 0)) < 30) then
                                            return true
                                        end
                                        local v2615 = 0
                                        pcall(function()
                                            v2615 = game.Players.LocalPlayer.Data.Fragments.Value
                                        end)
                                        v2615 = (tonumber(v2615) or 0)
                                        if (v2615 < 3000) then
                                            status(("Het fragment reroll (" .. (v2615 .. "/3000)")))
                                            return false
                                        end
                                        getgenv().K4_RerollAt = tick()
                                        for v2616 = 1, 10 do
                                            status(("Reroll " .. (v2616 .. ("/10 -> " .. tostring(v2614)))))
                                            pcall(function()
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1")
                                            end)
                                            task.wait(0.5)
                                            pcall(function()
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
                                            end)
                                            task.wait(2)
                                            if (v2602() == v2614) then
                                                status((" -> " .. tostring(v2614)))
                                                return true
                                            end
                                            local v2617 = v2602()
                                            if ((v2617 and (v2617 ~= v2614)) and v2608(v2617)) then
                                                status(("Roll trung " .. (tostring(v2617) .. " (can tier) -> giu lai train, dung reroll")))
                                                return true
                                            end
                                        end
                                        return true
                                    end
                                    local function v2618()
                                        if (v2602() == "Draco") then
                                            local v2619 = game.Players.LocalPlayer
                                            if ((v2619.Backpack and v2619.Backpack:FindFirstChild("Primordial Reign")) or (v2619.Character and v2619.Character:FindFirstChild("Primordial Reign"))) then
                                                return true
                                            end
                                        end
                                        local v2620, v2621 = pcall(function()
                                            return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getRaceLevel")
                                        end)
                                        return ((v2620 and tonumber(v2621)) and (tonumber(v2621) >= 3))
                                    end
                                    local function v2622()
                                        local v2623 = v2586()
                                        if (not v2623.Enable) then
                                            return false
                                        end
                                        if (not isMainAcc(game.Players.LocalPlayer.Name)) then
                                            return false
                                        end
                                        local v2624 = v2623.Race
                                        if ((type(v2624) ~= "table") or (#v2624 == 0)) then
                                            return false
                                        end
                                        local v2625 = v2602()
                                        if (not v2625) then
                                            return false
                                        end
                                        local v2626 = v2595()
                                        local v2627 = v2597()
                                        local function v2628(v2629)
                                            return (tonumber(v2627[v2629]) and (tonumber(v2627[v2629]) >= v2626))
                                        end
                                        local v2630 = (table.find(v2624, v2625) ~= nil)
                                        if (v2630 and (not v2628(v2625))) then
                                            local v2631 = false
                                            pcall(function()
                                                local v2632 = getV4Status(false)
                                                v2631 = ((type(v2632) == "table") and (v2632.complete == true))
                                            end)
                                            if v2631 then
                                                v2627[v2625] = v2626
                                                v2600(v2627)
                                                status((v2625 .. " V4 completed -> doi toc..."))
                                            else
                                                local v2633 = v2605()
                                                if (v2633 >= v2626) then
                                                    if (not v2618()) then
                                                        status(("ChangeRaceUp: " .. (tostring(v2625) .. (" tier " .. (tostring(v2626) .. " nhung chua V3 - doi V3 truoc, chua doi toc")))))
                                                        return false
                                                    end
                                                    v2627[v2625] = v2626
                                                    v2600(v2627)
                                                    status((v2625 .. (" dat tier " .. (v2626 .. " (V3) -> doi toc..."))))
                                                else
                                                    status(("ChangeRaceUp: " .. (tostring(v2625) .. (" tier " .. (tostring(v2633) .. ("/" .. (tostring(v2626) .. " - training...")))))))
                                                    return false
                                                end
                                            end
                                        end
                                        for v2634, v2635 in ipairs(v2624) do
                                            if (not v2628(v2635)) then
                                                if (v2625 == v2635) then
                                                    return false
                                                elseif (v2635 == "Cyborg") then
                                                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CyborgTrainer", "Buy")
                                                    task.wait(2)
                                                    if (v2602() == "Cyborg") then
                                                        return true
                                                    end
                                                elseif ((v2625 ~= v2635) and (v2635 == "Ghoul")) then
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "BuyCheck", 4)
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "Change", 4)
                                                    task.wait(2)
                                                    if (v2602() == "Ghoul") then
                                                        return true
                                                    end
                                                elseif ((v2625 ~= v2635) and (v2635 == "Draco")) then
                                                    local v2636 = CFrame.new(5773.936035, 1209.442871, 809.224548)
                                                    local function v2637()
                                                        local v2638 = (workspace:FindFirstChild("NPCs") and workspace.NPCs:FindFirstChild("Dragon Wizard"))
                                                        if ((v2638 and v2638:FindFirstChild("HumanoidRootPart")) and (v2638.HumanoidRootPart.Position.Magnitude > 100)) then
                                                            return (v2638.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
                                                        end
                                                        return v2636
                                                    end
                                                    local v2639 = v2637()
                                                    if (getdis(v2639) > 8) then
                                                        status("ChangeRaceUp: Dang tween ra NPC Dragon Wizard...")
                                                        repeat
                                                            task.wait(0.2)
                                                            v2639 = v2637()
                                                            pcall(function()
                                                                v411:topos(v2639)
                                                            end)
                                                        until (((getdis(v2639) <= 8) or (v2602() == "Draco")) or (not (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))))
                                                    end
                                                    if ((getdis(v2637()) <= 8) and (v2602() ~= "Draco")) then
                                                        status("ChangeRaceUp: Da toi Dragon Wizard -> Doi sang toc Draco...")
                                                        task.wait(0.5)
                                                        pcall(function()
                                                            local v2640 = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/InteractDragonQuest")
                                                            v2640:InvokeServer({ NPC = "Dragon Wizard", Command = "Speak" })
                                                            task.wait(0.5)
                                                            v2640:InvokeServer({ NPC = "Dragon Wizard", Command = "DragonRace" })
                                                        end)
                                                        task.wait(2)
                                                    end
                                                    return true
                                                elseif (not v2585[v2635]) then
                                                    status(("ChangeRaceUp: bo qua " .. (tostring(v2635) .. " (khong reroll duoc, can lam tay)")))
                                                else
                                                    status(("ChangeRaceUp: " .. (tostring(v2625) .. (" -> " .. tostring(v2635)))))
                                                    v2613(v2635)
                                                    return true
                                                end
                                            end
                                        end
                                        status(("ChangeRaceUp: xong het " .. (#v2624 .. (" toc (tier " .. (v2626 .. ")")))))
                                        return true
                                    end
                                    _G.K4_ChangeRaceTick = v2622
                                    local function v2641(v2642)
                                        v2642 = string.lower(tostring((v2642 or "")))
                                        local v2643 = { rabbit = "Mink", shark = "Fishman", angel = "Skypiea" }
                                        return (v2643[v2642] or (string.upper(string.sub(v2642, 1, 1)) .. string.sub(v2642, 2)))
                                    end
                                    local function v2644()
                                        local v2645 = (getgenv().Config or {})
                                        local v2646 = {}
                                        local v2647 = v2645["Help Change Race Allowed"]
                                        if (type(v2647) == "table") then
                                            if (#v2647 > 0) then
                                                for v2648, v2649 in ipairs(v2647) do
                                                    if ((type(v2649) == "string") and (v2649 ~= "")) then
                                                        v2646[(#v2646 + 1)] = v2641(v2649)
                                                    end
                                                end
                                            else
                                                for v2650, v2651 in pairs(v2647) do
                                                    if (v2651 and (type(v2650) == "string")) then
                                                        v2646[(#v2646 + 1)] = v2641(v2650)
                                                    end
                                                end
                                            end
                                        end
                                        return { Enable = (v2645["Help Change Race"] ~= false), Allowed = v2646, MaxRolls = math.clamp(math.floor((tonumber(v2645["Help Change Race Max Rolls"]) or 5)), 1, 10) }
                                    end
                                    local function v2652()
                                        if ((not v948) or (v948.assigned ~= true)) then
                                            return nil
                                        end
                                        local v2653 = tostring((v948.main_username or ""))
                                        if ((v2653 == "") or (v2653 == game.Players.LocalPlayer.Name)) then
                                            return nil
                                        end
                                        if ((v948.active_main and (v948.active_main ~= "")) and (v948.active_main ~= v2653)) then
                                            return nil
                                        end
                                        local v2654 = game.Players:FindFirstChild(v2653)
                                        if v2654 then
                                            local v2655, v2656 = pcall(function()
                                                return v2654.Data.Race.Value
                                            end)
                                            if ((v2655 and v2656) and (tostring(v2656) ~= "")) then
                                                return v2641(v2656), v2653
                                            end
                                        end
                                        local v2657 = tostring((v948.main_race or ""))
                                        if (v2657 ~= "") then
                                            return v2641(v2657), v2653
                                        end
                                        return nil, v2653
                                    end
                                    local function v2658(v2659, v2660, v2661)
                                        v2659 = v2641(v2659)
                                        if ((v2659 == "") or (v2659 == v2660)) then
                                            return false
                                        end
                                        return ((#v2661.Allowed == 0) or (table.find(v2661.Allowed, v2659) ~= nil))
                                    end
                                    local function v2662()
                                        local v2663 = false
                                        pcall(function()
                                            v2663 = (v348.LocalPlayer.PlayerGui.Main.Timer.Visible == true)
                                        end)
                                        pcall(function()
                                            v2663 = (v2663 or (_K4F.v1648() == true))
                                        end)
                                        pcall(function()
                                            v2663 = (v2663 or (K4_IsPostTrialFFAActive() == true))
                                        end)
                                        if (_G.K4PostTrialReset and (_G.K4PostTrialReset.active == true)) then
                                            v2663 = true
                                        end
                                        local v2664 = ((v1715 and v1715.round) and tonumber(v1715.round.local_fire_at))
                                        if ((v2664 and (tick() >= (v2664 - 10))) and (tick() <= (v2664 + 12))) then
                                            v2663 = true
                                        end
                                        return v2663
                                    end
                                    local function v2665(v2666, v2667)
                                        local v2668 = tostring((v948.group_id or ""))
                                        local v2669 = game:GetService("ReplicatedStorage").Remotes.CommF_
                                        for v2670 = 1, v2667.MaxRolls do
                                            local v2671 = v2652()
                                            if ((tostring(((v948 and v948.group_id) or "")) ~= v2668) or (v2671 ~= v2666)) then
                                                return false, "team_changed"
                                            end
                                            if v2662() then
                                                return false, "trial"
                                            end
                                            if v2658(v2602(), v2666, v2667) then
                                                return true
                                            end
                                            local v2672 = (tonumber(game.Players.LocalPlayer.Data.Fragments.Value) or 0)
                                            if (v2672 < 3000) then
                                                status(("Help doi toc: thieu fragment (" .. (tostring(v2672) .. "/3000)")))
                                                return false, "fragments"
                                            end
                                            status(("Help doi toc " .. (v2670 .. ("/" .. (v2667.MaxRolls .. (": " .. (tostring(v2602()) .. (" (main " .. (tostring(v2666) .. ")")))))))))
                                            v2669:InvokeServer("BlackbeardReward", "Reroll", "1")
                                            task.wait(0.5)
                                            if v2662() then
                                                return false, "trial"
                                            end
                                            if ((tostring(((v948 and v948.group_id) or "")) ~= v2668) or (v2652() ~= v2666)) then
                                                return false, "team_changed"
                                            end
                                            v2669:InvokeServer("BlackbeardReward", "Reroll", "2")
                                            task.wait(2)
                                            if v2658(v2602(), v2666, v2667) then
                                                status(("Help doi toc xong -> " .. tostring(v2602())))
                                                pcall(refreshMatch)
                                                return true
                                            end
                                        end
                                        return false, "max_rolls"
                                    end
                                    local v2673 = { key = "", at = 0 }
                                    local function v2674()
                                        if ((not v395) or _G.K4HelpRaceChanging) then
                                            return
                                        end
                                        local v2675 = v2644()
                                        if ((not v2675.Enable) or v2662()) then
                                            return
                                        end
                                        local v2676 = v2652()
                                        if ((not v2676) or v2658(v2602(), v2676, v2675)) then
                                            return
                                        end
                                        local v2677 = false
                                        for v2678, v2679 in ipairs({ "Human", "Mink", "Fishman", "Skypiea" }) do
                                            if v2658(v2679, v2676, v2675) then
                                                v2677 = true
                                                break
                                            end
                                        end
                                        if (not v2677) then
                                            status("Help doi toc: allowed list khong co toc reroll khac main")
                                            return
                                        end
                                        local v2680 = (tostring((v948.group_id or "")) .. ("|" .. (v2676 .. ("|" .. table.concat(v2675.Allowed, ",")))))
                                        if ((v2673.key == v2680) and (tick() < v2673.at)) then
                                            return
                                        end
                                        _G.K4HelpRaceChanging = true
                                        local v2681, v2682, v2683 = pcall(v2665, v2676, v2675)
                                        _G.K4HelpRaceChanging = false
                                        local v2684 = ((((not v2681) and 10) or ((v2683 == "max_rolls") and 60)) or 0)
                                        v2673 = { key = v2680, at = (tick() + v2684) }
                                        if (not v2681) then
                                            status(("Help doi toc loi: " .. tostring(v2682)))
                                        end
                                    end
                                    task.spawn(function()
                                        while true do
                                            pcall(v2674)
                                            task.wait(1)
                                        end
                                    end)
                                    task.spawn(function()
                                        task.wait(10)
                                        while true do
                                            pcall(function()
                                                local v2685 = (v948 and (v948.assigned == true))
                                                local v2686 = false
                                                pcall(function()
                                                    v2686 = (_K4TrialCycleIsActive() == true)
                                                end)
                                                if (((v396 and (not v2685)) and (not v2686)) and (not (getgenv().K4RaceUpgrade and getgenv().K4RaceUpgrade.active))) then
                                                    v2622()
                                                end
                                            end)
                                            task.wait(15)
                                        end
                                    end)
                                end)()
                                function _K4F.v2687(v2688)
                                    v2688 = tostring((v2688 or ""))
                                    local v2689 = utf8.len(v2688)
                                    if (not v2689) then
                                        return (string.sub(v2688, 1, math.max(0, (#v2688 - 3))) .. "***")
                                    end
                                    if (v2689 <= 3) then
                                        return "***"
                                    end
                                    local v2690 = utf8.offset(v2688, (v2689 - 2))
                                    return (string.sub(v2688, 1, (v2690 - 1)) .. "***")
                                end
                                function _K4F.v2691(v2692)
                                    local v2693 = (v2692.kind == "trial")
                                    local v2694 = ((v2693 and "Trial completed") or "Training completed")
                                    if v2692.test then
                                        v2694 = "Webhook preview · TEST"
                                    end
                                    return {
                                        username = "Vape Hub",
                                        allowed_mentions = { parse = {} },
                                        embeds = {
                                        {
                                        author = { name = "Vape Hub - Kaitun V4" },
                                        image = { url = "https://i.pinimg.com/736x/8c/bb/21/8cbb212a7d55ca5c8be65044108c059e.jpg" },
                                        title = v2694,
                                        description = ((v2692.test and "Kiểm tra giao diện webhook. Đây là dữ liệu minh họa, không phải tiến độ thật.") or ((v2693 and "Đã vượt qua trial. Tiến độ Race V4 vừa được cập nhật.") or "Đã hoàn tất mốc training được cấu hình.")),
                                        color = 10053375,
                                        fields = {
                                        { name = "Account", value = _K4F.v2687(v2692.account), inline = true },
                                        { name = "Race", value = tostring(v2692.race), inline = true },
                                        { name = "Progress", value = ("Tier **" .. (tostring(v2692.tier) .. (" / " .. (tostring(v2692.target) .. "**")))), inline = true },
                                        { name = "Session", value = tostring(v2692.session), inline = true },
                                        { name = "Status", value = ((v2692.test and "TEST · no gameplay event") or ((v2693 and "Trial cleared") or "Target reached")), inline = true }
                                    },
                                        footer = { text = "Vape Hub · Race V4 progress" },
                                        timestamp = v2692.timestamp
                                    }
                                    }
                                    }
                                end
                                local v2695 = os.clock()
                                function _K4F.v2696(v2697, v2698, v2699)
                                    if (((not v396) or v395) or (not Main_Acc)) then
                                        return
                                    end
                                    local v2700 = ((getgenv().Config and getgenv().Config.Webhook) or {})
                                    local v2701 = ((v2699 and v1) or v2700.Url)
                                    if ((type(v2701) ~= "string") or (v2701 == "")) then
                                        return false
                                    end
                                    local v2702 = game.Players.LocalPlayer
                                    local v2703 = (v2702:FindFirstChild("Data") and v2702.Data:FindFirstChild("Race"))
                                    local v2704 = math.max(0, math.floor((os.clock() - v2695)))
                                    local v2705 = ((v2699 and K4_GetTargetTier()) or (tonumber(v2700.Tier) or K4_GetTargetTier()))
                                    local v2706 = _K4F.v2691({
                                        kind = v2697,
                                        account = v2702.Name,
                                        race = ((v2703 and v2703.Value) or "Unknown"),
                                        tier = (v2698 or "?"),
                                        target = v2705,
                                        session = string.format("%02d:%02d:%02d", math.floor((v2704 / 3600)), (math.floor((v2704 / 60)) % 60), (v2704 % 60)),
                                        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
                                    })
                                    return v3(v2701, v2706)
                                end
                                local v2707 = "kurinianhub/webhookv4.json"
                                function _K4F.v2708(v2709)
                                    local v2710, v2711 = pcall(function()
                                        return game:GetService("HttpService"):JSONDecode(readfile(v2707))
                                    end)
                                    if ((not v2710) or (type(v2711) ~= "table")) then
                                        v2711 = {}
                                    end
                                    local v2712 = game.Players.LocalPlayer.Name
                                    if (v2711[v2712] and v2711[v2712][v2709]) then
                                        return false
                                    end
                                    v2711[v2712] = (v2711[v2712] or {})
                                    v2711[v2712][v2709] = true
                                    if ((type(isfolder) == "function") and (not isfolder("kurinianhub"))) then
                                        pcall(function()
                                            makefolder("kurinianhub")
                                        end)
                                    end
                                    if (type(writefile) == "function") then
                                        pcall(function()
                                            writefile(v2707, game:GetService("HttpService"):JSONEncode(v2711))
                                        end)
                                    end
                                    return true
                                end
                                if (not getgenv()._kurinianWebhookWatcher) then
                                    getgenv()._kurinianWebhookWatcher = true
                                    task.spawn(function()
                                        if (((not v396) or v395) or (not Main_Acc)) then
                                            return
                                        end
                                        local v2713 = 0
                                        pcall(function()
                                            v2713 = (tonumber(game.Players.LocalPlayer.Data.Race.C.Value) or 0)
                                        end)
                                        while task.wait(2) do
                                            pcall(function()
                                                local v2714 = ((getgenv().Config and getgenv().Config.Webhook) or {})
                                                local v2715 = ((type(v2714.Url) == "string") and (v2714.Url ~= ""))
                                                local v2716 = 0
                                                pcall(function()
                                                    v2716 = (tonumber(game.Players.LocalPlayer.Data.Race.C.Value) or 0)
                                                end)
                                                if (v2716 > v2713) then
                                                    v2713 = v2716
                                                    if _K4F.v2708(("dedicated_trial_" .. v2716)) then
                                                        _K4F.v2696("trial", v2716, true)
                                                    end
                                                    if (((v2715 and v2714.DoneTrial) and (v2714.Url ~= v1)) and _K4F.v2708(("trial_" .. v2716))) then
                                                        _K4F.v2696("trial", v2716)
                                                    end
                                                end
                                                local v2717 = K4_GetTargetTier()
                                                local v2718 = (tonumber(v2714.Tier) or 6)
                                                if ((v2716 >= v2717) or ((v2715 and v2714.DoneTier) and (v2716 >= v2718))) then
                                                    local v2719, v2720 = pcall(function()
                                                        return game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getRaceLevel")
                                                    end)
                                                    if (v2719 and (tonumber(v2720) == 4)) then
                                                        if ((v2716 >= v2717) and _K4F.v2708(("dedicated_tier_" .. v2716))) then
                                                            _K4F.v2696("tier", v2716, true)
                                                        end
                                                        if ((((v2715 and v2714.DoneTier) and (v2716 >= v2718)) and (v2714.Url ~= v1)) and _K4F.v2708(("tier_" .. v2716))) then
                                                            _K4F.v2696("tier", v2716)
                                                        end
                                                    end
                                                end
                                            end)
                                        end
                                    end)
                                end
                            end
                        end
                    end
                end
            end
        end
    end, function(v2721)
        return debug.traceback(tostring(v2721), 2)
    end)
    if (getgenv().K4_STARTUP == v139) then
        if v2722 then
            v139.phase = "running"
            getgenv().K4_LOCAL_TOOL_ACTIVE_VERSION = "2.36"
            getgenv().K4_LOCAL_TOOL_ACTIVE_JOB = tostring(game.JobId)
        else
            v139.phase = "failed"
            v139.error = tostring(v2723)
            getgenv().K4_LOCAL_TOOL_ACTIVE_JOB = nil
            warn(("[K4 startup] Failed; you can execute again: " .. tostring(v2723)))
        end
    end
end
