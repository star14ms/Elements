local client: Player = game.Players.LocalPlayer

local clientAchievements = client:WaitForChild("ACHIEVEMENTS FOLDER") :: Folder

local plrGui = script.Parent :: PlayerGui

local mainGui = plrGui:WaitForChild("AchievementsMainGui") :: ScreenGui
local openMainButton = mainGui:WaitForChild("OpenButton") :: TextButton
local mainFrame = mainGui:WaitForChild("AchievementsFrame") :: Frame
mainFrame.Visible = false

local notifGui = plrGui:WaitForChild("AchievementsNotification") :: ScreenGui
notifGui.Enabled = false
local notifFrame = notifGui:WaitForChild("NotificationFrame") :: Frame
local notifFramePos:UDim2 = notifFrame.Position


local rs = game.ReplicatedStorage:WaitForChild("AchievementSystemReplicatedStorage")
local remote = rs:WaitForChild("AchievementsRemoteEvent") :: RemoteEvent
local allAchievements = require(rs:WaitForChild("AchievementsList")) :: {[string]: any}


--Open main GUI
openMainButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = not mainFrame.Visible
end)
 
--Close main GUI
mainFrame:WaitForChild("CloseButton").MouseButton1Click:Connect(function()
	mainFrame.Visible = false
end)


-- Wait for all PeriodicTable groups to exist before building ElementPath
local PeriodicTable = workspace.MainPlate:WaitForChild("PeriodicTable")
local PeriodicTablePaths = require(workspace.MainPlate.PeriodicTable.PeriodicTablePaths)


local function isOwned(achievementKey: string): boolean
    -- Expect full path keys: "Elements/..." or "Constellations/..."
    if not string.find(achievementKey, "/") then
        return false
    end
    local base, rest = string.match(achievementKey, "([^/]+)/(.+)")
    if not base or not rest then
        return false
    end
	-- if achievementKey == "Elements/H" then
	-- 	print(clientAchievements:FindFirstChild(base))
	-- 	print(base, rest)
	-- end
    local baseFolder = clientAchievements:FindFirstChild(base)
    if not baseFolder or not baseFolder:IsA("Folder") then
        return false
    end
    local node: Instance = baseFolder
    for seg in string.gmatch(rest, "[^/]+") do
        local nextNode = node:FindFirstChild(seg)
        if not nextNode then return false end
        node = nextNode
    end
    return true
end

