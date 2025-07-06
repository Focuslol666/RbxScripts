-- Version: v0.98_Preview
-- Made by @FOCUSED_LIGHT (Scripter), @ASH_Uranium235 (Owner, Model Author) & @Nameless_MONSTER (Helper).

--// 获取Github资源 //--

function GetGitSound(GithubSnd, SoundName)
    local url = GithubSnd
    if not isfile(SoundName..".mp3") then
	    writefile(SoundName..".mp3", game:HttpGet(url))
	end
	return (getcustomasset or getsynasset)(SoundName..".mp3")
end

--// 实体生成前兆 //--

-- 颜色矫正效果
local function createColorCorrection(targetColor, fadeOutDuration, intensity)
    local Lighting = game:GetService("Lighting")
    local RunService = game:GetService("RunService")
    
    local colorCorrection = Instance.new("ColorCorrectionEffect")
    colorCorrection.Name = "ColorCorrectionEffect"
    colorCorrection.Parent = Lighting
    colorCorrection.Enabled = true
    
    local currentIntensity = intensity
    local timer = 0
    local effectActive = true
    
    colorCorrection.TintColor = Color3.new(
        1 - (1 - targetColor.R) * currentIntensity,
        1 - (1 - targetColor.G) * currentIntensity,
        1 - (1 - targetColor.B) * currentIntensity
    )
    
    local connection
    connection = RunService.Heartbeat:Connect(function(deltaTime)
        if not effectActive then
            connection:Disconnect()
            return
        end
        
        timer += deltaTime
        local progress = timer / fadeOutDuration
        currentIntensity = math.max(intensity - (progress * intensity), 0)
        
        colorCorrection.TintColor = Color3.new(
            1 - (1 - targetColor.R) * currentIntensity,
            1 - (1 - targetColor.G) * currentIntensity,
            1 - (1 - targetColor.B) * currentIntensity
        )
        
        if progress >= 1 then
            effectActive = false
            colorCorrection:Destroy()
            connection:Disconnect()
        end
    end)
end
createColorCorrection(Color3.fromRGB(255, 0, 0), 7, 1)
-- 视角抖动
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
    camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(10, 5, 2, 6)
-- 警告音频
local WarnSnd = Instance.new("Sound", workspace)
WarnSnd.SoundId = GetGitSound("https://github.com/Focuslol666/RbxScripts/raw/main/DOORS/MyScript/Other/ASH_spawnWarning.mp3", "WARNING")
WarnSnd.Name = "ASH_Warning"
WarnSnd.Volume = 2
WarnSnd.Ended:Connect(function()
    WarnSnd:Destroy()
end)
WarnSnd:Play()
task.wait(4)

---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
    Entity = {
        Name = "ASH_Uranium235",
        Asset = "https://github.com/Focuslol666/RbxScripts/raw/main/DOORS/MyScript/Other/ASH_Uranium235.rbxm",
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
        Values = {10, 10, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
    },
    Movement = {
        Speed = 75,
        Delay = 0.235,
        Reversed = false
    },
    Rebounding = {
        Enabled = true,
        Type = "Ambush", -- "Blitz"
        Min = 3,
        Max = 5,
        Delay = 1
    },
    Damage = {
        Enabled = true,
        Range = 30,
        Amount = 235001500 -- 逆天数额😱😱😱
    },
    Crucifixion = {
        Enabled = false, -- 想啥呢十字架根本无效😈
        Range = 0.000000000000001,
        Resist = true,
        Break = false
    },
    Death = {
        Type = "Guiding", -- "Curious"
        Hints = {"你死于Entity-001.", "他是象征铀元素的实体...\nASH_Uranium235!", "尽快躲藏, 不要逃跑.", "WU9VIENBTiBORVZFUiBFU0NBUEUhISE="},
        Cause = "ASH_Uranium235"
    }
})

---====== Debug entity ======---

-- 初始定义Caption
local caption = nil
local originalFont = nil
local originalTextColor = nil

-- 创建故障屏幕GUI
local radiationGui = Instance.new("ScreenGui")
radiationGui.Name = "RadiationOverlay"
radiationGui.IgnoreGuiInset = true
radiationGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
radiationGui.Enabled = false

local frameIDs = {
    "rbxassetid://123441112654075",
    "rbxassetid://116064804488464",
    "rbxassetid://102673007603396",
    "rbxassetid://95093892395935"
}

