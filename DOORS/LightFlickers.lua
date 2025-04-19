-- Services
local Players = game:GetService("Players")
local workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Variables
local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

-- Modules
local moduleScripts = {
    Module_Events = require(ReplicatedStorage.ClientModules.Module_Events)
}

-- Functions
function GetCurrentRoom(latest)
    if latest then
        return workspace.CurrentRooms:GetChildren()[#workspace.CurrentRooms:GetChildren()]
    end
    return workspace.CurrentRooms:FindFirstChild(localPlayer:GetAttribute("CurrentRoom"))
end

-- Configuration (example)
local config = {
    Lights = {
        Flicker = {
            Enabled = true,
            Duration = 1
        }
    }
}

-- Main logic
if config.Lights.Flicker.Enabled then
    local currentRoom = GetCurrentRoom(false)
    if currentRoom then
        moduleScripts.Module_Events.flicker(currentRoom, config.Lights.Flicker.Duration)
    end
end