-- Server-side handler for dialog-triggered actions
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Modules
local StarProperties = require(ReplicatedStorage.Model.Star.StarProperties)
local AchievementFunctions = require(ReplicatedStorage.AchievementSystemReplicatedStorage.AchievementFunctions)
local StarVisibility = require(ReplicatedStorage.Shared.StarVisibility)
local StarSphere = require(ReplicatedStorage.Shared.StarSphere)
local DEBUG = require(ReplicatedStorage.Constant).DEBUG

local GodDialogAction = ReplicatedStorage.DialogModule:WaitForChild("GodDialogAction")
local GodDialogReply = ReplicatedStorage.DialogModule:WaitForChild("GodDialogReply")
local AnnouncementEvent = ReplicatedStorage:WaitForChild("AnnouncementEvent")
local sunTemplate = ReplicatedStorage:FindFirstChild("Model") and ReplicatedStorage.Model:FindFirstChild("Star")
local rand = Random.new()

-- Try to require the constellations mapping module from a few known locations
local function requireConstellationsModule(): any?
    local shared = ReplicatedStorage:FindFirstChild("Shared")
    if not shared then return nil end

    local candidates: {Instance?} = {}
    local folderA = shared:FindFirstChild("constellations")
    if folderA then
        table.insert(candidates, folderA:FindFirstChild("constellationsModuleScript"))
    end
    local folderB = shared:FindFirstChild("constellation")
    if folderB then
        table.insert(candidates, folderB:FindFirstChild("constellation"))
    end

    for _, mod in ipairs(candidates) do
        if mod and mod:IsA("ModuleScript") then
            local ok, res = pcall(function()
                return require(mod)
            end)
            if ok and typeof(res) == "table" then
                return res
            end
        end
    end
    return nil
end

local function CreateStar(player, args)
    if sunTemplate then
        local Star = sunTemplate:Clone()        
        local props = StarProperties.assignProperties(args.atomicMassSpent)
        local sizeRatio = props.sizeRatio

        Star.Color = props.color
        Star.Size = Star.Size * sizeRatio
        
        local x = rand:NextNumber(-200, 200)
        local y = Star.Size.Y / 2
        local z = rand:NextNumber(-200, 200)

        while math.abs(x) < Star.Size.X / 2 and math.abs(z) < Star.Size.Z / x do
            x = rand:NextNumber(-200, 200)
            z = rand:NextNumber(-200, 200)
        end

        Star:SetAttribute("class", props.class)
        Star:SetAttribute("mass", props.mass)
        Star:SetAttribute("sizeRatio", sizeRatio)
        Star:SetAttribute("lifetime", props.lifetime)
        Star:SetAttribute("maxPulses", props.maxPulses)
        Star:SetAttribute("minAtoms", props.minAtoms)
        Star:SetAttribute("maxAtoms", props.maxAtoms)

        local textColor = props.textColor:ToHex()
        Star.Position = Vector3.new(x, y, z)
        Star.Parent = Workspace.SpawnedItems.Stars

		local starInfo = AchievementFunctions.SelectRandomStarByMassAndAward(props.mass)

        if starInfo ~= nil then
            local baseText = player.Name .. " Created '" .. starInfo.star .. "' from " .. starInfo.constellation .. " ! (Class: " .. props.class .. ")"
            local announcementMessage = string.format("<font color=\"#%s\">%s</font>", textColor, baseText)
            AnnouncementEvent:FireAllClients(announcementMessage, 8)
        end

        local baseText = "A new star has been created! Class:"
        local replyMessage = string.format("<font color=\"#%s\">%s %s</font>", textColor, baseText, props.class)
        GodDialogReply:FireClient(player, replyMessage)

        -- Update star visibility for all clients after creation
		StarVisibility.ServerShowOnlyUnionAchieved()
		StarVisibility.ShowOnlyUnionAchieved(player)
    else
        GodDialogReply:FireClient(player, "Could not find the Sun template.")
    end
