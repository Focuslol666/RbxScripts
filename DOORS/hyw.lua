local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local backpack = localPlayer.Backpack
local gameData = ReplicatedStorage.GameData
local latestRoom = gameData.LatestRoom
local floor = gameData.Floor

local function CheckQuit(tool)
    if tool.Name == "StarJug" then
        game:Shutdown()
    end
end
backpack.ChildAdded:Connect(CheckQuit)
character.ChildAdded:Connect(CheckQuit)
localPlayer.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    character.ChildAdded:Connect(CheckQuit)
end)
for _, tool in ipairs(backpack:GetChildren()) do
    CheckQuit(tool)
end
for _, tool in ipairs(character:GetChildren()) do
    CheckQuit(tool)
end

if floor == "Rooms" then
    latestRoom.Changed:Connect(function(value)
        if value >= 998 then
            while true do end
        end
    end)
end