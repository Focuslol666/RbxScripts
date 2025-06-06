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
        Asset = "https://github.com/Focuslol666/RbxScripts/blob/b14f2cd9561a07d543331bb021b762291014f796/DOORS/MyScript/Other/ASH500.rbxm?raw=true", -- 输入模型id
        HeightOffset = 1 -- 高度偏离
    },
    Lights = { -- 调节灯光效果
        Flicker = { -- 闪烁
            Enabled = false, -- 是(true)否(false)激活闪烁效果
            Duration = 1 -- 持续时间(秒)
        },
        Shatter = true, -- 是(true)否(false)打碎灯光
        Repair = false -- 是(true)否(false)不打碎灯光
    },
    Earthquake = { -- 房间震动
        Enabled = false -- 是(true)否(false)会导致房间震动
    },
    CameraShake = { -- 视角摇晃
        Enabled = true, --是(true)否(false)会导致视角摇晃
        Range = 100, -- 范围
        Values = {10, 10, 0.1, 1} -- 量级, 粗糙度, 淡入, 淡出 (按照顺序填入数字)
    },
    Movement = { -- 移动
        Speed = 75, -- 移动速度
        Delay = 1, -- 移动延迟
        Reversed = false -- 是(true)否(false)调为相反移动
    },
    Rebounding = { -- 来回移动
        Enabled = true, -- 是(true)否(false)来回移动
        Type = "Ambush", -- 可切换为"Blitz"
        Min = 3, -- 最少来回次数
        Max = 5, -- 最多来回次数
        Delay = 1 --来回延迟
    },
    Damage = { -- 伤害
        Enabled = true, -- 是(true)否(false)对玩家造成伤害
        Range = 40, -- 伤害范围
        Amount = 23500 -- 伤害数额
    },
    Crucifixion = { -- 十字架封印效果
        Enabled = false, -- 是(true)否(false)能对其使用十字架
        Range = 1, -- 封印范围
        Resist = true, -- 是(true)否(false)只能被控制
        Break = false -- 是(true)否(false)可以被封印
    },
    Death = {
        Type = "Guiding", -- 可切换为"Curious"
        Hints = {"你死于...##############?!", "你永远不会想知道那是什么东西", "尽快躲藏, 不要逃跑", "WU9VIENBTiBORVZFUiBFU0NBUEUhISE="}, -- 可以添加、删除和更改字幕
        Cause = "ASH_Uranium235" -- 总览中的死因
    }
})

---====== Debug entity 实体调试 ======---
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
    print("The spotlight is turning")
end

local loopController = nil
local caption = nil

local canDamage = true
local damageCooldown = 0.25

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
    caption = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.Caption
    OGColor = caption.TextColor3
    OGFont = caption.Font
    caption.TextColor3 = Color3.fromRGB(132, 126, 132)
    caption.Font = Enum.Font.Kalam
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("???: I found you, "..game.Players.LocalPlayer.DisplayName.."! =)")
    task.wait(3)
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("???: Feel the Pain.")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
    loopController = {
        Active = true,
        Stop = function(self)
            self.Active = false
        end
    }
    coroutine.wrap(function()
        while loopController.Active do
            if game:GetService("Players").LocalPlayer.Character and not game:GetService("Players").LocalPlayer.PlayerGui.MainUI.MainFrame.HideVignette.Visible then
                if not game.Players.LocalPlayer.Character then return end
                local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                if not humanoid or humanoid.Health <= 0 then return end
                    game:GetService("Players").LocalPlayer.Character.Humanoid:TakeDamage(1)
                if game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0 then
                    loopController:Stop()
                    game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "ASH_Uranium235"
                    firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, {"你死于...##############?!", "你永远不会想知道那是什么东西", "尽快躲藏, 不要逃跑", "WU9VIENBTiBORVZFUiBFU0NBUEUhISE="},"Blue")
                end
            end
            task.wait(0.17)
        end
    end)()
end)
entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
    if connection then
        connection:Disconnect()
    end
    workspace.ASH500["ASH_Uranium235(Entity-001)"].Attachment.BillboardGui.AlwaysOnTop = false
    if loopController then
        loopController:Stop()
    end
    if game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 then
        require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("#500: It seems that your strength is not ordinary.")
        task.wait(3)
        require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("#500: I hope you can stand up when I meet you next time.")
        task.wait(1)
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
                Reason = "Encounter and Survive rare entity called ASH_Uranium235.",
                Image = GitPNG("https://github.com/Focuslol666/RbxScripts/blob/00aad5b4efb6bee04b8199b08b25d90e88efa76d/DOORS/MyScript/Other/SurviveASH500.png?raw=true","Survive_ASH500"), -- 输入成就图id
            })    
            _G.achievementLock[achievementTitle] = true
            print(achievementTitle.." achievement unlocked and given!")
        else
            warn(achievementTitle.." achievement has been unlocked.")
        end
        caption.TextColor3 = OGColor
        caption.Font = OGFont
    else
        require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("???: Weak human beings...")
        task.wait(3)
        require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("???: They created disasters, but they can't avoid them at all.")
        task.wait(1)
        caption.TextColor3 = OGColor
        caption.Font = OGFont
    end
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
    if lineOfSight == true then
        print("Player is looking at entity")
        if canDamage then
            canDamage = false
            game:GetService("Players").LocalPlayer.Character.Humanoid:TakeDamage(5)
            task.wait(damageCooldown)
            canDamage = true
        end
        if game:GetService("Players").LocalPlayer.Character.Humanoid.Health <= 0 then
            game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "ASH_Uranium235"
            firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, {"你死于...##############?!", "你永远不会想知道那是什么东西", "尽快躲藏, 不要逃跑", "WU9VIENBTiBORVZFUiBFU0NBUEUhISE="},"Blue")
        end
        --[[
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local player = Players.LocalPlayer
        local playerGui = player:WaitForChild("PlayerGui")
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "GlitchScreen"
        screenGui.ResetOnSpawn = false
        screenGui.IgnoreGuiInset = true
        screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        screenGui.Enabled = true
        local background = Instance.new("ImageLabel")
        background.Name = "ImageLabel"
        background.Size = UDim2.new(1, 0, 1, 0)
        background.Position = UDim2.new(0, 0, 0, 0)
        background.BackgroundTransparency = 0.5
        background.BorderSizePixel = 0
        background.Image = "rbxassetid://7218675830"
        background.ScaleType = Enum.ScaleType.Crop
        background.Parent = screenGui
        screenGui.Parent = playerGui
        ]]
    else
        print("Player view is obstructed by something")
        -- screenGui.Enabled = false
    end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
    else
        print("Entity has finished rebounding")
    end
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
    if newHealth == 0 then
        print("Entity has killed the player")
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
        print("Entity has damaged the player")
    end
end)

---====== Run entity 运行实体 ======---

entity:Run()
