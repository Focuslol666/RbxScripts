--[[
Stamina System for DOORS.
Made by FOCUS (@Focuslol666)
This script is Beta Version, and there may be some bugs.

PC: Press the 'Q' Key to Sprint.
Mobile: Press the Button to Sprint
]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local TweenService = game:GetService("TweenService")

-- 配置参数
local MAX_STAMINA = 100
local STAMINA_DRAIN_RATE = MAX_STAMINA / 7  -- 7秒耗尽
local STAMINA_RECOVER_RATE = MAX_STAMINA / 14  -- 14秒恢复
local SPRINT_SPEED_BOOST = 4
local EXHAUSTED_SOUND_ID = "rbxassetid://8258601891"  -- 音效ID
local RECOVER_THRESHOLD = 0.75  -- 75%恢复阈值

-- 状态变量
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local stamina = MAX_STAMINA
local isSprinting = false
local isExhausted = false
local baseWalkSpeed = humanoid.WalkSpeed
local sprintButton

-- 获取疾跑图标引用
local mainUI = player:WaitForChild("PlayerGui"):WaitForChild("MainUI")
local mainFrame = mainUI:WaitForChild("MainFrame")
local healthbar = mainFrame:WaitForChild("Healthbar")
local effects = healthbar:WaitForChild("Effects")
local speedBoostEffect = effects:WaitForChild("SpeedBoost")
speedBoostEffect.Visible = false  -- 初始隐藏图标

-- 创建体力条GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "StaminaGui"
screenGui.IgnoreGuiInset = true
screenGui.Parent = player.PlayerGui

screenGui.Enabled = true -- 可选择 true/false 来开启或关闭体力条（默认为true）

local background = Instance.new("Frame")
background.Name = "Background"
background.Size = UDim2.new(0.2, 0, 0.03, 0)
background.Position = UDim2.new(0.75, 0, 0.9, 0)
background.BackgroundColor3 = Color3.fromRGB(100, 70, 16) -- 底板颜色
background.BorderSizePixel = 2
background.BorderColor3 = Color3.fromRGB(63, 41, 35) -- 边框颜色
background.Parent = screenGui

local bar = Instance.new("Frame")
bar.Name = "Bar"
bar.Size = UDim2.new(1, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(255, 222, 189) -- 初始米黄色
bar.BorderSizePixel = 0
bar.AnchorPoint = Vector2.new(0, 0)
bar.Parent = background

-- 黑色遮罩效果
local exhaustionOverlay = Instance.new("Frame")
exhaustionOverlay.Name = "ExhaustionOverlay"
exhaustionOverlay.Size = UDim2.new(1, 0, 1, 0)
exhaustionOverlay.BackgroundColor3 = Color3.new(0, 0, 0)
exhaustionOverlay.BackgroundTransparency = 1  -- 初始完全透明
exhaustionOverlay.ZIndex = 100  -- 确保在最上层
exhaustionOverlay.Parent = screenGui

local gradientImage = Instance.new("ImageLabel")
gradientImage.Name = "Gradient"
gradientImage.Size = UDim2.new(1, 0, 1, 0)
gradientImage.BackgroundTransparency = 1
gradientImage.Image = "rbxassetid://190596490"  -- 黑色渐变图片
gradientImage.ImageColor3 = Color3.new(0, 0, 0)
gradientImage.ImageTransparency = 1  -- 初始完全透明
gradientImage.Parent = exhaustionOverlay

-- 创建移动端疾跑按钮（仅在移动设备显示）
if UserInputService.TouchEnabled then
    sprintButton = Instance.new("TextButton")
    sprintButton.Name = "SprintButton"
    
    -- 按钮设置
    local buttonSize = 0.10 -- 占屏幕宽度的比例
    sprintButton.Size = UDim2.new(buttonSize, 0, buttonSize, 0) -- 宽高相同
    
    sprintButton.Position = UDim2.new(0.75, 0, 0.5, 0)
    sprintButton.AnchorPoint = Vector2.new(0.5, 0.5)
    
    sprintButton.Text = "Sprint"
    sprintButton.Font = Enum.Font.Oswald
    sprintButton.TextSize = 20
    
    -- 设置文本自动缩放以适应按钮
    sprintButton.TextScaled = true
    
    -- 设置文本颜色和按钮颜色
    sprintButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    sprintButton.BackgroundColor3 = Color3.fromRGB(255, 222, 189)
    
    -- 添加圆角效果
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.2, 0) -- 20%圆角
    corner.Parent = sprintButton
    
    sprintButton.Parent = screenGui
    
    sprintButton.MouseButton1Click:Connect(function()
        if not isExhausted then
            isSprinting = not isSprinting
            sprintButton.BackgroundColor3 = isSprinting and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 222, 189)
            
            -- 更新疾跑图标
            speedBoostEffect.Visible = isSprinting
        end
    end)
end

