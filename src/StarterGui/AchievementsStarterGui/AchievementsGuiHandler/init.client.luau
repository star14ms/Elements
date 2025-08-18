local client: Player = game.Players.LocalPlayer

local clientAchievements = client:WaitForChild("ACHIEVEMENTS FOLDER") :: Folder

local plrGui = script.Parent :: PlayerGui

local mainGui = plrGui:WaitForChild("AchievementsMainGui") :: ScreenGui
local openMainButton = mainGui:WaitForChild("OpenButton") :: TextButton
local mainFrame = mainGui:WaitForChild("AchievementsFrame") :: Frame
mainFrame.Visible = false

local notifGui = plrGui:WaitForChild("AchievementsNotification") :: ScreenGui
notifGui.Enabled = false
local notifFrame = notifGui:WaitForChild("NotificationFrame") :: Frame
local notifFramePos:UDim2 = notifFrame.Position


local rs = game.ReplicatedStorage:WaitForChild("AchievementSystemReplicatedStorage")
local remote = rs:WaitForChild("AchievementsRemoteEvent") :: RemoteEvent
local allAchievements = require(rs:WaitForChild("AchievementsList")) :: {[string]: any}
local ConstellationProgress = require(script:WaitForChild("ConstellationProgress"))

-- Tabs and state
local updateMain -- forward declaration
local currentTab = "PeriodicTable" -- "Elements" | "Constellations" | "PeriodicTable"
local selectedConstellationName: string? = nil
local unseen: {[string]: boolean} = {}
local sessionUnseenShown: {[string]: boolean} = {}
local savedScroll: {[string]: Vector2} = {
    Elements = Vector2.new(0, 0),
    Constellations = Vector2.new(0, 0),
    PeriodicTable = Vector2.new(0, 0),
}

-- PeriodicTable references (for family lists)
local PeriodicTable = workspace.MainPlate:WaitForChild("PeriodicTable")
local PeriodicTablePaths = require(workspace.MainPlate.PeriodicTable.PeriodicTablePaths)
local periodicTableColors = require(game.ReplicatedStorage.Constant).periodicTableColors -- Don't edit it (it's correct)
local spectralGuiColors = require(game.ReplicatedStorage.Constant).spectralGuiColors
local StarSphere = require(game.ReplicatedStorage.Shared:WaitForChild("StarSphere"))

-- local periodicTableColors = {
--     ["Actinide"] = Color3.fromRGB(175, 221, 255),
--     ["AlkaliMetal"] = Color3.fromRGB(255, 0, 0),
--     ["AlkalinEarth"] = Color3.fromRGB(255, 175, 0),
--     ["Lanthanide"] = Color3.fromRGB(0, 255, 255),
--     ["Metalloid"] = Color3.fromRGB(0, 255, 0),
--     ["NobleGas"] = Color3.fromRGB(170, 0, 170),
--     ["Nonmetal"] = Color3.fromRGB(4, 175, 236),
--     ["PostTransitionMetal"] = Color3.fromRGB(75, 151, 75),
--     ["TransitionMetal"] = Color3.fromRGB(248, 248, 248),
--     ["Unknown"] = Color3.fromRGB(120, 120, 120),
-- }
-- local spectralGuiColors = {
--     O = Color3.fromRGB(111, 125, 255),
--     B = Color3.fromRGB(171, 203, 255),
--     A = Color3.fromRGB(226, 255, 228),
--     F = Color3.fromRGB(213, 212, 185),
--     G = Color3.fromRGB(159, 143, 84),
--     K = Color3.fromRGB(165, 109, 77),
--     M = Color3.fromRGB(168, 80, 58),
-- }

local function getElementFamily(symbol: string): string
	-- Best-effort: detect lanthanide/actinide from PeriodicTablePaths lists; otherwise unknown
	if table.find(PeriodicTablePaths.Lanthanides, symbol) then return "Lanthanide" end
	if table.find(PeriodicTablePaths.Actinides, symbol) then return "Actinide" end
	if table.find(PeriodicTablePaths.AlkaliMetals, symbol) then return "AlkaliMetal" end
	if table.find(PeriodicTablePaths.AlkalineEarthMetals, symbol) then return "AlkalinEarth" end
	if table.find(PeriodicTablePaths.Metalloids, symbol) then return "Metalloid" end
	if table.find(PeriodicTablePaths.NobleGases, symbol) then return "NobleGas" end
	if table.find(PeriodicTablePaths.Nonmetals, symbol) then return "Nonmetal" end
	if table.find(PeriodicTablePaths.PostTransitionMetals, symbol) then return "PostTransitionMetal" end
	if table.find(PeriodicTablePaths.TransitionMetals, symbol) then return "TransitionMetal" end
	return "Unknown"
end

local tabs = mainFrame:WaitForChild("Tabs") :: Frame
-- local elementsBtn = tabs:WaitForChild("ElementsTab") :: TextButton
local constBtn = tabs:WaitForChild("ConstellationsTab") :: TextButton
local periodicTableBtn = tabs:WaitForChild("PeriodicTableTab") :: TextButton

