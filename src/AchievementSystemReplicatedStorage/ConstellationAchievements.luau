-- Builds achievements for all stars from shared constellation CSV data
-- Keys use full path: "Constellations/<ConstellationName>/<StarName>"

local M = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function parseCsvLine(line: string): {string}
    local fields = {}
    local field = ""
    local inQuotes = false
    local i = 1
    while i <= #line do
        local ch = string.sub(line, i, i)
        if ch == '"' then
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
        if v == key then return i end
    end
    return nil
end

local DEFAULT_IMAGE_ID = 113126302941978

function M.build(): {[string]: any}
    local achievements: {[string]: any} = {}
    local shared = ReplicatedStorage:WaitForChild("Shared")
    local constellationsFolder = shared:FindFirstChild("constellations")
    local constellationsModule: ModuleScript? = nil
    if constellationsFolder then
        constellationsModule = constellationsFolder:FindFirstChild("constellationsModuleScript") :: ModuleScript?
    end
    if not constellationsModule then
        return achievements
    end
    local constellations = require(constellationsModule)

    local order = 10000
    for constName, mod in pairs(constellations) do
        if typeof(mod) == "table" and typeof(mod.csv) == "string" then
            local csv = mod.csv
            local lines = {}
            for line in string.gmatch(csv, "([^\n]+)") do
                table.insert(lines, line)
            end
            if #lines > 0 then
                local header = parseCsvLine(lines[1])
                local nameIdx = indexOf(header, "Name")
                if nameIdx then
                    for i = 2, #lines do
                        local row = parseCsvLine(lines[i])
                        local starName = row[nameIdx]
                        if starName and starName ~= "" then
                            local key = string.format("Constellations/%s/%s", constName, starName)
                            achievements[key] = {
                                Title = string.format("%s: %s", constName, starName),
                                ImageId = DEFAULT_IMAGE_ID,
                                Description = string.format("Discovered %s in %s.", starName, constName),
                                OrderRank = order,
                            }
                            order += 1
                        end
                    end
                end
            end
        end
    end

    return achievements
end

return M


