-- 客户端版无敌模式闹麻了💀💀💀
-- Godmode is client-only, and the damage done locally has no effect on you.
-- Applies to scripts such as DOORS SCRIPT MODES that only hurt you on the client side.
--[[
If the variable is "true", Godmode is enabled. If the variable is "false", Godmode is disabled.

For Example:
getgenv().Godmode = true or false
loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/RbxScripts/refs/heads/main/DOORS/Godmode%20(OnClient).lua"))()
]]

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local originalHealth = humanoid.Health

local godmodeLoopActive = false
local godmodeThread = nil

local function startGodmodeLoop()
    godmodeLoopActive = true
    godmodeThread = coroutine.create(function()
        while godmodeLoopActive and humanoid do
            if character and humanoid and humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
                humanoid.Health = humanoid.MaxHealth
            end
            task.wait()
        end
    end)
    coroutine.resume(godmodeThread)
end

local function stopGodmodeLoop()
    godmodeLoopActive = false
    if humanoid and character then
        humanoid.Health = originalHealth
    end
end

while true do
    if getgenv().Godmode then
        if not godmodeLoopActive then
            startGodmodeLoop()
        end
    else
        if godmodeLoopActive then
            stopGodmodeLoop()
        end
    end
    task.wait(1)
end