local frameImages = {}
for i = 1, 4 do
    frameImages[i] = frameIDs[i]
end

local frameLabels = {}
for i = 1, 4 do
    local label = Instance.new("ImageLabel")
    label.Name = "RadiationScreen_"..i
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Image = frameImages[i]
    label.ImageTransparency = 1
    label.BackgroundTransparency = 1
    label.ZIndex = -999999999999999
    label.Parent = radiationGui
    frameLabels[i] = label
end

local currentFrame = 1
local frameTimer = 0
local frameDuration = 0.01
local animationActive = false

-- 创建辐射效果图像
local radiationEffectImage = nil
local colorTween = nil
local isRadiationActive = false

-- 故障屏幕GUI设置
local distanceThresholds = {
    {distance = 60, transparency = 0.25},
    {distance = 90, transparency = 0.6},
    {distance = 120, transparency = 0.8},
    {distance = 200, transparency = 0.95}
}

-- 聚光灯旋转
local function SpotlightRotation(speed)
    local part1 = workspace.ASH_Uranium235["Entity-001"]:GetChildren()[14].Weld["SpotLight-A"]
    local part2 = workspace.ASH_Uranium235["Entity-001"]:GetChildren()[14].Weld["SpotLight-B"]
    local part3 = workspace.ASH_Uranium235["Entity-001"]:GetChildren()[14].Weld["SpotLight-C"]
    local rotationSpeed = speed or 1
    local RunService = game:GetService("RunService")
    local connection
    connection = RunService.Heartbeat:Connect(function(deltaTime)
        part1.Orientation += Vector3.new(0, rotationSpeed * deltaTime, 0)
        part2.Orientation += Vector3.new(0, rotationSpeed * deltaTime, 0)
        part3.Orientation += Vector3.new(0, rotationSpeed * deltaTime, 0)
    end)
end

local function updateRadiationEffect(distance)
    local targetTransparency = 1
    
    if distance <= 60 then
        targetTransparency = 0.2
    elseif distance <= 90 then
        local t = (distance - 60) / 30
        targetTransparency = 0.2 + t * 0.3
    elseif distance <= 120 then
        local t = (distance - 90) / 30
        targetTransparency = 0.5 + t * 0.3
    elseif distance <= 200 then
        local t = (distance - 120) / 80
        targetTransparency = 0.8 + t * 0.15
    else
        targetTransparency = 1
    end
    
    return targetTransparency
end

-- 范围伤害设置
local damageCircles = {
    {range = 310, interval = 4},
    {range = 200, interval = 1},
    {range = 120, interval = 0.5},
    {range = 90,  interval = 0.1},
    {range = 60,  interval = 0.05}
}

entity:SetCallback("OnSpawned", function()
    print("Hi.")
    radiationGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    radiationGui.Enabled = true
    animationActive = true
    
    -- 创建辐射效果图像
    local effectsFrame = game:GetService("Players").LocalPlayer.PlayerGui.MainUI.MainFrame.Healthbar.Effects
    local wetImage = effectsFrame:FindFirstChild("Wet")
    
    if wetImage then
        radiationEffectImage = wetImage:Clone()
        radiationEffectImage.Name = "Radiation"
        radiationEffectImage.Image = "rbxassetid://133145488179887"
        radiationEffectImage.ImageColor3 = Color3.fromRGB(255, 131, 115)
        radiationEffectImage.Visible = false
        radiationEffectImage.Parent = effectsFrame
    end
    
    local Lighting = game:GetService("Lighting")
    local atmosphere = Instance.new("Atmosphere")
    atmosphere.Parent = Lighting
    atmosphere.Name = "ASH_Aftermath"
    atmosphere.Density = 0
    atmosphere.Offset = -1
    atmosphere.Haze = 0
    atmosphere.Color = Color3.fromRGB(0, 0, 0)
    atmosphere.Glare = 1
    atmosphere.Decay = Color3.fromRGB(68, 68, 68)
    local tweenService = game:GetService("TweenService")
    local riseTweenInfo = TweenInfo.new(
        180,
        Enum.EasingStyle.Quint,
        Enum.EasingDirection.Out
    )
    local riseTween = tweenService:Create(atmosphere, riseTweenInfo, {
        Density = 1,
        Offset = 1,
        Haze = 1
    })
    riseTween:Play()
    task.spawn(function()
        task.wait(500)
        local fadeTweenInfo = TweenInfo.new(
            20,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.Out
        )
        local fadeTween = tweenService:Create(atmosphere, fadeTweenInfo, {
            Density = 0,
            Haze = 0
        })
        fadeTween:Play()
        fadeTween.Completed:Wait()
        atmosphere:Destroy()
    end)
    
    caption = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.Caption
    originalFont = caption.Font
    originalTextColor = caption.TextColor3
    caption.TextColor3 = Color3.fromRGB(132, 126, 132)
    caption.Font = Enum.Font.Kalam
    if game.Players.LocalPlayer.Character.Name == "China_ASH500" and game.Players.LocalPlayer.UserId == 4287873323 then
        require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("???: What? Are you also called <mark color='#FFFF00' transparency='0.75'>"..game.Players.LocalPlayer.DisplayName.."</mark>?!")
        task.wait(3)
        require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("???: Are you the <b>\"SECOND ME\"</b>?")
    else
        require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("???: I found you, <mark color='#FFFF00' transparency='0.75'>"..game.Players.LocalPlayer.DisplayName.."</mark>! =)")
        task.wait(3)
        require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("???: Feel the <i>Pain</i>.")
    end
end)

