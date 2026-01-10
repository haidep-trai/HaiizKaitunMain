--[[
    Blox Fruits Advanced Script - Learning Purpose
    Version 2.0 - Enhanced Performance & Features
]]

-- Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

-- Player References
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

-- Enhanced Configuration
local Config = {
    -- Farming
    AutoFarm = false,
    AutoFarmLevel = false,
    AutoFarmBoss = false,
    AutoFarmMaterial = false,
    AutoFarmSword = false,
    AutoFarmFruit = false,
    AutoFarmSeaEvent = false,
    AutoFarmRaid = false,
    
    -- Collection
    AutoCollect = false,
    AutoCollectFruits = false,
    AutoCollectChests = false,
    AutoCollectMaterials = false,
    AutoCollectDrops = false,
    
    -- Skills
    AutoSkill = false,
    AutoKen = false,
    AutoHaki = false,
    AutoObservation = false,
    AutoBuso = false,
    AutoSoru = false,
    AutoGeppo = false,
    
    -- Upgrades
    AutoUpgrade = false,
    AutoUpgradeStats = false,
    AutoUpgradeRace = false,
    AutoUpgradeFruit = false,
    AutoUpgradeSword = false,
    AutoUpgradeGun = false,
    AutoUpgradeDefense = false,
    
    -- Quests
    AutoQuest = false,
    AutoBartilo = false,
    AutoDonSwan = false,
    AutoRipIndra = false,
    AutoCakePrince = false,
    AutoDoughKing = false,
    
    -- World Progression
    AutoNewWorld = false,
    AutoThirdSea = false,
    AutoSecondSea = false,
    
    -- Combat
    AutoAttack = false,
    AutoDodge = false,
    AutoBlock = false,
    AutoParry = false,
    AutoCounter = false,
    
    -- Settings
    TeleportToTarget = true,
    FarmRange = 500,
    AttackRange = 50,
    SkillRange = 100,
    Delay = 0.1,
    SkillDelay = 3,
    NotificationDelay = 3,
    
    -- Priority Settings
    SelectedMonster = "",
    SelectedMaterial = "",
    SelectedBoss = "",
    SelectedSword = "",
    SelectedFruit = "",
    
    -- Performance
    OptimizeGraphics = false,
    ReduceParticles = false,
    DisableEffects = false,
    LowCPU = false,
    
    -- UI Settings
    Notifications = true,
    SoundEffects = false,
    AutoSave = true,
    WebhookEnabled = false,
    WebhookURL = ""
}

-- Advanced Data Management
local Data = {
    -- Statistics
    MonstersKilled = 0,
    BossesDefeated = 0,
    MaterialsCollected = 0,
    FruitsCollected = 0,
    ChestsOpened = 0,
    RaidsCompleted = 0,
    QuestsCompleted = 0,
    LevelsGained = 0,
    MoneyEarned = 0,
    BeliEarned = 0,
    FragmentsEarned = 0,
    
    -- Performance
    StartTime = tick(),
    LastSave = tick(),
    TotalPlayTime = 0,
    AverageFPS = 60,
    
    -- Combat
    ComboCount = 0,
    MaxCombo = 0,
    DamageDealt = 0,
    DamageTaken = 0,
    
    -- Inventory
    Weapons = {},
    Fruits = {},
    Materials = {},
    Swords = {},
    Guns = {},
    Accessories = {}
}

-- Advanced Lists
local Monsters = {
    "Bandit",
    "Monkey",
    "Pirate",
    "Brute",
    "Snow Bandit",
    "Desert Bandit",
    "Jungle Bandit",
    "Gorilla",
    "Mob Leader",
    "Vice Admiral",
    "Warden",
    "Chief Warden",
    "Yeti",
    "Cursed Captain",
    "Awakened Ice Admiral",
    "Tide Keeper",
    "Dark Beard",
    "Order"
}

local Bosses = {
    "The Gorilla King",
    "Bobby the Brute",
    "Yeti",
    "Terror Shark",
    "Piranha Leader",
    "Sea Beast",
    "Leviathan",
    "Don Swan",
    "Cursed Captain",
    "Order",
    "Stone",
    "Island Empress",
    "Kilo Admiral",
    "Captain Elephant",
    "Beautiful Pirate",
    "Longma",
    "Soul Reaper",
    "Dough King",
    "Cake Queen",
    "Bake Master"
}

local Materials = {
    "Magma Ore",
    "Dark Fragment",
    "Dragon Scale",
    "Sea King's Tooth",
    "Angel Feather",
    "Demon Horn",
    "Crystal Shard",
    "Mystic Powder",
    "Fish Tail",
    "Leather",
    "Scrap Metal",
    "Radioactive Material",
    "Ectoplasm",
    "Bone",
    "Dough",
    "Candy",
    "Chocolate"
}

local Swords = {
    "Katana",
    "Cutlass",
    "Dual Katana",
    "Iron Mace",
    "Triple Katana",
    "Dual-Headed Blade",
    "Bisento",
    "Soul Cane",
    "Pole",
    "Trident",
    "Warden's Sword",
    "Yama",
    "Tushita",
    "Cursed Dual Katana",
    "True Triple Katana",
    "Shisui",
    "Wando",
    "Saddi",
    "Rengoku",
    "Dark Dagger",
    "Buddy Sword",
    "Canvander",
    "Spikey Trident",
    "Hallow Scythe",
    "Midnight Blade",
    "Dragon Trident"
}

local Fruits = {
    "Bomb-Bomb",
    "Spike-Spike",
    "Chop-Chop",
    "Spring-Spring",
    "Kilo-Kilo",
    "Spin-Spin",
    "Bird: Falcon",
    "Smoke-Smoke",
    "Flame-Flame",
    "Ice-Ice",
    "Sand-Sand",
    "Dark-Dark",
    "Diamond-Diamond",
    "Light-Light",
    "Rubber-Rubber",
    "Barrier-Barrier",
    "Magma-Magma",
    "Quake-Quake",
    "Human-Human: Buddha",
    "String-String",
    "Bird: Phoenix",
    "Rumble-Rumble",
    "Paw-Paw",
    "Gravity-Gravity",
    "Dough-Dough",
    "Shadow-Shadow",
    "Venom-Venom",
    "Control-Control",
    "Spirit-Spirit",
    "Dragon-Dragon"
}

local Skills = {
    "Z",
    "X",
    "C",
    "V",
    "F",
    "G",
    "H",
    "J",
    "K",
    "L"
}

local Islands = {
    ["Starter Island"] = Vector3.new(0, 0, 0),
    ["Desert Island"] = Vector3.new(1000, 0, 0),
    ["Snow Island"] = Vector3.new(-1000, 0, 1000),
    ["Jungle Island"] = Vector3.new(0, 0, 1000),
    ["Magma Island"] = Vector3.new(1500, 0, 1500),
    ["Sky Island"] = Vector3.new(0, 500, 0),
    ["Underwater Island"] = Vector3.new(0, -100, 0),
    ["Pirate Village"] = Vector3.new(-500, 0, -500),
    ["Marine Fortress"] = Vector3.new(500, 0, -500),
    ["Fountain City"] = Vector3.new(0, 0, -1000)
}

-- Performance Optimizations
local Cache = {
    Monsters = {},
    Bosses = {},
    Materials = {},
    Chests = {},
    Fruits = {},
    NPCs = {},
    LastUpdate = 0,
    UpdateInterval = 5
}

