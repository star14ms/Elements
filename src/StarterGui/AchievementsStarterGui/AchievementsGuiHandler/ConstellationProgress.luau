local M = {}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local AchievementSystem = ReplicatedStorage:WaitForChild("AchievementSystemReplicatedStorage")
local AllAchievements = require(AchievementSystem:WaitForChild("AchievementsList"))
local StarSphere = require(ReplicatedStorage.Shared:WaitForChild("StarSphere"))

local function parseConstellationAchievements(): {[string]: {stars: {string}}}
	local map: {[string]: {stars: {string}}} = {}
	for key in pairs(AllAchievements) do
		local constName, starName = string.match(key, "^Constellations/([^/]+)/([^/]+)$")
		if constName and starName then
			if not map[constName] then
				map[constName] = { stars = {} }
			end
			table.insert(map[constName].stars, starName)
		end
	end
	for _, entry in pairs(map) do
		table.sort(entry.stars, function(a, b)
			return a < b
		end)
	end
	return map
end

-- Helpers to access constellations CSV module in ReplicatedStorage (if present)
local function requireConstellationsModule(): any?
	local shared = ReplicatedStorage:FindFirstChild("Shared")
	if not shared then return nil end
	local candidates = {}
	local folder = shared:FindFirstChild("constellations")
	if folder then
		table.insert(candidates, folder:FindFirstChild("constellationsModuleScript"))
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

local function parseCsvLine(line: string): {string}
	local fields = {}
	local field = ""
	local inQuotes = false
	local i = 1
	while i <= #line do
		local ch = string.sub(line, i, i)
		if ch == '"' then
			local nextCh = string.sub(line, i + 1, i + 1)
			if inQuotes and nextCh == '"' then
				field ..= '"'
				i += 1
			else
				inQuotes = not inQuotes
			end
		elseif ch == ',' and not inQuotes then
			table.insert(fields, field)
			field = ""
		else
			field ..= ch
		end
		i += 1
	end
	table.insert(fields, field)
	return fields
end

local function indexOf(list: {string}, key: string): number?
	for i, v in ipairs(list) do
		if v == key then return i end
	end
	return nil
end

local function findHeaderIndexCaseInsensitive(header: {string}, wanted: string): number?
	local upperWanted = string.upper(wanted)
	for i, name in ipairs(header) do
		if string.upper(name) == upperWanted then
			return i
		end
	end
	return nil
end

local function parseBoolean(str: string?): boolean
	if not str then return false end
	local s = string.lower((string.gsub(str, "%s+", "")))
	if s == "1" or s == "true" or s == "yes" or s == "y" or s == "on" or s == "x" or s == "✓" then
		return true
	end
	local n = tonumber(s)
	if n and n > 0 then return true end
	return false
end

function M.listStarPositions(constellationName: string): {{ name: string, raDeg: number, decDeg: number, mag: number?, main: boolean }}
	local result = {}
	local constellations = requireConstellationsModule()
	if not constellations then
		return result
	end
	local mod = constellations[constellationName]
	if not mod or typeof(mod) ~= "table" or typeof(mod.csv) ~= "string" then
		return result
	end
	local csv = mod.csv
	local lines = {}
	for line in string.gmatch(csv, "([^\n]+)") do
		table.insert(lines, line)
	end
	if #lines == 0 then
		return result
	end
	local header = parseCsvLine(lines[1])
	local nameIdx = indexOf(header, "Name")
	local raIdx = indexOf(header, "RA") or indexOf(header, "Ra") or indexOf(header, "Right ascension")
	local decIdx = indexOf(header, "Dec") or indexOf(header, "DEC") or indexOf(header, "Declination")
	local magIdx = indexOf(header, "vis. mag.") or indexOf(header, "vis. mag")
	if not magIdx then
		magIdx = findHeaderIndexCaseInsensitive(header, "Vmag")
	end
	local mainIdx = indexOf(header, "Main Star") or indexOf(header, "MainStar") or findHeaderIndexCaseInsensitive(header, "Main Star")
	if not nameIdx or not raIdx or not decIdx then
		return result
	end
	local spectralClassIdx = indexOf(header, "Sp. class")
	local spectralTypeIdx = indexOf(header, "Spectral type")
	for i = 2, #lines do
		local row = parseCsvLine(lines[i])
		local starName = row[nameIdx]
		local raStr = row[raIdx]
		local decStr = row[decIdx]
		local magStr = magIdx and row[magIdx] or nil
		local mainVal = mainIdx and row[mainIdx] or nil
		local spectralType = spectralTypeIdx and row[spectralTypeIdx] or nil
		local spectralClass = spectralClassIdx and row[spectralClassIdx] or nil
		if starName and starName ~= "" and raStr and decStr then
			local raDeg = StarSphere.parseRAtoDegrees(raStr)
			local decDeg = StarSphere.parseDectoDegrees(decStr)
			local mag = nil
			if magStr and magStr ~= "" then
				local m = string.match(magStr, "[%-%d%.]+")
				if m then
					mag = tonumber(m)
				end
			end
			local main = parseBoolean(mainVal)
			if raDeg and decDeg then
				table.insert(result, { name = starName, raDeg = raDeg, decDeg = decDeg, mag = mag, main = main, spectralClass = spectralClass, spectralType = spectralType })
			end
		end
	end
	return result
end

-- Returns array of { name, owned, total }
function M.computeProgress(achievementsRoot: Folder?): {{ name: string, owned: number, total: number, image: string }}
	local result = {}
	local map = parseConstellationAchievements()
	local ownedByConstellation: {[string]: number} = {}

	if achievementsRoot then
		local constellationsFolder = achievementsRoot:FindFirstChild("Constellations")
		if constellationsFolder and constellationsFolder:IsA("Folder") then
			for _, constFolder in ipairs(constellationsFolder:GetChildren()) do
				if constFolder:IsA("Folder") then
					local count = 0
					for _, child in ipairs(constFolder:GetChildren()) do
						if child:IsA("StringValue") then
							count += 1
						end
					end
					ownedByConstellation[constFolder.Name] = count
				end
			end
		end
	end

	for constName, entry in pairs(map) do
		table.insert(result, {
			name = constName,
			owned = ownedByConstellation[constName] or 0,
			total = #entry.stars,
			image = "rbxassetid://" .. "113126302941978",
		})
	end

	table.sort(result, function(a, b)
		return a.name < b.name
	end)

	return result
end

function M.listConstellations(): {string}
	local list = {}
	local map = parseConstellationAchievements()
	for constName in pairs(map) do
		table.insert(list, constName)
	end
	table.sort(list, function(a, b)
		return a < b
	end)
	return list
end

function M.listStars(constellationName: string): {string}
	local map = parseConstellationAchievements()
	local entry = map[constellationName]
	if not entry then return {} end
	return entry.stars
end

-- Renders simple rows using the provided template into parent (e.g., AchievementsScroller)
function M.render(parent: Instance, template: Instance, achievementsRoot: Folder?)
	local player = Players.LocalPlayer
	if not player then return end

	local entries = M.computeProgress(achievementsRoot or player:WaitForChild("ACHIEVEMENTS FOLDER") :: Folder)
	for _, entry in ipairs(entries) do
		local frame = template:Clone()
		frame.Name = "ConstellationProgress__" .. entry.name
		frame.AchievementImage.Image = entry.image
		frame.AchievementName.Text = entry.name
		frame.Description.Text = string.format("%d/%d stars", entry.owned, entry.total)
		frame.Acquired.Visible = false
		frame.Parent = parent
	end
end

return M


