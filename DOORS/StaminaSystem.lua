--[[
Stamina System for DOORS.
Made by FOCUSED_LIGHT (@Focuslol666).
Version: v1_Alpha.
This script is Alpha Version, and there may be some bugs.

PC: Press the 'Q' Key to Sprint.
Mobile: Press the Button to Sprint.
]]

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local TweenService = game:GetService("TweenService")

local ExecCaptions = {
    "Stamina System executed successfully!",
    "Made by @FOCUSED_LIGHT.",
    "Press the 'Q' Key or the Button to Sprint.",
    "This script is Alpha Version, and there may be some bugs.",
    "Fuck @DY Film_A-101! Film_A-101's parents are dead."
}
if player.UserId == 4044271400 or player.UserId == 4287873323 or player.UserId == 7208141087 then
    table.insert(ExecCaptions, "You can switch Infinite Stamina ON or OFF with the Toggle Button.")
end

local MAX_STAMINA = 100
local STAMINA_DRAIN_RATE = MAX_STAMINA / 7
local STAMINA_RECOVER_RATE = MAX_STAMINA / 14
local SPRINT_SPEED_BOOST = 4
local EXHAUSTED_SOUND_ID = "rbxassetid://8258601891"
local RECOVER_THRESHOLD = 0.75

local stamina = MAX_STAMINA
local isSprinting = false
local isExhausted = false
local baseWalkSpeed = humanoid.WalkSpeed
local sprintButton

local infiniteStaminaEnabled = false
local infiniteStaminaToggle

local originalDrainRate = STAMINA_DRAIN_RATE
local originalRecoverRate = STAMINA_RECOVER_RATE
local isVitaminEffectActive = false
local vitaminSound
local vitaminDetectionEnabled = true

local mainUI = player:WaitForChild("PlayerGui"):WaitForChild("MainUI")
local mainGame = mainUI.Initiator.Main_Game

local mainFrame = mainUI:WaitForChild("MainFrame")
local healthbar = mainFrame:WaitForChild("Healthbar")
local effects = healthbar:WaitForChild("Effects")
local speedBoostEffect = effects:WaitForChild("SpeedBoost")
speedBoostEffect.Visible = false

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "StaminaGui"
screenGui.IgnoreGuiInset = true
screenGui.Parent = player.PlayerGui
screenGui.Enabled = true

local staminaBarPosition = UDim2.new(0.75, 0, 0.9, 0)

if player.UserId == 4044271400 or player.UserId == 4287873323 or player.UserId == 7208141087 then
    infiniteStaminaToggle = Instance.new("TextButton")
    infiniteStaminaToggle.Name = "InfiniteStaminaToggle"
    infiniteStaminaToggle.Size = UDim2.new(0.04, 0, 0.03, 0)
    infiniteStaminaToggle.Position = UDim2.new(0.75, 0, 0.9, 0)
    infiniteStaminaToggle.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    infiniteStaminaToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    infiniteStaminaToggle.Text = "OFF"
    infiniteStaminaToggle.Font = Enum.Font.Oswald
    infiniteStaminaToggle.TextSize = 14
    infiniteStaminaToggle.ZIndex = 10
    infiniteStaminaToggle.Parent = screenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.2, 0)
    corner.Parent = infiniteStaminaToggle
    
    infiniteStaminaToggle.MouseButton1Click:Connect(function()
        infiniteStaminaEnabled = not infiniteStaminaEnabled
        if infiniteStaminaEnabled then
            infiniteStaminaToggle.BackgroundColor3 = Color3.fromRGB(255, 222, 189)
            infiniteStaminaToggle.TextColor3 = Color3.fromRGB(50, 40, 30)
            infiniteStaminaToggle.Text = "ON"
            require(mainGame).caption("Infinite Stamina: ON")
        else
            infiniteStaminaToggle.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            infiniteStaminaToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
            infiniteStaminaToggle.Text = "OFF"
            require(mainGame).caption("Infinite Stamina: OFF")
        end
        
        updateStaminaBar()
    end)
    
    staminaBarPosition = UDim2.new(0.75, 0, 0.95, 0)
