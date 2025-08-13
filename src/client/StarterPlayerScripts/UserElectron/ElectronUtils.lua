local ElectronUtils = {}

-- Returns a sorted array of all electrons under StarterPlayerScripts.Electrons
function ElectronUtils.createUserElectrons()
	-- Find a template electron (must exist as "Electron" under Model)
	local sharedModel = game.ReplicatedStorage:FindFirstChild("Model")
	local electronTemplate = sharedModel:FindFirstChild("Electron")
	local userElectrons = {}

	for i = 1, 118 do
		local newElectron = electronTemplate:Clone()
		newElectron.Name = "Electron" .. tostring(i)
		newElectron.Transparency = 1
		newElectron.Parent = game.Workspace.SpawnedItems.Electrons
		table.insert(userElectrons, newElectron)
	end
	table.sort(userElectrons, function(a, b)
		return a.Name < b.Name
	end)
	return userElectrons
end

function ElectronUtils.getUserElectrons()
	-- This assumes ElectronUtils is parented under StarterPlayerScripts
	local electronsFolder = game.Workspace.SpawnedItems:FindFirstChild("Electrons")
	local electrons = {}
	if electronsFolder then
		for _, child in electronsFolder:GetChildren() do
			if child:IsA("Part") and string.sub(child.Name, 1, 8) == "Electron" then
				table.insert(electrons, child)
			end
		end
	end
	return electrons
end

return ElectronUtils
