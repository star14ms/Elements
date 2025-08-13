-- SelectiveSpendController: Handles selective atom spending for bonus
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local SelectiveSpendAtomsAction = ReplicatedStorage.Inventory:WaitForChild("SelectiveSpendAtomsAction")
local InventoryHandlerModule = require(ReplicatedStorage.Inventory.InventoryHandlerModule)

local spendMode = false
local atomicMassSpend = 0
local toolConnections = {}

-- BindableEvent for atom count updates
local AtomsSpentChanged = Instance.new("BindableEvent")
local HanldeItemChanged = Instance.new("BindableEvent")

-- Helper: Connect to all tools' Activated events
local function connectTools()
    -- Disconnect previous
    for tool, conn in toolConnections do
        if conn then conn:Disconnect() end
        toolConnections[tool] = nil
    end

    local function onToolActivated(tool)
		if not spendMode then return end
		local amount = InventoryHandlerModule.getAtomicMassFromTool(tool)
		if amount > 0 then
			atomicMassSpend = atomicMassSpend + amount
            AtomsSpentChanged:Fire(atomicMassSpend)
        end
    end

    local function connectTool(tool)
        if tool:IsA("Tool") and not toolConnections[tool] then
            toolConnections[tool] = tool.Activated:Connect(function()
                onToolActivated(tool)
            end)
        end
    end

    -- Backpack and Character
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        for _, tool in backpack:GetChildren() do
            connectTool(tool)
        end
        backpack.ChildAdded:Connect(connectTool)
    end
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    for _, tool in character:GetChildren() do
        connectTool(tool)
    end
	character.ChildAdded:Connect(connectTool)

	character.ChildAdded:Connect(function(tool)
		HanldeItemChanged:Fire(tool)
	end)
end

-- Helper: Disconnect all tool connections
local function disconnectTools()
    for tool, conn in toolConnections do
        if conn then conn:Disconnect() end
        toolConnections[tool] = nil
    end
end

-- API: Call this to start spend mode
local function StartSelectiveSpend()
    spendMode = true
	AtomsSpentChanged:Fire(atomicMassSpend)
    connectTools()
end

-- API: Call this to end spend mode and send result
local function EndSelectiveSpend()
    spendMode = false
    disconnectTools()
    -- Send to server
	SelectiveSpendAtomsAction:FireServer(atomicMassSpend)
	atomicMassSpend = 0
	AtomsSpentChanged:Fire(atomicMassSpend)
end

-- API: Get current atoms spent
local function GetAtomicMassSpent()
	return atomicMassSpend
end

local function GetSpendMode()
	return spendMode
end

local function AddAtomicMassSpend(amount)
	atomicMassSpend = atomicMassSpend + amount
	AtomsSpentChanged:Fire(atomicMassSpend)
end

-- Expose API for other scripts/dialogs
local module = {}
module.StartSelectiveSpend = StartSelectiveSpend
module.EndSelectiveSpend = EndSelectiveSpend
module.GetAtomicMassSpent = GetAtomicMassSpent
module.GetSpendMode = GetSpendMode
module.AtomsSpentChanged = AtomsSpentChanged.Event
module.HanldeItemChanged = HanldeItemChanged.Event
module.AddAtomicMassSpend = AddAtomicMassSpend

return module

