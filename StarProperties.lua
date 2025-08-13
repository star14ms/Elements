-- StarProperties ModuleScript
-- Provides assignProperties() for star creation
local ReplicatedStorage = game:GetService("ReplicatedStorage")


local StarProperties = {}

-- Spectral class definitions
-- Spectral class definitions
local CLASS_IDS = {
	["O"] = 1,
	["B"] = 2,
	["A"] = 3,
	["F"] = 4,
	["G"] = 5,
	["K"] = 6,
	["M"] = 7,
	["D"] = 8,
	["N"] = 9,
	["H"] = 10,
}

local CLASSES = {
	{
		class = "O",
		massRange = {16, 16}, -- solar masses
		color = Color3.fromRGB(111, 125, 255),
		textColor = Color3.fromRGB(148, 162, 255),
		sizeRange = {6.6, 100}, -- arbitrary units
		lifetime = {20, 20}, -- in billions of years (very short)
		maxPulses = 5,
		minAtoms = 640,
		maxAtoms = 640,
		prob = 0.06,
	},
	{
		class = "B",
		massRange = {2.1, 16},
		color = Color3.fromRGB(171, 203, 255),
		textColor = Color3.fromRGB(193, 225, 255),
		sizeRange = {1.8, 6.6},
		lifetime = {20, 40},
		maxPulses = 5,
		minAtoms = 84,
		maxAtoms = 640,
		prob = 0.13,
	},
	{
		class = "A",
		massRange = {1.4, 2.1},
		color = Color3.fromRGB(226, 255, 228),
		textColor = Color3.fromRGB(247, 255, 253),
		sizeRange = {1.4, 1.8},
		lifetime = {40, 60},
		maxPulses = 5,
		minAtoms = 56,
		maxAtoms = 84,
		prob = 0.61,
	},
	{
		class = "F",
		massRange = {1.04, 1.4},
		color = Color3.fromRGB(213, 212, 185),
		textColor = Color3.fromRGB(255, 237, 166),
		sizeRange = {1.15, 1.4},
		lifetime = {60, 90},
		maxPulses = 5,
		minAtoms = 42,
		maxAtoms = 56,
		prob = 3.0,
	},
	{
		class = "G",
		massRange = {0.8, 1.04},
		color = Color3.fromRGB(159, 143, 84),
		textColor = Color3.fromRGB(255, 229, 124),
		sizeRange = {0.96, 1.15},
		lifetime = {90, 120},
		maxPulses = 3,
		minAtoms = 32,
		maxAtoms = 42,
		prob = 7.6,
	},
	{
		class = "K",
		massRange = {0.45, 0.8},
		color = Color3.fromRGB(165, 109, 77),
		textColor = Color3.fromRGB(255, 146, 74),
		sizeRange = {0.7, 0.96},
		lifetime = {120, 150},
		maxPulses = 2,
		minAtoms = 18,
		maxAtoms = 32,
		prob = 12.1,
	},
	{
		class = "M",
		massRange = {0.08, 0.45},
		color = Color3.fromRGB(168, 74, 58),
		textColor = Color3.fromRGB(255, 70, 53),
		sizeRange = {0.08, 0.7},
		lifetime = {150, 180},
		maxPulses = 1,
		minAtoms = 10,
		maxAtoms = 18,
		prob = 76.5,
	},
}



local TEXTCOLORS = {
	{
		class = "O",
		textColor = Color3.fromRGB(148, 162, 255),
	},
	{
		class = "B",
		textColor = Color3.fromRGB(193, 225, 255),
	},
	{
		class = "A",
		textColor = Color3.fromRGB(247, 255, 253),
	},
	{
		class = "F",
		textColor = Color3.fromRGB(255, 237, 166),
	},
	{
		class = "G",
		textColor = Color3.fromRGB(255, 229, 124),
	},
	{
		class = "K",
		textColor = Color3.fromRGB(255, 146, 74),
	},
	{
		class = "M",
		textColor = Color3.fromRGB(255, 70, 53),
	},
	{
		class = "D",
		textColor = Color3.fromRGB(255, 255, 255),
	},
	{
		class = "N",
		textColor = Color3.fromRGB(49, 255, 255),
	},
	{
		class = "H",
		textColor = Color3.fromRGB(225, 18, 18),
	}
}



