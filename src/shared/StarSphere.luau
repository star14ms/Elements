local StarSphere = {}

local DEFAULT_RADIUS_SQUARED = 602370

local function squareRoot(n: number): number
    return math.sqrt(n)
end

local function toRadians(degrees: number): number
    return degrees * math.pi / 180
end

-- Extract all numeric sequences from a string as numbers (handles decimals).
local function extractNumericTriplet(str: string): (number?, number?, number?)
    local a, b, c
    local index = 0
    for token in string.gmatch(str, "([%d%.]+)") do
        index += 1
        if index == 1 then
            a = tonumber(token)
        elseif index == 2 then
            b = tonumber(token)
        elseif index == 3 then
            c = tonumber(token)
            break
        end
    end
    return a, b, c
end

-- Parse Right Ascension string like "00h 08m 23.17s" into degrees
local function parseRAtoDegrees(raStr: string): number
    local h, m, s = extractNumericTriplet(raStr)
    h = h or 0
    m = m or 0
    s = s or 0
    local hours = h + m/60 + s/3600
    return hours * 15
end

-- Parse Declination string like "+29° 05′ 27.0″" into signed degrees
local function parseDectoDegrees(decStr: string): number
    local negative = (string.find(decStr, "%-") ~= nil) or (string.find(decStr, "−") ~= nil)
    local d, m, s = extractNumericTriplet(decStr)
    d = d or 0
    m = m or 0
    s = s or 0
    local magnitude = d + m/60 + s/3600
    if negative then
        magnitude = -magnitude
    end
    return magnitude
end

-- Convert RA/Dec strings to a 3D Vector3 on a sphere of the given radius.
-- Coordinate frame:
--  x = R * cos(dec) * cos(ra)
--  y = R * sin(dec)
--  z = R * cos(dec) * sin(ra)
function StarSphere.raDecToPosition(raStr: string, decStr: string, radiusSquared: number?): Vector3
    local raDeg = parseRAtoDegrees(raStr)
    local decDeg = parseDectoDegrees(decStr)
    local raRad = toRadians(raDeg)
    local decRad = toRadians(decDeg)
    local radius = squareRoot(radiusSquared or DEFAULT_RADIUS_SQUARED)

    local cosDec = math.cos(decRad)
    local sinDec = math.sin(decRad)
    local cosRa = math.cos(raRad)
    local sinRa = math.sin(raRad)

    local x = radius * cosDec * cosRa
    local y = radius * sinDec
    local z = radius * cosDec * sinRa

    return Vector3.new(x, y, z)
end

-- Simple CSV line parser supporting quoted fields with commas.
local function parseCsvLine(line: string): {string}
    local fields = {}
    local field = ""
    local inQuotes = false

    local i = 1
    while i <= #line do
        local ch = string.sub(line, i, i)
        if ch == '"' then
            -- Toggle quotes or handle escaped quote
            local nextCh = string.sub(line, i + 1, i + 1)
            if inQuotes and nextCh == '"' then
                field ..= '"'
                i += 1
            else
                inQuotes = not inQuotes
            end
        elseif ch == ',' and not inQuotes then
            table.insert(fields, field)
            field = ""
        else
            field ..= ch
        end
        i += 1
    end
    table.insert(fields, field)
    return fields
end

local function indexOf(list: {string}, key: string): number?
    for i, v in ipairs(list) do
        if v == key then
            return i
        end
    end
    return nil
end

local function parseNumber(str: string?): number?
    if not str or str == "" then return nil end
    local num = string.match(str, "[%-%d%.]+")
    if num then return tonumber(num) end
    return nil
end

local function parseBoolean(str: string?): boolean
    if not str then return false end
    local s = string.lower((string.gsub(str, "%s+", "")))
    if s == "1" or s == "true" or s == "yes" or s == "y" or s == "on" or s == "x" or s == "✓" then
        return true
    end
    local n = tonumber(s)
    if n and n > 0 then return true end
    return false
end

-- Set of zodiac constellation names as used in our data
local ZODIAC: {[string]: boolean} = {
    ["Aries"] = true,
    ["Taurus"] = true,
    ["Gemini"] = true,
    ["Cancer"] = true,
    ["Leo"] = true,
    ["Virgo"] = true,
    ["Libra"] = true,
    ["Scorpius"] = true, -- dataset uses Scorpius
    ["Sagittarius"] = true,
    ["Capricornus"] = true,
    ["Aquarius"] = true,
    ["Pisces"] = true,
}