local function updateMain()
	local AllLanthanideAchievedCheck = false
	local AllActinideAchievedCheck = false

	for _, frame in pairs(mainFrame:WaitForChild("AchievementsScroller"):GetChildren()) do
		if frame:IsA("Frame") or frame:IsA("ImageLabel") or frame:IsA("ImageButton") or frame:IsA("TextButton") or frame:IsA("TextLabel") then
			frame:Destroy()
		end
	end

	local newFrames = {}

    for achievement, achievementInfo in pairs(allAchievements) do
        local name = achievement
		local image = type(achievementInfo.ImageId) == "number" and "rbxassetid://" .. achievementInfo.ImageId or achievementInfo.ImageId
		local desc = achievementInfo.Description
        local owned = isOwned(achievement)

		local newFrame = script:WaitForChild("AchievementTemplate"):Clone()
		newFrame.Name, newFrame.AchievementName.Text = name, achievementInfo.Title
		newFrame.AchievementImage.Image = image
		newFrame.Description.Text = desc
		newFrame.Acquired.Visible = owned
        local leaf = string.match(name, "/([^/]+)$") or name
        local model = PeriodicTablePaths.ElementPath[leaf]

		if not owned then
			newFrame.ImageColor3 = Color3.fromRGB(newFrame.ImageColor3.R - 50, newFrame.ImageColor3.G - 50, newFrame.ImageColor3.B - 50)
			for _, uiElement in pairs(newFrame:GetDescendants()) do
				if uiElement:IsA("Frame") then 
					uiElement.BackgroundColor3 = Color3.fromRGB(uiElement.BackgroundColor3.R - 50, uiElement.BackgroundColor3.G - 50, uiElement.BackgroundColor3.B - 50)
				elseif uiElement:IsA("TextLabel") or uiElement:IsA("TextButton") then
					uiElement.BackgroundColor3 = Color3.fromRGB(uiElement.BackgroundColor3.R - 50, uiElement.BackgroundColor3.G - 50, uiElement.BackgroundColor3.B - 50)
					uiElement.TextColor3 = Color3.fromRGB(uiElement.TextColor3.R - 50, uiElement.TextColor3.G - 50, uiElement.TextColor3.B - 50)
				elseif uiElement:IsA("ImageLabel") or uiElement:IsA("ImageButton") then
					uiElement.ImageColor3 = Color3.fromRGB(uiElement.ImageColor3.R - 50, uiElement.ImageColor3.G - 50, uiElement.ImageColor3.B - 50)
				end
			end
			if model:GetAttribute("colorOrigin") == nil then
				model:SetAttribute("colorOrigin", model.Color)
			end
			model.Color = Color3.fromRGB(0, 0, 0)

            if table.find(PeriodicTablePaths.Lanthanides, leaf) and not AllLanthanideAchievedCheck then
				PeriodicTable.Lanthanide.Blank:SetAttribute("colorOrigin", PeriodicTable.Lanthanide.Blank.Color)
				PeriodicTable.Lanthanide.Blank.Color = Color3.fromRGB(0, 0, 0)
				AllLanthanideAchievedCheck = true
            elseif table.find(PeriodicTablePaths.Actinides, leaf) and not AllActinideAchievedCheck then
				PeriodicTable.Actinide.Blank:SetAttribute("colorOrigin", PeriodicTable.Actinide.Blank.Color)
				PeriodicTable.Actinide.Blank.Color = Color3.fromRGB(0, 0, 0)
				AllActinideAchievedCheck = true
			end
		else
			if model:GetAttribute("colorOrigin") then
				model.Color = model:GetAttribute("colorOrigin")
			end
			model.SurfaceLight.Brightness = 1
		end

        table.insert(newFrames, newFrame)
	end

	if not AllLanthanideAchievedCheck then
		if PeriodicTable.Lanthanide.Blank:GetAttribute("colorOrigin") then 
			PeriodicTable.Lanthanide.Blank.Color = PeriodicTable.Lanthanide.Blank:GetAttribute("colorOrigin")
		end
		PeriodicTable.Lanthanide.Blank.SurfaceLight.Brightness = 1
	end
	if not AllActinideAchievedCheck then
		if PeriodicTable.Actinide.Blank:GetAttribute("colorOrigin") then
			PeriodicTable.Actinide.Blank.Color = PeriodicTable.Actinide.Blank:GetAttribute("colorOrigin")
		end
		PeriodicTable.Actinide.Blank.SurfaceLight.Brightness = 1
	end

	table.sort(newFrames, function(a, b)
		return allAchievements[a.Name].OrderRank < allAchievements[b.Name].OrderRank
	end)

    local scroller = mainFrame:WaitForChild("AchievementsScroller")
    for _, newFrame in pairs(newFrames) do
        newFrame.Parent = scroller
    end
end


--Notification GUI
local achievementsQueue = {}

remote.OnClientEvent:Connect(function(instruction, arg)
	
	if instruction == "AWARD ACHIEVEMENT" then
		
        local achievementKey = arg
        local achievementInfo = allAchievements[achievementKey]
		if achievementInfo then
            table.insert(achievementsQueue, achievementKey)
			repeat
				task.wait(0.2)
            until table.find(achievementsQueue, achievementKey) == 1
			
            local notifFrameClosedPos = notifFramePos + UDim2.fromScale(notifFrame.Size.X.Scale, 0)
			
			notifFrame.Position = notifFrameClosedPos
			notifFrame.AchievementName.Text = achievementInfo.Title
			notifFrame.AchievementImage.Image = type(achievementInfo.ImageId) == "number" and "rbxassetid://" .. achievementInfo.ImageId or achievementInfo.ImageId
			notifFrame.Description.Text = achievementInfo.Description
			
			notifGui.Enabled = true
			
            notifFrame:TweenPosition(notifFramePos, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.8, true)
			
			task.wait(2)
			
            notifFrame:TweenPosition(notifFrameClosedPos, Enum.EasingDirection.In, Enum.EasingStyle.Quart, 0.8, true)
			
			task.wait(0.8)
			notifGui.Enabled = false
			
            table.remove(achievementsQueue, table.find(achievementsQueue, achievementKey))
		end
	elseif instruction == "INITIALIZE ACHIEVEMENT" then
		updateMain()
	end
end)


updateMain()
local achievementFolders = clientAchievements:GetChildren()
for _, achievementFolder in achievementFolders do
    achievementFolder.ChildAdded:Connect(updateMain)
end