end

local background = Instance.new("Frame")
background.Name = "Background"
background.BackgroundTransparency = 0.2
background.Size = UDim2.new(0.2, 0, 0.03, 0)
background.Position = staminaBarPosition
background.BackgroundColor3 = Color3.fromRGB(30, 17, 16)
background.BorderSizePixel = 2
background.BorderColor3 = Color3.fromRGB(50, 40, 30)
background.Parent = screenGui

local bar = Instance.new("Frame")
bar.Name = "Bar"
bar.Size = UDim2.new(1, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(255, 222, 189)
bar.BorderSizePixel = 0
bar.AnchorPoint = Vector2.new(0, 0)
bar.Parent = background

local staminaText = Instance.new("TextLabel")
staminaText.Name = "StaminaText"
staminaText.Size = UDim2.new(0.1, 0, 0.03, 0)
staminaText.Position = staminaBarPosition + UDim2.new(-0.11, 0, 0, 0)
staminaText.BackgroundTransparency = 1
staminaText.Text = string.format("%d%%", stamina)
staminaText.Font = Enum.Font.Oswald
staminaText.TextSize = 16
staminaText.TextColor3 = Color3.fromRGB(255, 222, 189)
staminaText.TextStrokeTransparency = 0
staminaText.TextStrokeColor3 = Color3.fromRGB(50, 40, 30)
staminaText.TextXAlignment = Enum.TextXAlignment.Right
staminaText.Parent = screenGui

local exhaustionOverlay = Instance.new("Frame")
exhaustionOverlay.Name = "ExhaustionOverlay"
exhaustionOverlay.Size = UDim2.new(1, 0, 1, 0)
exhaustionOverlay.BackgroundColor3 = Color3.new(0, 0, 0)
exhaustionOverlay.BackgroundTransparency = 1
exhaustionOverlay.ZIndex = 100
exhaustionOverlay.Parent = screenGui

local gradientImage = Instance.new("ImageLabel")
gradientImage.Name = "Gradient"
gradientImage.Size = UDim2.new(1, 0, 1, 0)
gradientImage.BackgroundTransparency = 1
gradientImage.Image = "rbxassetid://190596490"
gradientImage.ImageColor3 = Color3.new(0, 0, 0)
gradientImage.ImageTransparency = 1
gradientImage.Parent = exhaustionOverlay

if UserInputService.TouchEnabled then
    sprintButton = Instance.new("TextButton")
    sprintButton.Name = "SprintButton"
    
    local buttonSize = 0.10
    sprintButton.Size = UDim2.new(buttonSize, 0, buttonSize, 0)
    
    sprintButton.Position = UDim2.new(0.9, 0, 0.5, 0)
    sprintButton.AnchorPoint = Vector2.new(0.5, 0.5)
    
    sprintButton.Text = "Sprint"
    sprintButton.Font = Enum.Font.Oswald
    sprintButton.TextSize = 20
    
    sprintButton.TextScaled = true
    
    sprintButton.TextColor3 = Color3.fromRGB(50, 40, 30)
    sprintButton.BackgroundColor3 = Color3.fromRGB(255, 222, 189)
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.2, 0)
    corner.Parent = sprintButton
    
    sprintButton.Parent = screenGui
    
    sprintButton.MouseButton1Click:Connect(function()
        if not isExhausted then
            isSprinting = not isSprinting
            sprintButton.BackgroundColor3 = isSprinting and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 222, 189)
            
            speedBoostEffect.Visible = isSprinting
        end
    end)
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.Q and UserInputService.KeyboardEnabled then
        if not isExhausted then
            isSprinting = not isSprinting
            
            speedBoostEffect.Visible = isSprinting
        end
    end
end)