-- StarElementOrigins.luau
-- Mapping from stellar class or production channel to the chemical elements they can produce/eject
-- Classes: O, B, A, F, G, K, M (main sequence), D (exploding white dwarfs/Type Ia), N (neutron-star mergers)
-- Extra channels: BB (big bang fusion), CR (cosmic ray spallation)

local ClassToElements: { [string]: { string } } = {
	-- Big bang and cosmic rays (non-stellar, for completeness)
	--BB = { "H", "He", "Li" },
	--CR = { "Li", "Be", "B" },

	-- stars produce He from H
	-- Massive main-sequence stars → core-collapse SNe (dominant producer of O–Zn, also some C and N)
	O = {
		He = 5, Li = 0.5, Be = 1, B = 0.5, C = 8, N = 2, O = 5, F = 1, Ne = 8, 
		Na = 2, Mg = 5, Al = 2, Si = 8, P = 2, S = 4, Cl = 2, Ar = 4, K = 2, Ca = 4, 
		Sc = 2, Ti = 1, V = 2, Cr = 1, Mn = 2, Fe = 5, Co = 1, Ni = 2, Cu = 1, Zn = 2, 
		Ga = 1, Ge = 2, As = 1, Se = 2, Br = 1, Kr = 2, Rb = 1, Sr = 2, Y = 1, Zr = 2, 
	},
	O_N = {
		He = 5, Li = 0.5, Be = 1, B = 0.5, C = 8, N = 2, O = 5, F = 1, Ne = 8, 
		Na = 2, Mg = 5, Al = 2, Si = 8, P = 2, S = 4, Cl = 2, Ar = 4, K = 2, Ca = 4, 
		Sc = 1, Ti = 2, V = 1, Cr = 2, Mn = 2, Fe = 5, Co = 1, Ni = 2, Cu = 1, Zn = 2, 
		Ga = 1, Ge = 2, As = 1, Se = 2, Br = 1, Kr = 2, Rb = 1, Sr = 2, Y = 1, Zr = 2, 
	},
	
	B_Big = {
		H = 20, He = 20, Li = 1, Be = 3, B = 1, C = 10, N = 6, O = 10, F = 3, Ne = 10, 
		Na = 3, Mg = 5, Al = 3, Si = 5
	},
	B_N = {
		Li = 0.5, Be = 1, B = 0.5, C = 8, N = 6, O = 8, F = 1, Ne = 8, 
		Na = 2, Mg = 5, Al = 2, Si = 8, P = 2, S = 5, Cl = 2, Ar = 5, K = 2, Ca = 5, 
		Sc = 2, Ti = 5, V = 2, Cr = 5, Mn = 2, Fe = 5, Co = 2, Ni = 2, Cu = 2, Zn = 2
	},

	B_Small = {
		H = 20, He = 20, Li = 1, Be = 3, B = 1, C = 10, N = 6, O = 10, F = 3, Ne = 10, 
		Na = 3, Mg = 5, Al = 3, Si = 5
	},
	B_D = {
		He = 5, Li = 0.5, Be = 1, B = 0.5, C = 8, N = 6, O = 8, F = 1, Ne = 8, 
		Na = 2, Mg = 5, Al = 2, Si = 8, P = 2, S = 5, Cl = 2, Ar = 5, K = 2, Ca = 5, 
		Sc = 2, Ti = 5, V = 2, Cr = 5, Mn = 2, Fe = 8
	},

	-- Low-to-intermediate mass main-sequence stars → AGB phase (s-process; C, N, F, Na; minor O production)
	A = {
		H = 20, He = 20, Li = 1, Be = 3, B = 1, C = 10, N = 6, O = 10, F = 2, Ne = 10, 
		Na = 2, Mg = 6, Al = 3, Si = 6
	},
	A_D = {
		He = 5, Li = 0.5, Be = 1, B = 0.5, C = 10, N = 5, O = 10, F = 2, Ne = 10, 
		Na = 2, Mg = 5, Al = 2, Si = 10, P = 2, S = 4, Cl = 2, Ar = 4, K = 2, Ca = 4,
		Sc = 2, Ti = 4, V = 2, Cr = 4, Mn = 2, Fe = 5, 
	},

	F = {
		H = 20, He = 20, Li = 1, Be = 3, B = 1, C = 20, N = 15, O = 20,
	},
	F_D = {
		He = 10, Li = 1, Be = 4, B = 1, C = 20, N = 10, O = 15, F = 4, Ne = 15, 
		Na = 5, Mg = 15, 
	},

	G = {
		H = 20, He = 50, Li = 1, Be = 3, B = 1, C = 25,
	},
	G_D = {
		H = 10, He = 25, Li = 1, Be = 3, B = 1, C = 60, 
	},

	K = {
		H = 40, He = 40, Li = 1, Be = 3, B = 1, C = 15, 
	},
	K_D = {
		H = 15, He = 40, Li = 1, Be = 3, B = 1, C = 40, 
	},

	-- Very low-mass main-sequence stars
	M = { H = 60, He = 40 },
	M_D = {
		H = 20, He = 80
	},

	-- Exploding white dwarfs (Type Ia) → intermediate mass elements and Fe-peak
	--WD = {
	--	"Si", "P", "S", "Cl", "Ar", "K", "Ca", "Sc", "Ti", "V", "Cr", "Mn", "Fe", "Co", "Ni", "Cu", "Zn"
	--},

	---- Neutron-star mergers (r-process) → most nuclei heavier than iron
	--NS = {
	--	"Nb", "Mo", "Ru", "Rh", "Pd", "Ag",
	--	"Cd", "In", "Sn", "Sb", "Te", "I", "Xe",
	--	"Cs", "Ba", "La", "Ce", "Pr", "Nd", "Sm", "Eu", "Gd", "Tb",
	--	"Dy", "Ho", "Er", "Tm", "Yb", "Lu", "Hf", "Ta", "W", "Re",
	--	"Os", "Ir", "Pt", "Au", "Hg", "Tl", "Pb", "Bi", "Th", "U",
	--	"Pm", -- unstable, but produced in the r-process
	--},
}