-- -- Map spectral class first letter to a representative Color3
-- local spectralColors: {[string]: Color3} = {
--     O = Color3.fromRGB(155, 176, 255), -- blue
--     B = Color3.fromRGB(170, 191, 255), -- blue-white
--     A = Color3.fromRGB(202, 215, 255), -- white
--     F = Color3.fromRGB(248, 247, 255), -- yellow-white
--     G = Color3.fromRGB(255, 244, 234), -- yellow
--     K = Color3.fromRGB(255, 210, 161), -- orange
--     M = Color3.fromRGB(255, 204, 111), -- red-orange
-- }
local spectralColors: {[string]: Color3} = {
    O = Color3.fromRGB(111, 125, 255),
    B = Color3.fromRGB(171, 203, 255),
    A = Color3.fromRGB(226, 255, 228),
    F = Color3.fromRGB(213, 212, 185),
    G = Color3.fromRGB(159, 143, 84),
    K = Color3.fromRGB(165, 109, 77),
    M = Color3.fromRGB(168, 80, 58),
}

local function parseSpectralFirstLetter(spClass: string?): string?
    if not spClass or spClass == "" then
        return nil
    end
    local first = string.sub(spClass, 1, 1)
    first = string.upper(first)
    if spectralColors[first] ~= nil then
        return first
    end
    -- Sometimes strings can start with digits or spaces; try to find first letter in set
    local letter = string.match(spClass, "[OBAFGKMobafgkm]")
    if letter then
        letter = string.upper(letter)
        if spectralColors[letter] ~= nil then
            return letter
        end
    end
    return nil
end

local function colorFromSpectral(spClass: string?, spectralType: string?): Color3
    local letter = parseSpectralFirstLetter(spClass) or parseSpectralFirstLetter(spectralType)
    if letter and spectralColors[letter] then
        return spectralColors[letter]
    end
    return Color3.new(1, 1, 1)
end

local function parseRadiusValue(radiusStr: string?): number?
    if not radiusStr or radiusStr == "" then
        return nil
    end
    local value = string.match(radiusStr, "[%d%.]+")
    if value then
        return tonumber(value)
    end
    return nil
end

-- Ensure and return a root folder (default name "Stars") under the given parent
function StarSphere.ensureRootFolder(rootName: string?, parent: Instance?): Folder
    local name = rootName or "Stars"
    local containerParent = parent or workspace
    local existing = containerParent:FindFirstChild(name)
    if existing and existing:IsA("Folder") then
        return existing
    end
    local folder = Instance.new("Folder")
    folder.Name = name
    folder.Parent = containerParent
    return folder
end