local function storeOriginalColors(btn: TextButton?)
    if not btn then return end
    if btn:GetAttribute("orig_bg_r") == nil then
        local c = btn.BackgroundColor3
        btn:SetAttribute("orig_bg_r", math.floor(c.R * 255))
        btn:SetAttribute("orig_bg_g", math.floor(c.G * 255))
        btn:SetAttribute("orig_bg_b", math.floor(c.B * 255))
    end
    if btn:GetAttribute("orig_tx_r") == nil then
        local c = btn.TextColor3
        btn:SetAttribute("orig_tx_r", math.floor(c.R * 255))
        btn:SetAttribute("orig_tx_g", math.floor(c.G * 255))
        btn:SetAttribute("orig_tx_b", math.floor(c.B * 255))
    end
end

local function darkenColor(c: Color3, amount: number): Color3
	local r = math.clamp(math.floor(c.R * 255) - amount, 0, 255)
	local g = math.clamp(math.floor(c.G * 255) - amount, 0, 255)
	local b = math.clamp(math.floor(c.B * 255) - amount, 0, 255)
	return Color3.fromRGB(r, g, b)
end

local function restoreBtnColors(btn: TextButton?)
    if not btn then return end
    local r = btn:GetAttribute("orig_tx_r")
    if r ~= nil then
        btn.TextColor3 = Color3.fromRGB(tonumber(btn:GetAttribute("orig_tx_r")) or 255, tonumber(btn:GetAttribute("orig_tx_g")) or 255, tonumber(btn:GetAttribute("orig_tx_b")) or 255)
    end
    r = btn:GetAttribute("orig_bg_r")
    if r ~= nil then
        btn.BackgroundColor3 = Color3.fromRGB(tonumber(btn:GetAttribute("orig_bg_r")) or 255, tonumber(btn:GetAttribute("orig_bg_g")) or 255, tonumber(btn:GetAttribute("orig_bg_b")) or 255)
    end
end

local function styleTabs()
	-- Ensure originals are stored
	-- storeOriginalColors(elementsBtn)
	storeOriginalColors(constBtn)
	storeOriginalColors(periodicTableBtn)
	-- Reset all
	-- restoreBtnColors(elementsBtn)
	restoreBtnColors(constBtn)
	restoreBtnColors(periodicTableBtn)
	-- elementsBtn.Active = true
	-- elementsBtn.AutoButtonColor = true
	constBtn.Active = true
	constBtn.AutoButtonColor = true
	periodicTableBtn.Active = true
	periodicTableBtn.AutoButtonColor = true
	-- Apply active style
	local activeBtn: TextButton? = nil
	if currentTab == "Constellations" then
		activeBtn = constBtn
	elseif currentTab == "PeriodicTable" then
		activeBtn = periodicTableBtn
	end
	if activeBtn then
		activeBtn.BackgroundColor3 = darkenColor(activeBtn.BackgroundColor3, 50)
		activeBtn.TextColor3 = darkenColor(activeBtn.TextColor3, 50)
		activeBtn.Active = false
		activeBtn.AutoButtonColor = false
	end
end

-- elementsBtn.MouseButton1Click:Connect(function()
-- 	currentTab = "Elements"
-- 	updateMain()
-- end)
constBtn.MouseButton1Click:Connect(function()
	currentTab = "Constellations"
	selectedConstellationName = nil
	updateMain()
end)
periodicTableBtn.MouseButton1Click:Connect(function()
	currentTab = "PeriodicTable"
	updateMain()
end)
styleTabs()

--Open main GUI
-- Remove all unseen badges and rings currently in the scroller (list, periodic, or detail map)
local function clearUnseenBadges()
    local scroller = mainFrame:FindFirstChild("AchievementsScroller")
    if not scroller or not scroller:IsA("ScrollingFrame") then return end
    for _, inst in ipairs(scroller:GetDescendants()) do
        local isBadge = inst:IsA("Frame") and inst.Name == "UnseenBadge"
        local isRing = inst:IsA("UIStroke") and inst.Name == "UnseenRing"
        if isBadge or isRing then
            inst:Destroy()
        end
    end
end

openMainButton.MouseButton1Click:Connect(function()
	local willShow = not mainFrame.Visible
	mainFrame.Visible = willShow
	if willShow then
		-- new viewing session
		sessionUnseenShown = {}
	else
		-- closing: mark any shown unseen as seen
		for key in pairs(sessionUnseenShown) do
			unseen[key] = nil
		end
		clearUnseenBadges()
	end
end)
 
--Close main GUI
mainFrame:WaitForChild("CloseButton").MouseButton1Click:Connect(function()
	mainFrame.Visible = false
	for key in pairs(sessionUnseenShown) do
		unseen[key] = nil
	end
	clearUnseenBadges()
end)

--Back button
local BackButton = mainFrame:WaitForChild("BackButton")
BackButton.MouseButton1Click:Connect(function()
	selectedConstellationName = nil
	BackButton.Visible = false
	updateMain()
	local scroller = mainFrame:FindFirstChild("AchievementsScroller")
	if scroller and scroller:IsA("ScrollingFrame") then
		scroller.CanvasPosition = savedScroll.Constellations
	end
end)

-- Helper: update fade effect visibility based on scroller position
local function updateFade(scroller: ScrollingFrame)
	local fade = mainFrame:FindFirstChild("FadeEffect")
	if not fade or not fade:IsA("ImageLabel") then return end
	local maxScroll = math.max(0, scroller.AbsoluteCanvasSize.Y - scroller.AbsoluteWindowSize.Y)
	if maxScroll <= 1 then
		fade.Visible = false
		return
	end
	-- show only when not at bottom
	local atEnd = scroller.CanvasPosition.Y >= maxScroll - 1
	fade.Visible = not atEnd
