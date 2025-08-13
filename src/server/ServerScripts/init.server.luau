local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local StarSphere = require(ReplicatedStorage.Shared.StarSphere)
local StarVisibility = require(ReplicatedStorage.Shared.StarVisibility)
local AllConstellations = require(ReplicatedStorage.Shared.constellations.constellationsModuleScript)

-- This script forces the game to only allow horizontal (landscape) orientation,
-- but allows 180-degree rotation (LandscapeLeft and LandscapeRight), not Portrait.
local StarterGui = game:GetService("StarterGui")
StarterGui.ScreenOrientation = Enum.ScreenOrientation.LandscapeSensor

--local csvText = ReplicatedStorage.Shared.constellations_with_props.Andromeda:WaitForChild("table")
-- local Shared = ReplicatedStorage:WaitForChild("Shared")
-- local mod = require(Shared.constellations_with_props.Andromeda.table)
-- local csvText = mod.csv

-- local function parseCsv(text)
-- 	local rows = {}
-- 	for line in string.gmatch(text, "[^\r\n]+") do
-- 		local row, field, i, inQuotes = {}, "", 1, false
-- 		while i <= #line do
-- 			local c = string.sub(line, i, i)
-- 			if c == "\"" then
-- 				if inQuotes and string.sub(line, i + 1, i + 1) == "\"" then
-- 					field ..= "\""
-- 					i += 2
-- 				else
-- 					inQuotes = not inQuotes
-- 					i += 1
-- 				end
-- 			elseif c == "," and not inQuotes then
-- 				table.insert(row, field)
-- 				field = ""
-- 				i += 1
-- 			else
-- 				field ..= c
-- 				i += 1
-- 			end
-- 		end
-- 		table.insert(row, field)
-- 		table.insert(rows, row)
-- 	end
-- 	return rows
-- end

-- local parsedTable = parseCsv(csvText)
-- for i, row in ipairs(parsedTable) do
-- 	print("Row " .. i .. ": " .. table.concat(row, ", "))
-- end


local StarHemisphere = workspace.MainPlate:WaitForChild("StarHemisphere")

-- Create all constellations globally on the server so all clients see the same stars
local _rootStars = StarSphere.createAllConstellations(AllConstellations, StarHemisphere)
print("Constellations Created")

-- RemoteEvent to control global star visibility from clients
local visibilityRemote = ReplicatedStorage:FindFirstChild("StarVisibilityRemoteEvent")
if not visibilityRemote then
    visibilityRemote = Instance.new("RemoteEvent")
    visibilityRemote.Name = "StarVisibilityRemoteEvent"
    visibilityRemote.Parent = ReplicatedStorage
end

visibilityRemote.OnServerEvent:Connect(function(_player, action)
	if action == "ServerUnion" then
		StarVisibility.ShowOnlyUnionAchieved(_player)
    end
end)

---- RemoteEvent to control constellation line visibility globally
--local linesRemote = ReplicatedStorage:FindFirstChild("ConstellationLinesRemoteEvent")
--if not linesRemote then
--    linesRemote = Instance.new("RemoteEvent")
--    linesRemote.Name = "ConstellationLinesRemoteEvent"
--    linesRemote.Parent = ReplicatedStorage
--end

--linesRemote.OnServerEvent:Connect(function(_player, visible)
--    local starsRoot = StarHemisphere:FindFirstChild("Stars")
--    if starsRoot then
--        StarSphere.setConstellationLinesVisible(starsRoot, visible == true)
--    end
--end)

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