entity:SetCallback("OnStartMoving", function()
    print("I'm coming.")
    SpotlightRotation(90)
    loopController = {
        Active = true,
        Stop = function(self)
            self.Active = false
        end
    }
    
    local radiationActive = true
    local lastTransparency = 0
    
    -- 启动辐射效果动画
    isRadiationActive = true
    local baseColor = Color3.fromRGB(255, 131, 115)
    local targetColor = Color3.fromRGB(255, 255, 255)
    local tweenService = game:GetService("TweenService")
    
    local function animateRadiationEffect()
        while isRadiationActive and radiationEffectImage do
            -- 淡入到白色
            colorTween = tweenService:Create(radiationEffectImage, TweenInfo.new(0.3), {
                ImageColor3 = targetColor
            })
            colorTween:Play()
            colorTween.Completed:Wait()
            
            if not isRadiationActive then break end
            
            -- 淡出到基础色
            colorTween = tweenService:Create(radiationEffectImage, TweenInfo.new(0.3), {
                ImageColor3 = baseColor
            })
            colorTween:Play()
            colorTween.Completed:Wait()
        end
    end
    
    -- 启动动画协程
    task.spawn(animateRadiationEffect)
    
    coroutine.wrap(function()
        local RunService = game:GetService("RunService")
        local damageTimers = {}
        for i = 1, #damageCircles do
            damageTimers[i] = 0
        end
        
        local damageConnection
        damageConnection = RunService.Heartbeat:Connect(function(deltaTime)
            local entityExists, mainModel = pcall(function()
                return workspace:FindFirstChild("ASH_Uranium235")
            end)
            
            if not entityExists or not mainModel then
                loopController:Stop()
                if damageConnection then damageConnection:Disconnect() end
                return
            end
            if animationActive then
                frameTimer = frameTimer + deltaTime
                if frameTimer >= frameDuration then
                    frameTimer = 0
                    
                    frameLabels[currentFrame].ImageTransparency = 1
                    
                    currentFrame = currentFrame + 1
                    if currentFrame > #frameLabels then
                        currentFrame = 1
                    end
                    
                    frameLabels[currentFrame].ImageTransparency = lastTransparency
                end
            end
            
            if game:GetService("Players").LocalPlayer.Character and not game:GetService("Players").LocalPlayer.PlayerGui.MainUI.MainFrame.HideVignette.Visible then
                
                if not game.Players.LocalPlayer.Character then return end
                local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                if not humanoid or humanoid.Health <= 0 then return end
                
                local entityModel = workspace.ASH_Uranium235:FindFirstChild("Entity-001")
                local playerChar = game.Players.LocalPlayer.Character
                
                if entityModel and playerChar then
                    local entityPos = entityModel:GetPivot().Position
                    local playerPos = playerChar:GetPivot().Position
                    
                    local horizontalDistance = (Vector3.new(entityPos.X, 0, entityPos.Z) - 
                                              Vector3.new(playerPos.X, 0, playerPos.Z)).Magnitude
                    
                    local targetTransparency = updateRadiationEffect(horizontalDistance)
                    lastTransparency = targetTransparency
                    
                    if frameLabels[currentFrame] then
                        frameLabels[currentFrame].ImageTransparency = targetTransparency
                    end
                    
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
                    
                    -- 控制辐射效果图像的可见性
                    if radiationEffectImage then
                        if inAnyCircle and humanoid.Health > 0 then
                            radiationEffectImage.Visible = true
                        else
                            radiationEffectImage.Visible = false
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
                    firesignal(game:GetService("ReplicatedStorage").RemotesFolder.DeathHint.OnClientEvent, {"你死于Entity-001.", "他是象征铀元素的实体...\nASH_Uranium235!", "尽快躲藏, 不要逃跑.", "WU9VIENBTiBORVZFUiBFU0NBUEUhISE="}, 'Blue')
                    
                    if radiationActive then
                        radiationActive = false
                        animationActive = false
                        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                        for i = 1, #frameLabels do
                            game:GetService("TweenService"):Create(
                                frameLabels[i], 
                                tweenInfo, 
                                {ImageTransparency = 1}
                            ):Play()
                        end
                    end
                end
            end
        end)
    end)()
end)
entity:SetCallback("OnDespawning", function()
    print("Goodbye.")
    animationActive = false
    
    -- 停止辐射效果动画
    isRadiationActive = false
    
    -- 取消正在进行的Tween
    if colorTween then
        colorTween:Cancel()
        colorTween = nil
    end
    
    -- 隐藏并销毁辐射效果图像
    if radiationEffectImage then
        radiationEffectImage.Visible = false
        radiationEffectImage:Destroy()
        radiationEffectImage = nil
    end
    
    createColorCorrection(Color3.fromRGB(255, 255, 0), 7, 0.6)
    local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
    local camara = game.Workspace.CurrentCamera
    local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
        camara.CFrame = camara.CFrame * shakeCf
    end)
    camShake:Start()
    camShake:ShakeOnce(20, 15, 2, 6)
    local LeaveSnd = Instance.new("Sound", workspace)
    LeaveSnd.SoundId = GetGitSound("https://github.com/Focuslol666/RbxScripts/raw/main/DOORS/MyScript/Assets/R%26D_Despawn_A-200.mp3", "LEAVING")
    LeaveSnd.Name = "ASH_Leaving"
    LeaveSnd.Volume = 3
    LeaveSnd.Ended:Connect(function()
        LeaveSnd:Destroy()
    end)
    LeaveSnd:Play()
    if connection then
        connection:Disconnect()
    end
    workspace.ASH_Uranium235["Entity-001"].Attachment.BillboardGui.AlwaysOnTop = false
    loopController:Stop()
    
    if radiationGui and radiationGui.Parent then
        local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        
        local fadeOuts = {}
        for i = 1, #frameLabels do
            local fadeOut = game:GetService("TweenService"):Create(
                frameLabels[i], 
                tweenInfo, 
                {ImageTransparency = 1}
            )
            table.insert(fadeOuts, fadeOut)
        end
        
        for _, fadeOut in ipairs(fadeOuts) do
            fadeOut:Play()
        end
        
        task.wait(1.5)
        radiationGui:Destroy()
    end
    
    if game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 then
        if game.Players.LocalPlayer.Character.Name == "China_ASH500" and game.Players.LocalPlayer.UserId == 4287873323 then
            require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("#001: You seem <b>Familiar</b> with my attacks.")
            task.wait(2)
            require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("#001: And I seem to feel that we are <u>Attracted</u> to each other.")
            task.wait(3)
            require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("#001: So, I hope you can <i>Stand Up</i> when I meet you next time.")
        else
            require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("#001: You are so <b>Special</b>, that you can avoid all my attacks.")
            task.wait(3)
            require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("#001: I hope you can <i>Stand Up</i> when I meet you next time.")
        end
        task.wait()
        
