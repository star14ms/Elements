local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local AnnouncementEvent = ReplicatedStorage:WaitForChild("AnnouncementEvent")

Players.PlayerAdded:Connect(function(player)
    local message = player.DisplayName .. " has joined the game!"
	AnnouncementEvent:FireAllClients(message)
end)

