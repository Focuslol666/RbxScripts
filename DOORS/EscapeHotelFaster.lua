-- by Focus Group (Chinese Edition of TikTok)
-- Escape as quickly as possible and gain hidden achievement!

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local GameData = ReplicatedStorage:WaitForChild("GameData")
local LatestRoom = GameData:WaitForChild("LatestRoom")
local EndMusic = game:GetService("ReplicatedStorage").FloorReplicated.MinesFinale.EndMusic

local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

local achievementInfo = {
    Title = "Book In, Book Out",
    Desc = "Four stars; weird smell.",
    Reason = "Escape The Hotel in under 15 minutes.",
    Image = "rbxassetid://10411081432"
}

local startTime = tick()

LatestRoom.Changed:Connect(function(newValue)
    if newValue == 100 then
        local elapsedTime = tick() - startTime
        if elapsedTime <= 900 and EndMusic.IsPlaying then
            achievementGiver(achievementInfo)
        end
    end
end)