-- 键盘输入处理
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.Q and UserInputService.KeyboardEnabled then
        if not isExhausted then
            isSprinting = not isSprinting
            
            -- 更新疾跑图标
            speedBoostEffect.Visible = isSprinting
        end
    end
end)

-- 更新体力条外观 - 米黄色到红色渐变
local function updateStaminaBar()
    local percent = stamina / MAX_STAMINA
    
    -- 直接设置体力条大小
    bar.Size = UDim2.new(percent, 0, 1, 0)
    
    local COLOR_THRESHOLD = 0.5  -- 颜色渐变阈值为50%
    
    if percent >= COLOR_THRESHOLD then
        -- 50%以上保持米黄色
        bar.BackgroundColor3 = Color3.fromRGB(255, 222, 189)
    else
        -- 计算渐变比例 (0%到50%区间)
        local t = 1 - (percent / COLOR_THRESHOLD)
        
        -- 在米黄色和红色之间渐变
        local r = 255
        local g = 222 - (222 * t)
        local b = 189 - (189 * t)
        
        bar.BackgroundColor3 = Color3.fromRGB(r, g, b)
    end
end

-- 播放耗尽音效
local exhaustSound = Instance.new("Sound")
exhaustSound.SoundId = EXHAUSTED_SOUND_ID
exhaustSound.Looped = true
exhaustSound.Volume = 0.8
exhaustSound.Parent = player:FindFirstChild("PlayerGui") or player.PlayerGui -- 也可以放在Workspace

-- 耐力耗尽时的遮罩效果
local function triggerExhaustionEffect()
    local fadeIn = TweenService:Create(
        gradientImage,
        TweenInfo.new(0.5),
        {ImageTransparency = 0}
    )
    fadeIn:Play()
    
    -- 等待淡入完成
    task.wait(0.5)
    
    -- 缓慢淡出（10秒恢复透明度）
    local fadeOut = TweenService:Create(
        gradientImage,
        TweenInfo.new(10),
        {ImageTransparency = 1}
    )
    fadeOut:Play()
end

-- 体力管理主循环
RunService.Heartbeat:Connect(function(dt)
    -- 确保角色存在
    if not character or not character:FindFirstChild("Humanoid") then
        character = player.Character
        if character then
            humanoid = character:WaitForChild("Humanoid")
            baseWalkSpeed = humanoid.WalkSpeed
        end
        return
    end
    
    -- 更新基础速度（防止其他脚本修改）
    if not isSprinting and humanoid.WalkSpeed ~= baseWalkSpeed then
        baseWalkSpeed = humanoid.WalkSpeed
    end
    
    -- 体力耗尽处理
    if isExhausted then
        if stamina >= MAX_STAMINA * RECOVER_THRESHOLD then
            isExhausted = false
            exhaustSound:Stop()
            print("Stamina is recovering...")
            if sprintButton then
                sprintButton.BackgroundColor3 = Color3.fromRGB(255, 222, 189)
            end
        else
            stamina = math.min(stamina + STAMINA_RECOVER_RATE * dt, MAX_STAMINA)
        end
        
    -- 疾跑消耗体力
    elseif isSprinting then
        stamina = math.max(stamina - STAMINA_DRAIN_RATE * dt, 0)
        
        -- 体力耗尽处理
        if stamina <= 0 then
            isSprinting = false
            isExhausted = true
            humanoid.WalkSpeed = baseWalkSpeed
            exhaustSound:Play()
            require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("You're tired.")
            print("Stamina is exhausted.")
            
            -- 更新移动端按钮状态
            if sprintButton then
                sprintButton.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
            end
            
            -- 关闭疾跑图标
            speedBoostEffect.Visible = false
            
            -- 触发遮罩效果
            triggerExhaustionEffect()
        else
            humanoid.WalkSpeed = baseWalkSpeed + SPRINT_SPEED_BOOST
            
            -- 确保疾跑图标可见
            speedBoostEffect.Visible = true
        end
    
    -- 自然恢复体力
    else
        stamina = math.min(stamina + STAMINA_RECOVER_RATE * dt, MAX_STAMINA)
        humanoid.WalkSpeed = baseWalkSpeed
        
        -- 确保疾跑图标隐藏
        speedBoostEffect.Visible = false
    end
    
    -- 更新UI
    updateStaminaBar()
end)

-- 角色死亡重置
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = character:WaitForChild("Humanoid")
    baseWalkSpeed = humanoid.WalkSpeed
    stamina = MAX_STAMINA
    isSprinting = false
    isExhausted = false
    exhaustSound:Stop()
    
    -- 重置遮罩效果
    gradientImage.ImageTransparency = 1
    
    -- 关闭疾跑图标
    speedBoostEffect.Visible = false
    
    if sprintButton then
        sprintButton.BackgroundColor3 = Color3.fromRGB(255, 222, 189)
    end
end)

-- 初始更新
updateStaminaBar()

print("Stamina System executed successfully!")

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Stamina System by @FOCUSED_LIGHT.")
task.wait(3)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Press the 'Q' Key or the Button to Sprint.")