end

local function connectFade(scroller: ScrollingFrame)
	scroller:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
		updateFade(scroller)
	end)
	scroller:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function()
		updateFade(scroller)
	end)
	scroller:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
		updateFade(scroller)
	end)
	updateFade(scroller)
end

-- Owned check
local function isOwned(achievementKey: string): boolean
    -- Expect full path keys: "Elements/..." or "Constellations/..."
    if not string.find(achievementKey, "/") then
        return false
    end
    local base, rest = string.match(achievementKey, "([^/]+)/(.+)")
    if not base or not rest then
        return false
    end
    local baseFolder = clientAchievements:FindFirstChild(base)
    if not baseFolder or not baseFolder:IsA("Folder") then
        return false
    end
    local node: Instance = baseFolder
    for seg in string.gmatch(rest, "[^/]+") do
        local nextNode = node:FindFirstChild(seg)
        if not nextNode then return false end
        node = nextNode
    end
    return true
end

local function renderConstellationDetail(scroller: Instance, constName: string)
	-- Clear
	for _, child in ipairs(scroller:GetChildren()) do
		if child:IsA("GuiObject") then
			child:Destroy()
		end
	end
	-- Header and back button
	local header = Instance.new("TextLabel")
	header.BackgroundTransparency = 1
	header.Size = UDim2.fromOffset(300, 28)
	header.Position = UDim2.fromOffset(8, 8)
	header.TextXAlignment = Enum.TextXAlignment.Left
	header.Font = Enum.Font.GothamBold
	header.TextSize = 18
	header.Text = constName .. " — Star Map"
	header.Parent = scroller

	-- Star map canvas
	local canvas = Instance.new("Frame")
	canvas.Name = "StarCanvas"
	canvas.Size = UDim2.fromScale(1, 1)
	canvas.BackgroundTransparency = 1
	canvas.Position = UDim2.fromOffset(0, 76)
	canvas.Parent = scroller

	local map = Instance.new("Frame")
	map.Name = "Map"
	map.Size = UDim2.fromScale(1, 1)
	map.Position = UDim2.fromOffset(0, 0)
	map.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	map.BorderSizePixel = 0
	map.Parent = canvas

	-- plot stars using RA/Dec (equirectangular projection)
	local stars = ConstellationProgress.listStarPositions(constName)
	if #stars == 0 then
		return
	end
	-- compute RA center and span to center constellation horizontally, and DEC extents for vertical scaling
	local minRA = 360
	local maxRA = 0
	local minDec = 90
	local maxDec = -90
	for _, s in ipairs(stars) do
		minRA = math.min(minRA, s.raDeg)
		maxRA = math.max(maxRA, s.raDeg)
		minDec = math.min(minDec, s.decDeg)
		maxDec = math.max(maxDec, s.decDeg)
	end
	local raSpan = maxRA - minRA
	local decSpan = maxDec - minDec
	-- If span crosses 0h (wrap), adjust by adding 360 to small values
	if raSpan > 180 then
		-- Treat small RA values as +360 for projection
		minRA, maxRA = maxRA, minRA
		for i, s in ipairs(stars) do
			if s.raDeg < 180 then
				stars[i].raDeg = s.raDeg + 360
			end
			minRA = math.min(minRA, stars[i].raDeg)
			maxRA = math.max(maxRA, stars[i].raDeg)
		end
		raSpan = maxRA - minRA
	end
	if raSpan < 1 then
		raSpan = 1
	end
	if minDec >= maxDec then
		minDec = -90
		maxDec = 90
		decSpan = maxDec - minDec
	end
	-- Enforce 1:1 aspect by expanding the smaller span to match the larger (keep centers)
	-- local targetSpan = math.max(raSpan, decSpan, 1)
	-- if raSpan < targetSpan then
	-- 	local raCenter = (minRA + maxRA) * 0.5
	-- 	minRA = raCenter - targetSpan * 0.5
	-- 	maxRA = raCenter + targetSpan * 0.5
	-- 	raSpan = targetSpan
	-- end
	-- if decSpan < targetSpan then
	-- 	local decCenter = (minDec + maxDec) * 0.5
	-- 	minDec = decCenter - targetSpan * 0.5
	-- 	maxDec = decCenter + targetSpan * 0.5
	-- 	decSpan = targetSpan
	-- end
	local width = map.AbsoluteSize.X
	local height = map.AbsoluteSize.Y

	local padding = 64
	local innerW = math.max(1, width - padding * 2)
	local innerH = math.max(1, height - padding * 2)

	-- store projected positions by star name for line drawing
	local starScreenPos: {[string]: Vector2} = {}
	local starIsMain: {[string]: boolean} = {}
	local starMag: {[string]: number?} = {}

	for _, s in ipairs(stars) do
		local owned = isOwned("Constellations/" .. constName .. "/" .. s.name)
		if owned then
			local nx = (raSpan - (s.raDeg - minRA)) / raSpan
			local ny = (decSpan - (s.decDeg - minDec)) / decSpan
			-- vertical stretch by 1.33 about center
			ny = 0.5 + (ny - 0.5) * 1.33
			ny = math.clamp(ny, 0, 1)
			-- apply padding and inner sizing
			local x = padding + nx * innerW
			local y = padding + ny * innerH
			local size = 4
			if s.mag then
				size = math.clamp(4 + 60 * 1 / (1 + math.exp(s.mag)), 4, 64)
			end
			local dot = Instance.new("Frame")
			dot.Name = s.name
			dot.Size = UDim2.fromOffset(size, size)
			dot.AnchorPoint = Vector2.new(0.5, 0.5)
			dot.Position = UDim2.fromOffset(math.floor(x), math.floor(y))
			dot.BackgroundColor3 = StarSphere.colorFromSpectral(s.spectralType, s.spectralClass, spectralGuiColors)
			dot.BorderSizePixel = 0
			dot.ZIndex = 2
			dot.Parent = map
			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(0.5, 0)
			corner.Parent = dot
			-- Highlight unseen star with a red ring
			local starKey = "Constellations/" .. constName .. "/" .. s.name
			if unseen[starKey] then
				local ring = Instance.new("UIStroke")
				ring.Name = "UnseenRing"
				ring.Thickness = math.max(4, math.floor(size / 2))
				ring.Color = Color3.fromRGB(255, 255, 255)
				ring.Transparency = 0.33
				ring.Parent = dot
				-- Track as shown this session so closing the frame clears it
				sessionUnseenShown[starKey] = true
			end
			starScreenPos[s.name] = Vector2.new(dot.Position.X.Offset, dot.Position.Y.Offset)
			starIsMain[s.name] = s.main == true
		starMag[s.name] = s.mag
		end
	end

	-- Fetch line connections like StarSphere
	local lines: {{string}}? = nil
	do
		local ok, constellationsModule = pcall(function()
			return require(game:GetService("ReplicatedStorage").Shared.constellations.constellationsModuleScript)
		end)
		if ok and constellationsModule then
			local data = constellationsModule[constName]
			if data and data.lines then
				lines = data.lines
			else
				local okConv, converter = pcall(function()
					return require(game:GetService("ReplicatedStorage").Shared.constellations.StellariumLinesConverter)
				end)
				if okConv and converter then
					local constellationAbbrevMap = {
						["Aquila"] = "Aql",
						["Andromeda"] = "And",
						["Sculptor"] = "Scl",
						["Ara"] = "Ara",
						["Libra"] = "Lib",
						["Cetus"] = "Cet",
						["Aries"] = "Ari",
						["Scutum"] = "Sct",
						["Pyxis"] = "Pyx",
						["Boötes"] = "Boo",
						["Caelum"] = "Cae",
						["Chamaeleon"] = "Cha",
						["Cancer"] = "Cnc",
						["Capricornus"] = "Cap",
						["Carina"] = "Car",
						["Cassiopeia"] = "Cas",
						["Centaurus"] = "Cen",
						["Cepheus"] = "Cep",
						["Coma Berenices"] = "Com",
						["Canes Venatici"] = "Cvn",
						["Auriga"] = "Aur",
						["Columba"] = "Col",
						["Circinus"] = "Cir",
						["Crater"] = "Crt",
						["Corona Australis"] = "CrA",
						["Corona Borealis"] = "CrB",
						["Corvus"] = "Crv",
						["Crux"] = "Cru",
						["Cygnus"] = "Cyg",
						["Delphinus"] = "Del",
						["Dorado"] = "Dor",
						["Draco"] = "Dra",
						["Norma"] = "Nor",
						["Eridanus"] = "Eri",
						["Sagitta"] = "Sge",
						["Fornax"] = "For",
						["Gemini"] = "Gem",
						["Camelopardalis"] = "Cam",
						["Canis Major"] = "CMa",
						["Ursa Major"] = "UMa",
						["Grus"] = "Gru",
						["Hercules"] = "Her",
						["Horologium"] = "Hor",
						["Hydra"] = "Hya",
						["Hydrus"] = "Hyi",
						["Indus"] = "Ind",
						["Lacerta"] = "Lac",
						["Monoceros"] = "Mon",
						["Lepus"] = "Lep",
						["Leo"] = "Leo",
						["Lupus"] = "Lup",
						["Lynx"] = "Lyn",
						["Lyra"] = "Lyr",
						["Antlia"] = "Ant",
						["Microscopium"] = "Mic",
						["Musca"] = "Mus",
						["Octans"] = "Oct",
						["Apus"] = "Aps",
						["Ophiuchus"] = "Oph",
						["Orion"] = "Ori",
						["Pavo"] = "Pav",
						["Pegasus"] = "Peg",
						["Pictor"] = "Pic",
						["Perseus"] = "Per",
						["Equuleus"] = "Equ",
						["Canis Minor"] = "CMi",
						["Leo Minor"] = "LMi",
						["Vulpecula"] = "Vul",
						["Ursa Minor"] = "UMi",
						["Phoenix"] = "Phe",
						["Pisces"] = "Psc",
						["Piscis Austrinus"] = "PsA",
						["Volans"] = "Vol",
						["Puppis"] = "Pup",
						["Reticulum"] = "Ret",
						["Sagittarius"] = "Sgr",
						["Scorpius"] = "Sco",
						["Serpens"] = "Ser",
						["Sextans"] = "Sex",
						["Mensa"] = "Men",
						["Taurus"] = "Tau",
						["Telescopium"] = "Tel",
						["Tucana"] = "Tuc",
						["Triangulum"] = "Tri",
						["Triangulum Australe"] = "Tra",
						["Aquarius"] = "Aqr",
						["Virgo"] = "Vir",
						["Vela"] = "Vel",
					}
					local abbrev = constellationAbbrevMap[constName]
					if abbrev and converter.hasStellariumLines(abbrev) then
						lines = converter.convertHipLinesToStarNames(abbrev, constellationsModule[constName])
					end
				end
			end
		end
	end

	-- Draw GUI lines for connections if available
	local usedInLine: {[string]: boolean} = {}
	if lines then
		local lineColor = Color3.fromRGB(255, 255, 255)
		for _, conn in ipairs(lines) do
			local aName = conn[1]
			local bName = conn[2]
			local aPos = starScreenPos[aName]
			local bPos = starScreenPos[bName]
			if aPos and bPos then
				usedInLine[aName] = true
				usedInLine[bName] = true
				local dx = bPos.X - aPos.X
				local dy = bPos.Y - aPos.Y
				local length = math.sqrt(dx*dx + dy*dy)
				if length > 0.5 then
					local midX = (aPos.X + bPos.X) * 0.5
					local midY = (aPos.Y + bPos.Y) * 0.5
					local line = Instance.new("Frame")
					line.Name = "Line__" .. aName .. "__" .. bName
					line.Size = UDim2.fromOffset(length, 2)
					line.AnchorPoint = Vector2.new(0.5, 0.5)
					line.Position = UDim2.fromOffset(midX, midY)
					line.BackgroundColor3 = lineColor
					line.Transparency = 0.5
					line.BorderSizePixel = 0
					line.Rotation = math.deg(math.atan2(dy, dx))
					line.Parent = map
				end
			end
		end
	end

	-- Add labels only for main stars or those used in lines
	for name, pos in pairs(starScreenPos) do
		if starIsMain[name] or usedInLine[name] then
			local size = 6
			local m = starMag[name]
			if m then
				size = math.clamp(10 - m, 4, 9)
			end
			local lbl = Instance.new("TextLabel")
			lbl.BackgroundTransparency = 1
			lbl.Text = name
			lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
			lbl.Font = Enum.Font.Gotham
			lbl.TextSize = 12
			lbl.TextXAlignment = Enum.TextXAlignment.Left
			lbl.TextYAlignment = Enum.TextYAlignment.Top
			local lx = math.clamp(pos.X + size + 2, padding, width - 16)
			local ly = math.clamp(pos.Y - size, padding, height - 16)
			lbl.Position = UDim2.fromOffset(lx, ly)
			lbl.Size = UDim2.fromOffset(16, 16)
			lbl.Parent = map
			-- Unseen badge handled as ring on the star dot; no label badge
		end
	end

	-- ensure scroll fade updates for this view too
	local scrollerSF = scroller
	if scrollerSF and scrollerSF:IsA("ScrollingFrame") then
		updateFade(scrollerSF)
	end