function cloneAtomInstances(atomAcronyms)
	-- Find atom templates in ReplicatedStorage.Model
	local atomsToRelease = {}
	for i = 1, #atomAcronyms do
		local atom = ReplicatedStorage.SpawnItems:FindFirstChild(atomAcronyms[i])
		if atom then
			table.insert(atomsToRelease, atom:Clone())
		end
	end
	
	return atomsToRelease
end


function StarProperties.pickRandomElementByProbability(starClass)
	local elementTable = ClassToElements[starClass]

	-- Calculate total weight
	local total = 0
	for element, weight in elementTable do
		total = total + weight
	end
	-- Generate a random number between 0 and total
	local r = math.random() * total
	local acc = 0
	for element, weight in elementTable do
		acc = acc + weight
		if r <= acc then
			return element
		end
	end
	-- Fallback: return last element (should not happen if weights are positive)
	for element, _ in elementTable do
		return element
	end
end

-- Picks n random elements from the probability table for the given starClass.
-- Returns a table of picked element symbols.
-- By default, allows repeats (sampling with replacement).
function StarProperties.pickNRandomElementsByProbability(starClass, mass, n)
	if starClass == "B" then
		if mass >= 8 then
			starClass = "B_Big"
		else
			starClass = "B_Small"
		end
	elseif starClass == "B_D" then
		if mass >= 8 then
			starClass = "B_N"
		else
			starClass = "B_D"
		end
	end

	local elementTable = ClassToElements[starClass]

	local elements = {}
	local weights = {}
	local total = 0
	
	-- Build arrays of elements and their weights
	for element, weight in elementTable do
		table.insert(elements, element)
		table.insert(weights, weight)
		total = total + weight
	end
	
	-- Build cumulative weights for efficient selection
	local cumulative = {}
	local acc = 0
	for i = 1, #weights do
		acc = acc + weights[i]
		cumulative[i] = acc
	end
	
	local picks = {}
	for i = 1, n do
		local r = math.random() * total
		for j = 1, #cumulative do
			if r <= cumulative[j] then
				table.insert(picks, elements[j])
				break
			end
		end
	end
	
	local atomInstances = cloneAtomInstances(picks)

	return atomInstances
