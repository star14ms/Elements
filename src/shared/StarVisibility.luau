local StarVisibility = {}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local StarHemisphere = workspace.MainPlate:WaitForChild("StarHemisphere")
local UpdateVisibleStars = ReplicatedStorage:FindFirstChild("UpdateVisibleStars")


local function getRoot(root: Instance?): Instance?
    if root and root:IsDescendantOf(workspace) then
        return root
    end
    local stars = workspace:FindFirstChild("Stars")
    return stars or workspace
end

local function isStarPart(inst: Instance): boolean
    return inst:IsA("BasePart")
end

local function iterStarParts(root: Instance): () -> (Instance)
	local descendants = root:GetDescendants()
    local index = 0
    return function()
        index += 1
        while index <= #descendants do
            local inst = descendants[index]
            index += 1
            if isStarPart(inst) then
                return inst
            end
        end
        return nil
    end
end

local function makeKeyFromPart(part: BasePart): string?
    local parent = part.Parent
    if not parent then return nil end
    -- Expect stars under Stars/<Constellation>/<StarPart>
    local constellationName = parent.Name
    local starName = part.Name
    if constellationName and starName and constellationName ~= "ConstellationLines" then
        return constellationName .. "|" .. starName
    end
    return nil
end

local function buildOwnedSetFromPlayer(player: Player): {[string]: boolean}
    local owned: {[string]: boolean} = {}
    local root = player:FindFirstChild("ACHIEVEMENTS FOLDER")
    if not root then return owned end
    local constellations = root:FindFirstChild("Constellations")
    if not constellations then return owned end
    for _, constFolder in ipairs(constellations:GetChildren()) do
        if constFolder:IsA("Folder") then
            for _, val in ipairs(constFolder:GetChildren()) do
                if val:IsA("StringValue") then
                    owned[constFolder.Name .. "|" .. val.Name] = true
                end
            end
        end
    end
    return owned
end

-- 1) Client: Show only stars that the local player has achieved
function StarVisibility.ShowOnlyPlayerAchieved()
    local localPlayer = Players.LocalPlayer
    if not localPlayer then return end
    local root = getRoot(StarHemisphere.Stars)
	if not root then return end

    local owned = buildOwnedSetFromPlayer(localPlayer)
	--print("Individual", #owned)
    for part in iterStarParts(root) do
        local key = makeKeyFromPart(part :: BasePart)
        if key and owned[key] then
            (part :: BasePart).LocalTransparencyModifier = 0
        else
            (part :: BasePart).LocalTransparencyModifier = 1
        end
    end
end

-- 2) Client: Show only stars achieved by at least one player (global union)
function StarVisibility.ShowOnlyUnionAchieved(player)
	local root = getRoot(StarHemisphere.Stars)
	if not root then return end

	local unionOwned = {}
	for _, plr in Players:GetPlayers() do
		local owned = buildOwnedSetFromPlayer(plr)
		for k in owned do
			unionOwned[k] = true
		end
	end

	-- Build array of keys for remote event
	local visibleKeys = {}
	for k in unionOwned do
		table.insert(visibleKeys, k)
	end
	--print("ServerUnion", #visibleKeys)

	-- Fire remote event to each client with the union set
	if UpdateVisibleStars then
		UpdateVisibleStars:FireClient(player, "ServerUnion", visibleKeys)
	end
end

-- 1 or 2) Client: Show only stars depending on current mode
function StarVisibility.RefreshClient(player)
	local root = getRoot(StarHemisphere.Stars)
	if not root then return end

	local unionOwned = {}
	for _, plr in Players:GetPlayers() do
		local owned = buildOwnedSetFromPlayer(plr)
		for k in owned do
			unionOwned[k] = true
		end
	end

	-- Build array of keys for remote event
	local visibleKeys = {}
	for k in unionOwned do
		table.insert(visibleKeys, k)
	end

	-- Fire remote event to each client with the union set
	if UpdateVisibleStars then
		UpdateVisibleStars:FireClient(player, nil, visibleKeys)
	end
end

-- 3) Server: Show only stars achieved by at least one player (global union)
function StarVisibility.ServerShowOnlyUnionAchieved()
	if Players.LocalPlayer then return end -- prevent running on client
	local root = getRoot(StarHemisphere.Stars)
	
	if not root then return end
	
	local unionOwned = {}
	for _, plr in Players:GetPlayers() do
		local owned = buildOwnedSetFromPlayer(plr)
		for k in owned do
			unionOwned[k] = true
		end
	end

	local visibleKeys = {}
	for k in unionOwned do
		table.insert(visibleKeys, k)
	end
	--print("Server", #visibleKeys)
	
	local visibleSet = {}
	for i = 1, #visibleKeys do
		visibleSet[visibleKeys[i]] = true
	end

	for part in iterStarParts(root) do
		local key = makeKeyFromPart(part)
		if key and visibleSet[key] then
			part.Transparency = 0
		else
			part.Transparency = 1
		end
	end
end

-- 4) Server: Show all stars globally
function StarVisibility.ServerShowAll()
    if Players.LocalPlayer then return end -- prevent running on client
	local root = getRoot(StarHemisphere.Stars)
    if not root then return end
    for part in iterStarParts(root) do
        local bp = part :: BasePart
        bp.Transparency = 0
    end
end

return StarVisibility