end

local function renderPeriodic(scroller: Instance)
	-- Root vertical container to separate groups with 4px padding
	local root = Instance.new("Frame")
	root.BackgroundTransparency = 1
	root.Size = UDim2.fromScale(1, 0)
	root.AutomaticSize = Enum.AutomaticSize.Y
	root.Name = "PeriodicRoot"
	root.Parent = scroller
	local vlayout = Instance.new("UIListLayout")
	vlayout.Name = "PeriodicVLayout"
	vlayout.FillDirection = Enum.FillDirection.Vertical
	vlayout.Padding = UDim.new(0, 4)
	vlayout.SortOrder = Enum.SortOrder.LayoutOrder
	vlayout.Parent = root

	-- container for main 7-period grid
	local container = Instance.new("Frame")
	container.BackgroundTransparency = 1
	container.Size = UDim2.fromScale(1, 0)
	container.AutomaticSize = Enum.AutomaticSize.Y
	container.Parent = root

	local grid = Instance.new("UIGridLayout")
	grid.CellSize = UDim2.fromOffset(44, 44)
	grid.CellPadding = UDim2.fromOffset(4, 4)
	grid.FillDirectionMaxCells = 18
	grid.SortOrder = Enum.SortOrder.LayoutOrder
	grid.Parent = container

	-- build ordered symbols by OrderRank (serves as atomic number)
	local symbols = {}
	for key, info in pairs(allAchievements) do
		local symbol = string.match(key, "^Elements/([A-Za-z]+)$")
		if symbol then
			table.insert(symbols, { symbol = symbol, order = info.OrderRank or 9999 })
		end
	end
	table.sort(symbols, function(a, b)
		return a.order < b.order
	end)

	local function cellForIndex(idx: number): Instance
		local entry = symbols[idx]
		if not entry then
			local spacer = Instance.new("Frame")
			spacer.BackgroundTransparency = 1
			spacer.BorderSizePixel = 0
			return spacer
		end
		local symbol = entry.symbol
		local key = "Elements/" .. symbol
		local owned = isOwned(key)
		local family = getElementFamily(symbol)
		local bg = owned and (periodicTableColors[family] or periodicTableColors.Unknown) or Color3.fromRGB(40, 40, 40)
		local fg = owned and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(200, 200, 200)
		local label = Instance.new("TextLabel")
		label.Name = "Cell__" .. symbol
		label.Size = UDim2.fromScale(0, 0)
		label.BackgroundColor3 = bg
		label.BorderSizePixel = 0
		label.Text = symbol
		label.Font = Enum.Font.GothamBold
		label.TextColor3 = fg
		label.TextScaled = false
		label.TextSize = 16
		label.TextXAlignment = Enum.TextXAlignment.Center
		label.TextYAlignment = Enum.TextYAlignment.Center
		-- Unseen badge for periodic elements
		if unseen[key] then
			local badge = Instance.new("Frame")
			badge.Name = "UnseenBadge"
			badge.Size = UDim2.fromOffset(16, 16)
			badge.AnchorPoint = Vector2.new(1, 0)
			badge.Position = UDim2.fromScale(1, 0)
			badge.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			badge.BorderSizePixel = 0
			badge.ZIndex = 2
			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(0.5, 0)
			corner.Parent = badge
			badge.Parent = label
			-- track element unseen badge
			sessionUnseenShown[key] = true
		end
		return label
	end

	local function addBlank()
		local spacer = Instance.new("Frame")
		spacer.BackgroundTransparency = 1
		spacer.BorderSizePixel = 0
		spacer.Parent = container
	end

	local function addIndex(i)
		local cell = cellForIndex(i)
		cell.Parent = container
	end

	-- Period 1: H, blanks, He
	addIndex(1)
	for _ = 1, 16 do
		addBlank()
	end
	addIndex(2)
	-- Period 2: Li, Be, 10 blanks, B..Ne
	addIndex(3)
	addIndex(4)
	for _ = 1, 10 do
		addBlank()
	end
	for i = 5, 10 do
		addIndex(i)
	end
	-- Period 3: Na, Mg, 10 blanks, Al..Ar
	addIndex(11)
	addIndex(12)
	for _ = 1, 10 do
		addBlank()
	end
	for i = 13, 18 do
		addIndex(i)
	end
	-- Period 4: K, Ca, Sc..Zn, Ga..Kr
	addIndex(19)
	addIndex(20)
	for i = 21, 30 do
		addIndex(i)
	end
	for i = 31, 36 do
		addIndex(i)
	end
	-- Period 5: Rb, Sr, Y..Cd, In..Xe
	addIndex(37)
	addIndex(38)
	for i = 39, 48 do
		addIndex(i)
	end
	for i = 49, 54 do
		addIndex(i)
	end
	-- Period 6: Cs, Ba, blank (group 3 placeholder), Hf..Rn
	addIndex(55)
	addIndex(56)
	addBlank()
	for i = 72, 86 do
		addIndex(i)
	end
	-- Period 7: Fr, Ra, blank (group 3 placeholder), Rf..Og
	addIndex(87)
	addIndex(88)
	addBlank()
	for i = 104, 118 do
		addIndex(i)
	end

	-- Lanthanides row (indent to group 3 position)
	local lanRow = Instance.new("Frame")
	lanRow.BackgroundTransparency = 1
	lanRow.Size = UDim2.fromScale(1, 0)
	lanRow.AutomaticSize = Enum.AutomaticSize.Y
	lanRow.Parent = root
	local lanGrid = Instance.new("UIGridLayout")
	lanGrid.CellSize = UDim2.fromOffset(44, 44)
	lanGrid.CellPadding = UDim2.fromOffset(4, 4)
	lanGrid.FillDirectionMaxCells = 18
	lanGrid.SortOrder = Enum.SortOrder.LayoutOrder
	lanGrid.Parent = lanRow
	for _ = 1, 3 do
		local spacer = Instance.new("Frame")
		spacer.BackgroundTransparency = 1
		spacer.BorderSizePixel = 0
		spacer.Parent = lanRow
	end
	for i = 57, 71 do
		local cell = cellForIndex(i)
		cell.Parent = lanRow
	end

	-- Actinides row (indent to group 3 position)
	local actRow = Instance.new("Frame")
	actRow.BackgroundTransparency = 1
	actRow.Size = UDim2.fromScale(1, 0)
	actRow.AutomaticSize = Enum.AutomaticSize.Y
	actRow.Parent = root
	local actGrid = Instance.new("UIGridLayout")
	actGrid.CellSize = UDim2.fromOffset(44, 44)
	actGrid.CellPadding = UDim2.fromOffset(4, 4)
	actGrid.FillDirectionMaxCells = 18
	actGrid.SortOrder = Enum.SortOrder.LayoutOrder
	actGrid.Parent = actRow
	for _ = 1, 3 do
		local spacer = Instance.new("Frame")
		spacer.BackgroundTransparency = 1
		spacer.BorderSizePixel = 0
		spacer.Parent = actRow
	end
	for i = 89, 103 do
		local cell = cellForIndex(i)
		cell.Parent = actRow
	end