-- Internal helper to populate stars into an existing folder
local function populateStarsFromCsvIntoFolder(csv: string, targetFolder: Folder, radiusSquared: number?)
    -- Split into lines
    local lines = {}
    for line in string.gmatch(csv, "([^\n]+)") do
        table.insert(lines, line)
    end
    if #lines == 0 then
        return
    end

    -- Header
    local headerFields = parseCsvLine(lines[1])
    local nameIdx = indexOf(headerFields, "Name")
    local raIdx = indexOf(headerFields, "RA")
    local decIdx = indexOf(headerFields, "Dec")
    local spClassIdx = indexOf(headerFields, "Sp. class")
    local spectralTypeIdx = indexOf(headerFields, "Spectral type")
    local radiusIdx = indexOf(headerFields, "Radius")
    local visMagIdx = indexOf(headerFields, "vis. mag.")
    -- optional user-added column to mark whether a star participates in lines
    local inLinesIdx = indexOf(headerFields, "In lines")
        or indexOf(headerFields, "In constellation")
        or indexOf(headerFields, "Connect")
        or indexOf(headerFields, "Line")

    if not raIdx or not decIdx then
        return
    end

    for i = 2, #lines do
        local row = parseCsvLine(lines[i])
        -- Fallbacks for missing RA/Dec
        local raStr = row[raIdx]
        if raStr == nil or raStr == "" then
            raStr = "00h 00m 00s"
        end
        local decStr = row[decIdx]
        if decStr == nil or decStr == "" then
            decStr = "+00° 00′ 00.0″"
        end

        local position = StarSphere.raDecToPosition(raStr, decStr, radiusSquared)
        local part = Instance.new("Part")
        -- Size from radius if present (R☉), with clamping for visibility
        local sizeStuds = 5
        if radiusIdx then
            local rVal = parseRadiusValue(row[radiusIdx])
            if rVal then
                sizeStuds = math.clamp(0.2 + rVal * 0.05, 0.2, 6)
            end
        end
        part.Size = Vector3.new(sizeStuds, sizeStuds, sizeStuds)
        part.Shape = Enum.PartType.Ball
        part.Anchored = true
        part.CanCollide = false
        part.Material = Enum.Material.Neon
        part.Color = colorFromSpectral(spClassIdx and row[spClassIdx] or nil, spectralTypeIdx and row[spectralTypeIdx] or nil)
        part.CFrame = CFrame.new(position)
        if nameIdx and row[nameIdx] and row[nameIdx] ~= "" then
            part.Name = tostring(row[nameIdx])
        else
            part.Name = "Star_" .. tostring(i - 1)
        end
        -- attributes used for line selection
        local visMag = visMagIdx and parseNumber(row[visMagIdx]) or nil
        if visMag == nil then
            -- push missing magnitudes to the end for selection-by-magnitude
            visMag = math.huge
        end
        part:SetAttribute("VisMag", visMag)
        if inLinesIdx then
            part:SetAttribute("InLines", parseBoolean(row[inLinesIdx]))
        end
        part.Parent = targetFolder
    end
end

-- Create Parts positioned on the sphere using RA/Dec columns in a CSV string.
-- Colors are mapped from spectral class/type; sizes are scaled from Radius (R☉).
-- Returns the container Folder with all created Parts.
function StarSphere.createStarPartsFromCsv(csv: string, parent: Instance?, radiusSquared: number?): Folder
    local container = Instance.new("Folder")
    container.Name = "Stars"
    container.Parent = parent or workspace
    populateStarsFromCsvIntoFolder(csv, container, radiusSquared)
    return container
end

-- Create Parts directly inside the given folder
function StarSphere.createStarPartsIn(csv: string, targetFolder: Folder, radiusSquared: number?): Folder
    populateStarsFromCsvIntoFolder(csv, targetFolder, radiusSquared)
    return targetFolder
end

