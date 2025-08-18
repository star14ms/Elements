local functions = {}

local dss = game:GetService("DataStoreService")
local ds = dss:GetDataStore("Achievements Data Store")

local _ReplicatedStorage = game:GetService("ReplicatedStorage")

local remote = script.Parent:WaitForChild("AchievementsRemoteEvent")

local function ensureAchievementRoot(plr: Player): Folder
    local root = plr:FindFirstChild("ACHIEVEMENTS FOLDER")
    if not root then
        root = Instance.new("Folder")
        root.Name = "ACHIEVEMENTS FOLDER"
        root.Parent = plr
    end
    return root
end

local function ensureChildFolder(parent: Instance, name: string): Folder
    local f = parent:FindFirstChild(name)
    if not f then
        f = Instance.new("Folder")
        f.Name = name
        f.Parent = parent
    end
    return f
end

local function ensureCategories(plr: Player): (Folder, Folder)
    local root = ensureAchievementRoot(plr)
    local elements = ensureChildFolder(root, "Elements")
    local constellations = ensureChildFolder(root, "Constellations")
    return elements, constellations
end

local function createPathFolders(root: Folder, pathParts: {string}): Instance
    local node: Instance = root
    -- If the first segment matches the provided root, skip it to avoid duplicating (e.g., Elements/Elements/...)
    local startIndex = 1
    if #pathParts >= 1 and pathParts[1] == root.Name then
        startIndex = 2
    end
    for i = startIndex, #pathParts - 1 do
        node = ensureChildFolder(node :: Instance, pathParts[i])
    end
    return node
end

local function splitPath(path: string): {string}
    local parts: {string} = {}
    for part in string.gmatch(path, "[^/]+") do
        table.insert(parts, part)
    end
    return parts
end

local function collectLeafPaths(root: Folder): {string}
    local collected: {string} = {}
    local function dfs(node: Instance, prefix: {string})
        for _, child in ipairs(node:GetChildren()) do
            if child:IsA("StringValue") then
                local segs = table.clone(prefix)
                table.insert(segs, child.Name)
                table.insert(collected, table.concat(segs, "/"))
            elseif child:IsA("Folder") then
                local segs = table.clone(prefix)
                table.insert(segs, child.Name)
                dfs(child, segs)
            end
        end
    end
    dfs(root, {})
    return collected
end