---====== Load achievement giver ======---

        if not _G.achievementLock then
            _G.achievementLock = {}
        end
        local achievementTitle = "Evil Radiation"
        if not _G.achievementLock[achievementTitle] then
            local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()
---====== Display achievement ======---
            achievementGiver({
                Title = achievementTitle,
                Desc = "Enduring the pain caused by Radiation.",
                Reason = "Encounter and Survive rare Entity called ASH_Uranium235.",
                Image = "rbxassetid://87002809796484"
            })    
            _G.achievementLock[achievementTitle] = true
            print(achievementTitle.." achievement unlocked and given!")
        else
            warn(achievementTitle.." achievement has been unlocked.")
        end
        task.wait(1)
        caption.Font = originalFont
        caption.TextColor3 = originalTextColor
    else
        if game.Players.LocalPlayer.Character.Name == "China_ASH500" and game.Players.LocalPlayer.UserId == 4287873323 then
            require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("???: The <i>\"SECOND ME\"</i> is still too weak.")
        else
            require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("???: Weak human beings...")
            task.wait(3)
            require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("???: They created <u>Disasters</u>, but they can't avoid them at all.")
        end
        task.wait(1)
        caption.Font = originalFont
        caption.TextColor3 = originalTextColor
    end
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    local currentRoom = game:GetService("Players").LocalPlayer:GetAttribute("CurrentRoom")
    local prevRoom = currentRoom - 1
    
    if workspace.ASH_Uranium235 and workspace.ASH_Uranium235:FindFirstChild("Entity-001") then
        local entityModel = workspace.ASH_Uranium235["Entity-001"]
        if entityModel and entityModel:FindFirstChild("Attachment") then
            local billboard = entityModel.Attachment:FindFirstChild("BillboardGui")
            if billboard then
                local roomNum = tonumber(room.Name)
                local shouldShow = (roomNum == currentRoom) or (roomNum == prevRoom)
                
                billboard.AlwaysOnTop = shouldShow
                
            end
        end
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
    -- 什么都没有👽
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    -- 什么都没有👽
end)