-- Create a white line network connecting the given star parts using a simple MST
-- Returns a folder containing created Beams
-- Create constellation lines with selection rules
-- opts: { lineWidth: number?, maxStars: number?, useOnlyInLines: boolean? }
local function createLinesWithSelection(starFolder: Folder, opts: any?): Folder
    local lineWidth = (opts and opts.lineWidth) or nil
    local maxStars = (opts and opts.maxStars) or 10
    local useOnlyInLines = (opts and opts.useOnlyInLines)

    local partsAll: {BasePart} = {}
    local anyMarked = false
    for _, child in ipairs(starFolder:GetChildren()) do
        if child:IsA("BasePart") then
            table.insert(partsAll, child)
            if child:GetAttribute("InLines") == true then
                anyMarked = true
            end
        end
    end

    -- Decide selection set
    local selected: {BasePart} = {}
    if anyMarked and useOnlyInLines ~= false then
        for _, p in ipairs(partsAll) do
            if p:GetAttribute("InLines") == true then
                table.insert(selected, p)
            end
        end
    else
        table.sort(partsAll, function(a: BasePart, b: BasePart)
            local aMag = a:GetAttribute("VisMag") or math.huge
            local bMag = b:GetAttribute("VisMag") or math.huge
            return aMag < bMag -- smaller magnitude = brighter
        end)
        local limit = math.min(maxStars, #partsAll)
        for i = 1, limit do
            table.insert(selected, partsAll[i])
        end
    end

    local n = #selected
    local linesFolder = starFolder:FindFirstChild("ConstellationLines")
    if not linesFolder then
        linesFolder = Instance.new("Folder")
        linesFolder.Name = "ConstellationLines"
        linesFolder.Parent = starFolder
    else
        -- clear existing beams
        for _, d in ipairs(linesFolder:GetDescendants()) do
            if d:IsA("Beam") then
                d:Destroy()
            end
        end
    end
    if n <= 1 then
        return linesFolder
    end

    local attachments: {[BasePart]: Attachment} = {}
    for _, p in ipairs(selected) do
        local att = p:FindFirstChild("StarAttachment")
        if not att then
            att = Instance.new("Attachment")
            att.Name = "StarAttachment"
            att.Parent = p
        end
        attachments[p] = att
    end

    -- MST on selected
    local inTree: {[number]: boolean} = {}
    local dist: {number} = {}
    local parentIdx: {number?} = {}
    for i = 1, n do
        inTree[i] = false
        dist[i] = math.huge
        parentIdx[i] = nil
    end
    dist[1] = 0
    local function pos(i: number): Vector3
        return selected[i].Position
    end
    for _ = 1, n do
        local u = -1
        local minVal = math.huge
        for i = 1, n do
            if not inTree[i] and dist[i] < minVal then
                minVal = dist[i]
                u = i
            end
        end
        if u == -1 then break end
        inTree[u] = true
        for v = 1, n do
            if not inTree[v] then
                local d = (pos(u) - pos(v)).Magnitude
                if d < dist[v] then
                    dist[v] = d
                    parentIdx[v] = u
                end
            end
        end
    end

    local width = lineWidth or 1.00
    local isZodiac = ZODIAC[starFolder.Name] == true
    local lineColor = isZodiac and Color3.fromRGB(255, 220, 0) or Color3.new(1, 1, 1)
    for v = 2, n do
        local u = parentIdx[v]
        if u then
            local beam = Instance.new("Beam")
            beam.Attachment0 = attachments[selected[u]]
            beam.Attachment1 = attachments[selected[v]]
            beam.Width0 = width
            beam.Width1 = width
            beam.Color = ColorSequence.new(lineColor)
            beam.Transparency = NumberSequence.new(0)
            beam.LightEmission = 1
            beam.FaceCamera = true
            beam.Parent = linesFolder
        end
    end
    return linesFolder
end

function StarSphere.connectWithWhiteLines(starFolder: Folder, arg: any?): Folder
    if typeof(arg) == "table" then
        return createLinesWithSelection(starFolder, arg)
    else
        return createLinesWithSelection(starFolder, { lineWidth = arg })
    end
end

-- Create a single constellation under a root folder
function StarSphere.createConstellation(constellationName: string, csv: string, parent: Instance?, radiusSquared: number?, opts: any?): Folder
    local root = StarSphere.ensureRootFolder("Stars", parent)
    local constellationFolder = Instance.new("Folder")
    constellationFolder.Name = constellationName
    constellationFolder.Parent = root
    StarSphere.createStarPartsIn(csv, constellationFolder, radiusSquared)
    StarSphere.connectWithWhiteLines(constellationFolder, opts or { lineWidth = 1.00 })
    return constellationFolder
end

-- Bulk-create all constellations from a name->module map (module.csv expected)
function StarSphere.createAllConstellations(constellationsMap: {[string]: any}, parent: Instance?, radiusSquared: number?, opts: any?): Folder
    local root = StarSphere.ensureRootFolder("Stars", parent)
    for name, mod in pairs(constellationsMap) do
        local okCsv = nil
        if typeof(mod) == "table" and typeof(mod.csv) == "string" then
            okCsv = mod.csv
        end
        if okCsv then
            local folder = Instance.new("Folder")
            folder.Name = name
            folder.Parent = root
            StarSphere.createStarPartsIn(okCsv, folder, radiusSquared)
            StarSphere.connectWithWhiteLines(folder, opts or { lineWidth = 1.00 })
        end
	end
    return root
end

-- Toggle visibility of all constellation lines under a root folder
function StarSphere.setConstellationLinesVisible(rootFolder: Instance, visible: boolean)
    for _, constFolder in ipairs(rootFolder:GetChildren()) do
        if constFolder:IsA("Folder") then
            local linesFolder = constFolder:FindFirstChild("ConstellationLines")
            if linesFolder and linesFolder:IsA("Folder") then
                for _, beam in ipairs(linesFolder:GetDescendants()) do
                    if beam:IsA("Beam") then
                        beam.Enabled = visible
                    end
                end
            end
        end
    end
end

return StarSphere