end

local function CreateWelcomeStar(player)
    local sizeRatio = 1.5

    if sunTemplate then
        local Star = sunTemplate:Clone()
        local props = {
            class = "M",
            mass = 0.25,
            color = StarProperties.CLASSES[7].color,
            sizeRatio = sizeRatio,
            maxPulses = 1,
            lifetime = not DEBUG and 8 or 0,
            minAtoms = 10,
            maxAtoms = 10,
            maxScale = 1.8,
            maxScaleStep = 1.5,
        }

        Star.Color = props.color
        Star.Size = Vector3.new(12.604*sizeRatio, 12.604*sizeRatio, 12.604*sizeRatio)

        Star:SetAttribute("class", props.class)
        Star:SetAttribute("mass", props.mass)
        Star:SetAttribute("sizeRatio", props.sizeRatio)
        Star:SetAttribute("lifetime", props.lifetime)
        Star:SetAttribute("maxPulses", props.maxPulses)
        Star:SetAttribute("minAtoms", props.minAtoms)
        Star:SetAttribute("maxAtoms", props.maxAtoms)
        Star:SetAttribute("maxScale", props.maxScale)
        Star:SetAttribute("maxScaleStep", props.maxScaleStep)

        Star.Position = Vector3.new(39, 6.302*sizeRatio, -11)
        Star.Parent = Workspace.SpawnedItems.Stars

        GodDialogReply:FireClient(player, "Welcome to my Universe!")
    end
end