function functions.LoadPlayerAchievements(plr:Player)
	if not game:GetService("RunService"):IsServer() then return end
	
	if plr.Parent == game.Players and not plr:FindFirstChild("ACHIEVEMENTS FOLDER") then
		
		local plrData
		local success, err
		
		while not success do
			success, err = pcall(function()
				plrData = ds:GetAsync(plr.UserId) or {}
			end)
			
			if not success then
				warn("Error loading achievements for player " .. plr.Name .. ": " .. tostring(err))
			end
			
			task.wait(0.5)
		end

        if success then
            local root = ensureAchievementRoot(plr)
            local elements, constellations = ensureCategories(plr)
            for _, entry in pairs(plrData) do
                if typeof(entry) == "string" and string.find(entry, "/") then
                    -- structured path, e.g. Elements/H or Constellations/Andromeda/Alpheratz
                    local parts = splitPath(entry)
                    if #parts >= 2 then
                    local baseName = parts[1]
                    local base = baseName == "Elements" and elements or (baseName == "Constellations" and constellations or root)
                    local parentNode = createPathFolders(base, parts)
                        local leafName = parts[#parts]
                        if not parentNode:FindFirstChild(leafName) then
                            local v = Instance.new("StringValue")
                            v.Name = leafName
                            v.Parent = parentNode
                        end
                    end
                elseif typeof(entry) == "string" then
                    -- legacy flat name; default to Elements bucket
                    local v = Instance.new("StringValue")
                    v.Name = entry
                    v.Parent = elements
                end
            end
        end
	end
end

function functions.SavePlayerAchievements(plr:Player)
	if not game:GetService("RunService"):IsServer() then return end

    if plr.Parent == game.Players and plr:FindFirstChild("ACHIEVEMENTS FOLDER") then
        local root = plr:FindFirstChild("ACHIEVEMENTS FOLDER") :: Folder
        local elements = ensureChildFolder(root, "Elements")
        local constellations = ensureChildFolder(root, "Constellations")
        local plrAchievements = {}
        -- store only entries within the two category folders
        for _, path in ipairs(collectLeafPaths(elements)) do
            table.insert(plrAchievements, "Elements/" .. path)
        end
        for _, path in ipairs(collectLeafPaths(constellations)) do
            table.insert(plrAchievements, "Constellations/" .. path)
        end
		
		local success, err

		while not success do
			success, err = pcall(function()
				return ds:SetAsync(plr.UserId, plrAchievements)
			end)
			if not success then
				warn("Error saving achievements for player " .. plr.Name .. ": " .. tostring(err))
			end
			
			task.wait(0.1)
		end
	end
end

function functions.AwardAchievement(plr:Player, achName:string)
	
	if not game:GetService("RunService"):IsServer() then return end

    local root = ensureAchievementRoot(plr)
    local elements, constellations = ensureCategories(plr)

    -- If the name is a structured path, create nested
    if string.find(achName, "/") then
        local parts = splitPath(achName)
        local baseName = parts[1]
        local base = baseName == "Elements" and elements or (baseName == "Constellations" and constellations or root)
        local parentNode = createPathFolders(base, parts)
        local leafName = parts[#parts]
        if not parentNode:FindFirstChild(leafName) then
            remote:FireClient(plr, "AWARD ACHIEVEMENT", achName)
            local v = Instance.new("StringValue")
            v.Name = leafName
            v.Parent = parentNode
            functions.SavePlayerAchievements(plr)
        end
        return
    end

    -- Legacy behavior: award into Elements by default
    if not elements:FindFirstChild(achName) then
        remote:FireClient(plr, "AWARD ACHIEVEMENT", achName)
        local v = Instance.new("StringValue")
        v.Name = achName
        v.Parent = elements
        functions.SavePlayerAchievements(plr)
    end
end

-- New function to initialize achievements as empty
function functions.InitializeEmptyAchievements(plr:Player)
	if not game:GetService("RunService"):IsServer() then return end
	
	local success, err

	while not success do
		success, err = pcall(function()
			return ds:SetAsync(plr.UserId, {})
		end)
		if not success then
			warn("Error saving achievements for player " .. plr.Name .. ": " .. tostring(err))
		end

		task.wait(0.1)
	end

	if plr.Parent == game.Players then
		local folder = plr:FindFirstChild("ACHIEVEMENTS FOLDER")
		if not folder then
			folder = Instance.new("Folder")
			folder.Name = "ACHIEVEMENTS FOLDER"
			folder.Parent = plr
		end
		-- Remove all existing achievements
		for _, AchievementType in pairs(folder:GetChildren()) do
            for _, child in pairs(AchievementType:GetChildren()) do
                child:Destroy()
            end
		end
		
		remote:FireClient(plr, "INITIALIZE ACHIEVEMENT")
	end
end
-- Utility: CSV parsing used for constellation data scanning
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
        if v == key then
            return i
        end
    end
    return nil
end

local function parseNumber(str: string?): number?
    if not str or str == "" then return nil end
    local m = string.match(str, "[%-%d%.]+")
    if m then return tonumber(m) end
    return nil
end

-- Try to require the constellations mapping module from a few known locations
local function requireConstellationsModule(): any?
    local shared = _ReplicatedStorage:FindFirstChild("Shared")
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

-- Select a random star whose Mass is within ±tolerance of targetMass (in solar masses)
-- If selected and not already owned by player, award the corresponding achievement
-- Returns the achievement key ("Constellations/<Constellation>/<Star>") or nil
function functions.SelectRandomStarByMass(targetMass: number, tolerance: number?): { constellation: string, star: string, massStr: string, radiusStr: string }?
    if not game:GetService("RunService"):IsServer() then return nil end
    tolerance = tolerance or 0.2

    -- Load constellations mapping module
    local constellations = requireConstellationsModule()
    if not constellations then return nil end

	local candidates: {{key: string, constellation: string, star: string, massStr: string, radiusStr: string }} = {}
    
    -- local n_stars = 0
    -- local minimum_mass = 99

    for constName, mod in pairs(constellations) do
        if typeof(mod) == "table" and typeof(mod.csv) == "string" then
            local csv = mod.csv
            local lines = {}
            for line in string.gmatch(csv, "([^\n]+)") do
                table.insert(lines, line)
            end
            if #lines > 0 then
                local header = parseCsvLine(lines[1])
                local nameIdx = indexOf(header, "Name")
                local massIdx = indexOf(header, "Mass")
                local radiusIdx = indexOf(header, "Radius")
                if nameIdx and massIdx then
                    for i = 2, #lines do
                        local row = parseCsvLine(lines[i])
                        local starName = row[nameIdx]
                        local massStr = row[massIdx]
                        local massVal = parseNumber(massStr) or tolerance
                        -- n_stars = n_stars + 1
                        -- minimum_mass = math.min(minimum_mass, massVal)
                        if starName and starName ~= "" and massVal then
                            if math.abs(massVal - targetMass) <= tolerance then
                                local key = string.format("Constellations/%s/%s", constName, starName)
                                table.insert(candidates, { key = key, constellation = constName, star = starName, massStr = massStr, radiusStr = row[radiusIdx] })
                            end
                        end
                    end
                end
            end
        end
    end

    -- print(n_stars)
    -- print(minimum_mass)
	-- for _, dict in pairs(candidates) do
    --     local desc = ""
	-- 	for key, value in pairs(dict) do
    --         -- You can customize the output format here
    --         desc = desc .. key .. ": " .. tostring(value) .. "\n"
    --     end
    --     print(desc .. "\n")
	-- end

    if #candidates == 0 then
        return nil
    end

    -- Partition candidates into not owned and owned
    local notOwned = {}
    local owned = {}

    for _, candidate in pairs(candidates) do
        local isOwned = false
        for _, player in ipairs(game.Players:GetPlayers()) do
            local _, constellationsFolder = ensureCategories(player)
            local pathParts = {}
            for seg in string.gmatch(candidate.key, "[^/]+") do
                table.insert(pathParts, seg)
            end
            if #pathParts >= 3 then
                local constFolderNode = constellationsFolder:FindFirstChild(pathParts[2])
                if constFolderNode and constFolderNode:IsA("Folder") then
                    local starNode = constFolderNode:FindFirstChild(pathParts[3])
                    if starNode then
                        isOwned = true
                        break
                    end
                end
            end
        end
        if not isOwned then
            table.insert(notOwned, candidate)
        else
            table.insert(owned, candidate)
        end
    end

    local rng = Random.new()
    local chosen = nil

    if #notOwned > 0 then
        local idx = rng:NextInteger(1, #notOwned)
        chosen = notOwned[idx]
    else
        local idx = rng:NextInteger(1, #candidates)
        chosen = candidates[idx]
    end

    return chosen
end

function functions.AwardStarAchievementAllPlayers(key)
    -- Award achievement to all players who don't own it yet
    for _, player in ipairs(game.Players:GetPlayers()) do
        local _, constellationsFolder = ensureCategories(player)
        local pathParts = {}
        for seg in string.gmatch(key, "[^/]+") do
            table.insert(pathParts, seg)
        end
        local owned = false
        if #pathParts >= 3 then
            local constFolderNode = constellationsFolder:FindFirstChild(pathParts[2])
            if constFolderNode and constFolderNode:IsA("Folder") then
                local starNode = constFolderNode:FindFirstChild(pathParts[3])
                owned = starNode ~= nil
            end
        end
        if not owned then
            functions.AwardAchievement(player, key)
        end
    end
end

return functions
