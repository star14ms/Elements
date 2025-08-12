local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GodDialogAction = ReplicatedStorage.DialogModule:WaitForChild("GodDialogAction")

GodDialogAction:FireServer("CreateWelcomeStar")

print("Hello world, from client!")


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


-- local StarSphere = require(ReplicatedStorage.Shared.StarSphere)
-- local AllConstellations = require(ReplicatedStorage.Shared.constellation.constellation)

-- -- Create all constellations under a single root folder
-- local rootStars = StarSphere.createAllConstellations(AllConstellations, workspace)

-- -- UI: toggle constellation lines on/off
-- local _StarterGui = game:GetService("StarterGui")
-- local Players = game:GetService("Players")
-- local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

-- local screenGui = Instance.new("ScreenGui")
-- screenGui.Name = "ConstellationUI"
-- screenGui.ResetOnSpawn = false
-- screenGui.Parent = playerGui

-- local button = Instance.new("TextButton")
-- button.Name = "ToggleLinesButton"
-- button.Size = UDim2.fromOffset(160, 36)
-- button.Position = UDim2.fromOffset(20, 20)
-- button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
-- button.TextColor3 = Color3.new(1, 1, 1)
-- button.Text = "Toggle Lines: ON"
-- button.Parent = screenGui

-- local linesVisible = true
-- button.MouseButton1Click:Connect(function()
--     linesVisible = not linesVisible
--     StarSphere.setConstellationLinesVisible(rootStars, linesVisible)
--     button.Text = linesVisible and "Toggle Lines: ON" or "Toggle Lines: OFF"
-- end)