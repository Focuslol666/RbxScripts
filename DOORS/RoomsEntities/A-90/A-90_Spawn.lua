-- Made by @Focuslol666
function RunA90()
    local config = _G.A90Config

    local gui = game:GetService("Players").LocalPlayer.PlayerGui
    gui.MainUI.Jumpscare.Jumpscare_A90.Face.Image = config.Face
    gui.MainUI.Jumpscare.Jumpscare_A90.FaceAngry.Image = config.AngryFace
    gui.MainUI.Jumpscare.Jumpscare_A90.StopIcon.Image = config.StopIcon
    gui.MainUI.Jumpscare.Jumpscare_A90.Static.ImageColor3 = config.StaticColor
    gui.MainUI.Jumpscare.Jumpscare_A90.Static2.ImageColor3 = config.StaticColor
    gui.MainUI.Jumpscare.Jumpscare_A90.StopIcon.StopStatic.ImageColor3 = config.StaticColor
    gui.MainUI.Initiator.Main_Game.RemoteListener.Modules.A90.Hit.SoundId = config.HitSound
    gui.MainUI.Initiator.Main_Game.RemoteListener.Modules.A90.Spawn.SoundId = config.SpawnSound

    coroutine.wrap(function()
        local initiator = gui.MainUI.Initiator.Main_Game
        require(initiator.RemoteListener.Modules.A90)(
            require(initiator),
            workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")]
        )

        while true do
            if gui.MainUI.Jumpscare.Jumpscare_A90.FaceAngry.Visible then
                task.wait(2.5)
                game.Players.LocalPlayer.Character.Humanoid:TakeDamage(config.Damage)
                break
            end
            task.wait()
        end
        if game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0 then
            game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "A-90"
            firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, {"You died to A-90"},"Yellow")
        end
    end)()
end

RunA90()
