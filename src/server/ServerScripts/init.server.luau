local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- local StarSphere = require(ReplicatedStorage.Shared.StarSphere)
-- local AllConstellations = require(ReplicatedStorage.Shared.constellations.constellationsModuleScript)
local StarVisibility = require(ReplicatedStorage.Shared.StarVisibility)

-- This script forces the game to only allow horizontal (landscape) orientation,
-- but allows 180-degree rotation (LandscapeLeft and LandscapeRight), not Portrait.
local StarterGui = game:GetService("StarterGui")
StarterGui.ScreenOrientation = Enum.ScreenOrientation.LandscapeSensor


-- Create all constellations globally on the server so all clients see the same stars
-- local StarHemisphere = workspace.MainPlate:WaitForChild("StarHemisphere")
-- local _rootStars = StarSphere.createAllConstellations(AllConstellations, StarHemisphere)
-- print("Constellations Created")

-- RemoteEvent to control global star visibility from clients
local visibilityRemote = ReplicatedStorage:FindFirstChild("StarVisibilityRemoteEvent")

visibilityRemote.OnServerEvent:Connect(function(_player, action)
	if action == "ServerUnion" then
		StarVisibility.ShowOnlyUnionAchieved(_player)
    end
end)

-- Show all stars for 60s when a player joins, then revert to union visibility
local function showAllTemporarily()
    StarVisibility.ServerShowAll()
    task.delay(60, function()
		StarVisibility.ServerShowOnlyUnionAchieved()
    end)
end

Players.PlayerAdded:Connect(function()
    showAllTemporarily()
end)

print("Hello world, from server!")