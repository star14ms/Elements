local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local mainPlate = Workspace:WaitForChild("MainPlate")
if not mainPlate then return end

local baseplate = mainPlate:WaitForChild("Baseplate")
if not baseplate then return end

local camera = Workspace.CurrentCamera
local originalTransparency = baseplate.Transparency

-- Returns downward pitch in degrees (0 = horizontal, 90 = straight down)
local function getDownwardPitch()
    local lookVector = camera.CFrame.LookVector
    -- Y component is up/down, so arcsin of -Y gives downward pitch
    local pitchRadians = math.asin(-lookVector.Y)
    local pitchDegrees = math.deg(pitchRadians)
    return pitchDegrees
end

RunService.RenderStepped:Connect(function()
	local pitch = getDownwardPitch()
    if pitch > 20 or pitch < -20 then
        baseplate.Transparency = 1
    else
		baseplate.Transparency = originalTransparency
    end
end)

