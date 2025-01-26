local shadow=game:GetObjects("rbxassetid://88396533523807")[1]
shadow.Parent = game.Players.LocalPlayer.Backpack
local Players = game:GetService("Players")
local Plr = Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")
local RightArm = Char:WaitForChild("RightUpperArm")
local LeftArm = Char:WaitForChild("LeftUpperArm")
local RightC1 = RightArm.RightShoulder.C1
local LeftC1 = LeftArm.LeftShoulder.C1
        local function setupCrucifix(tool)
        RightArm.Name = "R_Arm"
        
        RightArm.RightShoulder.C1 = RightC1 * CFrame.Angles(math.rad(-90), math.rad(-15), 0)
        for _, v in next, Hum:GetPlayingAnimationTracks() do
            v:Stop()
        end
        end
shadow.Equipped:Connect(function()
setupCrucifix(shadow)
end)
 
shadow.Unequipped:Connect(function()
        RightArm.Name = "RightUpperArm"
        
        RightArm.RightShoulder.C1 = RightC1
end)

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("原作者: FOCUS_MAX与baichuangtin", true)
wait(2)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("可外传, 但禁止圈米 (就这个破脚本应该也没人圈)", true)
wait(2)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("模型: rbxassetid://88396533523807 (公用)", true)
wait(3)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("QQ群: 1025611708", true)