local function CreateFixedStar(player, args)
    if not args.starKey or not sunTemplate then
        GodDialogReply:FireClient(player, "Invalid star key or missing template.")
        return
    end

    -- Parse starKey format: "[constellation]/[starName]"
    local parts = {}
    for part in string.gmatch(args.starKey, "[^/]+") do
        table.insert(parts, part)
    end
    
    if #parts ~= 2 then
        GodDialogReply:FireClient(player, "Invalid star key format. Expected: [constellation]/[starName]")
        return
    end
    
    local constellationName = parts[1]
    local starName = parts[2]
    
    -- Load constellations mapping module
    local constellations = requireConstellationsModule()
    if not constellations or not constellations[constellationName] then
        GodDialogReply:FireClient(player, "Constellation not found: " .. constellationName)
        return
    end
    
    local constellationData = constellations[constellationName]
    if not constellationData.csv then
        GodDialogReply:FireClient(player, "No data found for constellation: " .. constellationName)
        return
    end
    
    -- Parse CSV to find the star
    local lines = {}
    for line in string.gmatch(constellationData.csv, "([^\n]+)") do
        table.insert(lines, line)
    end
    
    if #lines < 2 then
        GodDialogReply:FireClient(player, "Invalid constellation data format")
        return
    end
    
    -- Parse header
    local headerFields = StarSphere.parseCsvLine(lines[1])
    local nameIdx = StarSphere.indexOf(headerFields, "Name")
    local spClassIdx = StarSphere.indexOf(headerFields, "Sp. class")
    local spectralTypeIdx = StarSphere.indexOf(headerFields, "Spectral type")
    local massIdx = StarSphere.indexOf(headerFields, "Mass")
    local radiusIdx = StarSphere.indexOf(headerFields, "Radius")
    
    if not nameIdx then
        GodDialogReply:FireClient(player, "Missing Name column in constellation data")
        return
    end
    
    -- Find the star in the CSV
    local starData = nil
    for i = 2, #lines do
        local row = StarSphere.parseCsvLine(lines[i])
        if row[nameIdx] and row[nameIdx] == starName then
            starData = row
            break
        end
    end
    
    if not starData then
        GodDialogReply:FireClient(player, "Star not found: " .. starName .. " in " .. constellationName)
        return
    end
    
    -- Extract star properties
    local spClass = spClassIdx and starData[spClassIdx] or nil
    local spectralType = spectralTypeIdx and starData[spectralTypeIdx] or nil
    local massStr = massIdx and starData[massIdx] or nil
    local radiusStr = radiusIdx and starData[radiusIdx] or nil
    
    -- Parse spectral class to get the first letter
    local spectralClass = StarSphere.parseSpectralFirstLetter(spClass) or StarSphere.parseSpectralFirstLetter(spectralType)
    if not spectralClass then
        GodDialogReply:FireClient(player, "Could not determine spectral class for star")
        return
    end
    
    -- Get properties from StarProperties based on spectral class
    local classIndex = StarProperties.CLASS_IDS[spectralClass]
    if not classIndex then
        GodDialogReply:FireClient(player, "Unknown spectral class: " .. spectralClass)
        return
    end
    
    local classData = StarProperties.CLASSES[classIndex]
    if not classData then
        GodDialogReply:FireClient(player, "No data found for spectral class: " .. spectralClass)
        return
    end
    
    -- Parse mass and radius
    local mass = 0.5 -- default
    if massStr then
        local massMatch = string.match(massStr, "([%d%.]+)")
        if massMatch then
            mass = tonumber(massMatch) or 0.5
        end
    end
    
    local sizeRatio = classData.sizeRange[1] -- default from class
    if radiusStr then
        local radiusValue = StarSphere.parseRadiusValue(radiusStr)
        if radiusValue then
            sizeRatio = radiusValue * 2 / 3
        end
	end
    
    -- Create star with extracted properties
    local Star = sunTemplate:Clone()
    Star.Color = classData.color
    Star.Size = Star.Size * sizeRatio
    
    -- Random position (same logic as CreateStar)
    local x = rand:NextNumber(-500, 500)
    local y = Star.Size.Y / 2
    local z = rand:NextNumber(-500, 500)

    while math.abs(x) < Star.Size.X / 2 and math.abs(z) < Star.Size.Z / 2 do
        x = rand:NextNumber(-500, 500)
        z = rand:NextNumber(-500, 500)
    end
    
    -- Set attributes
    Star:SetAttribute("class", spectralClass)
    Star:SetAttribute("mass", mass)
    Star:SetAttribute("sizeRatio", sizeRatio)
    Star:SetAttribute("lifetime", classData.lifetime[1])
    Star:SetAttribute("maxPulses", classData.maxPulses)
    Star:SetAttribute("minAtoms", classData.minAtoms)
	Star:SetAttribute("maxAtoms", classData.maxAtoms)
    
    local textColor = classData.textColor:ToHex()
    Star.Position = Vector3.new(x, y, z)
	Star.Parent = Workspace.SpawnedItems.Stars
	
	AchievementFunctions.AwardAchievement(player, args.starKey)
    
    -- Announcement
    local baseText = player.Name .. " Created '" .. starName .. "' from " .. constellationName .. " ! (Class: " .. spectralClass .. ")"
    local announcementMessage = string.format("<font color=\"#%s\">%s</font>", textColor, baseText)
    AnnouncementEvent:FireAllClients(announcementMessage, 8)
    
    local replyText = "A fixed star has been created! Class: " .. spectralClass
    local replyMessage = string.format("<font color=\"#%s\">%s</font>", textColor, replyText)
    GodDialogReply:FireClient(player, replyMessage)
    
    -- Update star visibility for all clients after creation
    StarVisibility.ServerShowOnlyUnionAchieved()
	StarVisibility.ShowOnlyUnionAchieved(player)
end

GodDialogAction.OnServerEvent:Connect(function(player, action, args)
    if action == "CreateStar" then
        CreateStar(player, args)
    elseif action == "CreateWelcomeStar" then
        CreateWelcomeStar(player)
    elseif action == "CreateFixedStar" then
        CreateFixedStar(player, args)
    -- Add more actions as needed
    end
end)