end

updateMain = function()
	local AllLanthanideAchievedCheck = false
	local AllActinideAchievedCheck = false

	for _, frame in pairs(mainFrame:WaitForChild("AchievementsScroller"):GetChildren()) do
		if frame:IsA("Frame") or frame:IsA("ImageLabel") or frame:IsA("ImageButton") or frame:IsA("TextButton") or frame:IsA("TextLabel") then
			frame:Destroy()
		end
	end

	local newFrames = {}

	local scroller = mainFrame:WaitForChild("AchievementsScroller")
	styleTabs()
	if scroller and scroller:IsA("ScrollingFrame") then
		connectFade(scroller)
	end

	-- PeriodicTable tab: grid view of elements, colored if owned
	if currentTab == "PeriodicTable" then
		-- restore list layout
		for _, layout in ipairs(scroller:GetChildren()) do
			if layout:IsA("UIGridLayout") or layout:IsA("UIListLayout") then
				layout:Destroy()
			end
		end
		scroller.AutomaticCanvasSize = Enum.AutomaticSize.Y
		local list = Instance.new("UIListLayout")
		list.Name = "PeriodicListLayout"
		list.Padding = UDim.new(0, 4)
		list.SortOrder = Enum.SortOrder.LayoutOrder
		list.Parent = scroller
		renderPeriodic(scroller)
		return
	end

	-- Constellations tab: Either show list of constellations or stars of a selected constellation
	if currentTab == "Constellations" then
		if selectedConstellationName == nil then
			-- list all constellations alphabetically with progress and make them clickable
			-- two-column grid layout
			for _, layout in ipairs(scroller:GetChildren()) do
				if layout:IsA("UIGridLayout") or layout:IsA("UIListLayout") then
					layout:Destroy()
				end
			end
			scroller.AutomaticCanvasSize = Enum.AutomaticSize.Y
			local grid = Instance.new("UIGridLayout")
			grid.Name = "ConstellationsGrid"
			grid.CellPadding = UDim2.fromOffset(8, 8)
			grid.CellSize = UDim2.new(0.5, -12, 0, 120)
			grid.SortOrder = Enum.SortOrder.LayoutOrder
			grid.Parent = scroller
			ConstellationProgress.render(scroller, script:WaitForChild("AchievementTemplate"), clientAchievements)
			-- Build a lookup for owned counts to dim empty constellations
			local progressList = ConstellationProgress.computeProgress(clientAchievements)
			local ownedByName: {[string]: number} = {}
			for _, e in ipairs(progressList) do
				ownedByName[e.name] = e.owned
			end
			for _, child in ipairs(scroller:GetChildren()) do
				if (child:IsA("ImageButton") or child:IsA("Frame") or child:IsA("ImageLabel")) and string.find(child.Name, "^ConstellationProgress__") then
					if not child:FindFirstChild("ClickCatcher") then
						local btn = Instance.new("TextButton")
						btn.Name = "ClickCatcher"
						btn.Text = ""
						btn.BackgroundTransparency = 1
						btn.Size = UDim2.fromScale(1, 1)
						btn.Parent = child
						local constName = string.gsub(child.Name, "^ConstellationProgress__", "")
						-- Darken and deactivate if player owns zero stars
						if (ownedByName[constName] or 0) <= 0 then
							if child:IsA("ImageButton") then
								child.Active = false
							end
							local function dimDescendants(inst: ImageButton)
								inst.ImageColor3 = Color3.fromRGB(inst.ImageColor3.R - 50, inst.ImageColor3.G - 50, inst.ImageColor3.B - 50)
								for _, d in ipairs(inst:GetDescendants()) do
									if d:IsA("TextLabel") then
										d.TextColor3 = darkenColor(d.TextColor3, 50)
									elseif d:IsA("ImageLabel") then
										d.ImageColor3 = darkenColor(d.ImageColor3, 50)
									elseif d:IsA("Frame") then
										d.BackgroundColor3 = darkenColor(d.BackgroundColor3, 50)
									end
								end
							end
							dimDescendants(child)
							btn.Active = false
						end
						-- Unseen badge if any unseen star under this constellation
						local hasUnseen = false
						for key, mark in pairs(unseen) do
							if mark and string.sub(key, 1, 15) == "Constellations/" then
								if string.sub(key, 1, 15 + #constName + 1) == ("Constellations/" .. constName .. "/") then
									hasUnseen = true
									-- track each specific unseen key shown for this constellation
									sessionUnseenShown[key] = true
								end
							end
						end
						local oldBadge = child:FindFirstChild("UnseenBadge")
						if hasUnseen then
							if not oldBadge then
								local badge = Instance.new("Frame")
								badge.Name = "UnseenBadge"
								badge.Size = UDim2.fromOffset(32, 32)
								badge.AnchorPoint = Vector2.new(1, 0)
								badge.Position = UDim2.new(1, -4, 0, 4)
								badge.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
								badge.BorderSizePixel = 0
								badge.ZIndex = 5
								local corner = Instance.new("UICorner")
								corner.CornerRadius = UDim.new(0.5, 0)
								corner.Parent = badge
								badge.Parent = child
							end
						else
							if oldBadge then
								oldBadge:Destroy()
							end
						end
						btn.MouseButton1Click:Connect(function()
							savedScroll.Constellations = scroller.CanvasPosition
							selectedConstellationName = constName
							BackButton.Visible = true
							updateMain()
						end)
					end
				end
			end
			-- restore previous scroll position for list
			task.defer(function()
				if scroller and scroller:IsA("ScrollingFrame") then
					scroller.CanvasPosition = savedScroll.Constellations
				end
			end)
			return
		else
			-- detail star map view for selected constellation
			renderConstellationDetail(scroller, selectedConstellationName)
			return
		end
	end

    for achievement, achievementInfo in pairs(allAchievements) do
        local name = achievement
		if string.sub(name, 1, 9) ~= "Elements/" then
			continue
		end
		local image = type(achievementInfo.ImageId) == "number" and "rbxassetid://" .. achievementInfo.ImageId or achievementInfo.ImageId
		local desc = achievementInfo.Description
        local owned = isOwned(achievement)

		local newFrame = script:WaitForChild("AchievementTemplate"):Clone()
		newFrame.Name, newFrame.AchievementName.Text = name, achievementInfo.Title
		newFrame.AchievementImage.Image = image
		newFrame.Description.Text = desc
		newFrame.Acquired.Visible = owned
        local leaf = string.match(name, "/([^/]+)$") or name
        local model = PeriodicTablePaths.ElementPath[leaf]

		if not owned then
			newFrame.ImageColor3 = Color3.fromRGB(newFrame.ImageColor3.R - 50, newFrame.ImageColor3.G - 50, newFrame.ImageColor3.B - 50)
			for _, uiElement in pairs(newFrame:GetDescendants()) do
				if uiElement:IsA("Frame") then 
					uiElement.BackgroundColor3 = Color3.fromRGB(uiElement.BackgroundColor3.R - 50, uiElement.BackgroundColor3.G - 50, uiElement.BackgroundColor3.B - 50)
				elseif uiElement:IsA("TextLabel") or uiElement:IsA("TextButton") then
					uiElement.BackgroundColor3 = Color3.fromRGB(uiElement.BackgroundColor3.R - 50, uiElement.BackgroundColor3.G - 50, uiElement.BackgroundColor3.B - 50)
					uiElement.TextColor3 = Color3.fromRGB(uiElement.TextColor3.R - 50, uiElement.TextColor3.G - 50, uiElement.TextColor3.B - 50)
				elseif uiElement:IsA("ImageLabel") or uiElement:IsA("ImageButton") then
					uiElement.ImageColor3 = Color3.fromRGB(uiElement.ImageColor3.R - 50, uiElement.ImageColor3.G - 50, uiElement.ImageColor3.B - 50)
				end
			end
			if model:GetAttribute("colorOrigin") == nil then
				model:SetAttribute("colorOrigin", model.Color)
			end
			model.Color = Color3.fromRGB(0, 0, 0)

            if table.find(PeriodicTablePaths.Lanthanides, leaf) and not AllLanthanideAchievedCheck then
				PeriodicTable.Lanthanide.Blank:SetAttribute("colorOrigin", PeriodicTable.Lanthanide.Blank.Color)
				PeriodicTable.Lanthanide.Blank.Color = Color3.fromRGB(0, 0, 0)
				AllLanthanideAchievedCheck = true
            elseif table.find(PeriodicTablePaths.Actinides, leaf) and not AllActinideAchievedCheck then
				PeriodicTable.Actinide.Blank:SetAttribute("colorOrigin", PeriodicTable.Actinide.Blank.Color)
				PeriodicTable.Actinide.Blank.Color = Color3.fromRGB(0, 0, 0)
				AllActinideAchievedCheck = true
			end
		else
			if model:GetAttribute("colorOrigin") then
				model.Color = model:GetAttribute("colorOrigin")
			end
			model.SurfaceLight.Brightness = 1
		end

        table.insert(newFrames, newFrame)
	end

	local scroller2 = mainFrame:WaitForChild("AchievementsScroller")
    for _, newFrame in pairs(newFrames) do
        newFrame.Parent = scroller2
    end

	if scroller2 and scroller2:IsA("ScrollingFrame") then
		updateFade(scroller2)
    end
end


--Notification GUI
local achievementsQueue = {}

remote.OnClientEvent:Connect(function(instruction, arg)
	
	if instruction == "AWARD ACHIEVEMENT" then
		
        local achievementKey = arg
        unseen[achievementKey] = true
        local achievementInfo = allAchievements[achievementKey]
		if achievementInfo then
            table.insert(achievementsQueue, achievementKey)
			repeat
				task.wait(0.2)
            until table.find(achievementsQueue, achievementKey) == 1
			
            local notifFrameClosedPos = notifFramePos + UDim2.fromScale(notifFrame.Size.X.Scale, 0)
			
			notifFrame.Position = notifFrameClosedPos
			notifFrame.AchievementName.Text = achievementInfo.Title
			notifFrame.AchievementImage.Image = type(achievementInfo.ImageId) == "number" and "rbxassetid://" .. achievementInfo.ImageId or achievementInfo.ImageId
			notifFrame.Description.Text = achievementInfo.Description
			
			notifGui.Enabled = true
			
            notifFrame:TweenPosition(notifFramePos, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.8, true)
			
			task.wait(5)
			
            notifFrame:TweenPosition(notifFrameClosedPos, Enum.EasingDirection.In, Enum.EasingStyle.Quart, 0.8, true)
			
			task.wait(0.8)
			notifGui.Enabled = false
			
            table.remove(achievementsQueue, table.find(achievementsQueue, achievementKey))
		end
	elseif instruction == "INITIALIZE ACHIEVEMENT" then
		updateMain()
	end
end)

-- Initial render
updateMain()

-- Also refresh when achievement entries are added/removed deeper in the tree
if clientAchievements and clientAchievements:IsA("Folder") then
    clientAchievements.DescendantAdded:Connect(function(desc)
        if desc:IsA("StringValue") then
            updateMain()
        end
    end)
    clientAchievements.DescendantRemoving:Connect(function(desc)
        if desc:IsA("StringValue") then
            updateMain()
        end
    end)
end
