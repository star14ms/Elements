local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InventoryAction = ReplicatedStorage.Inventory:WaitForChild("InventoryAction")


local function ThrowItem(props)
	local tool
	if props.cloneAndThrow then
		tool = props.tool:Clone()
	else
		tool = props.tool
	end
	
	local pos = props.position + (props.direction * 10)

	if tool:IsA("BasePart") then
		tool.Position = pos
	elseif tool:IsA("Model") then
		if tool:GetPivot() then
			tool:PivotTo(CFrame.new(pos))
		else
			warn("Model has no pivot, cannot move!")
		end
		tool.Parent = Workspace.SpawnedItems
	end
end

InventoryAction.OnServerEvent:Connect(function(_, actionName, props)
	if actionName == "ThrowTool" then
		ThrowItem(props)
	end
	-- Add more actions as needed
end)
