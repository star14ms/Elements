local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GodDialogAction = ReplicatedStorage.DialogModule:WaitForChild("GodDialogAction")

GodDialogAction:FireServer("CreateWelcomeStar")

print("Hello world, from client!")
