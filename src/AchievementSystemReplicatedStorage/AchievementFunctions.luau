local functions = {}

local dss = game:GetService("DataStoreService")
local ds = dss:GetDataStore("Achievements Data Store")

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

return functions