end


local function randomBetween(a, b)
	return a + math.random() * (b - a)
end

function StarProperties.calculateClassProbability(massToSpend)
	local tempProbs = {}
	for i = 1, #CLASSES do
		tempProbs[i] = CLASSES[i].prob
	end
	
	local factor = 1

	while massToSpend > 0 do
		-- Find the class with the highest probability that is not zero
		local maxProb, idx = 0, nil
		for i = 1, #tempProbs do
			if tempProbs[i] > maxProb then
				maxProb = tempProbs[i]
				idx = i
			end
		end

		if not idx then break end -- No more probability to reduce

		local reduce = math.min(massToSpend, tempProbs[idx] * factor)
		tempProbs[idx] = tempProbs[idx] - reduce / factor
		massToSpend = massToSpend - reduce

		-- If this class reaches zero, redistribute remaining probability
		if tempProbs[idx] <= 0 or massToSpend == 0 then
			if tempProbs[idx] <= 0 then 
				tempProbs[idx] = 0
			end
			-- Recalculate total and normalize
			local total = 0
			for i = 1, #tempProbs do
				total = total + tempProbs[i]
			end
			if total > 0 then
				for i = 1, #tempProbs do
					tempProbs[i] = tempProbs[i] / total * 100
				end
			end
			
			if massToSpend == 0 or tempProbs[4] == 0 then
				break
			end
			--print("Redistributed probabilities after class " .. CLASSES[idx].class .. " reached zero:", table.unpack(tempProbs))
		end
		factor = factor * 2
	end
	--print("Final probabilities:", table.unpack(tempProbs))
	
	return tempProbs
end

-- Helper to pick class by fixed probability, with atomicMassSpent affecting lowest-mass classes
local function pickClassByProbability(massToSpend)
	local tempProbs = StarProperties.calculateClassProbability(massToSpend)
	
	-- Calculate total probability
	local total = 0
	for i = 1, #tempProbs do
		total = total + tempProbs[i]
	end
	if total <= 0 then
		-- fallback: all probabilities zero, pick the highest-mass class
		return CLASSES[1]
	end

	local r = math.random() * total
	local acc = 0
	for i = 1, #CLASSES do
		acc = acc + tempProbs[i]
		if r <= acc then
			return CLASSES[i]
		end
	end
	return CLASSES[#CLASSES] -- fallback to M
end

function StarProperties.assignProperties(atomicMassSpent)
	local atmoicMassSpent = atomicMassSpent or 0

	-- Pick class by probability
	local classData = pickClassByProbability(atomicMassSpent)
	-- Randomly pick a mass within the class's range
	local mass = randomBetween(classData.massRange[1], classData.massRange[2])
	-- Assign properties based on class
	local color = classData.color
	local sizeRatio = randomBetween(classData.sizeRange[1], classData.sizeRange[2])
	local lifetime = randomBetween(classData.lifetime[1], classData.lifetime[2])

	return {
		class = classData.class,
		mass = mass,
		color = color,
		sizeRatio = sizeRatio,
		maxPulses = classData.maxPulses,
		lifetime = lifetime,
		minAtoms = classData.minAtoms,
		maxAtoms = classData.maxAtoms,
		textColor = classData.textColor
	}
end

StarProperties.CLASS_IDS = CLASS_IDS
StarProperties.CLASSES = CLASSES -- Expose CLASSES for external use
StarProperties.ClassToElements = ClassToElements
StarProperties.TEXTCOLORS = TEXTCOLORS

return StarProperties

