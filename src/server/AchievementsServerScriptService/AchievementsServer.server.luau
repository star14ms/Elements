local rs = game.ReplicatedStorage:WaitForChild("AchievementSystemReplicatedStorage")
local remote = rs:WaitForChild("AchievementsRemoteEvent")
local allAchievements = require(rs:WaitForChild("AchievementsList")) :: {[string]: any}
local achievementFuncs = require(rs:WaitForChild("AchievementFunctions"))

--Save data
game.Players.PlayerRemoving:Connect(achievementFuncs.SavePlayerAchievements)
game:BindToClose(function()
	for _, plr in pairs(game.Players:GetPlayers()) do
		achievementFuncs.SavePlayerAchievements(plr)
	end
end)

game.Players.PlayerAdded:Connect(function(plr)
	
	achievementFuncs.LoadPlayerAchievements(plr) --Load data
	
--	achievementFuncs.AwardAchievement(plr, "Welcome") --Give achievement to player for playing the game
	
	
--	--Handle the "Energetic" achievement for walking 500 studs
--	local studsWalked = 0
--	local moving = false
	
--	plr.CharacterAdded:Connect(function(char)
--		local hum = char:WaitForChild("Humanoid")
		
--		hum:GetPropertyChangedSignal("MoveDirection"):Connect(function()
--			if (hum.MoveDirection * Vector3.new(1, 0, 1)).Magnitude > 0 then
--				moving = true
--			else
--				moving = false
--			end
--		end)
--	end)
	
--	local lastStep = tick()
--	local achievementHeartbeatConnection
--	achievementHeartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function()
		
--		local delta = tick() - lastStep
		
--		if plr.Character and plr.Character:FindFirstChild("Humanoid") then
--			studsWalked += delta * (plr.Character.Humanoid.MoveDirection * Vector3.new(1, 0, 1)).Magnitude * plr.Character.Humanoid.WalkSpeed
--		end
		
--		if studsWalked >= 500 then
--			achievementFuncs.AwardAchievement(plr, "Energetic") --Give achievement for playing for walking 500 studs
--			achievementHeartbeatConnection:Disconnect()
--		end
		
--		lastStep = tick()
--	end)
	
	
--	--Handle the "10 minutes" achievement for walking 500 studs
--	task.wait(10 * 60) --Wait 10 minutes before awarding ten minute achievement
--	achievementFuncs.AwardAchievement(plr, "10 minutes") --Give achievement for playing for 10 minutes
end)

game.Players.PlayerAdded:Connect(function(player)

	player.CharacterAdded:Connect(function(character)
		
		character.ChildAdded:Connect(function(tool)
            -- Award by matching exact key or Elements/<key>
            for achievement, _ in pairs(allAchievements) do
                if tool.Name == achievement or tool.Name == string.match(achievement, "/([^/]+)$") then
                    local awardKey = achievement
                    if not string.find(awardKey, "/") then
                        awardKey = "Elements/" .. awardKey
                    end
                    achievementFuncs.AwardAchievement(player, awardKey)
                end
            end
		end)
	end)
end)

--Initialize to empty achievements
remote.OnServerEvent:Connect(function(player, action)
	if action == "InitializeEmptyAchievements" then
		achievementFuncs.InitializeEmptyAchievements(player)
	end
end)

