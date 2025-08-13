--local ReplicatedStorage = game:GetService("ReplicatedStorage")
--local Players = game:GetService("Players")

---- Example atom list to give to new players
--local STARTING_ATOMS = {
--	"H", "He", "Li", "Be", "B", "C", "N", "O", "F", "Ne",
--	"Na", "Mg", "Al", "Si", "P", "S", "Cl", "Ar", "K", "Ca",
--	"Sc", "Ti", "V", "Cr", "Mn", "Fe", "Co", "Ni", "Cu", "Zn",
--	"Ga", "Ge", "As", "Se", "Br", "Kr", "Rb", "Sr", "Y", "Zr",
--	"Nb", "Mo", "Tc", "Ru", "Rh", "Pd", "Ag", "Cd", "In", "Sn",
--	"Sb", "Te", "I", "Xe", "Cs", "Ba", "La", "Ce", "Pr", "Nd",
--	"Pm", "Sm", "Eu", "Gd", "Tb", "Dy", "Ho", "Er", "Tm", "Yb",
--	"Lu", "Hf", "Ta", "W", "Re", "Os", "Ir", "Pt", "Au", "Hg",
--	"Tl", "Pb", "Bi", "Po", "At", "Rn", "Fr", "Ra", "Ac", "Th",
--	"Pa", "U", "Np", "Pu", "Am", "Cm", "Bk", "Cf", "Es", "Fm",
--	"Md", "No", "Lr", "Rf", "Db", "Sg", "Bh", "Hs", "Mt", "Ds",
--	"Rg", "Cn", "Nh", "Fl", "Mc", "Lv", "Ts", "Og"
--}

--local function giveAtoms(player)
--	local backpack = player:WaitForChild("Backpack")

--	for i, atom in STARTING_ATOMS do
--		local atomInstance = ReplicatedStorage.SpawnItems:FindFirstChild(atom):Clone()
--		atomInstance:SetAttribute("amount", 10)
--		atomInstance.Parent = backpack
--	end
--end

--Players.PlayerAdded:Connect(function(player)
--	player.CharacterAdded:Connect(function()
--		--wait(1) -- Slight delay to ensure Backpack is ready
--		giveAtoms(player)
--	end)
--end)

---- Optional: Give atoms to players already in game (for live script reloads)
--for _, player in Players:GetPlayers() do
--    giveAtoms(player)
--end