local function updateStaminaBar()
    if infiniteStaminaEnabled then
        staminaText.Text = "Infinity%"
        staminaText.TextColor3 = Color3.fromRGB(255, 222, 189)
        bar.Size = UDim2.new(1, 0, 1, 0)
        bar.BackgroundColor3 = Color3.fromRGB(255, 222, 189)
        return
    end
    
    local percent = stamina / MAX_STAMINA
    
    bar.Size = UDim2.new(percent, 0, 1, 0)
    
    local COLOR_THRESHOLD = 0.5
    
    if percent >= COLOR_THRESHOLD then
        bar.BackgroundColor3 = Color3.fromRGB(255, 222, 189)
    else
        local t = 1 - (percent / COLOR_THRESHOLD)
        
        local r = 255
        local g = 222 - (222 * t)
        local b = 189 - (189 * t)
        
        bar.BackgroundColor3 = Color3.fromRGB(r, g, b)
    end
    
    staminaText.Text = string.format("%d%%", math.floor(stamina))
    
    if stamina <= 20 then
        staminaText.TextColor3 = Color3.fromRGB(255, 0, 0)
    else
        staminaText.TextColor3 = Color3.fromRGB(255, 222, 189)
    end
end

local exhaustSound = Instance.new("Sound")
exhaustSound.SoundId = EXHAUSTED_SOUND_ID
exhaustSound.Looped = true
exhaustSound.Volume = 0.8
exhaustSound.Parent = player:FindFirstChild("PlayerGui") or workspace

local function triggerExhaustionEffect()
    local fadeIn = TweenService:Create(
        gradientImage,
        TweenInfo.new(0.5),
        {ImageTransparency = 0}
    )
    fadeIn:Play()
    
    task.wait(0.5)
    
    local fadeOut = TweenService:Create(
        gradientImage,
        TweenInfo.new(10),
        {ImageTransparency = 1}
    )
    fadeOut:Play()
end

local function activateVitaminEffect()
    if infiniteStaminaEnabled or isVitaminEffectActive then
        print("Vitamin effect skipped - Infinite stamina enabled or effect already active")
        return
    end
    
    isVitaminEffectActive = true
    print("Vitamin effect activated")
    
    local savedDrainRate = STAMINA_DRAIN_RATE
    local savedRecoverRate = STAMINA_RECOVER_RATE
    
    STAMINA_DRAIN_RATE = MAX_STAMINA / 15
    STAMINA_RECOVER_RATE = MAX_STAMINA / 10
    
    humanoid.Health = math.min(humanoid.Health + 30, humanoid.MaxHealth)
    require(mainGame).caption("You feel a powerful force coming at you...")
    print("Vitamin boost activated!")
    
    vitaminSound = Instance.new("Sound")
    vitaminSound.SoundId = "rbxassetid://5948090748"
    vitaminSound.Volume = 5
    vitaminSound.Looped = true
    vitaminSound.Parent = workspace
    vitaminSound:Play()
    
    local effectDuration = 30
    local startTime = os.clock()
    
    while os.clock() - startTime < effectDuration and humanoid.Health > 0 do
        RunService.Heartbeat:Wait()
    end
    
    if vitaminSound then
        vitaminSound:Stop()
        vitaminSound:Destroy()
        vitaminSound = nil
    end
    
    if humanoid.Health > 0 then
        stamina = 0
        isSprinting = false
        isExhausted = true
        updateStaminaBar()
        
        humanoid.Health = math.max(humanoid.Health - 10, 0)
        print("Vitamin effect ended!")
        
        if sprintButton then
            sprintButton.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
        end
        speedBoostEffect.Visible = false
        STAMINA_DRAIN_RATE = savedDrainRate
        STAMINA_RECOVER_RATE = savedRecoverRate * 0.7
        
        task.wait(5)
        isExhausted = false
        
        while stamina < MAX_STAMINA and humanoid.Health > 0 do
            RunService.Heartbeat:Wait()
        end
        
        STAMINA_RECOVER_RATE = savedRecoverRate
        print("Stamina fully recovered")
    end
    
    isVitaminEffectActive = false
    print("Vitamin effect ended")
end

