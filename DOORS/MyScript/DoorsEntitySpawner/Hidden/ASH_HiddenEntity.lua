function GitPNG(GithubImg,ImageName)
	local url=GithubImg
	if not isfile(ImageName..".png") then
		writefile(ImageName..".png", game:HttpGet(url))
	end
	return (getcustomasset or getsynasset)(ImageName..".png")
end
function GitSND(GithubSnd,SoundName)
    local url=GithubSnd
    if not isfile(SoundName..".mp3") then
	    writefile(SoundName..".mp3", game:HttpGet(url))
	end
	return (getcustomasset or getsynasset)(SoundName..".mp3")
end

---====== Load spawner 加载生成器 ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity 创作实体 ======---

local entity = spawner.Create({
    Entity = {
        Name = "ASH500",
        Asset = "https://github.com/Focuslol666/RbxScripts/raw/main/DOORS/MyScript/Other/ASH500.rbxm",
        HeightOffset = 0
    },
    Lights = {
        Flicker = {
            Enabled = false,
            Duration = 1
        },
        Shatter = true,
        Repair = false
    },
    Earthquake = {
        Enabled = false
    },
    CameraShake = {
        Enabled = true,
        Range = 80,
        Values = {10, 10, 0.1, 1}
    },
    Movement = {
        Speed = 75,
        Delay = 1,
        Reversed = false
    },
    Rebounding = {
        Enabled = true,
        Type = "Ambush",
        Min = 3,
        Max = 5,
        Delay = 1
    },
    Damage = {
        Enabled = true,
        Range = 30,
        Amount = 2352352350 -- 逆天数额😱😱😱
    },
    Crucifixion = {
        Enabled = false, -- 想啥呢十字架根本无效😈
        Range = 1,
        Resist = true,
        Break = false
    },
    Death = {
        Type = "Guiding",
        Hints = {"你死于...##############?!", "你永远不会想知道那是什么东西", "尽快躲藏, 不要逃跑", "WU9VIENBTiBORVZFUiBFU0NBUEUhISE="},
        Cause = "ASH_Uranium235"
    }
})

---====== Debug entity 实体调试 ======---

local caption = nil
local originalFont = nil
local originalTextColor = nil

local function SpotlightRotation(speed)
    local part1 = workspace.ASH500["ASH_Uranium235(Entity-001)"]:GetChildren()[10].Weld["Part(Light-A)"]
    local part2 = workspace.ASH500["ASH_Uranium235(Entity-001)"]:GetChildren()[10].Weld["Part(Light-B)"]
    local part3 = workspace.ASH500["ASH_Uranium235(Entity-001)"]:GetChildren()[10].Weld["Part(Light-C)"]
    local rotationSpeed = speed or 1
    local RunService = game:GetService("RunService")
    local connection
    connection = RunService.Heartbeat:Connect(function(deltaTime)
        part1.Orientation += Vector3.new(0, rotationSpeed * deltaTime, 0)
        part2.Orientation += Vector3.new(0, rotationSpeed * deltaTime, 0)
        part3.Orientation += Vector3.new(0, rotationSpeed * deltaTime, 0)
    end)
end

local damageCircles = {
    {range = 200, interval = 1},
    {range = 120, interval = 0.5},
    {range = 90,  interval = 0.1},
    {range = 60,  interval = 0.05}
}

entity:SetCallback("OnSpawned", function()
    print("Hi.")
    
    caption = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.Caption
    originalFont = caption.Font
    originalTextColor = caption.TextColor3
    caption.TextColor3 = Color3.fromRGB(132, 126, 132)
    caption.Font = Enum.Font.Kalam
    
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("???: I found you, "..game.Players.LocalPlayer.DisplayName.."! =)")
    task.wait(3)
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("???: Feel the Pain.")
    
    repeat task.wait() until workspace:FindFirstChild("ASH500")
    local entityModel = workspace.ASH500:FindFirstChildWhichIsA("Model")
    if entityModel then
        SpotlightRotation(60)
        
        local billboard = entityModel:FindFirstChild("BillboardGui", true)
        if billboard then
            while task.wait(math.random(2, 10)) and entityModel.Parent do
                billboard.AlwaysOnTop = not billboard.AlwaysOnTop
            end
        end
    end
end)

