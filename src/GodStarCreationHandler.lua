-- GodStarCreationHandler Module
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local InventoryHandler = require(game.ReplicatedStorage.Inventory.InventoryHandlerModule)

-- Fixed star list - stars that should be created if player doesn't have the achievement
local FIXED_STAR_LIST = {
    "Ursa Minor/Polaris",
    "Centaurus/α Cen", 
    "Canis Major/Sirius A, B"
}

-- Table to track free star creations per player (by UserId)
local freeCount = 0
local freeLimit = 0

-- Helper: increment player's free star creation count
local function incrementFreeCount(player)
	freeCount = freeCount + 1
end

-- Helper: remove Hydrogen Atoms from inventory
local function removeHydrogen(player, count)
    if count > 0 then
        return InventoryHandler.HasAndRemove(player, "H", count)
    end
    return false
end

-- Helper: check if player has achievement for a specific star
local function hasStarAchievement(player, starKey)
    local playerData = player:FindFirstChild("ACHIEVEMENTS FOLDER")
    if not playerData then
        return false
    end
    
    local constellationsFolder = playerData:FindFirstChild("Constellations")
    if not constellationsFolder then
        return false
    end
    
    -- Parse starKey format: "[constellation]/[starName]"
    local parts = {}
    for part in string.gmatch(starKey, "[^/]+") do
        table.insert(parts, part)
    end
    
    if #parts ~= 2 then
        return false
    end
    
    local constellationName = parts[1]
    local starName = parts[2]
    
    local constFolder = constellationsFolder:FindFirstChild(constellationName)
    if not constFolder then
        return false
    end
    
    local starNode = constFolder:FindFirstChild(starName)
    return starNode ~= nil
end

-- Helper: find first available fixed star that player doesn't have
local function findAvailableFixedStar(player)
    for _, starKey in ipairs(FIXED_STAR_LIST) do
        if not hasStarAchievement(player, starKey) then
            return starKey
        end
    end
    return nil
end

-- Main handler
local GodStarCreationHandler = {}

-- Returns: canCreate, message, highClassProb, starKey (or nil if no fixed star available)
function GodStarCreationHandler.SpendAtomsToCreateStar(player, spendAll)
	if freeCount < freeLimit then
        incrementFreeCount(player)
        -- Try to find a fixed star to create
        local availableStarKey = findAvailableFixedStar(player)
        return true, nil, 0, availableStarKey
    else
		local atomicMassSpent = InventoryHandler.GetTotalAtomicMassFromInventory(player)
		if atomicMassSpent and atomicMassSpent >= 1 then
			local success
            if spendAll then
				success = InventoryHandler.RemoveAllAtomsFromInventory(player)
			else 
				success = removeHydrogen(player, 1)
			end
            if success then
                -- Try to find a fixed star to create
                local availableStarKey = findAvailableFixedStar(player)
				return true, nil, atomicMassSpent, availableStarKey
            else
                return false, "Failed to spend atoms!", 0, nil
            end
        else
            return false, "You need at least 1 Hydrogen Atom!", 0, nil
        end
    end
end

-- Helper to check if player is on free creation
function GodStarCreationHandler.IsFreeCreation(player)
	return freeCount < freeLimit
end

-- Helper to get atom count
function GodStarCreationHandler.CountHydrogen(player)
	return InventoryHandler.CountHydrogenFromInventory(player)
end

-- Helper to get the fixed star list
function GodStarCreationHandler.GetFixedStarList()
    return FIXED_STAR_LIST
end

-- Helper to check if a specific star is available for creation
function GodStarCreationHandler.IsStarAvailable(player, starKey)
    return not hasStarAchievement(player, starKey)
end

return GodStarCreationHandler


