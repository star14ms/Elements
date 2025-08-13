local spawnFolder = game.ReplicatedStorage.SpawnItems
local ToolDespawnTimer = require(game.ReplicatedStorage.ToolDespawnTimer)

-- Find all desired items in the spawn folder using a loop
local spawnItems = {}
local itemNames = {"H"}
--local itemNames = {"H", "He", "Li", "Be", "B", "C", "N", "O", "F", "Ne", "Na", "Mg", "Al", "Si", "P", "S", "Cl", "Ar"}
--local itemNames = {"K", "Ca", "Sc", "Ti", "V", "Cr", "Mn", "Fe", "Co", "Ni", "Cu", "Zn"}
--local itemNames = {"TNT", "Pizza", "H"}

for _, name in itemNames do
	local item = spawnFolder:FindFirstChild(name)
	if item then
		table.insert(spawnItems, item)
	end
end

local rand = Random.new()

while true do
	local waitTime = rand:NextNumber(10, 10)
	task.wait(waitTime)

	-- Generate a random spawn position within x: -100 to 100, y: 50, z: -100 to 100
	local x = rand:NextNumber(-100, 100)
	local y = 50
	local z = rand:NextNumber(-100, 100)
	local pos = Vector3.new(x, y, z)

	-- Randomly pick an item to spawn
	if #spawnItems == 0 then
		warn("No spawn items found in SpawnFolder!")
		break
	end
	local spawnItem = spawnItems[rand:NextInteger(1, #spawnItems)]

	-- Check if spawnItem is a valid Instance
	if typeof(spawnItem) ~= "Instance" then
		warn("spawnItem is not a valid Roblox Instance! Type:", typeof(spawnItem), "Value:", tostring(spawnItem))
		break
	end
	
	if #game.Workspace.SpawnedItems:GetChildren() >= 1024 then
		continue
	end

	-- Clone the item so each spawn is a new instance
	local newItem = spawnItem:Clone()

	if newItem:IsA("BasePart") then
		-- BasePart which includes Part and MeshPart
		newItem.Position = pos
	elseif newItem:IsA("Model") then
		-- Use PivotTo instead of PrimaryPart (safer)
		if newItem:GetPivot() then
			newItem:PivotTo(CFrame.new(pos))
		else
			warn("Model has no pivot, cannot move!")
		end
	else
		-- Default: print warning
		warn("spawnItem is not a BasePart or Model. Type:", newItem.ClassName)
	end

	newItem.Parent = game.Workspace.SpawnedItems

	-- If the spawned item is a Tool, start the despawn timer
	if newItem:IsA("Tool") then
		ToolDespawnTimer.registerToolForDespawn(newItem)
	end
end