entity:SetCallback("OnStartMoving", function()
    print("I'm coming.")
    SpotlightRotation(60)
    loopController = {
        Active = true,
        Stop = function(self)
            self.Active = false
        end
    }
    
    coroutine.wrap(function()
        local RunService = game:GetService("RunService")
        local damageTimers = {}
        for i = 1, #damageCircles do
            damageTimers[i] = 0
        end
        
        local damageConnection
        damageConnection = RunService.Heartbeat:Connect(function(deltaTime)
            if not loopController.Active then
                damageConnection:Disconnect()
                return
            end
            
            if game:GetService("Players").LocalPlayer.Character and not game:GetService("Players").LocalPlayer.PlayerGui.MainUI.MainFrame.HideVignette.Visible then
                
                if not game.Players.LocalPlayer.Character then return end
                local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                if not humanoid or humanoid.Health <= 0 then return end
                
                local entityModel = workspace.ASH500:FindFirstChild("ASH_Uranium235(Entity-001)")
                local playerChar = game.Players.LocalPlayer.Character
                
                if entityModel and playerChar then
                    local entityPos = entityModel:GetPivot().Position
                    local playerPos = playerChar:GetPivot().Position
                    
                    local horizontalDistance = (Vector3.new(entityPos.X, 0, entityPos.Z) - 
                                              Vector3.new(playerPos.X, 0, playerPos.Z)).Magnitude
                    
                    local inAnyCircle = false
                    for i, circle in ipairs(damageCircles) do
                        if horizontalDistance <= circle.range then
                            inAnyCircle = true
                            damageTimers[i] = damageTimers[i] + deltaTime
                            
                            if damageTimers[i] >= circle.interval then
                                humanoid:TakeDamage(1)
                                damageTimers[i] = 0
                            end
                        end
                    end
                end
                
                if humanoid.Health <= 0 then
                    loopController:Stop()
                    damageConnection:Disconnect()
                    if playerChar:FindFirstChild("RadiationEffect") then
                        playerChar.RadiationEffect:Destroy()
                    end
                    game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "ASH_Uranium235"
                    firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, {"你死于...##############?!", "你永远不会想知道那是什么东西", "尽快躲藏, 不要逃跑", "WU9VIENBTiBORVZFUiBFU0NBUEUhISE="}, "Blue")
                end
            end
        end)
    end)()
end)
entity:SetCallback("OnDespawning", function()
    print("Goodbye.")
    if connection then
        connection:Disconnect()
    end
    workspace.ASH500["ASH_Uranium235(Entity-001)"].Attachment.BillboardGui.AlwaysOnTop = false
    loopController:Stop()
    if game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 then
        require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("#500: It seems that your strength is not ordinary.")
        task.wait(3)
        require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("#500: I hope you can stand up when I meet you next time.")
        task.wait(1)
        caption.Font = originalFont
        caption.TextColor3 = originalTextColor

---====== Achievement Giver 给予成就 ======---

        if not _G.achievementLock then
            _G.achievementLock = {}
        end
        local achievementTitle = "Evil Radiation"
        if not _G.achievementLock[achievementTitle] then
            local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()   
            achievementGiver({
                Title = achievementTitle,
                Desc = "Enduring the pain caused by Radiation.",
                Reason = "Encounter and Survive rare Entity called ASH_Uranium235.",
                Image = GitPNG("https://github.com/Focuslol666/RbxScripts/raw/main/DOORS/MyScript/Other/SurviveASH500.png","Survive_ASH500"),
            })    
            _G.achievementLock[achievementTitle] = true
            print(achievementTitle.." achievement unlocked and given!")
        else
            warn(achievementTitle.." achievement has been unlocked.")
        end
    else
        require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("???: Weak human beings...")
        task.wait(3)
        require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("???: They created disasters, but they can't avoid them at all.")
        task.wait(1)
        caption.Font = originalFont
        caption.TextColor3 = originalTextColor
    end
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Where is this? Oh, I seem to be at the DOOR ".. room.Name)
    else
        print("I'm here again, DOOR ".. room.Name)
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
    if lineOfSight == true then
        print("You seem to be paying attention to me..")
    else
        print("Okay, that's it. Don't look at me.")
    end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("I'm back.")
    else
        print("I'm back again.")
    end
end)