entity:SetCallback("OnDespawned", function()
    print("emm...")
    coroutine.wrap(function()
        local rand = math.random(1, 100)
    
        if rand <= 25 then
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/RbxScripts/refs/heads/main/DOORS/RoomsEntities/A-60.lua"))()
                print("Secondary Attack: A-60")
            end)
        elseif rand <= 50 then
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/RbxScripts/refs/heads/main/DOORS/RoomsEntities/A-90/A-90_BranchToASH500.lua"))()
                print("Secondary Attack: A-90")
            end)
        elseif rand <= 75 then
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/RbxScripts/refs/heads/main/DOORS/RoomsEntities/A-120.lua"))()
                print("Secondary Attack: A-120")
            end)
        else
            print("You're lucky, ENTITY-001 has \"LEFT\", without Secondary Attacks.")
        end
    end)()
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
    if newHealth == 0 then
        print("Surprise!")
        local JumpscareGui = Instance.new("ScreenGui")
        local Background = Instance.new("Frame")
        local Face = Instance.new("ImageLabel")
        JumpscareGui.Name = "JumpscareGui"
        JumpscareGui.IgnoreGuiInset = true
        JumpscareGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        JumpscareGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        Background.Name = "Background"
        Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Background.BorderSizePixel = 0
        Background.Size = UDim2.new(1, 0, 1, 0)
        Background.ZIndex = 9999
        Face.Name = "ASH_ScareFace"
        Face.AnchorPoint = Vector2.new(0.5, 0.5)
        Face.BackgroundTransparency = 1
        Face.Position = UDim2.new(0.5, 0, 0.5, 0)
        Face.ResampleMode = Enum.ResamplerMode.Pixelated
        Face.Size = UDim2.new(0, 150, 0, 150)
        Face.Image = "rbxassetid://1"
        Background.Parent = JumpscareGui
        Face.Parent = Background
        local scare = Instance.new("Sound")
        scare.Parent = JumpscareGui
        scare.Name = "ASH_ScareSound"
        scare.SoundId = GetGitSound("https://github.com/Focuslol666/RbxScripts/raw/main/DOORS/MyScript/Other/JumpScare_Snd.mp3", "SCARE")
        scare.Volume = 10
        local distort = Instance.new("DistortionSoundEffect")
        distort.Parent = scare
        distort.Level = 0.75   
            task.spawn(function()
                while JumpscareGui.Parent do
                    Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    task.wait(math.random(25, 100) / 1000)
                    Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    task.wait(math.random(25, 100) / 1000)
        end
    end)
        game.TweenService:Create(Face, TweenInfo.new(2), {Size = UDim2.new(0, 2450, 0, 1550), ImageTransparency = 0}):Play()
        scare:Play()
        task.wait(2)
        JumpscareGui:Destroy()
        radiationGui:Destroy()
    else
        print("Huh? Why are you still alive?")
    end
end)

--[[
entity:SetCallback("OnCrucified", function()
    print("Shit Fuck!") -- 但是你永远无法触发此回调💀💀💀
end)
]]

---====== Run entity ======---

entity:Run()