local function continuousVitaminDetection()
    while vitaminDetectionEnabled do
        local vitaminsFolder
        while vitaminDetectionEnabled and (not vitaminsFolder or not vitaminsFolder:IsDescendantOf(workspace)) do
            vitaminsFolder = workspace:FindFirstChild(character.Name)
            task.wait(1)
        end
        
        if vitaminsFolder then
            local vitamins = vitaminsFolder:FindFirstChild("Vitamins")
            
            if vitamins then
                local attributeConnection = vitamins:GetAttributeChangedSignal("CannotDrop"):Connect(function()
                    if vitamins:GetAttribute("CannotDrop") == true then
                        print("Vitamin CannotDrop attribute changed to true")
                        activateVitaminEffect()
                    end
                end)
                
                if vitamins:GetAttribute("CannotDrop") == true then
                    print("Vitamin CannotDrop attribute is already true")
                    activateVitaminEffect()
                end
            end
        end
        
        task.wait(1)
    end
end

coroutine.wrap(continuousVitaminDetection)()

RunService.Heartbeat:Connect(function(dt)
    if not character or not character:FindFirstChild("Humanoid") then
        character = player.Character
        if character then
            humanoid = character:WaitForChild("Humanoid")
            baseWalkSpeed = humanoid.WalkSpeed
        end
        return
    end
    
    local currentDrainRate = infiniteStaminaEnabled and 0 or STAMINA_DRAIN_RATE
    local currentRecoverRate = infiniteStaminaEnabled and MAX_STAMINA / 0.01 or STAMINA_RECOVER_RATE
    
    if not isSprinting and humanoid.WalkSpeed ~= baseWalkSpeed then
        baseWalkSpeed = humanoid.WalkSpeed
    end
    
    if isExhausted then
        if stamina >= MAX_STAMINA * RECOVER_THRESHOLD then
            isExhausted = false
            exhaustSound:Stop()
            print("Stamina is recovering...")
            if sprintButton then
                sprintButton.BackgroundColor3 = Color3.fromRGB(255, 222, 189)
            end
        else
            stamina = math.min(stamina + currentRecoverRate * dt, MAX_STAMINA)
        end
        
    elseif isSprinting then
        stamina = math.max(stamina - currentDrainRate * dt, 0)
        
        if stamina <= 0 and not infiniteStaminaEnabled then
            isSprinting = false
            isExhausted = true
            humanoid.WalkSpeed = baseWalkSpeed
            exhaustSound:Play()
            require(mainGame).caption("You're tired.")
            print("Stamina is exhausted.")
            
            if sprintButton then
                sprintButton.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
            end
            
            speedBoostEffect.Visible = false
            
            triggerExhaustionEffect()
        else
            humanoid.WalkSpeed = baseWalkSpeed + SPRINT_SPEED_BOOST
            
            speedBoostEffect.Visible = true
            
            if infiniteStaminaEnabled then
                stamina = MAX_STAMINA
            end
        end
    
    else
        stamina = math.min(stamina + currentRecoverRate * dt, MAX_STAMINA)
        humanoid.WalkSpeed = baseWalkSpeed
        
        speedBoostEffect.Visible = false
    end
    
    updateStaminaBar()
end)

player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = character:WaitForChild("Humanoid")
    baseWalkSpeed = humanoid.WalkSpeed
    stamina = MAX_STAMINA
    isSprinting = false
    isExhausted = false
    exhaustSound:Stop()
    
    gradientImage.ImageTransparency = 1
    
    speedBoostEffect.Visible = false
    
    if sprintButton then
        sprintButton.BackgroundColor3 = Color3.fromRGB(255, 222, 189)
    end
    
    updateStaminaBar()
    
    isVitaminEffectActive = false
    if vitaminSound then
        vitaminSound:Stop()
        vitaminSound:Destroy()
        vitaminSound = nil
    end
end)

updateStaminaBar()

print("Stamina System executed successfully!")

for _, Text in ipairs(ExecCaptions) do
    require(mainGame).caption(Text, true)
    task.wait(2.5)
end

game:BindToClose(function()
    vitaminDetectionEnabled = false
end)