entity:SetCallback("OnDespawned", function()
    print("emm...")
    coroutine.wrap(function()
        local rand = math.random(1, 100)
    
        if rand <= 25 then
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/RbxScripts/refs/heads/main/DOORS/RoomsEntities/A-60.lua"))()
                print("Last Attack: A-60")
            end)
        elseif rand <= 50 then
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/RbxScripts/refs/heads/main/DOORS/RoomsEntities/A-90/A-90_BranchToASH500.lua"))()
                print("Last Attack: A-90")
            end)
        elseif rand <= 75 then
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/RbxScripts/refs/heads/main/DOORS/RoomsEntities/A-120.lua"))()
                print("Last Attack: A-120")
            end)
        else
            print("You're lucky there aren't any Rooms entity spawned.")
        end
    end)()
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
    if newHealth == 0 then
        print("Surprise!")
        --[[
        local JumpscareGui = Instance.new("ScreenGui")
        local Background = Instance.new("Frame")
        local Face = Instance.new("ImageLabel")
        JumpscareGui.Name = "JumpscareGui"
        JumpscareGui.IgnoreGuiInset = true
        JumpscareGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        JumpscareGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        Background.Name = "Background"
        Background.BackgroundColor3 = Color3.fromRGB(77, 5, 99)
        Background.BorderSizePixel = 0
        Background.Size = UDim2.new(1, 0, 1, 0)
        Background.ZIndex = 999
        Face.Name = "ASH500_ScareFace"
        Face.AnchorPoint = Vector2.new(0.5, 0.5)
        Face.BackgroundTransparency = 1
        Face.Position = UDim2.new(0.5, 0, 0.5, 0)
        Face.ResampleMode = Enum.ResamplerMode.Pixelated
        Face.Size = UDim2.new(0, 150, 0, 150)
        Face.Image = GitPNG("?raw=true", "ASH500_ScareImg")
        Background.Parent = JumpscareGui
        Face.Parent = Background
        local scare = Instance.new("Sound")
        scare.Parent = JumpscareGui
        scare.Name = "ASH500_ScareSound"
        scare.SoundId = GitSND("?raw=true", "ASH500_ScareSnd")
        scare.Volume = 6
        local distort = Instance.new("DistortionSoundEffect")
        distort.Parent = scare
        distort.Level = 0.75   
            task.spawn(function()
                while JumpscareGui.Parent do
                    Background.BackgroundColor3 = Color3.fromRGB(77, 5, 99)
                    task.wait(math.random(25, 100) / 1000)
                    Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    task.wait(math.random(25, 100) / 1000)
        end
    end)
        game.TweenService:Create(Face, TweenInfo.new(0.7), {Size = UDim2.new(0, 2450, 0, 1550), ImageTransparency = 0}):Play()
        scare:Play()
        task.wait(0.8)
        JumpscareGui:Destroy()
        ]]
    else
        print("Huh? Why are you still alive?")
    end
end)

entity:SetCallback("OnCrucified", function()
    print("Shit Fuck!") -- 但是你永远无法触发此回调💀💀💀
end)

---====== Run entity 运行实体 ======---

entity:Run()
