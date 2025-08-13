local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local StarSphere = require(ReplicatedStorage.Shared.StarSphere)
local StarVisibility = require(ReplicatedStorage.Shared.StarVisibility)
local visibilityRemote = ReplicatedStorage:WaitForChild("StarVisibilityRemoteEvent")
local StarHemisphere = workspace.MainPlate:WaitForChild("StarHemisphere")
local UpdateVisibleStars = ReplicatedStorage:WaitForChild("UpdateVisibleStars")

-- UI: toggle constellation lines on/off
local _StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

--local screenGui = Instance.new("ScreenGui")
--screenGui.Name = "ConstellationUI"
--screenGui.ResetOnSpawn = false
--screenGui.Parent = playerGui

local linesButton = script.Parent:WaitForChild("ToggleConstellationLineButton")
--local linesButton = Instance.new("TextButton")
--linesButton.Name = "ToggleLinesButton"
--linesButton.Size = UDim2.fromOffset(160, 36)
--linesButton.Position = UDim2.fromOffset(20, 20)
--linesButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
--linesButton.TextColor3 = Color3.new(1, 1, 1)
--linesButton.Text = "Toggle Lines: ON"
--linesButton.Parent = screenGui

local linesVisible = true
linesButton.MouseButton1Click:Connect(function()
	linesVisible = not linesVisible
	-- Toggle constellation lines globally
	local starsRoot = StarHemisphere:FindFirstChild("Stars")
	if starsRoot then
		StarSphere.setConstellationLinesVisible(starsRoot, linesVisible)
	end
	if linesVisible then
		linesButton.Image = "rbxassetid://113126302941978"
	else
		linesButton.Image = "rbxassetid://104071476510258"
	end
end)

-- Constellation name labels and toggle functionality
local constellationNamesVisible = true

-- Toggle constellation names button
local constellationNamesButton = script.Parent:WaitForChild("ToggleConstellationNamesButton") :: ImageButton

-- Function to toggle constellation name visibility
constellationNamesButton.MouseButton1Click:Connect(function()
    constellationNamesVisible = not constellationNamesVisible
    local starsRoot = StarHemisphere:FindFirstChild("Stars")
    if starsRoot then
        StarSphere.setConstellationNamesVisible(starsRoot, constellationNamesVisible)
    end
    if constellationNamesVisible then
		constellationNamesButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
	else
		constellationNamesButton.ImageColor3 = Color3.fromRGB(120, 120, 120)
	end
end)

-- Star visibility buttons (client-side and server-union)
local clientMode = false

local starsClientButton = script.Parent:WaitForChild("ToggleStarVisibilityButton")
--local starsClientButton = Instance.new("TextButton")
--starsClientButton.Name = "ToggleStarsClientButton"
--starsClientButton.Size = UDim2.fromOffset(200, 36)
--starsClientButton.Position = UDim2.fromOffset(20, 64)
--starsClientButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
--starsClientButton.TextColor3 = Color3.new(1, 1, 1)
--starsClientButton.Text = "Stars: Mine"
--starsClientButton.Parent = screenGui

--local starsServerButton = Instance.new("TextButton")
--starsServerButton.Name = "ToggleStarsServerButton"
--starsServerButton.Size = UDim2.fromOffset(200, 36)
--starsServerButton.Position = UDim2.fromOffset(20, 104)
--starsServerButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
--starsServerButton.TextColor3 = Color3.new(1, 1, 1)
--starsServerButton.Text = "Stars: Union"
--starsServerButton.Parent = screenGui

starsClientButton.MouseButton1Click:Connect(function()
	clientMode = not clientMode
	if clientMode then
		starsClientButton.Image = "rbxassetid://75139318503126"
	else
		starsClientButton.Image = "rbxassetid://97525934808253"
	end
	
	if clientMode then
		visibilityRemote:FireServer("ServerUnion")
	end
		StarVisibility.ShowOnlyPlayerAchieved()
end)

-- Client-side handler for updating star transparency based on server info
local function getRoot()
	-- Dummy implementation, replace with your actual logic
	return Workspace.MainPlate.StarHemisphere.Stars
end

local function makeKeyFromPart(part)
	-- Dummy implementation, replace with your actual logic
	return part.Name
end

local function iterStarParts(root)
	local parts = {}
	for i, child in root:GetChildren() do
		if child:IsA("BasePart") then
			table.insert(parts, child)
		end
	end
	return parts
end

UpdateVisibleStars.OnClientEvent:Connect(function(mode, visibleKeys)
	if mode == "ServerUnion" or (mode ~= "ServerUnion" and clientMode == false) then
		local root = getRoot()
		if not root then return end

		local visibleSet = {}
		for i = 1, #visibleKeys do
			visibleSet[visibleKeys[i]] = true
		end

		for i, part in iterStarParts(root) do
			local key = makeKeyFromPart(part)
			if key and visibleSet[key] then
				part.LocalTransparencyModifier = 0
			else
				part.LocalTransparencyModifier = 1
			end
		end
	else
		StarVisibility.ShowOnlyPlayerAchieved()
	end
end)

-- Initialize constellation labels when stars are loaded
local function initializeConstellationLabels()
    -- Wait for stars to be loaded
    local starsRoot = StarHemisphere:WaitForChild("Stars")
    if starsRoot then
        -- Wait a bit for all constellations to be created
        task.wait(2)
        -- StarSphere will handle creating labels
    end
end

-- Start initialization
task.spawn(initializeConstellationLabels)

-- Update labels when camera moves (for better positioning)
local RunService = game:GetService("RunService")
RunService.RenderStepped:Connect(function()
    -- StarSphere will handle label positioning
end)