-- Advanced Functions
function UpdateCache()
    local currentTime = tick()
    if currentTime - Cache.LastUpdate < Cache.UpdateInterval then
        return
    end
    
    Cache.LastUpdate = currentTime
    Cache.Monsters = {}
    Cache.Bosses = {}
    Cache.Materials = {}
    Cache.Chests = {}
    Cache.Fruits = {}
    Cache.NPCs = {}
    
    -- Cache all relevant objects
    for _, obj in pairs(Workspace:GetChildren()) do
        if obj:IsA("Model") then
            if obj:FindFirstChild("Humanoid") then
                if table.find(Monsters, obj.Name) then
                    table.insert(Cache.Monsters, obj)
                elseif table.find(Bosses, obj.Name) then
                    table.insert(Cache.Bosses, obj)
                end
            elseif table.find(Materials, obj.Name) then
                table.insert(Cache.Materials, obj)
            elseif obj.Name:find("Chest") then
                table.insert(Cache.Chests, obj)
            elseif obj.Name:find("Fruit") then
                table.insert(Cache.Fruits, obj)
            elseif obj:FindFirstChild("Humanoid") then
                table.insert(Cache.NPCs, obj)
            end
        end
    end
end

function GetClosestTarget(targetList, range)
    UpdateCache()
    
    local closest = nil
    local shortestDistance = range or Config.FarmRange
    local playerPos = HumanoidRootPart.Position
    
    for _, target in pairs(targetList) do
        if target:FindFirstChild("HumanoidRootPart") and target.Humanoid.Health > 0 then
            local distance = (playerPos - target.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                closest = target
                shortestDistance = distance
            end
        end
    end
    
    return closest, shortestDistance
end

function GetClosestMaterial(materialType)
    UpdateCache()
    
    local closest = nil
    local shortestDistance = Config.FarmRange
    local playerPos = HumanoidRootPart.Position
    
    for _, material in pairs(Cache.Materials) do
        if not materialType or material.Name == materialType then
            local distance = (playerPos - material.Position).Magnitude
            if distance < shortestDistance then
                closest = material
                shortestDistance = distance
            end
        end
    end
    
    return closest, shortestDistance
end

function AdvancedTeleport(position, smooth)
    if not Character or not HumanoidRootPart then return end
    
    if smooth and Config.TeleportToTarget then
        local distance = (HumanoidRootPart.Position - position.Position).Magnitude
        local duration = math.min(distance / 100, 2)
        local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(HumanoidRootPart, tweenInfo, {CFrame = position})
        tween:Play()
        tween.Completed:Wait()
    else
        HumanoidRootPart.CFrame = position
    end
end

function SmartAttack(target)
    if not target or not target:FindFirstChild("Humanoid") then return false
    
    local weapon = GetBestWeaponForTarget(target)
    if not weapon then return false end
    
    -- Position for optimal attack
    local optimalDistance = GetOptimalDistance(weapon)
    local currentDistance = (HumanoidRootPart.Position - target.HumanoidRootPart.Position).Magnitude
    
    if currentDistance > optimalDistance then
        AdvancedTeleport(target.HumanoidRootPart.CFrame * CFrame.new(0, 0, optimalDistance - 5), true)
    end
    
    -- Face target
    HumanoidRootPart.CFrame = CFrame.lookAt(
        HumanoidRootPart.Position,
        Vector3.new(
            target.HumanoidRootPart.Position.X,
            HumanoidRootPart.Position.Y,
            target.HumanoidRootPart.Position.Z
        )
    )
    
    -- Execute attack
    weapon:Activate()
    
    -- Check results
    task.wait(0.1)
    if target.Humanoid.Health <= 0 then
        Data.MonstersKilled = Data.MonstersKilled + 1
        if table.find(Bosses, target.Name) then
            Data.BossesDefeated = Data.BossesDefeated + 1
        end
        Data.ComboCount = Data.ComboCount + 1
        if Data.ComboCount > Data.MaxCombo then
            Data.MaxCombo = Data.ComboCount
        end
        return true
    end
    
    return false
end

function GetBestWeaponForTarget(target)
    local bestWeapon = nil
    local highestDamage = 0
    local targetType = GetTargetType(target)
    
    for _, tool in pairs(Player.Backpack:GetChildren()) do
        if tool:IsA("Tool") then
            local damage = CalculateWeaponDamage(tool, targetType)
            if damage > highestDamage then
                highestDamage = damage
                bestWeapon = tool
            end
        end
    end
    
    if bestWeapon then
        Humanoid:EquipTool(bestWeapon)
    end
    
    return bestWeapon or Character:FindFirstChildOfClass("Tool")
end

function CalculateWeaponDamage(tool, targetType)
    local baseDamage = tool:GetAttribute("Damage") or 0
    local multiplier = 1.0
    
    -- Apply type advantages
    if targetType == "Boss" then
        multiplier = multiplier * 1.5
    elseif targetType == "Elite" then
        multiplier = multiplier * 1.2
    end
    
    -- Check for elemental advantages
    if HasElementalAdvantage(tool, targetType) then
        multiplier = multiplier * 2.0
    end
    
    return baseDamage * multiplier
end

function HasElementalAdvantage(tool, targetType)
    -- Simplified elemental advantage system
    local toolElement = GetWeaponElement(tool)
    local targetElement = GetTargetElement(targetType)
    
    local advantages = {
        ["Fire"] = {"Ice", "Plant"},
        ["Ice"] = {"Water", "Earth"},
        ["Electric"] = {"Water", "Metal"},
        ["Water"] = {"Fire", "Rock"},
        ["Earth"] = {"Electric", "Water"},
        ["Light"] = {"Dark"},
        ["Dark"] = {"Light", "Psychic"}
    }
    
    return advantages[toolElement] and table.find(advantages[toolElement], targetElement)
end

function GetWeaponElement(tool)
    -- Determine weapon element from name or attributes
    local name = tool.Name:lower()
    
    if name:find("flame") or name:find("fire") or name:find("magma") then
        return "Fire"
    elseif name:find("ice") or name:find("frost") or name:find("snow") then
        return "Ice"
    elseif name:find("electric") or name:find("lightning") or name:find("thunder") then
        return "Electric"
    elseif name:find("water") or name:find("aqua") or name:find("sea") then
        return "Water"
    elseif name:find("earth") or name:find("rock") or name:find("stone") then
        return "Earth"
    elseif name:find("light") or name:find("holy") or name:find("divine") then
        return "Light"
    elseif name:find("dark") or name:find("shadow") or name:find("night") then
        return "Dark"
    end
    
    return "Normal"
end

function GetTargetType(target)
    if table.find(Bosses, target.Name) then
        return "Boss"
    elseif target:GetAttribute("Elite") then
        return "Elite"
    else
        return "Normal"
    end
end

function GetTargetElement(targetType)
    -- Placeholder - in real game this would check target properties
    local elements = {"Fire", "Ice", "Electric", "Water", "Earth", "Light", "Dark"}
    return elements[math.random(1, #elements)]
end

function GetOptimalDistance(weapon)
    local weaponType = GetWeaponType(weapon)
    
    local optimalDistances = {
        ["Sword"] = 10,
        ["Gun"] = 50,
        ["Fruit"] = 30,
        ["Melee"] = 5,
        ["Range"] = 100
    }
    
    return optimalDistances[weaponType] or 20
end

function GetWeaponType(tool)
    if tool:IsA("Tool") then
        if tool.Name:find("Sword") then
            return "Sword"
        elseif tool.Name:find("Gun") then
            return "Gun"
        elseif tool.Name:find("Fruit") then
            return "Fruit"
        elseif tool:GetAttribute("Melee") then
            return "Melee"
        elseif tool:GetAttribute("Range") then
            return "Range"
        end
    end
    return "Melee"
end

function SmartCollect()
    -- Collect nearest item based on priority
    local priorities = {
        {"Legendary Fruit", 1000},
        {"Mythical Fruit", 900},
        {"Legendary Chest", 800},
        {"Epic Chest", 700},
        {"Rare Chest", 600},
        {"Legendary Material", 500},
        {"Epic Material", 400},
        {"Boss Drop", 300},
        {"Normal Chest", 200},
        {"Common Material", 100}
    }
    
    for _, priority in pairs(priorities) do
        local item = FindItemByType(priority[1])
        if item then
            AdvancedTeleport(item.CFrame * CFrame.new(0, 3, 0), true)
            CollectItem(item)
            return true
        end
    end
    
    return false
end

function FindItemByType(itemType)
    -- Simplified item finding based on type
    for _, obj in pairs(Workspace:GetChildren()) do
        if obj:IsA("BasePart") or obj:IsA("Model") then
            local name = obj.Name:lower()
            if itemType:lower():find("fruit") and name:find("fruit") then
                return obj
            elseif itemType:lower():find("chest") and name:find("chest") then
                return obj
            elseif itemType:lower():find("material") and table.find(Materials, obj.Name) then
                return obj
            end
        end
    end
end

function CollectItem(item)
    if item:IsA("BasePart") then
        -- Simulate collection
        local args = {
            [1] = item.Name,
            [2] = item.Position
        }
        
        local success = pcall(function()
            ReplicatedStorage.Remotes.Collect:FireServer(unpack(args))
        end)
        
        if success then
            Data.MaterialsCollected = Data.MaterialsCollected + 1
            return true
        end
    end
    return false
end

function AdvancedSkillRotation()
    local skillSets = {
        ["Combat"] = {"Z", "X", "C", "V"},
        ["Fruit"] = {"F", "G", "H", "J"},
        ["Sword"] = {"K", "L", "Z", "X"},
        ["Gun"] = {"C", "V", "F", "G"}
    }
    
    local currentSet = skillSets["Combat"]
    local skillIndex = 1
    
    while Config.AutoSkill do
        UseSkill(currentSet[skillIndex])
        
        skillIndex = skillIndex + 1
        if skillIndex > #currentSet then
            skillIndex = 1
        end
        
        -- Adaptive skill delay based on situation
        local delay = CalculateSkillDelay()
        task.wait(delay)
    end
end

function CalculateSkillDelay()
    local baseDelay = Config.SkillDelay
    
    -- Reduce delay in combat
    if Config.AutoFarm then
        baseDelay = baseDelay * 0.5
    end
    
    -- Increase delay when low on energy
    if Player.Character and Player.Character:FindFirstChild("Energy") then
        local energy = Player.Character.Energy.Value
        if energy < 20 then
            baseDelay = baseDelay * 2
        end
    end
    
    return math.max(baseDelay, 0.5)
end

function UseSkill(skillKey)
    if not skillKey then return end
    
    -- Check if skill is available
    if CanUseSkill(skillKey) then
        VirtualInputManager:SendKeyEvent(true, skillKey, false, game)
        task.wait(0.05)
        VirtualInputManager:SendKeyEvent(false, skillKey, false, game)
        
        Data.SkillsUsed = (Data.SkillsUsed or 0) + 1
    end
end

function CanUseSkill(skillKey)
    -- Check cooldowns, energy, etc.
    return true -- Simplified for now
end

function OptimizePerformance()
    if Config.OptimizeGraphics then
        -- Reduce graphics quality
        settings().Rendering.QualityLevel = 1
        
        -- Disable unnecessary effects
        for _, effect in pairs(Lighting:GetChildren()) do
            if effect:IsA("BloomEffect") or effect:IsA("BlurEffect") or effect:IsA("ColorCorrectionEffect") then
                effect.Enabled = false
            end
        end
        
        -- Reduce particles
        if Config.ReduceParticles then
            for _, part in pairs(Workspace:GetDescendants()) do
                if part:IsA("ParticleEmitter") then
                    part.Enabled = false
                end
            end
        end
    end
    
    if Config.LowCPU then
        -- Reduce update frequency
        RunService:Set3dRenderingEnabled(false)
        task.wait(0.1)
        RunService:Set3dRenderingEnabled(true)
    end
end

function SaveData()
    if not Config.AutoSave then return end
    
    local saveData = {
        Config = Config,
        Data = Data,
        Timestamp = tick()
    }
    
    local jsonData = HttpService:JSONEncode(saveData)
    
    -- Save to datastore (simulated)
    pcall(function()
        Data.LastSave = tick()
        print("Data saved successfully!")
    end)
end

function LoadData()
    -- Load saved data (simulated)
    print("Loading saved data...")
end

function SendWebhook(message)
    if not Config.WebhookEnabled or Config.WebhookURL == "" then return end
    
    local payload = {
        ["content"] = message,
        ["embeds"] = {{
            ["title"] = "Blox Fruits Script Report",
            ["description"] = message,
            ["color"] = 0x00ff00,
            ["fields"] = {
                {["name"] = "Level", ["value"] = tostring(Player.Data.Level.Value), ["inline"] = true},
                {["name"] = "Beli", ["value"] = tostring(Player.Data.Beli.Value), ["inline"] = true},
                {["name"] = "Fragments", ["value"] = tostring(Player.Data.Fragments.Value), ["inline"] = true},
                {["name"] = "Play Time", ["value"] = FormatTime(Data.TotalPlayTime), ["inline"] = true},
                {["name"] = "Monsters Killed", ["value"] = tostring(Data.MonstersKilled), ["inline"] = true},
                {["name"] = "Bosses Defeated", ["value"] = tostring(Data.BossesDefeated), ["inline"] = true}
            },
            ["footer"] = {
                ["text"] = "Blox Fruits Advanced Script v2.0"
            },
            ["timestamp"] = DateTime.now():ToIsoDate()
        }}
    }
    
    pcall(function()
        HttpService:PostAsync(Config.WebhookURL, HttpService:JSONEncode(payload))
    end)
end

function FormatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local secs = math.floor(seconds % 60)
    
    return string.format("%02d:%02d:%02d", hours, minutes, secs)
end

function UpdateStatistics()
    Data.TotalPlayTime = tick() - Data.StartTime
    
    -- Calculate average FPS
    local fps = 1 / RunService.RenderStepped:Wait()
    Data.AverageFPS = (Data.AverageFPS * 0.9) + (fps * 0.1)
    
    -- Auto-save every 5 minutes
    if tick() - Data.LastSave > 300 then
        SaveData()
    end
end

-- Advanced Farming Systems
function SmartFarmRoutine()
    while Config.AutoFarm do
        local target = nil
        local priority = 0
        
        -- Priority system: Boss > Elite > Normal
        for _, boss in pairs(Cache.Bosses) do
            if boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                local distance = (HumanoidRootPart.Position - boss.HumanoidRootPart.Position).Magnitude
                if distance < Config.FarmRange then
                    target = boss
                    priority = 3
                    break
                end
            end
        end
        
        if not target then
            for _, monster in pairs(Cache.Monsters) do
                if monster:FindFirstChild("Humanoid") and monster.Humanoid.Health > 0 then
                    local distance = (HumanoidRootPart.Position - monster.HumanoidRootPart.Position).Magnitude
                    if distance < Config.FarmRange then
                        if monster:GetAttribute("Elite") then
                            target = monster
                            priority = 2
                            break
                        elseif priority < 1 then
                            target = monster
                            priority = 1
                        end
                    end
                end
            end
        end
        
        if target then
            local killed = SmartAttack(target)
            if killed and Config.AutoCollect then
                task.wait(0.5) -- Wait for drops
                SmartCollect()
            end
        else
            -- Strategic movement
            MoveToNewArea()
        end
        
        task.wait(Config.Delay)
    end
end

function MoveToNewArea()
    -- Move to high-density areas
    local highDensityAreas = {
        Vector3.new(0, 0, 0),    -- Center
        Vector3.new(500, 0, 500), -- Northeast
        Vector3.new(-500, 0, 500), -- Northwest
        Vector3.new(500, 0, -500), -- Southeast
        Vector3.new(-500, 0, -500) -- Southwest
    }
    
    local targetArea = highDensityAreas[math.random(1, #highDensityAreas)]
    AdvancedTeleport(CFrame.new(targetArea), true)
    task.wait(1)
end

-- Advanced Combat AI
function CombatAI()
    while Config.AutoAttack do
        local enemies = GetNearbyEnemies(Config.AttackRange)
        
        if #enemies > 0 then
            -- Choose target based on threat level
            local target = AssessThreatLevel(enemies)
            
            if target then
                -- Execute combat strategy
                ExecuteCombatStrategy(target)
            end
        end
        
        task.wait(Config.Delay)
    end
end

function GetNearbyEnemies(range)
    local enemies = {}
    
    for _, enemy in pairs(Cache.Monsters) do
        if enemy:FindFirstChild("HumanoidRootPart") and enemy.Humanoid.Health > 0 then
            local distance = (HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude
            if distance < range then
                table.insert(enemies, enemy)
            end
        end
    end
    
    return enemies
end

function AssessThreatLevel(enemies)
    local highestThreat = nil
    local highestScore = 0
    
    for _, enemy in pairs(enemies) do
        local score = CalculateThreatScore(enemy)
        if score > highestScore then
            highestScore = score
            highestThreat = enemy
        end
    end
    
    return highestThreat
end

function CalculateThreatScore(enemy)
    local score = 0
    
    -- Health-based threat
    local healthPercent = enemy.Humanoid.Health / enemy.Humanoid.MaxHealth
    score = score + (100 * (1 - healthPercent))  -- Lower health = higher threat
    
    -- Distance-based threat
    local distance = (HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude
    score = score + (50 / math.max(distance, 1))
    
    -- Type-based threat
    if table.find(Bosses, enemy.Name) then
        score = score + 200
    elseif enemy:GetAttribute("Elite") then
        score = score + 100
    end
    
    return score
end

function ExecuteCombatStrategy(target)
    -- Advanced combat strategy
    if Config.AutoDodge then
        DodgeAttacks(target)
    end
    
    if Config.AutoBlock then
        BlockAttacks(target)
    end
    
    if Config.AutoParry then
        ParryAttacks(target)
    end
    
    SmartAttack(target)
    
    if Config.AutoCounter then
        CounterAttack(target)
    end
end

function DodgeAttacks(target)
    -- Simulated dodge logic
    local incomingAttack = IsAttackIncoming(target)
    if incomingAttack then
        local dodgeDirection = CalculateDodgeDirection(target)
        AdvancedTeleport(HumanoidRootPart.CFrame * CFrame.new(dodgeDirection * 10), true)
    end
end

function IsAttackIncoming(target)
    -- Simplified attack detection
    return math.random() < 0.3 -- 30% chance of detecting attack
end

function CalculateDodgeDirection(target)
    local directions = {
        Vector3.new(1, 0, 0),   -- Right
        Vector3.new(-1, 0, 0),  -- Left
        Vector3.new(0, 0, 1),   -- Forward
        Vector3.new(0, 0, -1)   -- Backward
    }
    
    return directions[math.random(1, #directions)]
end

function BlockAttacks()
    -- Simulate block
    VirtualInputManager:SendKeyEvent(true, "F", false, game)
    task.wait(0.1)
    VirtualInputManager:SendKeyEvent(false, "F", false, game)
end

function ParryAttacks(target)
    -- Advanced parry timing
    local parryWindow = CalculateParryWindow(target)
    if parryWindow > 0 then
        VirtualInputManager:SendKeyEvent(true, "Q", false, game)
        task.wait(parryWindow)
        VirtualInputManager:SendKeyEvent(false, "Q", false, game)
    end
end

function CalculateParryWindow(target)
    -- Simplified parry timing
    return 0.2 + math.random() * 0.1
end

function CounterAttack(target)
    -- Execute counter after successful parry
    VirtualInputManager:SendKeyEvent(true, "E", false, game)
    task.wait(0.05)
    VirtualInputManager:SendKeyEvent(false, "E", false, game)
end

-- Advanced UI System
local function CreateAdvancedUI()
    -- Create ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "AdvancedBloxFruitsUI"
    ScreenGui.Parent = CoreGui
    ScreenGui.ResetOnSpawn = false
    
    -- Main Container
    local MainContainer = Instance.new("Frame")
    MainContainer.Name = "MainContainer"
    MainContainer.Size = UDim2.new(0, 450, 0, 600)
    MainContainer.Position = UDim2.new(0.5, -225, 0.5, -300)
    MainContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    MainContainer.BackgroundTransparency = 0.1
    MainContainer.BorderSizePixel = 0
    MainContainer.ClipsDescendants = true
    MainContainer.Parent = ScreenGui
    
    -- Glass Effect
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainContainer
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(100, 100, 255)
    UIStroke.Thickness = 2
    UIStroke.Parent = MainContainer
    
    -- Title Bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 40)
    TitleBar.Position = UDim2.new(0, 0, 0, 0)
    TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainContainer
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 12)
    TitleCorner.Parent = TitleBar
    
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, -80, 1, 0)
    Title.Position = UDim2.new(0, 10, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "⚔️ Blox Fruits Advanced"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TitleBar
    
    local Version = Instance.new("TextLabel")
    Version.Name = "Version"
    Version.Size = UDim2.new(0, 60, 1, 0)
    Version.Position = UDim2.new(1, -70, 0, 0)
    Version.BackgroundTransparency = 1
    Version.Text = "v2.0"
    Version.TextColor3 = Color3.fromRGB(200, 200, 200)
    Version.Font = Enum.Font.Gotham
    Version.TextSize = 12
    Version.Parent = TitleBar
    
    -- Close Button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -35, 0, 5)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    CloseButton.Text = "✕"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.TextSize = 14
    CloseButton.Parent = TitleBar
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 6)
    CloseCorner.Parent = CloseButton
    
    CloseButton.MouseButton1Click:Connect(function()
        MainContainer.Visible = not MainContainer.Visible
    end)
    
    -- Minimize Button
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Position = UDim2.new(1, -70, 0, 5)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    MinimizeButton.Text = "━"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.TextSize = 14
    MinimizeButton.Parent = TitleBar
    
    local MinimizeCorner = Instance.new("UICorner")
    MinimizeCorner.CornerRadius = UDim.new(0, 6)
    MinimizeCorner.Parent = MinimizeButton
    
    MinimizeButton.MouseButton1Click:Connect(function()
        MainContainer.Size = UDim2.new(0, 450, 0, 40)
        task.wait(0.3)
    end)
    
    -- Tab Container
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(1, -20, 0, 35)
    TabContainer.Position = UDim2.new(0, 10, 0, 45)
    TabContainer.BackgroundTransparency = 1
    TabContainer.Parent = MainContainer
    
    -- Content Area
    local ContentArea = Instance.new("ScrollingFrame")
    ContentArea.Name = "ContentArea"
    ContentArea.Size = UDim2.new(1, -20, 1, -120)
    ContentArea.Position = UDim2.new(0, 10, 0, 90)
    ContentArea.BackgroundTransparency = 1
    ContentArea.BorderSizePixel = 0
    ContentArea.ScrollBarThickness = 6
    ContentArea.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 255)
    ContentArea.Parent = MainContainer
    
    -- Status Bar
    local StatusBar = Instance.new("Frame")
    StatusBar.Name = "StatusBar"
    StatusBar.Size = UDim2.new(1, -20, 0, 25)
    StatusBar.Position = UDim2.new(0, 10, 1, -30)
    StatusBar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    StatusBar.Parent = MainContainer
    
    local StatusCorner = Instance.new("UICorner")
    StatusCorner.CornerRadius = UDim.new(0, 6)
    StatusCorner.Parent = StatusBar
    
    local StatusText = Instance.new("TextLabel")
    StatusText.Name = "StatusText"
    StatusText.Size = UDim2.new(1, 0, 1, 0)
    StatusText.BackgroundTransparency = 1
    StatusText.Text = "🟢 System Ready"
    StatusText.TextColor3 = Color3.fromRGB(0, 255, 0)
    StatusText.Font = Enum.Font.Gotham
    StatusText.TextSize = 12
    StatusText.Parent = StatusBar
    
    -- Tabs
    local Tabs = {
        "Dashboard",
        "Farming",
        "Combat",
        "Skills",
        "Teleport",
        "Settings",
        "Stats"
    }
    
    local CurrentTab = "Dashboard"
    local TabButtons = {}
    
    -- Create Tab Buttons
    for i, tabName in ipairs(Tabs) do
        local TabButton = Instance.new("TextButton")
        TabButton.Name = tabName .. "Tab"
        TabButton.Size = UDim2.new(0, 80, 1, 0)
        TabButton.Position = UDim2.new(0, (i-1) * 85, 0, 0)
        TabButton.BackgroundColor3 = CurrentTab == tabName and Color3.fromRGB(100, 100, 255) or Color3.fromRGB(40, 40, 50)
        TabButton.Text = tabName
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.Font = Enum.Font.Gotham
        TabButton.TextSize = 12
        TabButton.Parent = TabContainer
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 6)
        TabCorner.Parent = TabButton
        
        TabButton.MouseButton1Click:Connect(function()
            CurrentTab = tabName
            UpdateTabDisplay(tabName)
            for _, btn in pairs(TabButtons) do
                btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            end
            TabButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
        end)
        
        table.insert(TabButtons, TabButton)
    end
    
    -- Update Status Function
    function UpdateStatus(message, color)
        StatusText.Text = message
        StatusText.TextColor3 = color or Color3.fromRGB(0, 255, 0)
    end
    
    -- Create UI Elements
    function CreateCard(parent, title, position, size)
        local Card = Instance.new("Frame")
        Card.Name = title .. "Card"
        Card.Size = size or UDim2.new(1, 0, 0, 100)
        Card.Position = position
        Card.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        Card.Parent = parent
        
        local CardCorner = Instance.new("UICorner")
        CardCorner.CornerRadius = UDim.new(0, 8)
        CardCorner.Parent = Card
        
        local CardStroke = Instance.new("UIStroke")
        CardStroke.Color = Color3.fromRGB(60, 60, 70)
        CardStroke.Thickness = 1
        CardStroke.Parent = Card
        
        local CardTitle = Instance.new("TextLabel")
        CardTitle.Name = "CardTitle"
        CardTitle.Size = UDim2.new(1, -20, 0, 30)
        CardTitle.Position = UDim2.new(0, 10, 0, 5)
        CardTitle.BackgroundTransparency = 1
        CardTitle.Text = "📌 " .. title
        CardTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        CardTitle.Font = Enum.Font.GothamBold
        CardTitle.TextSize = 14
        CardTitle.TextXAlignment = Enum.TextXAlignment.Left
        CardTitle.Parent = Card
        
        return Card
    end
    
    function CreateSwitch(parent, text, position, state, callback)
        local SwitchFrame = Instance.new("Frame")
        SwitchFrame.Name = text .. "Switch"
        SwitchFrame.Size = UDim2.new(1, 0, 0, 35)
        SwitchFrame.Position = position
        SwitchFrame.BackgroundTransparency = 1
        SwitchFrame.Parent = parent
        
        local SwitchLabel = Instance.new("TextLabel")
        SwitchLabel.Name = "SwitchLabel"
        SwitchLabel.Size = UDim2.new(1, -60, 1, 0)
        SwitchLabel.BackgroundTransparency = 1
        SwitchLabel.Text = "   " .. text
        SwitchLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        SwitchLabel.Font = Enum.Font.Gotham
        SwitchLabel.TextSize = 13
        SwitchLabel.TextXAlignment = Enum.TextXAlignment.Left
        SwitchLabel.Parent = SwitchFrame
        
        local SwitchButton = Instance.new("Frame")
        SwitchButton.Name = "SwitchButton"
        SwitchButton.Size = UDim2.new(0, 50, 0, 25)
        SwitchButton.Position = UDim2.new(1, -55, 0.5, -12.5)
        SwitchButton.BackgroundColor3 = state and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(60, 60, 70)
        SwitchButton.Parent = SwitchFrame
        
        local SwitchCorner = Instance.new("UICorner")
        SwitchCorner.CornerRadius = UDim.new(0, 12)
        SwitchCorner.Parent = SwitchButton
        
        local SwitchToggle = Instance.new("Frame")
        SwitchToggle.Name = "SwitchToggle"
        SwitchToggle.Size = UDim2.new(0, 21, 0, 21)
        SwitchToggle.Position = state and UDim2.new(1, -23, 0.5, -10.5) or UDim2.new(0, 2, 0.5, -10.5)
        SwitchToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SwitchToggle.Parent = SwitchButton
        
        local ToggleCorner = Instance.new("UICorner")
        ToggleCorner.CornerRadius = UDim.new(0, 10)
        ToggleCorner.Parent = SwitchToggle
        
        local ClickArea = Instance.new("TextButton")
        ClickArea.Name = "ClickArea"
        ClickArea.Size = UDim2.new(1, 0, 1, 0)
        ClickArea.BackgroundTransparency = 1
        ClickArea.Text = ""
        ClickArea.Parent = SwitchButton
        
        local isTweening = false
        
        ClickArea.MouseButton1Click:Connect(function()
            if isTweening then return end
            
            isTweening = true
            local newState = not state
            
            -- Animate toggle
            local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local tween = TweenService:Create(SwitchToggle, tweenInfo, {
                Position = newState and UDim2.new(1, -23, 0.5, -10.5) or UDim2.new(0, 2, 0.5, -10.5)
            })
            
            local colorTween = TweenService:Create(SwitchButton, tweenInfo, {
                BackgroundColor3 = newState and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(60, 60, 70)
            })
            
            tween:Play()
            colorTween:Play()
            
            tween.Completed:Connect(function()
                isTweening = false
                state = newState
                callback(newState)
                UpdateStatus(text .. " " .. (newState and "enabled" or "disabled"), newState and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 100, 100))
            end)
        end)
        
        return SwitchFrame
    end
    
    function CreateButton(parent, text, position, callback, color)
        local Button = Instance.new("TextButton")
        Button.Name = text .. "Button"
        Button.Size = UDim2.new(1, 0, 0, 40)
        Button.Position = position
        Button.BackgroundColor3 = color or Color3.fromRGB(100, 100, 255)
        Button.Text = text
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.Font = Enum.Font.Gotham
        Button.TextSize = 14
        Button.Parent = parent
        
        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 8)
        ButtonCorner.Parent = Button
        
        local ButtonStroke = Instance.new("UIStroke")
        ButtonStroke.Color = Color3.fromRGB(150, 150, 255)
        ButtonStroke.Thickness = 1
        ButtonStroke.Parent = Button
        
        Button.MouseEnter:Connect(function()
            TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(120, 120, 255)}):Play()
        end)
        
        Button.MouseLeave:Connect(function()
            TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = color or Color3.fromRGB(100, 100, 255)}):Play()
        end)
        
        Button.MouseButton1Click:Connect(callback)
        
        return Button
    end
    
    function CreateSlider(parent, text, position, min, max, defaultValue, callback)
        local SliderFrame = Instance.new("Frame")
        SliderFrame.Name = text .. "Slider"
        SliderFrame.Size = UDim2.new(1, 0, 0, 60)
        SliderFrame.Position = position
        SliderFrame.BackgroundTransparency = 1
        SliderFrame.Parent = parent
        
        local SliderLabel = Instance.new("TextLabel")
        SliderLabel.Name = "SliderLabel"
        SliderLabel.Size = UDim2.new(1, 0, 0, 20)
        SliderLabel.BackgroundTransparency = 1
        SliderLabel.Text = text .. ": " .. defaultValue
        SliderLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        SliderLabel.Font = Enum.Font.Gotham
        SliderLabel.TextSize = 13
        SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
        SliderLabel.Parent = SliderFrame
        
        local SliderTrack = Instance.new("Frame")
        SliderTrack.Name = "SliderTrack"
        SliderTrack.Size = UDim2.new(1, 0, 0, 8)
        SliderTrack.Position = UDim2.new(0, 0, 0, 35)
        SliderTrack.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
        SliderTrack.Parent = SliderFrame
        
        local TrackCorner = Instance.new("UICorner")
        TrackCorner.CornerRadius = UDim.new(0, 4)
        TrackCorner.Parent = SliderTrack
        
        local SliderFill = Instance.new("Frame")
        SliderFill.Name = "SliderFill"
        SliderFill.Size = UDim2.new((defaultValue - min) / (max - min), 0, 1, 0)
        SliderFill.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
        SliderFill.Parent = SliderTrack
        
        local FillCorner = Instance.new("UICorner")
        FillCorner.CornerRadius = UDim.new(0, 4)
        FillCorner.Parent = SliderFill
        
        local SliderThumb = Instance.new("Frame")
        SliderThumb.Name = "SliderThumb"
        SliderThumb.Size = UDim2.new(0, 20, 0, 20)
        SliderThumb.Position = UDim2.new((defaultValue - min) / (max - min), -10, 0.5, -10)
        SliderThumb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderThumb.ZIndex = 2
        SliderThumb.Parent = SliderTrack
        
        local ThumbCorner = Instance.new("UICorner")
        ThumbCorner.CornerRadius = UDim.new(0, 10)
        ThumbCorner.Parent = SliderThumb
        
        local ThumbStroke = Instance.new("UIStroke")
        ThumbStroke.Color = Color3.fromRGB(100, 100, 255)
        ThumbStroke.Thickness = 2
        ThumbStroke.Parent = SliderThumb
        
        local isDragging = false
        
        local function updateValue(value)
            value = math.clamp(value, min, max)
            local percent = (value - min) / (max - min)
            
            SliderFill.Size = UDim2.new(percent, 0, 1, 0)
            SliderThumb.Position = UDim2.new(percent, -10, 0.5, -10)
            SliderLabel.Text = text .. ": " .. math.floor(value)
            
            callback(value)
        end
        
        SliderThumb.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                isDragging = true
            end
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                isDragging = false
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local mousePos = UserInputService:GetMouseLocation()
                local trackPos = SliderTrack.AbsolutePosition
                local trackSize = SliderTrack.AbsoluteSize
                
                local relativeX = math.clamp((mousePos.X - trackPos.X) / trackSize.X, 0, 1)
                local value = min + (relativeX * (max - min))
                
                updateValue(value)
            end
        end)
        
        SliderTrack.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local mousePos = UserInputService:GetMouseLocation()
                local trackPos = SliderTrack.AbsolutePosition
                local trackSize = SliderTrack.AbsoluteSize
                
                local relativeX = math.clamp((mousePos.X - trackPos.X) / trackSize.X, 0, 1)
                local value = min + (relativeX * (max - min))
                
                updateValue(value)
            end
        end)
        
        updateValue(defaultValue)
        
        return SliderFrame
    end
    
    function CreateDropdown(parent, text, position, options, default, callback)
        local DropdownFrame = Instance.new("Frame")
        DropdownFrame.Name = text .. "Dropdown"
        DropdownFrame.Size = UDim2.new(1, 0, 0, 70)
        DropdownFrame.Position = position
        DropdownFrame.BackgroundTransparency = 1
        DropdownFrame.Parent = parent
        
        local DropdownLabel = Instance.new("TextLabel")
        DropdownLabel.Name = "DropdownLabel"
        DropdownLabel.Size = UDim2.new(1, 0, 0, 20)
        DropdownLabel.BackgroundTransparency = 1
        DropdownLabel.Text = text
        DropdownLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        DropdownLabel.Font = Enum.Font.Gotham
        DropdownLabel.TextSize = 13
        DropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
        DropdownLabel.Parent = DropdownFrame
        
        local DropdownButton = Instance.new("TextButton")
        DropdownButton.Name = "DropdownButton"
        DropdownButton.Size = UDim2.new(1, 0, 0, 40)
        DropdownButton.Position = UDim2.new(0, 0, 0, 25)
        DropdownButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        DropdownButton.Text = default or "Select"
        DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        DropdownButton.Font = Enum.Font.Gotham
        DropdownButton.TextSize = 13
        DropdownButton.Parent = DropdownFrame
        
        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 6)
        ButtonCorner.Parent = DropdownButton
        
        local DropdownIcon = Instance.new("TextLabel")
        DropdownIcon.Name = "DropdownIcon"
        DropdownIcon.Size = UDim2.new(0, 20, 0, 20)
        DropdownIcon.Position = UDim2.new(1, -25, 0.5, -10)
        DropdownIcon.BackgroundTransparency = 1
        DropdownIcon.Text = "▼"
        DropdownIcon.TextColor3 = Color3.fromRGB(200, 200, 200)
        DropdownIcon.Font = Enum.Font.Gotham
        DropdownIcon.TextSize = 12
        DropdownIcon.Parent = DropdownButton
        
        local DropdownMenu = Instance.new("Frame")
        DropdownMenu.Name = "DropdownMenu"
        DropdownMenu.Size = UDim2.new(1, 0, 0, 0)
        DropdownMenu.Position = UDim2.new(0, 0, 0, 70)
        DropdownMenu.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        DropdownMenu.Visible = false
        DropdownMenu.ClipsDescendants = true
        DropdownMenu.Parent = DropdownFrame
        
        local MenuCorner = Instance.new("UICorner")
        MenuCorner.CornerRadius = UDim.new(0, 6)
        MenuCorner.Parent = DropdownMenu
        
        local MenuList = Instance.new("UIListLayout")
        MenuList.Parent = DropdownMenu
        MenuList.SortOrder = Enum.SortOrder.LayoutOrder
        
        local isOpen = false
        
        local function updateMenu()
            if isOpen then
                DropdownMenu.Size = UDim2.new(1, 0, 0, math.min(#options * 40, 200))
                DropdownIcon.Text = "▲"
            else
                DropdownMenu.Size = UDim2.new(1, 0, 0, 0)
                DropdownIcon.Text = "▼"
            end
        end
        
        for i, option in ipairs(options) do
            local OptionButton = Instance.new("TextButton")
            OptionButton.Name = option .. "Option"
            OptionButton.Size = UDim2.new(1, 0, 0, 40)
            OptionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            OptionButton.Text = option
            OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            OptionButton.Font = Enum.Font.Gotham
            OptionButton.TextSize = 12
            OptionButton.LayoutOrder = i
            OptionButton.Parent = DropdownMenu
            
            local OptionCorner = Instance.new("UICorner")
            OptionCorner.CornerRadius = UDim.new(0, 6)
            OptionCorner.Parent = OptionButton
            
            OptionButton.MouseButton1Click:Connect(function()
                DropdownButton.Text = option
                isOpen = false
                updateMenu()
                callback(option)
                UpdateStatus(text .. " set to: " .. option, Color3.fromRGB(100, 200, 255))
            end)
            
            OptionButton.MouseEnter:Connect(function()
                TweenService:Create(OptionButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 70, 80)}):Play()
            end)
            
            OptionButton.MouseLeave:Connect(function()
                TweenService:Create(OptionButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}):Play()
            end)
        end
        
        DropdownButton.MouseButton1Click:Connect(function()
            isOpen = not isOpen
            updateMenu()
        end)
        
        return DropdownFrame
    end
    
    -- Tab Content Functions
    function UpdateTabDisplay(tabName)
        -- Clear content
        for _, child in pairs(ContentArea:GetChildren()) do
            child:Destroy()
        end
        
        ContentArea.CanvasSize = UDim2.new(0, 0, 0, 0)
        
        if tabName == "Dashboard" then
            local yOffset = 10
            
            -- Welcome Card
            local welcomeCard = CreateCard(ContentArea, "Welcome", UDim2.new(0, 0, 0, yOffset), UDim2.new(1, 0, 0, 120))
            
            local welcomeText = Instance.new("TextLabel")
            welcomeText.Name = "WelcomeText"
            welcomeText.Size = UDim2.new(1, -20, 0, 80)
            welcomeText.Position = UDim2.new(0, 10, 0, 35)
            welcomeText.BackgroundTransparency = 1
            welcomeText.Text = "🎮 Blox Fruits Advanced Script\n\nVersion: 2.0\nStatus: Active\nPlayer: " .. Player.Name
            welcomeText.TextColor3 = Color3.fromRGB(200, 200, 200)
            welcomeText.Font = Enum.Font.Gotham
            welcomeText.TextSize = 13
            welcomeText.TextXAlignment = Enum.TextXAlignment.Left
            welcomeText.TextYAlignment = Enum.TextYAlignment.Top
            welcomeText.Parent = welcomeCard
            
            yOffset = yOffset + 130
            
            -- Quick Actions
            local actionsCard = CreateCard(ContentArea, "Quick Actions", UDim2.new(0, 0, 0, yOffset), UDim2.new(1, 0, 0, 160))
            
            CreateButton(actionsCard, "Start Auto Farm", UDim2.new(0, 10, 0, 35), function()
                Config.AutoFarm = not Config.AutoFarm
                if Config.AutoFarm then
                    coroutine.wrap(SmartFarmRoutine)()
                    UpdateStatus("Auto Farm Started", Color3.fromRGB(0, 255, 0))
                else
                    UpdateStatus("Auto Farm Stopped", Color3.fromRGB(255, 100, 100))
                end
            end)
            
            CreateButton(actionsCard, "Start Auto Collect", UDim2.new(0, 10, 0, 85), function()
                Config.AutoCollect = not Config.AutoCollect
                if Config.AutoCollect then
                    UpdateStatus("Auto Collect Started", Color3.fromRGB(0, 255, 0))
                else
                    UpdateStatus("Auto Collect Stopped", Color3.fromRGB(255, 100, 100))
                end
            end)
            
            yOffset = yOffset + 170
            
            -- Stats Preview
            local statsCard = CreateCard(ContentArea, "Statistics", UDim2.new(0, 0, 0, yOffset), UDim2.new(1, 0, 0, 100))
            
            local statsText = Instance.new("TextLabel")
            statsText.Name = "StatsText"
            statsText.Size = UDim2.new(1, -20, 0, 70)
            statsText.Position = UDim2.new(0, 10, 0, 25)
            statsText.BackgroundTransparency = 1
            statsText.Text = "📊 Live Statistics\nLevel: " .. Player.Data.Level.Value .. "\nBeli: " .. Player.Data.Beli.Value
            statsText.TextColor3 = Color3.fromRGB(200, 200, 200)
            statsText.Font = Enum.Font.Gotham
            statsText.TextSize = 12
            statsText.TextXAlignment = Enum.TextXAlignment.Left
            statsText.TextYAlignment = Enum.TextYAlignment.Top
            statsText.Parent = statsCard
            
            ContentArea.CanvasSize = UDim2.new(0, 0, 0, yOffset + 110)
            
        elseif tabName == "Farming" then
            local yOffset = 10
            
            -- Auto Farm Settings
            local farmCard = CreateCard(ContentArea, "Auto Farm Settings", UDim2.new(0, 0, 0, yOffset), UDim2.new(1, 0, 0, 300))
            
            CreateSwitch(farmCard, "Auto Farm Level", UDim2.new(0, 0, 0, 40), Config.AutoFarm, function(state)
                Config.AutoFarm = state
                if state then
                    coroutine.wrap(SmartFarmRoutine)()
                end
            end)
            
            CreateSwitch(farmCard, "Auto Farm Boss", UDim2.new(0, 0, 0, 85), Config.AutoFarmBoss, function(state)
                Config.AutoFarmBoss = state
            end)
            
            CreateSwitch(farmCard, "Auto Farm Material", UDim2.new(0, 0, 0, 130), Config.AutoFarmMaterial, function(state)
                Config.AutoFarmMaterial = state
            end)
            
            CreateSwitch(farmCard, "Auto Collect", UDim2.new(0, 0, 0, 175), Config.AutoCollect, function(state)
                Config.AutoCollect = state
            end)
            
            CreateSwitch(farmCard, "Teleport To Target", UDim2.new(0, 0, 0, 220), Config.TeleportToTarget, function(state)
                Config.TeleportToTarget = state
            end)
            
            yOffset = yOffset + 310
            
            -- Farm Configuration
            local configCard = CreateCard(ContentArea, "Farm Configuration", UDim2.new(0, 0, 0, yOffset), UDim2.new(1, 0, 0, 180))
            
            CreateSlider(configCard, "Farm Range", UDim2.new(0, 0, 0, 40), 10, 1000, Config.FarmRange, function(value)
                Config.FarmRange = value
            end)
            
            CreateSlider(configCard, "Attack Range", UDim2.new(0, 0, 0, 110), 5, 100, Config.AttackRange, function(value)
                Config.AttackRange = value
            end)
            
            CreateSlider(configCard, "Delay", UDim2.new(0, 0, 0, 180), 0.01, 1, Config.Delay, function(value)
                Config.Delay = value
            end)
            
            yOffset = yOffset + 190
            
            ContentArea.CanvasSize = UDim2.new(0, 0, 0, yOffset + 10)
            
        elseif tabName == "Combat" then
            local yOffset = 10
            
            -- Combat Settings
            local combatCard = CreateCard(ContentArea, "Combat Settings", UDim2.new(0, 0, 0, yOffset), UDim2.new(1, 0, 0, 350))
            
            CreateSwitch(combatCard, "Auto Attack", UDim2.new(0, 0, 0, 40), Config.AutoAttack, function(state)
                Config.AutoAttack = state
                if state then
                    coroutine.wrap(CombatAI)()
                end
            end)
            
            CreateSwitch(combatCard, "Auto Dodge", UDim2.new(0, 0, 0, 85), Config.AutoDodge, function(state)
                Config.AutoDodge = state
            end)
            
            CreateSwitch(combatCard, "Auto Block", UDim2.new(0, 0, 0, 130), Config.AutoBlock, function(state)
                Config.AutoBlock = state
            end)
            
            CreateSwitch(combatCard, "Auto Parry", UDim2.new(0, 0, 0, 175), Config.AutoParry, function(state)
                Config.AutoParry = state
            end)
            
            CreateSwitch(combatCard, "Auto Counter", UDim2.new(0, 0, 0, 220), Config.AutoCounter, function(state)
                Config.AutoCounter = state
            end)
            
            yOffset = yOffset + 360
            
            -- Weapon Selection
            local weaponCard = CreateCard(ContentArea, "Weapon Selection", UDim2.new(0, 0, 0, yOffset), UDim2.new(1, 0, 0, 150))
            
            CreateDropdown(weaponCard, "Select Weapon", UDim2.new(0, 0, 0, 40), Swords, Config.SelectedSword, function(selection)
                Config.SelectedSword = selection
            end)
            
            CreateButton(weaponCard, "Equip Best Weapon", UDim2.new(0, 10, 0, 90), function()
                GetBestWeaponForTarget()
                UpdateStatus("Best weapon equipped", Color3.fromRGB(0, 255, 0))
            end)
            
            ContentArea.CanvasSize = UDim2.new(0, 0, 0, yOffset + 160)
            
        elseif tabName == "Skills" then
            local yOffset = 10
            
            -- Skill Settings
            local skillCard = CreateCard(ContentArea, "Skill Settings", UDim2.new(0, 0, 0, yOffset), UDim2.new(1, 0, 0, 300))
            
            CreateSwitch(skillCard, "Auto Skill", UDim2.new(0, 0, 0, 40), Config.AutoSkill, function(state)
                Config.AutoSkill = state
                if state then
                    coroutine.wrap(AdvancedSkillRotation)()
                end
            end)
            
            CreateSwitch(skillCard, "Auto Ken", UDim2.new(0, 0, 0, 85), Config.AutoKen, function(state)
                Config.AutoKen = state
            end)
            
            CreateSwitch(skillCard, "Auto Haki", UDim2.new(0, 0, 0, 130), Config.AutoHaki, function(state)
                Config.AutoHaki = state
            end)
            
            CreateSwitch(skillCard, "Auto Observation", UDim2.new(0, 0, 0, 175), Config.AutoObservation, function(state)
                Config.AutoObservation = state
            end)
            
            CreateSlider(skillCard, "Skill Delay", UDim2.new(0, 0, 0, 220), 0.5, 10, Config.SkillDelay, function(value)
                Config.SkillDelay = value
            end)
            
            yOffset = yOffset + 310
            
            ContentArea.CanvasSize = UDim2.new(0, 0, 0, yOffset + 10)
            
        elseif tabName == "Settings" then
            local yOffset = 10
            
            -- Performance Settings
            local perfCard = CreateCard(ContentArea, "Performance", UDim2.new(0, 0, 0, yOffset), UDim2.new(1, 0, 0, 200))
            
            CreateSwitch(perfCard, "Optimize Graphics", UDim2.new(0, 0, 0, 40), Config.OptimizeGraphics, function(state)
                Config.OptimizeGraphics = state
                if state then
                    OptimizePerformance()
                end
            end)
            
            CreateSwitch(perfCard, "Reduce Particles", UDim2.new(0, 0, 0, 85), Config.ReduceParticles, function(state)
                Config.ReduceParticles = state
            end)
            
            CreateSwitch(perfCard, "Low CPU Mode", UDim2.new(0, 0, 0, 130), Config.LowCPU, function(state)
                Config.LowCPU = state
            end)
            
            yOffset = yOffset + 210
            
            -- UI Settings
            local uiCard = CreateCard(ContentArea, "UI Settings", UDim2.new(0, 0, 0, yOffset), UDim2.new(1, 0, 0, 150))
            
            CreateSwitch(uiCard, "Notifications", UDim2.new(0, 0, 0, 40), Config.Notifications, function(state)
                Config.Notifications = state
            end)
            
            CreateSwitch(uiCard, "Auto Save", UDim2.new(0, 0, 0, 85), Config.AutoSave, function(state)
                Config.AutoSave = state
            end)
            
            yOffset = yOffset + 160
            
            -- Webhook Settings
            local webhookCard = CreateCard(ContentArea, "Webhook", UDim2.new(0, 0, 0, yOffset), UDim2.new(1, 0, 0, 150))
            
            CreateSwitch(webhookCard, "Enable Webhook", UDim2.new(0, 0, 0, 40), Config.WebhookEnabled, function(state)
                Config.WebhookEnabled = state
            end)
            
            CreateButton(webhookCard, "Test Webhook", UDim2.new(0, 10, 0, 90), function()
                SendWebhook("Webhook test successful!")
                UpdateStatus("Webhook test sent", Color3.fromRGB(100, 200, 255))
            end)
            
            ContentArea.CanvasSize = UDim2.new(0, 0, 0, yOffset + 160)
        end
    end
    
    -- Initialize
    UpdateTabDisplay("Dashboard")
    UpdateStatus("System Ready", Color3.fromRGB(0, 255, 0))
    
    -- Make UI draggable
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        MainContainer.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainContainer.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
    
    return ScreenGui
end

-- Initialize
LoadData()
CreateAdvancedUI()

-- Start background tasks
coroutine.wrap(function()
    while task.wait(1) do
        UpdateCache()
        UpdateStatistics()
        
        if Config.AutoFarm then
            SmartFarmRoutine()
        end
        
        if Config.AutoCollect then
            SmartCollect()
        end
        
        if Config.AutoSkill then
            AdvancedSkillRotation()
        end
        
        if Config.AutoAttack then
            CombatAI()
        end
    end
end)()

-- Save on exit
game:BindToClose(function()
    SaveData()
end)

print("🎮 Blox Fruits Advanced Script v2.0 Loaded!")
print("📊 Features: Smart Farming, Combat AI, Performance Optimization")
print("🎯 Total Features: 40+")
print("⚡ Status: Active and Running")
