local ReplicatedStorage = game:GetService("ReplicatedStorage")

local event = ReplicatedStorage:WaitForChild("RequestToolPickup")

event.OnServerEvent:Connect(function(player, tool)
	if typeof(tool) ~= "Instance" or not tool:IsA("Tool") then return end
	if not tool.Parent or not tool:IsDescendantOf(workspace.SpawnedItems) then return end

	local character = player.Character
	if not character then return end
	local hrp = character:FindFirstChild("HumanoidRootPart")
	local handle = tool:FindFirstChild("Handle")
	if not hrp or not handle then return end

	local distance = (handle.Position - hrp.Position).Magnitude
	if distance > 10 then return end -- must match client distance

	-- Parent the tool to the player's Backpack if not already owned
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	tool.Parent = player.Backpack
	humanoid:EquipTool(tool)
end)

