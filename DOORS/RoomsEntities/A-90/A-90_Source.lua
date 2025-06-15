-- Made by @Focuslol666

if not _G.ogA90Config then
    _G.ogA90Config = {}
end

function RunA90()
    local config = _G.A90Config
    local player = game.Players.LocalPlayer
    local gui = player.PlayerGui

    if not _G.ogA90Config.Saved then
        _G.ogA90Config = {
            Assets = {
                Face = gui.MainUI.Jumpscare.Jumpscare_A90.Face.Image,
                AngryFace = gui.MainUI.Jumpscare.Jumpscare_A90.FaceAngry.Image,
                StopIcon = gui.MainUI.Jumpscare.Jumpscare_A90.StopIcon.Image,
                StaticColor = gui.MainUI.Jumpscare.Jumpscare_A90.Static.ImageColor3,
                Static2Color = gui.MainUI.Jumpscare.Jumpscare_A90.Static2.ImageColor3,
                StopStaticColor = gui.MainUI.Jumpscare.Jumpscare_A90.StopIcon.StopStatic.ImageColor3,
                HitSound = gui.MainUI.Initiator.Main_Game.RemoteListener.Modules.A90.Hit.SoundId,
                SpawnSound = gui.MainUI.Initiator.Main_Game.RemoteListener.Modules.A90.Spawn.SoundId
            },
            Saved = true
        }
    end

    local assets = config.Assets
    gui.MainUI.Jumpscare.Jumpscare_A90.Face.Image = assets.Face
    gui.MainUI.Jumpscare.Jumpscare_A90.FaceAngry.Image = assets.AngryFace
    gui.MainUI.Jumpscare.Jumpscare_A90.StopIcon.Image = assets.StopIcon
    gui.MainUI.Jumpscare.Jumpscare_A90.Static.ImageColor3 = assets.StaticColor
    gui.MainUI.Jumpscare.Jumpscare_A90.Static2.ImageColor3 = assets.StaticColor
    gui.MainUI.Jumpscare.Jumpscare_A90.StopIcon.StopStatic.ImageColor3 = assets.StaticColor
    gui.MainUI.Initiator.Main_Game.RemoteListener.Modules.A90.Hit.SoundId = assets.HitSound
    gui.MainUI.Initiator.Main_Game.RemoteListener.Modules.A90.Spawn.SoundId = assets.SpawnSound

    local function RestoreogConfig()
        local og = _G.ogA90Config.Assets
        
        gui.MainUI.Jumpscare.Jumpscare_A90.Face.Image = og.Face
        gui.MainUI.Jumpscare.Jumpscare_A90.FaceAngry.Image = og.AngryFace
        gui.MainUI.Jumpscare.Jumpscare_A90.StopIcon.Image = og.StopIcon
        gui.MainUI.Jumpscare.Jumpscare_A90.Static.ImageColor3 = og.StaticColor
        gui.MainUI.Jumpscare.Jumpscare_A90.Static2.ImageColor3 = og.Static2Color
        gui.MainUI.Jumpscare.Jumpscare_A90.StopIcon.StopStatic.ImageColor3 = og.StopStaticColor
        gui.MainUI.Initiator.Main_Game.RemoteListener.Modules.A90.Hit.SoundId = og.HitSound
        gui.MainUI.Initiator.Main_Game.RemoteListener.Modules.A90.Spawn.SoundId = og.SpawnSound
    end

    coroutine.wrap(function()
        local initiator = gui.MainUI.Initiator.Main_Game
        
        require(initiator.RemoteListener.Modules.A90)(require(initiator), workspace.CurrentRooms[player:GetAttribute("CurrentRoom")])

        while not gui.MainUI.Jumpscare.Jumpscare_A90.FaceAngry.Visible do
            task.wait()
        end
        
        task.wait(1)
        
        local death = config.Death
        local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
        if humanoid then
            local remainingHealth = humanoid.Health - death.Damage
            
            if remainingHealth <= 0 then
                humanoid.Health = 0
            else
                humanoid:TakeDamage(death.Damage)
            end
        end

        task.wait(0.1)
        local isDead = false
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            isDead = player.Character.Humanoid.Health <= 0
        end

        if isDead then
            local stats = game.ReplicatedStorage.GameStats:FindFirstChild("Player_".. player.Name)
            if stats then
                stats.Total.DeathCause.Value = death.Cause
            end
            
            if firesignal then
                firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, death.Hints, death.HintType)
            end
        end

        local startTime = tick()
        while gui.MainUI.Jumpscare.Jumpscare_A90.FaceAngry.Visible do
            task.wait(0.1)
            if tick() - startTime > 10 then break end
        end

        RestoreogConfig()
    end)()
end

RunA90()

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    if _G.ogA90Config.Saved then
        task.wait(1)
        local gui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        local og = _G.ogA90Config.Assets
        
        if gui:FindFirstChild("MainUI") then
            gui.MainUI.Jumpscare.Jumpscare_A90.Face.Image = og.Face
            gui.MainUI.Jumpscare.Jumpscare_A90.FaceAngry.Image = og.AngryFace
            gui.MainUI.Jumpscare.Jumpscare_A90.StopIcon.Image = og.StopIcon
            gui.MainUI.Jumpscare.Jumpscare_A90.Static.ImageColor3 = og.StaticColor
            gui.MainUI.Jumpscare.Jumpscare_A90.Static2.ImageColor3 = og.Static2Color
            gui.MainUI.Jumpscare.Jumpscare_A90.StopIcon.StopStatic.ImageColor3 = og.StopStaticColor
        end
        
        if gui:FindFirstChild("Initiator") then
            gui.MainUI.Initiator.Main_Game.RemoteListener.Modules.A90.Hit.SoundId = og.HitSound
            gui.MainUI.Initiator.Main_Game.RemoteListener.Modules.A90.Spawn.SoundId = og.SpawnSound
        end
    end
end)
