-- Server-side handler for dialog-triggered actions
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Modules
local StarProperties = require(ReplicatedStorage.Model.Star.StarProperties)
local SelectRandomStarByMassAndAward = require(ReplicatedStorage.AchievementSystemReplicatedStorage.AchievementFunctions).SelectRandomStarByMassAndAward
local StarVisiblity = require(ReplicatedStorage.Shared.StarVisibility)

local GodDialogAction = ReplicatedStorage.DialogModule:WaitForChild("GodDialogAction")
local GodDialogReply = ReplicatedStorage.DialogModule:WaitForChild("GodDialogReply")
local AnnouncementEvent = ReplicatedStorage:WaitForChild("AnnouncementEvent")
local UpdateVisibleStars = ReplicatedStorage:WaitForChild("UpdateVisibleStars")
local sunTemplate = ReplicatedStorage:FindFirstChild("Model") and ReplicatedStorage.Model:FindFirstChild("Star")
local rand = Random.new()


local function CreateStar(player, args)
    if sunTemplate then
        local Star = sunTemplate:Clone()        
        local props = StarProperties.assignProperties(args.atomicMassSpent)
        local sizeRatio = props.sizeRatio * 2.5

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

		local starInfo = SelectRandomStarByMassAndAward(props.mass)

        if starInfo ~= nil then
            local baseText = player.Name .. " Created '" .. starInfo.star .. "' from " .. starInfo.constellation .. " ! (Class: " .. props.class .. ")"
            local announcementMessage = string.format("<font color=\"#%s\">%s</font>", textColor, baseText)
            AnnouncementEvent:FireAllClients(announcementMessage, 8)
        end

        local baseText = "A new star has been created! Class:"
        local replyMessage = string.format("<font color=\"#%s\">%s %s</font>", textColor, baseText, props.class)
        GodDialogReply:FireClient(player, replyMessage)

        -- Update star visibility for all clients after creation
		StarVisiblity.ServerShowOnlyUnionAchieved()
		UpdateVisibleStars:FireClient(player, nil)
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
            lifetime = 8,
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

GodDialogAction.OnServerEvent:Connect(function(player, action, args)
    if action == "CreateStar" then
        CreateStar(player, args)
    elseif action == "CreateWelcomeStar" then
        CreateWelcomeStar(player)
    -- Add more actions as needed
    end
end)

