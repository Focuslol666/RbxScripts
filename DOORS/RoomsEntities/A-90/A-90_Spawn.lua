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
            if gui.MainUI.Jumpscare.Jumpscare_A90.Visible then
                task.wait(2.5)
                game.Players.LocalPlayer.Character.Humanoid:TakeDamage(config.Damage)
                gui.MainUI.Jumpscare.Jumpscare_A90.Visible = false
                break
            end
            task.wait()
        end
    end)()
end

RunA90()