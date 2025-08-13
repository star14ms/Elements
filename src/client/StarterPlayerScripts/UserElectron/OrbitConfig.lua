-- OrbitConfig ModuleScript

local OrbitConfig = {}

-- Example shell configuration: [max electrons per shell]
local SHELLS = {2, 8, 18, 32, 50, 72, 98}

-- Assign electrons to shells and calculate angleOffsets for even spacing
function OrbitConfig.assignShells(electrons, nucleus, atomicNumber)
	local shells = {}
	local electronShells = {}
	local electronIndex = 1
	local remaining = atomicNumber
	local nucleusRadius = math.max(nucleus.Size.X, nucleus.Size.Y, nucleus.Size.Z) / 2
	local baseOffset = nucleusRadius

	for shellNum = 1, #SHELLS do
		local maxInShell = SHELLS[shellNum]
		local electronsInThisShell = math.min(remaining, maxInShell)
		if electronsInThisShell <= 0 then break end

		-- Assign electrons to this shell
		for i = 1, electronsInThisShell do
			
			
			local electron = electrons[electronIndex]
			-- Evenly space electrons: angleOffset = (2pi) * ((i-1)/electronsInThisShell)
			local angleOffset = (2 * math.pi) * ((i - 1) / electronsInThisShell)
			electronShells[electron] = {
				shell = shellNum,
				shellRadius = baseOffset + 1.5 * shellNum, -- Example: increase radius per shell
				speedMultiplier = 1 / shellNum, -- Example: outer shells orbit slower
				angleOffset = angleOffset,
			}
			electronIndex = electronIndex + 1
		end

		remaining = remaining - electronsInThisShell
		if remaining <= 0 then break end
	end

	return electronShells
end

-- Dummy implementations for required functions (for completeness)
function OrbitConfig.setAllElectronsInvisible(electrons)
	for i = 1, #electrons do
		electrons[i].Transparency = 1
	end
end

function OrbitConfig.setElectronsByAtomicNumber(electrons, atomicNumber)
	for i = 1, #electrons do
		electrons[i].Transparency = (i > atomicNumber) and 1 or 0
	end
end

return OrbitConfig

