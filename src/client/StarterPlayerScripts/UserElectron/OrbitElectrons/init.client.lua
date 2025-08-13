-- Orbit Script (Client-side, electrons orbit the equipped element's nucleus)
-- Place this LocalScript under StarterPlayerScripts

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local ElectronUtils = require(script.Parent.ElectronUtils)
local OrbitConfig = require(script.Parent.OrbitConfig)
local ELEMENTS = require(game.ReplicatedStorage.Constant).ELEMENTS

-- Cache atomic numbers for quick lookup
local ELEMENTS_ATOMIC_NUM = {}

for i, element in ipairs(ELEMENTS) do
	ELEMENTS_ATOMIC_NUM[element] = i
end

-- Get electrons from ElectronUtils
local electrons = ElectronUtils.createUserElectrons()

local electronAngles = {}

local function resetRotation(electrons) 
	for i = 1, #electrons do
		electronAngles[electrons[i]] = 0
	end
end

resetRotation(electrons)

local ORBIT_TIME = 1.00
local ECLIPSE = 1
local ROTATION = CFrame.Angles(-33,0,0)
local sin, cos = math.sin, math.cos
local BASE_ROTSPEED = math.pi*2/ORBIT_TIME

-- State
local equippedTool = nil
local nucleus = nil
local atomicNumber = 0
local electronShells = nil

-- Helper: Hide all electrons
local function hideElectrons()
	OrbitConfig.setAllElectronsInvisible(electrons)
	nucleus = nil
	atomicNumber = 0
	electronShells = nil
end

-- Helper: Show electrons for this tool/nucleus
local function showElectrons(tool)
	-- Find Model and Nucleus in the tool
	local model = tool:FindFirstChildOfClass("Model")
	if not model then hideElectrons() return end
	local foundNucleus = nil
	for i = 1, #model:GetChildren() do
		local child = model:GetChildren()[i]
		if child:IsA("Part") and child.Name:lower():find("nucleus") then
			foundNucleus = child
			break
		end
	end
	if not foundNucleus then hideElectrons() return end
	nucleus = foundNucleus

	-- Determine atomic number from tool name
	atomicNumber = ELEMENTS_ATOMIC_NUM[tool.Name] or 1
	
	-- Assign shells and set visibility
	resetRotation(electrons)
	electronShells = OrbitConfig.assignShells(electrons, nucleus, atomicNumber)
	OrbitConfig.setElectronsByAtomicNumber(electrons, atomicNumber)
end

-- Listen for tool equipped/unequipped
local function onChildAdded(child)
	if child:IsA("Tool") and ELEMENTS_ATOMIC_NUM[child.Name] then
		equippedTool = child
		--if child.Parent then
		--	child.Model.Nucleus.CanCollide = false
		--end
		showElectrons(child)
	end
end

local function onChildRemoved(child)
	if child == equippedTool then
		equippedTool = nil
		--if child.Parent then
		--	child.Model.Nucleus.CanCollide = true
		--end
		hideElectrons()
	end
end

-- Connect to character tools
local function connectCharacter(character)
	-- Listen for tools equipped/unequipped
	character.ChildAdded:Connect(onChildAdded)
	character.ChildRemoved:Connect(onChildRemoved)
	-- If already holding a tool, show electrons
	for i = 1, #character:GetChildren() do
		local child = character:GetChildren()[i]
		if child:IsA("Tool") and ELEMENTS[child.Name] then
			equippedTool = child
			showElectrons(child)
			break
		end
	end
end

-- Listen for character spawn
LocalPlayer.CharacterAdded:Connect(connectCharacter)
if LocalPlayer.Character then
	connectCharacter(LocalPlayer.Character)
end

-- Orbit update loop
RunService.RenderStepped:Connect(function(dt)
	if not nucleus or not electronShells then return end
	for i = 1, atomicNumber do
		local electron = electrons[i]
		local shellData = electronShells[electron]
		if shellData then
			local shellRadius = shellData.shellRadius
			local speedMultiplier = shellData.speedMultiplier or 1
			local angleOffset = shellData.angleOffset
			electronAngles[electron] = electronAngles[electron] + dt * BASE_ROTSPEED * speedMultiplier
			local angle = electronAngles[electron] + angleOffset
			local ellipse = ECLIPSE * shellRadius
			electron.CFrame = ROTATION * CFrame.new(sin(angle)*ellipse, 0, cos(angle)*shellRadius) + nucleus.Position
		end
	end
end)

