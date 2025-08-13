local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local camera = Workspace.CurrentCamera

-- Helper to get the screen rectangle of a BillboardGui
local function getBillboardScreenRect(billboard)
	if not billboard or not billboard.Adornee then return nil end
	if not billboard.Enabled then return nil end

	local adornee = billboard.Adornee
	local worldPos = adornee.Position + billboard.StudsOffset
	local screenPos, onScreen = camera:WorldToViewportPoint(worldPos)
	if not onScreen then return nil end

	-- BillboardGui size is in pixels (offset part of UDim2)
	local size = billboard.Size
	local width = size.X.Offset
	local height = size.Y.Offset

	-- Centered at screenPos
	local left = screenPos.X - width/2
	local right = screenPos.X + width/2
	local top = screenPos.Y - height/2
	local bottom = screenPos.Y + height/2

	return {left=left, right=right, top=top, bottom=bottom}
end

-- Helper to check if two rectangles overlap
local function rectsOverlap(a, b)
	if not a or not b then return false end
	return not (a.right < b.left or a.left > b.right or a.bottom < b.top or a.top > b.bottom)
end

-- Main loop
RunService.RenderStepped:Connect(function()
	for _, star in Workspace:GetDescendants() do
		if star:IsA("BasePart") then
			local timerBillboard = star:FindFirstChild("StarTimer")
			local classBillboard = star:FindFirstChild("StarClassBillboard")
			if timerBillboard and classBillboard then
				local timerRect = getBillboardScreenRect(timerBillboard)
				local classRect = getBillboardScreenRect(classBillboard)
				if timerRect and classRect and rectsOverlap(timerRect, classRect) then
					-- Move timer billboard up until no overlap (max 5 tries)
					local offset = timerBillboard.StudsOffset
					local step = 0.5
					local tries = 0
					repeat
						offset = offset + Vector3.new(0, step, 0)
						timerBillboard.StudsOffset = offset
						timerRect = getBillboardScreenRect(timerBillboard)
						tries = tries + 1
					until not rectsOverlap(timerRect, classRect) or tries > 5
				else
					-- Only reset to default offset if it will NOT overlap after reset
					local defaultOffset = Vector3.new(0, star.Size.Y/2 + 2 + 0.8, 0)
					if timerBillboard.StudsOffset ~= defaultOffset then
						-- Simulate what would happen if we reset
						local oldOffset = timerBillboard.StudsOffset
						timerBillboard.StudsOffset = defaultOffset
						local newTimerRect = getBillboardScreenRect(timerBillboard)
						-- If no overlap, apply; else, revert
						if not (newTimerRect and classRect and rectsOverlap(newTimerRect, classRect)) then
							-- Safe to reset to default
							-- Already set above
						else
							-- Would overlap, so revert to previous offset
							timerBillboard.StudsOffset = oldOffset
						end
					end
				end
			end
		end
	end
end)

