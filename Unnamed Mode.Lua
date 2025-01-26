-- Caption
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Made by Light's Group.", true)
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
wait(1)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Unnamed Mode", true)
wait(3)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("The most is ez and bad", true)

-- A-25 
local a25Script = game:HttpGet("https://pastebin.com/raw/0gupZhuR")
local success, result = pcall(function()
    loadstring(a25Script)()
end)
if not success then
    warn("Failed to load A-25 script: " .. tostring(result))
end

-- doors sound
local doorSoundScript = game:HttpGet("https://pastebin.com/raw/9ydNPa3U")
local success, result = pcall(function()
    loadstring(doorSoundScript)()
end)
if not success then
    warn("Failed to load door sound script: " .. tostring(result))
end