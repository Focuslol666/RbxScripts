local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local workspace = game:GetService("Workspace")

local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

local remotesFolder = ReplicatedStorage:WaitForChild("RemotesFolder")
local moduleScripts = {
    Main_Game = require(playerGui.MainUI.Initiator.Main_Game),
    Earthquake = require(remotesFolder.RequestAsset:InvokeServer("Earthquake"))
}

local function GetCurrentRoom(latest)
    if latest then
        return workspace.CurrentRooms:GetChildren()[#workspace.CurrentRooms:GetChildren()]
    end
    return workspace.CurrentRooms:FindFirstChild(localPlayer:GetAttribute("CurrentRoom"))
end

local currentRoom = GetCurrentRoom(false)
if currentRoom then
    moduleScripts.Earthquake(moduleScripts.Main_Game, currentRoom)
else
    warn("Current room not found.")
end
