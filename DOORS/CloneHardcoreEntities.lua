game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "加载中...",
		Text = "正在加载脚本",
		Duration = 3
	})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- player
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Model
local model = Instance.new("Model")
model.Parent = Workspace
model.Name = "Hardcore_Entities"

-- Clone
local modelId = 16026549027
local modelTemplate = game:GetObjects("rbxassetid://" .. modelId)[1]
for _, child in ipairs(modelTemplate:GetChildren()) do
    child:Clone().Parent = model
end

-- Site
model:PivotTo(rootPart.CFrame * CFrame.new(0, 0, 10))

-- Destroy
delay(15, function()
    model:Destroy()
end)
