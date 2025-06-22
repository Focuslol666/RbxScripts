-- 客户端版无敌模式闹麻了💀💀💀
-- Godmode is client-only, and the damage done locally has no effect on you.
-- Applies to scripts such as DOORS SCRIPT MODES that only hurt you on the client side.
-- This script is Beta Version, may have some bugs.
--[[
If the variable is "true", Godmode is enabled. If the variable is "false", Godmode is disabled.

For Example:
local Godmode = loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/RbxScripts/refs/heads/main/DOORS/Godmode%20(OnClient).lua"))()
Godmode(true or false)
]]

local player = game:GetService("Players").LocalPlayer
local originalMaxHealth = 100

local function Godmode(Value)
    local character = player.Character
    if not character or not character:FindFirstChild("Humanoid") then
        return
    end
    
    local humanoid = character.Humanoid
    local invincibilityIcon = player.PlayerGui.MainUI.MainFrame.Healthbar.Effects.Invincibility
    
    if Value then
        if originalMaxHealth == 100 then
            originalMaxHealth = humanoid.MaxHealth
        end
        
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
        if invincibilityIcon then
            invincibilityIcon.Visible = true
        end
        require(player.PlayerGui.MainUI.Initiator.Main_Game).caption("Godmode is enabled.")
        print("Godmode is enabled.")
    else
        humanoid.MaxHealth = originalMaxHealth
        humanoid.Health = originalMaxHealth
        if invincibilityIcon then
            invincibilityIcon.Visible = false
        end
        require(player.PlayerGui.MainUI.Initiator.Main_Game).caption("Godmode is disabled.")
        print("Godmode is disabled.")
    end
end
