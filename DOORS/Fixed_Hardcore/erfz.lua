local HotSex = Instance.new("Animation")
HotSex.AnimationId = "rbxassetid://10096088747"
local HotSexOnHumanoid = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(HotSex)
HotSexOnHumanoid:Play()
local humrootpart = game.Players.LocalPlayer.Character.HumanoidRootPart
humrootpart.Anchored = true
local followhead = true

--Stop rendering camera
local maingame = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
maingame.stopcam = true

--Make camera follow head
task.spawn(function()
    while true do
        if followhead == true then
            workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(game.Players.LocalPlayer.Character.Head.CFrame, 0.3)
        end
        task.wait()
    end
end)
humrootpart.CFrame = humrootpart.CFrame + Vector3.new(0,1,0)
HotSexOnHumanoid:AdjustSpeed(0.8)
task.wait(0.5)
HotSexOnHumanoid:AdjustSpeed(0.25)
task.wait(3.5)
HotSexOnHumanoid:AdjustSpeed(-0.2)
task.wait(0.1)
HotSexOnHumanoid:AdjustSpeed(-0.4)
task.wait(0.2)
HotSexOnHumanoid:AdjustSpeed(0.1)
task.wait(0.2)
HotSexOnHumanoid:AdjustSpeed(-0.25)
task.wait(1.5)
HotSexOnHumanoid:AdjustSpeed(-0.15)
task.wait(2)
HotSexOnHumanoid:AdjustSpeed(0)
task.wait(2)
HotSexOnHumanoid:Stop()
humrootpart.Anchored = false
followhead = false
local maingame = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
maingame.stopcam = false
if replicatesignal then
    replicatesignal(game.Players.LocalPlayer.Kill)
else
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    game.Players.LocalPlayer:SetAttribute("Alive", false)
end
